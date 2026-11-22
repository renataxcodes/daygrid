# DGD-GER-005: Relatório de Auditoria de Configuração do DayGrid

## 1. Identificação do documento

A auditoria física (PCA) acontece em 22/11/2026, depois da ATA-006 e antes da BL-REL. A auditoria funcional (FCA) depende do software e fica para a fase de implementação, depois da BL-IMPL. Este documento traz os roteiros, prontos para preencher. Os resultados ainda não foram registrados, porque as auditorias não foram executadas.

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-GER-005 |
| Título | Relatório de Auditoria de Configuração |
| Versão | 0.4 (rascunho) |
| Data | 22/11/2026 |
| Responsáveis | Hugo Henry Lemos Carvalho e Iago Medice Ferreira da Silva |
| Baseline | BL-REL (prevista para 22/11/2026) |
| Base | DGD-GER-001 (PGC) v1.3, seção 9.2; DGD-REQ-002 (Matriz) v1.1; DGD-TST-001 (Plano de Testes) v1.3 |

### Histórico de revisões

| Versão | Data | Autor | Descrição |
| --- | --- | --- | --- |
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
| PCA-01 | A tag `v1.0.0` existe em `main` e as tags das baselines anteriores também | `git tag --list` | A executar |  |
| PCA-02 | Cada IC da Lista de ICs está no local indicado no repositório | Comparar a coluna "Local no repositório" com a árvore da tag | A executar |  |
| PCA-03 | A versão de cada documento é a mesma na Lista de ICs e no próprio documento | Comparar a coluna "Versão" com a tabela de identificação de cada documento | A executar |  |
| PCA-04 | Os documentos aprovados estão nos locais da Lista de ICs, na versão 1.0 ou superior | Abrir cada arquivo em `docs/gerencia/`, `docs/requisitos/`, `docs/arquitetura/`, `database/migrations/` e `tests/` | A executar |  |
| PCA-05 | O `.env` não está no repositório, e o `.env.example` está, sem valores secretos | Procurar `.env` no histórico do Git | A executar |  |
| PCA-06 | O banco pode ser criado do zero pelas migrações | `flask db upgrade` em um banco vazio | Não se aplica nesta entrega (fase de implementação) |  |
| PCA-07 | O CHANGELOG tem a entrada da `v1.0.0`, com as SMs incluídas | Abrir o `CHANGELOG.md` | A executar |  |
| PCA-08 | Toda SM fechada aparece no Registro de SMs com decisão do CCB | Comparar as issues `CR` fechadas com o DGD-GER-003 | A executar |  |
| PCA-09 | Os commits seguem o padrão do PGC (Conventional Commits com o número da issue) | `git log --oneline` na tag | A executar |  |

## 5. Não conformidades e parecer final

### 5.1 Não conformidades

| ID | Item do roteiro | Descrição | Severidade | Ação (bug ou SM) | Situação |
| --- | --- | --- | --- | --- | --- |
| Nenhuma | Não se aplica | Nenhuma registrada (auditorias ainda não executadas) | Não se aplica | Não se aplica | Não se aplica |

### 5.2 Parecer final

A BL-REL só é criada se não houver não conformidade de severidade Alta em aberto (PGC, seção 9.2).

| Auditoria | Itens conformes | Não conformes | Parecer | Data | Assinatura |
| --- | --- | --- | --- | --- | --- |
| FCA | A preencher (de 8) | A preencher | A preencher: aprovada / aprovada com ressalvas / reprovada |  |  |
| PCA | A preencher (de 9) | A preencher | A preencher: aprovada / aprovada com ressalvas / reprovada |  |  |
