# DGD-GER-005: Relatório de Auditoria de Configuração do DayGrid

## 1. Identificação do documento

A auditoria física (PCA) acontece em 22/11/2026, depois da ATA-006 e antes da BL-REL. A auditoria funcional (FCA) depende do software e fica para a fase de implementação, depois da BL-IMPL. A PCA foi executada em 22/11/2026 por Hugo Henry Lemos Carvalho e João Vitor Simonetti e aprovada, sem não conformidades: os itens aplicáveis estão conformes, a PCA-09 com uma observação. Com isso, a BL-REL foi criada. O roteiro da FCA continua pronto para a fase de implementação.

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-GER-005 |
| Título | Relatório de Auditoria de Configuração |
| Versão | 1.0 (aprovado, baseline BL-REL) |
| Data | 22/11/2026 |
| Responsáveis | Hugo Henry Lemos Carvalho e Iago Medice Ferreira da Silva |
| Baseline | BL-REL (criada em 22/11/2026) |
| Base | DGD-GER-001 (PGC) v1.3, seção 9.2; DGD-REQ-002 (Matriz) v1.1; DGD-TST-001 (Plano de Testes) v1.3 |

### Histórico de revisões

| Versão | Data | Autor | Descrição |
| --- | --- | --- | --- |
| 1.0 | 22/11/2026 | Equipe DayGrid | PCA executada e aprovada (Hugo e João Vitor); resultados e parecer registrados; entra na baseline BL-REL |
| 0.4 | 22/11/2026 | Equipe DayGrid | Bases atualizadas depois da SM-004 (Matriz v1.1, Plano de Testes v1.3) |
| 0.3 | 18/11/2026 | Equipe DayGrid | Consolidação: travessões retirados, bases atualizadas (PGC v1.3, Plano de Testes v1.2) e PCA-04 com todos os locais da Lista de ICs |
| 0.2 | 13/10/2026 | Equipe DayGrid | Revisão de consistência: base atualizada (PGC v1.0) |
| 0.1 | 01/10/2026 | Equipe DayGrid | Criação dos roteiros da FCA e da PCA |

## 2. Escopo, data e auditores

| Auditoria | Pergunta que responde | Data | Auditores | Fonte das evidências |
| --- | --- | --- | --- | --- |
| FCA (Funcional) | O software faz o que o Documento de Requisitos e a ERS pedem? | Fase de implementação | Iago e Renata | Matriz de Rastreabilidade, resultados do pytest no CI e evidências dos casos manuais |
| PCA (Física) | O que será entregue corresponde exatamente aos ICs e às versões registradas? | 22/11/2026 | Hugo e João Vitor | Lista de ICs, repositório na tag `v1.0.0` e documentos em `docs/` |

Cada item dos roteiros recebe um resultado: **Conforme**, **Não conforme** ou **Não se aplica**. Todo item Não conforme vira uma linha na seção 5.

## 3. Roteiro da Auditoria Funcional (FCA)

| ID | Verificação | Como verificar | Resultado | Evidência |
| --- | --- | --- | --- | --- |
| FCA-01 | Todos os 33 requisitos têm pelo menos um caso de teste | Resumo da Matriz: "Cobertura de testes" = 100% | A executar |  |
| FCA-02 | Todos os 44 casos de teste foram executados | Nenhuma linha da Matriz com "Não executado" | A executar |  |
| FCA-03 | Todos os requisitos Essenciais estão aprovados | Filtrar a Matriz por prioridade Essencial e resultado Aprovado | A executar |  |
| FCA-04 | Não há defeito de severidade Alta aberto | Issues com rótulo `bug` e severidade Alta, todas fechadas | A executar |  |
| FCA-05 | Os testes automáticos passam na versão entregue | Execução do CI no commit da tag `v1.0.0` | A executar |  |
| FCA-06 | Os casos manuais têm evidência | Capturas de tela ou anotações dos CT-29 e CT-40 a CT-44 | A executar |  |
| FCA-07 | As regras de negócio RN01 a RN10 têm caso aprovado | Aba "RF × RN" da Matriz cruzada com os resultados | A executar |  |
| FCA-08 | Os requisitos não aprovados têm decisão do CCB | Ata do CCB e item em "Problemas conhecidos" no CHANGELOG | A executar |  |

## 4. Roteiro da Auditoria Física (PCA)

| ID | Verificação | Como verificar | Resultado | Evidência |
| --- | --- | --- | --- | --- |
| PCA-01 | A tag `v1.0.0` existe em `main` e as tags das baselines anteriores também | `git tag --list` | Conforme | Tags `BL-PLAN`, `BL-REQ` e `BL-PROJ` publicadas em github.com/renataxcodes/daygrid; tag `v1.0.0` criada no commit de fechamento da BL-REL |
| PCA-02 | Cada IC da Lista de ICs está no local indicado no repositório | Comparar a coluna "Local no repositório" com a árvore da tag | Conforme | Os 13 ICs de documentação estão nos locais da Lista de ICs; `frontend/` e `backend/` (DGD-COD-001 e DGD-COD-002) ainda não existem por serem ICs planejados para a fase de implementação |
| PCA-03 | A versão de cada documento é a mesma na Lista de ICs e no próprio documento | Comparar a coluna "Versão" com a tabela de identificação de cada documento | Conforme | A versão na Lista de ICs coincide com a tabela de identificação, o histórico de revisões e o nome do arquivo de cada documento |
| PCA-04 | Os documentos aprovados estão nos locais da Lista de ICs, na versão 1.0 ou superior | Abrir cada arquivo em `docs/gerencia/`, `docs/requisitos/`, `docs/arquitetura/`, `database/migrations/` e `tests/` | Conforme | Os 9 documentos aprovados estão entre as versões 1.0 e 1.3, nos locais da Lista de ICs |
| PCA-05 | O `.env` não está no repositório, e o `.env.example` está, sem valores secretos | Procurar `.env` no histórico do Git | Conforme | O `.env` nunca entrou no histórico do Git; o `.env.example` está no repositório com os campos de senha vazios |
| PCA-06 | O banco pode ser criado do zero pelas migrações | `flask db upgrade` em um banco vazio | Não se aplica | Nesta entrega não há código nem banco em execução (fase de implementação) |
| PCA-07 | O CHANGELOG tem a entrada da `v1.0.0`, com as SMs incluídas | Abrir o `CHANGELOG.md` | Conforme | `CHANGELOG.md` com a entrada [1.0.0] e as SMs incluídas (SM-001 a SM-004, issues #1 a #4) |
| PCA-08 | Toda SM fechada aparece no Registro de SMs com decisão do CCB | Comparar as issues `CR` fechadas com o DGD-GER-003 | Conforme | Issues `CR` #1 a #4 fechadas no GitHub, cada uma no Registro de SMs (DGD-GER-003, seção 2) com a decisão do CCB (ATA-003 a ATA-006) |
| PCA-09 | Os commits seguem o padrão do PGC (Conventional Commits com o número da issue) | `git log --oneline` na tag | Conforme, com observação | Todos os commits seguem o Conventional Commits. Os commits anteriores a 22/11/2026 citam a SM e a ata, por exemplo "(SM-004, ATA-006)", em vez do número da issue, porque as SMs foram registradas antes da publicação no GitHub. O commit 5a0a967 já cita as issues #1 a #4. |

## 5. Não conformidades e parecer final

### 5.1 Não conformidades

| ID | Item do roteiro | Descrição | Severidade | Ação (bug ou SM) | Situação |
| --- | --- | --- | --- | --- | --- |
| Nenhuma | Não se aplica | A PCA não encontrou não conformidades. A FCA ainda não foi executada | Não se aplica | Não se aplica | Não se aplica |

**Observação da PCA-09:** Os commits anteriores a 22/11/2026 citam a SM e a ata, por exemplo "(SM-004, ATA-006)", em vez do número da issue, porque as SMs foram registradas antes da publicação no GitHub. O commit 5a0a967 já cita as issues #1 a #4. A partir da fase de implementação, todo commit cita o número da issue, como define o PGC.

### 5.2 Parecer final

A BL-REL só é criada se não houver não conformidade de severidade Alta em aberto (PGC, seção 9.2).

| Auditoria | Itens conformes | Não conformes | Parecer | Data | Assinatura |
| --- | --- | --- | --- | --- | --- |
| FCA | Não executada (de 8) | Não se aplica | Fica para a fase de implementação, depois da BL-IMPL |  |  |
| PCA | 8 de 8 aplicáveis (PCA-06 não se aplica; PCA-09 com observação) | 0 | Aprovada: BL-REL liberada | 22/11/2026 | Hugo Henry Lemos Carvalho e João Vitor Simonetti |
