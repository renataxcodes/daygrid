-- =====================================================================
-- DGD-BD-001 · Script inicial do banco do DayGrid · v0.3 · 18/11/2026
-- MySQL 8.0.16 ou superior (CHECK constraints) · InnoDB · utf8mb4
-- Colunas DATETIME guardam UTC e são preenchidas pela aplicação (DA-09).
-- Colunas DATE guardam a data do calendário de Manaus.
-- =====================================================================

CREATE DATABASE IF NOT EXISTS daygrid
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;   -- ignora maiúsculas e acentos: "Estudos" = "estudos" (RF25)

USE daygrid;

-- ---------------------------------------------------------------------
-- M0 · Usuários
-- ---------------------------------------------------------------------
CREATE TABLE usuario (
  id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nome        VARCHAR(100)    NOT NULL,
  email       VARCHAR(255)    NOT NULL,
  senha_hash  CHAR(60)        NOT NULL,                       -- bcrypt (RNF03)
  criado_em   DATETIME        NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uq_usuario_email UNIQUE (email)                  -- RF01
) ENGINE = InnoDB;

CREATE TABLE token_redefinicao (
  id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_id  BIGINT UNSIGNED NOT NULL,
  token_hash  CHAR(64)        NOT NULL,                       -- SHA-256 do token do link (RF04)
  expira_em   DATETIME        NOT NULL,                       -- criado_em + 15 minutos (RF04)
  usado_em    DATETIME        NULL,                           -- preenchido ao usar: o link deixa de valer
  criado_em   DATETIME        NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uq_token_hash UNIQUE (token_hash),
  CONSTRAINT fk_token_usuario FOREIGN KEY (usuario_id)
    REFERENCES usuario (id) ON DELETE CASCADE
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- M1 · Tarefas e etiquetas
-- ---------------------------------------------------------------------
CREATE TABLE etiqueta (
  id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_id  BIGINT UNSIGNED NOT NULL,
  nome        VARCHAR(40)     NOT NULL,
  criado_em   DATETIME        NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uq_etiqueta_usuario_nome UNIQUE (usuario_id, nome),   -- RN01, RF25
  CONSTRAINT fk_etiqueta_usuario FOREIGN KEY (usuario_id)
    REFERENCES usuario (id) ON DELETE CASCADE
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- M3 · Metas (criada antes de tarefa, que aponta para ela)
-- ---------------------------------------------------------------------
CREATE TABLE meta (
  id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_id  BIGINT UNSIGNED NOT NULL,
  titulo      VARCHAR(120)    NOT NULL,
  descricao   TEXT            NULL,
  prazo       DATE            NOT NULL,                       -- RF17
  criado_em   DATETIME        NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_meta_usuario FOREIGN KEY (usuario_id)
    REFERENCES usuario (id) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE tarefa (
  id             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_id     BIGINT UNSIGNED NOT NULL,
  etiqueta_id    BIGINT UNSIGNED NOT NULL,                    -- obrigatória (RN01)
  meta_id        BIGINT UNSIGNED NULL,                        -- no máximo uma meta (RN07)
  titulo         VARCHAR(120)    NOT NULL,
  descricao      TEXT            NULL,
  data_prevista  DATE            NOT NULL,                    -- obrigatória (RF05)
  prioridade     ENUM('baixa', 'media', 'alta')                  NOT NULL DEFAULT 'media',     -- RN03
  status         ENUM('pendente', 'em_andamento', 'concluida')   NOT NULL DEFAULT 'pendente',  -- RN02
  concluida_em   DATETIME        NULL,                        -- RF08
  criado_em      DATETIME        NOT NULL,
  atualizado_em  DATETIME        NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_tarefa_usuario  FOREIGN KEY (usuario_id)
    REFERENCES usuario (id)  ON DELETE CASCADE,
  CONSTRAINT fk_tarefa_etiqueta FOREIGN KEY (etiqueta_id)
    REFERENCES etiqueta (id) ON DELETE RESTRICT,             -- RN01: etiqueta em uso não é excluída
  CONSTRAINT fk_tarefa_meta     FOREIGN KEY (meta_id)
    REFERENCES meta (id)     ON DELETE SET NULL,             -- RF20
  INDEX ix_tarefa_usuario_data   (usuario_id, data_prevista), -- RF10, RNF06
  INDEX ix_tarefa_usuario_status (usuario_id, status)         -- RF11, RNF06
) ENGINE = InnoDB;

CREATE TABLE subtarefa (
  id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  tarefa_id   BIGINT UNSIGNED NOT NULL,
  titulo      VARCHAR(120)    NOT NULL,
  concluida   BOOLEAN         NOT NULL DEFAULT FALSE,         -- RF09
  criado_em   DATETIME        NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_subtarefa_tarefa FOREIGN KEY (tarefa_id)
    REFERENCES tarefa (id) ON DELETE CASCADE                  -- RF07
) ENGINE = InnoDB;

CREATE TABLE remarcacao (
  id             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  tarefa_id      BIGINT UNSIGNED NOT NULL,
  data_anterior  DATE            NOT NULL,
  data_nova      DATE            NOT NULL,
  remarcada_em   DATETIME        NOT NULL,                    -- RF12
  PRIMARY KEY (id),
  CONSTRAINT ck_remarcacao_para_depois CHECK (data_nova > data_anterior),   -- RN04
  CONSTRAINT fk_remarcacao_tarefa FOREIGN KEY (tarefa_id)
    REFERENCES tarefa (id) ON DELETE CASCADE
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- M2 · Lembretes
-- ---------------------------------------------------------------------
CREATE TABLE lembrete (
  id              BIGINT UNSIGNED  NOT NULL AUTO_INCREMENT,
  usuario_id      BIGINT UNSIGNED  NOT NULL,
  tarefa_id       BIGINT UNSIGNED  NULL,                      -- opcional (RN08)
  titulo          VARCHAR(120)     NOT NULL,
  recorrencia     ENUM('nenhuma', 'diaria', 'semanal', 'mensal') NOT NULL DEFAULT 'nenhuma',  -- RF14
  proximo_envio   DATETIME         NOT NULL,                  -- UTC (RF15)
  dia_referencia  TINYINT UNSIGNED NOT NULL,                  -- dia original, 1 a 31 (RN09)
  ativo           BOOLEAN          NOT NULL DEFAULT TRUE,
  ultimo_envio    DATETIME         NULL,
  criado_em       DATETIME         NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT ck_lembrete_dia CHECK (dia_referencia BETWEEN 1 AND 31),
  CONSTRAINT fk_lembrete_usuario FOREIGN KEY (usuario_id)
    REFERENCES usuario (id) ON DELETE CASCADE,
  CONSTRAINT fk_lembrete_tarefa  FOREIGN KEY (tarefa_id)
    REFERENCES tarefa (id)  ON DELETE CASCADE,                -- RF07
  INDEX ix_lembrete_envio (ativo, proximo_envio)              -- job a cada minuto (RNF05)
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- M4 · Relatório semanal
-- ---------------------------------------------------------------------
CREATE TABLE relatorio_semanal (
  id                BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_id        BIGINT UNSIGNED NOT NULL,
  semana_inicio     DATE            NOT NULL,                 -- segunda-feira (RN10)
  semana_fim        DATE            NOT NULL,                 -- domingo (RN10)
  total_tarefas     INT UNSIGNED    NOT NULL,
  total_concluidas  INT UNSIGNED    NOT NULL,
  total_adiadas     INT UNSIGNED    NOT NULL,
  pct_concluidas    DECIMAL(5,2)    NOT NULL,                 -- RF22
  pct_adiadas       DECIMAL(5,2)    NOT NULL,                 -- RF22
  dias_produtivos   JSON            NOT NULL,                 -- RF23, ex.: ["terca", "quinta"]
  progresso_metas   JSON            NOT NULL,                 -- RF24, ex.: [{"meta_id": 3, "progresso": 37.5}]
  gerado_em         DATETIME        NOT NULL,                 -- RF21
  PRIMARY KEY (id),
  CONSTRAINT uq_relatorio_semana UNIQUE (usuario_id, semana_inicio),
  CONSTRAINT fk_relatorio_usuario FOREIGN KEY (usuario_id)
    REFERENCES usuario (id) ON DELETE CASCADE
) ENGINE = InnoDB;
