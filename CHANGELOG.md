# Changelog — DayGrid

> **IC:** DGD-REL-001 · **Versão do documento:** 0.4 (rascunho) · **Responsável:** Hugo Henry Lemos Carvalho
> **Baseline:** BL-REL (prevista para 25/11/2026)

Todas as mudanças relevantes do DayGrid ficam registradas aqui, da mais recente para a mais antiga.
O formato segue o [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/), e as versões do
software seguem o [Versionamento Semântico](https://semver.org/lang/pt-BR/) (`MAJOR.MINOR.PATCH`),
como define o Plano de Gerência de Configuração (DGD-GER-001, seção 5.3).

Cada entrada de release informa: data, funcionalidades novas, correções, SMs incluídas,
problemas conhecidos e instruções de instalação (DGD-GER-001, seção 10.1).

---

## [Não lançado]

### Baselines
- **BL-PLAN** criada em 18/11/2026 (ATA-002): DGD-GER-001 v1.0 e DGD-GER-002 v1.0
- **BL-REQ** criada em 18/11/2026 (ATA-002): DGD-REQ-001 v1.0 e DGD-REQ-002 v1.0
- Tags `BL-PLAN` e `BL-REQ` criadas no repositório `daygrid` (local) em 18/11/2026, com os documentos aprovados em `docs/`; falta publicar no GitHub

### Adicionado
- Documentação do projeto, em versão de rascunho (18/11/2026):
  - DGD-GER-001 — Plano de Gerência de Configuração (v1.0, aprovado)
  - DGD-GER-002 — Lista de Itens de Configuração (v1.0, aprovada)
  - DGD-GER-003 — Registro de SMs e Atas do CCB (v0.5), com a ATA-001 e a ATA-002
  - DGD-GER-004 — Relatório de Status da Configuração (v0.5)
  - DGD-GER-005 — Relatório de Auditoria de Configuração (v0.2)
  - DGD-REQ-001 — Especificação de Requisitos de Software (v1.0, aprovada): 25 RF, 10 RN e 8 RNF
  - DGD-REQ-002 — Matriz de Rastreabilidade (v1.0, aprovada): 33 requisitos ligados a componentes, tabelas e testes
  - DGD-ARQ-001 — Documento de Arquitetura (v0.4): 10 decisões, 9 componentes e 31 rotas da API
  - DGD-BD-001 — Modelo de Dados (v0.4) e script `database/0001_esquema_inicial.sql`: 9 tabelas
  - DGD-TST-001 — Plano e Casos de Teste (v0.2): 44 casos de teste
  - DGD-REL-001 — este CHANGELOG (v0.4)

### SMs incluídas
- Nenhuma até 18/11/2026.

---

## [1.0.0] — 25/11/2026 *(planejada)*

> Esta seção será preenchida na criação da BL-REL. O modelo abaixo mostra o que ela deve conter.

### Adicionado
- M0 — Usuários: cadastro, login, logout e redefinição de senha por e-mail (RF01 a RF04)
- M1 — Tarefas: tarefas com status, prioridade, etiqueta e subtarefas; lista do dia; filtros;
  remarcação; etiquetas personalizáveis (RF05 a RF12, RF25)
- M2 — Lembretes: lembretes por e-mail, com recorrência diária, semanal ou mensal (RF13 a RF16)
- M3 — Metas: metas com prazo e barra de progresso automática (RF17 a RF20)
- M4 — Relatório semanal: gerado todo domingo às 23h59, com concluídas e adiadas,
  dias mais produtivos e progresso das metas (RF21 a RF24)

### Corrigido
- *(defeitos corrigidos durante os testes, com o número da issue)*

### SMs incluídas
- *(SM-NNN — resumo)*

### Problemas conhecidos
- *(requisitos não aprovados com decisão do CCB, conforme DGD-TST-001, seção 4)*

### Instalação
```bash
git clone https://github.com/<organizacao>/daygrid.git
cd daygrid
cp .env.example .env                        # preencher banco, SECRET_KEY e senha de app do Gmail
pip install -r backend/requirements.txt
flask --app backend/run.py db upgrade       # cria as 9 tabelas
flask --app backend/run.py run              # um único processo (DA-07)
```

[Não lançado]: https://github.com/<organizacao>/daygrid/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/<organizacao>/daygrid/releases/tag/v1.0.0
