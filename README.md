# DayGrid

Lista de afazeres diária com tarefas, lembretes por e-mail, metas e relatório semanal de produtividade.
Projeto acadêmico de Gerência de Configuração (IEEE 828) do curso de Engenharia de Software da FAMETRO, com entrega da documentação em 25/11/2026.

Equipe: Hugo Henry Lemos Carvalho (Gerente de Projeto e de Configuração), Renata Martins da Silva (Requisitos),
João Vitor Simonetti (Desenvolvimento, DBA e DevOps) e Iago Medice Ferreira da Silva (Testes).

## Baselines

| Baseline | Situação | Tag |
| --- | --- | --- |
| BL-PLAN | Criada em 06/10/2026 (ATA-002); atualizada pelas SM-001 a SM-004 | `BL-PLAN` |
| BL-REQ | Criada em 06/10/2026 (ATA-002); atualizada pelas SM-002 a SM-004 | `BL-REQ` |
| BL-PROJ | Criada em 03/11/2026 (ATA-003, SM-001); atualizada pelas SM-002 a SM-004 | `BL-PROJ` |
| BL-IMPL | Fase de implementação, depois da entrega (código e testes executados) | ainda não criada |
| BL-REL | Prevista para 22/11/2026 (auditoria física e versão 1.0.0 da documentação) | ainda não criada |

As tags marcam o commit em que cada baseline foi aprovada. As versões vigentes dos documentos estão em `main`.

## Documentos

| IC | Documento | Versão | Situação | Arquivo |
| --- | --- | --- | --- | --- |
| DGD-GER-001 | Plano de Gerência de Configuração (PGC) | 1.3 | Aprovado (BL-PLAN) | `docs/gerencia/` |
| DGD-GER-002 | Lista de Itens de Configuração | 1.4 | Aprovado (BL-PLAN) | `docs/gerencia/` (.xlsx e .csv) |
| DGD-GER-006 | Plano de Projeto | 1.0 | Aprovado (BL-PLAN) | `docs/gerencia/` |
| DGD-REQ-001 | Documento de Requisitos | 1.2 | Aprovado (BL-REQ) | `docs/requisitos/` |
| DGD-REQ-002 | Matriz de Rastreabilidade | 1.1 | Aprovado (BL-REQ) | `docs/requisitos/` (.xlsx e .csv) |
| DGD-REQ-003 | Especificação de Requisitos de Software (ERS) | 1.0 | Aprovado (BL-PROJ) | `docs/requisitos/` |
| DGD-ARQ-001 | Documento de Arquitetura | 1.3 | Aprovado (BL-PROJ) | `docs/arquitetura/` |
| DGD-BD-001 | Modelo de Dados e script inicial | 1.3 | Aprovado (BL-PROJ) | `database/migrations/` |
| DGD-TST-001 | Plano e Casos de Teste | 1.3 | Aprovado (BL-PROJ) | `tests/` |
| DGD-GER-003 | Registro de SMs e Atas do CCB | 0.13 | Em elaboração (BL-REL) | `docs/gerencia/` |
| DGD-GER-004 | Relatório de Status da Configuração | 0.12 | Em elaboração (BL-REL) | `docs/gerencia/` |
| DGD-GER-005 | Relatório de Auditoria de Configuração | 0.4 | Em elaboração (BL-REL) | `docs/gerencia/` |
| DGD-REL-001 | Notas de Release | 0.9 | Em elaboração (BL-REL) | `CHANGELOG.md` |
| DGD-COD-001 e DGD-COD-002 | Código do front-end e do back-end | | Planejado para a fase de implementação (BL-IMPL) | `frontend/` e `backend/` |

Cada documento existe em `.md` (texto, fácil de comparar entre versões) e em `.docx` (gerado com o modelo `docs/modelo-docx-daygrid.docx`).
Os `.docx` usam Arial em preto e tabelas com grade, como nos templates da disciplina. Os diagramas ficam em `docs/imagens/` como `.png`, e o código Mermaid de cada um está em `docs/imagens/fonte-mermaid/`. No GitHub, a ERS em `.md` continua mostrando os diagramas Mermaid desenhados.
As Solicitações de Mudança aprovadas estão em `docs/gerencia/sm/`, e o modelo de SM está em `.github/ISSUE_TEMPLATE/`.

## Regras do repositório (PGC, seção 6)

- `main` protegida; branches `<tipo>/<id-issue>-<descricao>`.
- Commits no padrão Conventional Commits, com o número da issue.
- Toda mudança em documento aprovado exige uma Solicitação de Mudança (issue com o rótulo `CR`), aprovada pelo CCB.
