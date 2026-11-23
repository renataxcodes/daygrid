# Changelog do DayGrid

> **IC:** DGD-REL-001 · **Versão do documento:** 1.0 (aprovado) · **Responsável:** Hugo Henry Lemos Carvalho
> **Baseline:** BL-REL (criada em 22/11/2026)

Todas as mudanças relevantes do DayGrid ficam registradas aqui, da mais recente para a mais antiga.
O formato segue o [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/), e as versões do
software seguem o [Versionamento Semântico](https://semver.org/lang/pt-BR/) (`MAJOR.MINOR.PATCH`),
como define o Plano de Gerência de Configuração (DGD-GER-001, seção 5.3).

Cada entrada de release informa: data, funcionalidades novas, correções, SMs incluídas,
problemas conhecidos e instruções de instalação (DGD-GER-001, seção 10.1).

---

## [Não lançado]

Nada ainda. As próximas mudanças entram aqui (fase de implementação).

---

## [1.0.0] - 22/11/2026

> Versão da documentação do sistema. A BL-REL foi criada em 22/11/2026, depois da auditoria física (PCA) aprovada (DGD-GER-005).

### Baselines
- **BL-PLAN** criada em 06/10/2026 (ATA-002): DGD-GER-001 v1.0 e DGD-GER-002 v1.0. Hoje: DGD-GER-001 v1.3, DGD-GER-002 v1.5 e DGD-GER-006 v1.0 (incluído pela SM-003)
- **BL-REQ** criada em 06/10/2026 (ATA-002): DGD-REQ-001 v1.0 e DGD-REQ-002 v1.0. Hoje: DGD-REQ-001 v1.2 (agora Documento de Requisitos) e DGD-REQ-002 v1.1
- **BL-PROJ** criada em 03/11/2026 (ATA-003, SM-001): DGD-ARQ-001 v1.0, DGD-BD-001 v1.0 e DGD-TST-001 v1.0. Hoje: os três na v1.3 e DGD-REQ-003 v1.0 (incluída pela SM-003)
- Tags `BL-PLAN`, `BL-REQ` e `BL-PROJ` criadas no repositório `daygrid` em 06/10/2026 (BL-PLAN e BL-REQ) e 03/11/2026 (BL-PROJ), e publicadas no GitHub em 22/11/2026 (github.com/renataxcodes/daygrid)
- **BL-REL** criada em 22/11/2026, depois da auditoria física (PCA) aprovada: os 13 ICs de documentação nas versões vigentes. Tag `v1.0.0`

### Adicionado
- Documentação do projeto (situação na BL-REL, em 22/11/2026):
  - DGD-GER-001: Plano de Gerência de Configuração (v1.3, aprovado)
  - DGD-GER-002: Lista de Itens de Configuração (v1.5, aprovada): 15 ICs
  - DGD-GER-003: Registro de SMs e Atas do CCB (v1.0, aprovado), com as atas ATA-001 a ATA-006 e as SM-001 a SM-004
  - DGD-GER-004: Relatório de Status da Configuração (v1.0, aprovado)
  - DGD-GER-005: Relatório de Auditoria de Configuração (v1.0, aprovado): PCA executada e aprovada; roteiro da FCA pronto para a fase de implementação
  - DGD-GER-006: Plano de Projeto (v1.0, aprovado)
  - DGD-REQ-001: Documento de Requisitos (v1.2, aprovado): 25 RF, 10 RN e 8 RNF
  - DGD-REQ-002: Matriz de Rastreabilidade (v1.1, aprovada): 33 requisitos ligados a componentes, tabelas e testes
  - DGD-REQ-003: Especificação de Requisitos de Software (v1.0, aprovada): casos de uso, classes, modelo lógico, regras de validação e API REST
  - DGD-ARQ-001: Documento de Arquitetura (v1.3, aprovado): 10 decisões, 9 componentes e 29 rotas da API
  - DGD-BD-001: Modelo de Dados (v1.3, aprovado) e script `database/migrations/0001_esquema_inicial.sql`: 9 tabelas
  - DGD-TST-001: Plano e Casos de Teste (v1.3, aprovado): 44 casos de teste
  - DGD-REL-001: este CHANGELOG (v1.0)

### SMs incluídas
- **SM-001** (29/10/2026, Renata Martins da Silva): criar a baseline BL-PROJ. Aprovada por unanimidade na ATA-003, em 03/11/2026, e implementada no mesmo dia (PGC e Lista de ICs na v1.1)
- **SM-002** (09/11/2026, Renata Martins da Silva): revisão editorial dos documentos em baseline (travessões retirados, cabeçalho das tabelas padronizado e novo modelo de exportação .docx). Aprovada por unanimidade na ATA-004, em 10/11/2026, e implementada no mesmo dia (PGC e Lista de ICs na v1.2; ERS, Arquitetura, Modelo de Dados e Plano de Testes na v1.1)
- **SM-003** (17/11/2026, Renata Martins da Silva): adaptação aos templates da disciplina. A antiga ERS (DGD-REQ-001) virou o Documento de Requisitos; foram criados a ERS (DGD-REQ-003) e o Plano de Projeto (DGD-GER-006). Aprovada por unanimidade na ATA-005 e implementada no mesmo dia (PGC e Lista de ICs na v1.3; Documento de Requisitos, Arquitetura, Modelo de Dados e Plano de Testes na v1.2)
- **SM-004** (22/11/2026, Renata Martins da Silva): correções de consistência (módulos da Matriz sem travessão, campo Baseline da Arquitetura, do Modelo de Dados e do Plano de Testes corrigido para BL-PROJ e local do script inicial corrigido). Aprovada por unanimidade na ATA-006, em 22/11/2026, e implementada no mesmo dia (Matriz na v1.1; Arquitetura, Modelo de Dados e Plano de Testes na v1.3; Lista de ICs na v1.4)

### Auditoria
- PCA executada em 22/11/2026 por Hugo Henry Lemos Carvalho e João Vitor Simonetti e aprovada: 8 de 8 itens aplicáveis conformes, sem não conformidades. A PCA-06 não se aplica nesta entrega, e a PCA-09 tem uma observação: os commits anteriores a 22/11/2026 citam a SM e a ata em vez do número da issue

### Problemas conhecidos
- O código (DGD-COD-001 e DGD-COD-002), a execução dos testes, a BL-IMPL e a auditoria funcional (FCA)
  ficam para a fase de implementação, depois desta entrega.

---

## [Fase de implementação] *(futura, sem data)*

> Planejada para depois da entrega da documentação. Os itens abaixo serão confirmados quando o código existir.

### Adicionado (planejado)
- M0 (Usuários): cadastro, login, logout e redefinição de senha por e-mail (RF01 a RF04)
- M1 (Tarefas): tarefas com status, prioridade, etiqueta e subtarefas; lista do dia; filtros;
  remarcação; etiquetas personalizáveis (RF05 a RF12, RF25)
- M2 (Lembretes): lembretes por e-mail, com recorrência diária, semanal ou mensal (RF13 a RF16)
- M3 (Metas): metas com prazo e barra de progresso automática (RF17 a RF20)
- M4 (Relatório semanal): gerado todo domingo às 23h59, com concluídas e adiadas,
  dias mais produtivos e progresso das metas (RF21 a RF24)

### Instalação (quando o código existir)
```bash
git clone https://github.com/renataxcodes/daygrid.git
cd daygrid
cp .env.example .env                        # preencher banco, SECRET_KEY e senha de app do Gmail
pip install -r backend/requirements.txt
flask --app backend/run.py db upgrade       # cria as 9 tabelas
flask --app backend/run.py run              # um único processo (DA-07)
```

[Não lançado]: https://github.com/renataxcodes/daygrid/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/renataxcodes/daygrid/releases/tag/v1.0.0
