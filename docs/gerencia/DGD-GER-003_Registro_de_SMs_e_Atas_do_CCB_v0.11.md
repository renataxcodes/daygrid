# DGD-GER-003: Registro de SMs e Atas do CCB do DayGrid

Data: 19/11/2026

## 1. Identificação do documento

Este registro guarda todas as Solicitações de Mudança (SMs) e as atas do CCB do DayGrid. Em 18/11/2026 foi aberta a primeira SM (SM-001), aprovada no mesmo dia na ATA-003, que criou a baseline BL-PROJ. A SM-002 (revisão editorial) foi aprovada e implementada na ATA-004, e a SM-003 (adaptação aos templates da disciplina), na ATA-005. As decisões anteriores às baselines ficam na ATA-001. As baselines BL-PLAN e BL-REQ foram aprovadas na ATA-002: a partir delas, mudar qualquer documento em baseline (Plano de Projeto, PGC, Lista de ICs, Documento de Requisitos, Matriz, ERS, Arquitetura, Modelo de Dados ou Plano de Testes) exige uma SM.

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-GER-003 |
| Título | Registro de SMs e Atas do CCB |
| Versão | 0.11 (rascunho) |
| Responsável | Hugo Henry Lemos Carvalho (Gerente de Configuração) |
| Baseline | BL-REL (prevista para 25/11/2026) |
| Base | DGD-GER-001 (PGC) v1.3, seção 8 |

### Histórico de revisões

| Versão | Data | Autor | Descrição |
| --- | --- | --- | --- |
| 0.11 | 19/11/2026 | Equipe DayGrid | Consolidação: travessões retirados, base atualizada (PGC v1.3), status da SM-001 corrigido e encaminhamentos da ATA-005 concluídos |
| 0.10 | 19/11/2026 | Equipe DayGrid | SM-003 registrada e aprovada (ATA-005): documentos adaptados aos templates da disciplina |
| 0.9 | 18/11/2026 | Equipe DayGrid | ATA-004: SM-002 aprovada e implementada |
| 0.8 | 18/11/2026 | Equipe DayGrid | SM-002 registrada (retirada dos travessões dos documentos em baseline) |
| 0.7 | 18/11/2026 | Equipe DayGrid | ATA-003: SM-001 aprovada e baseline BL-PROJ criada |
| 0.6 | 18/11/2026 | Equipe DayGrid | SM-001 registrada (baseline do projeto técnico), com análise de impacto |
| 0.5 | 18/11/2026 | Equipe DayGrid | ATA-002: presentes confirmados; encaminhamentos atualizados |
| 0.4 | 18/11/2026 | Equipe DayGrid | Revisão de consistência: pontuação corrigida e base atualizada (PGC v1.0) |
| 0.3 | 18/11/2026 | Equipe DayGrid | ATA-002: aprovação das baselines BL-PLAN e BL-REQ |
| 0.2 | 18/11/2026 | Equipe DayGrid | ATA-001: presentes confirmados e decisão 20 (CT-31) |
| 0.1 | 18/11/2026 | Equipe DayGrid | Criação, com os modelos e a ATA-001 |

## 2. Registro de Solicitações de Mudança

Cada SM ocupa uma linha, da abertura ao fechamento. O texto completo da SM fica na issue do GitHub, que leva o mesmo ID.

| ID | Abertura | Solicitante | Descrição | ICs afetados | Prioridade | Decisão do CCB | Data da decisão | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SM-001 | 18/11/2026 | Renata Martins da Silva | Criar a baseline BL-PROJ, só de documentos técnicos (Arquitetura, Modelo de Dados e Plano de Testes) | DGD-GER-001 v1.0 → v1.1, DGD-GER-002 v1.0 → v1.1 | Média | Aprovada (ATA-003) | 18/11/2026 | Implementada |
| SM-002 | 18/11/2026 | Renata Martins da Silva | Revisão editorial: retirar os travessões e padronizar a formatação dos documentos em baseline, sem mudar o conteúdo | DGD-GER-001 v1.1, DGD-GER-002 v1.1, DGD-REQ-001 v1.0, DGD-ARQ-001 v1.0, DGD-BD-001 v1.0, DGD-TST-001 v1.0 | Baixa | Aprovada (ATA-004) | 18/11/2026 | Implementada |
| SM-003 | 19/11/2026 | Renata Martins da Silva | Adaptar os documentos aos templates da disciplina: Documento de Requisitos (DGD-REQ-001), nova ERS (DGD-REQ-003) e novo Plano de Projeto (DGD-GER-006) | DGD-REQ-001 1.1 → 1.2; DGD-GER-001 1.2 → 1.3; DGD-GER-002 1.2 → 1.3; DGD-ARQ-001, DGD-BD-001 e DGD-TST-001 1.1 → 1.2; novos DGD-REQ-003 e DGD-GER-006 (1.0) | Média | Aprovada (ATA-005) | 19/11/2026 | Implementada |

Status possíveis (PGC, seção 8.2): Aberta → Em análise → Aprovada ou Rejeitada → Implementada → Verificada → Fechada. Uma SM também pode ser Adiada pelo CCB.

Numeração: `SM-001`, `SM-002`…, em ordem de abertura. Um número nunca é reaproveitado, nem quando a SM é rejeitada.

### 2.1 SM-001: Baseline do projeto técnico (BL-PROJ)

| Campo | Conteúdo |
| --- | --- |
| Solicitante e data | Renata Martins da Silva, 18/11/2026 |
| Descrição | Alterar a seção 7 do PGC para incluir uma quinta baseline, **BL-PROJ**, entre a BL-REQ e a BL-IMPL. Ela reúne só os documentos técnicos: DGD-ARQ-001 (Arquitetura), DGD-BD-001 (Modelo de Dados e script inicial) e DGD-TST-001 (Plano e Casos de Teste). A BL-IMPL passa a reunir o código (DGD-COD-001 e DGD-COD-002) e as versões vigentes desses três documentos. |
| Justificativa | Congelar o projeto técnico antes do início do código (19/11 a 23/11). Assim, a implementação parte de uma base estável, e qualquer ajuste em arquitetura, banco ou testes passa a ser registrado por SM. Hoje esses três documentos estão em rascunho e só entrariam em baseline em 24/11, junto com o código. |
| ICs afetados | DGD-GER-001 (PGC) v1.0 → v1.1 · DGD-GER-002 (Lista de ICs) v1.0 → v1.1. Se aprovada, DGD-ARQ-001, DGD-BD-001 e DGD-TST-001 passam para a v1.0 na BL-PROJ. |
| Prioridade | Média |
| Status | Implementada (aprovada na ATA-003) |

**Análise de impacto** (Hugo Henry Lemos Carvalho, responsável pelo PGC e pela Lista de ICs):

| Aspecto | Avaliação |
| --- | --- |
| Requisitos atingidos | Nenhum. A mudança é só de processo; a ERS e a Matriz não mudam. |
| O que muda no PGC | Seção 7: "Quatro baselines" passa a "Cinco baselines", com a nova linha BL-PROJ (critério: documentos revisados e consistentes com a ERS v1.0, aprovados pelo CCB), e a linha da BL-IMPL é ajustada. A regra de tags da seção 6.4 já cobre a nova tag `BL-PROJ`. |
| O que muda na Lista de ICs | A coluna Baseline de DGD-ARQ-001, DGD-BD-001 e DGD-TST-001 passa de BL-IMPL para BL-PROJ. |
| Pré-condição | Já atendida: a revisão de consistência de 18/11/2026 não encontrou divergências entre os três documentos e a ERS v1.0. |
| Esforço | Baixo: editar a seção 7 do PGC, uma coluna da Lista de ICs, criar a tag e registrar a ata. |
| Risco | Baixo. Durante a implementação, ajustes nos três documentos passam a exigir SM, o que pode atrasar o código. Mitigação: SM urgente decidida em até 24 horas pelo grupo da equipe (PGC, seção 3.1). |
| Efeito no prazo de 25/11/2026 | Nenhum. |

**Decisão do CCB:** aprovada por unanimidade em 18/11/2026 (ATA-003). Implementada no mesmo dia: PGC e Lista de ICs na v1.1; Arquitetura, Modelo de Dados e Plano de Testes na v1.0; tag `BL-PROJ` criada no repositório.

### 2.2 SM-002: Revisão editorial dos documentos em baseline

| Campo | Valor |
| --- | --- |
| Solicitante | Renata Martins da Silva |
| Data | 18/11/2026 |
| Prioridade | Baixa |
| Descrição | Trocar os travessões dos documentos por vírgula, dois-pontos ou parênteses, conforme o caso; dar fundo cinza claro ao cabeçalho das tabelas; e exportar os arquivos .docx e PDF com um modelo padrão do projeto (texto justificado, cabeçalho com o nome do documento e numeração de páginas). O restante do texto continua como está |
| Justificativa | A equipe prefere uma escrita sem travessões, mais próxima do padrão de trabalhos acadêmicos |
| ICs afetados | DGD-GER-001 (1.1 → 1.2), DGD-REQ-001 (1.0 → 1.1), DGD-ARQ-001, DGD-BD-001 e DGD-TST-001 (1.0 → 1.1); DGD-GER-002 (1.1 → 1.2) só para registrar as novas versões |

**Análise de impacto** (Hugo Henry Lemos Carvalho):

| Aspecto | Avaliação |
| --- | --- |
| Requisitos | Nenhum requisito, regra ou valor muda; a alteração é só de forma |
| Esforço | Baixo: troca pontual de pontuação e de formatação em cinco documentos |
| Risco | Baixo: mudar sem querer o sentido de um requisito. Mitigação: as alterações ficam como sugestões no documento e só entram depois da revisão da responsável por cada IC |
| Prazo (25/11/2026) | Sem impacto |

As alterações foram feitas como sugestões nos cinco documentos e aceitas depois da aprovação do CCB.

**Decisão do CCB:** aprovada por unanimidade em 18/11/2026 (ATA-004). Implementada no mesmo dia: PGC e Lista de ICs na v1.2; ERS, Arquitetura, Modelo de Dados e Plano de Testes na v1.1.

### 2.3 SM-003: Adaptação dos documentos aos templates da disciplina

| Campo | Valor |
| --- | --- |
| Solicitante | Renata Martins da Silva |
| Data | 19/11/2026 |
| Prioridade | Média |
| Descrição | Seguir os templates da disciplina. A antiga ERS (DGD-REQ-001) vira o Documento de Requisitos, com Introdução, Definições, Visão Geral e tabelas de RF, RNF e RN com as colunas ID, Descrição, Prioridade e Depende de; os critérios de aceitação passam para a descrição de cada RF. Cria-se uma nova ERS (DGD-REQ-003), com arquitetura, casos de uso, diagrama de classes, modelo lógico, regras de validação, interfaces e API REST, e um Plano de Projeto (DGD-GER-006) |
| Justificativa | Os templates são o formato exigido para a entrega acadêmica |
| ICs afetados | DGD-REQ-001 (1.1 → 1.2); DGD-GER-001 e DGD-GER-002 (1.2 → 1.3); DGD-ARQ-001, DGD-BD-001 e DGD-TST-001 (1.1 → 1.2), só para atualizar referências; novos DGD-REQ-003 e DGD-GER-006 (1.0) |

**Análise de impacto** (Hugo Henry Lemos Carvalho):

| Aspecto | Avaliação |
| --- | --- |
| Requisitos | Nenhum requisito, regra ou valor muda. São novas as prioridades dos RNF e das RN e a coluna Depende de, derivadas dos requisitos existentes |
| Esforço | Médio: um documento reorganizado, dois criados e referências atualizadas em quatro |
| Risco | Baixo: a ERS nova repete informações da Arquitetura e do Modelo de Dados. Mitigação: em caso de divergência, valem esses documentos, e a ERS é corrigida por SM |
| Prazo (25/11/2026) | Sem impacto |

**Decisão do CCB:** aprovada por unanimidade em 19/11/2026 (ATA-005) e implementada no mesmo dia.

## 3. Modelo de SM

O modelo fica em `.github/ISSUE_TEMPLATE/solicitacao-de-mudanca.md`. Ao abrir uma issue com esse modelo, o GitHub já aplica o rótulo `CR` e preenche os campos obrigatórios (PGC, seção 8.2).

```markdown
---
name: Solicitação de Mudança
about: Pedir uma mudança em um IC que já está em baseline
title: "SM-NNN: <resumo da mudança>"
labels: CR
---

## Solicitante e data
<nome>, <dd/mm/aaaa>

## Descrição
<o que deve mudar>

## Justificativa
<por que deve mudar>

## ICs afetados
| IC | Versão atual |
| --- | --- |
| DGD-XXX-NNN | x.y |

## Prioridade
- [ ] Baixa  - [ ] Média  - [ ] Alta

## Análise de impacto (responsável pelo IC)
- Requisitos atingidos (Matriz de Rastreabilidade):
- Esforço estimado:
- Risco:
- Efeito no prazo de 25/11/2026:

## Decisão do CCB
- [ ] Aprovada  - [ ] Rejeitada  - [ ] Adiada
- Justificativa:
- Data:
- Ata:
```

## 4. Modelo de ata do CCB

Toda reunião do CCB gera uma ata numerada (`ATA-NNN`), registrada neste documento. Uma decisão tomada pelo grupo da equipe (SM urgente, PGC seção 3.1) também vira ata, com o print da conversa como anexo.

```markdown
### ATA-NNN, <dd/mm/aaaa>

- Tipo: reunião presencial | reunião on-line | decisão pelo grupo da equipe
- Presentes: <nomes> (quórum mínimo: 3 integrantes)
- Presidente: Hugo Henry Lemos Carvalho

| Item | SM | Assunto | Decisão | Votos (sim/não) | Responsável |
| --- | --- | --- | --- | --- | --- |
| 1 | SM-NNN | ... | Aprovada / Rejeitada / Adiada | x/y | ... |

Encaminhamentos:
- ...
```

## 5. Atas

### ATA-001, 18/11/2026

Em 18/11/2026, a equipe tomou 20 decisões de escopo, requisitos e arquitetura. Como nenhum documento estava em baseline, elas não precisaram de SM: entraram diretamente nas versões 0.x dos documentos.

- Tipo: reunião de definição do projeto (antes das baselines)
- Presentes: *Hugo Henry Lemos Carvalho, Renata Martins da Silva, Iago Medice Ferreira da Silva e João Vitor Simonetti (4 de 4 integrantes; quórum atingido)*
- Presidente: Hugo Henry Lemos Carvalho

| Item | Decisão | Onde ficou registrada |
| --- | --- | --- |
| 1 | O sistema se chama DayGrid e tem cinco módulos: usuários, tarefas, lembretes, metas e relatório semanal | PGC 2.2; ERS 2.2 |
| 2 | Papéis: Hugo (Gerente de Projeto e Configuração), Renata (Requisitos), João Vitor (Desenvolvimento, DBA e DevOps), Iago (Testes) | PGC 3 |
| 3 | Stack: aplicação web com HTML/CSS/JS, Python/Flask e MySQL | PGC 4; ARQ 3 |
| 4 | Uma tarefa é adiada quando a data prevista passa sem conclusão ou quando é remarcada para depois | ERS RN04 |
| 5 | O dia mais produtivo é o dia com mais tarefas concluídas | ERS RN10 |
| 6 | O progresso da meta conta só as tarefas principais, e não as subtarefas | ERS RN05, RN06 |
| 7 | Um lembrete pode estar ligado a uma tarefa ou ser independente | ERS RN08 |
| 8 | O lembrete chega por e-mail | ERS RF15, RN08 |
| 9 | O relatório é gerado todo domingo às 23h59 e exibido em uma tela do sistema | ERS RF21, RN10 |
| 10 | As etiquetas são personalizáveis (com três iniciais) e obrigatórias em toda tarefa | ERS RN01, RF05, RF25 |
| 11 | Ao excluir uma etiqueta em uso, o usuário escolhe outra para as tarefas | ERS RN01, RF25 |
| 12 | Os valores dos RNF foram confirmados (como o envio do lembrete em até 5 minutos) | ERS 5 |
| 13 | Um lembrete de tarefa já concluída não é enviado | ERS RN08 |
| 14 | A tarefa principal pode ser concluída com subtarefas pendentes | ERS RN05 |
| 15 | Na recorrência mensal, um dia que não existe vai para o último dia do mês | ERS RN09; ARQ 6.1 |
| 16 | O provedor de e-mail é o Gmail | ARQ DA-08, 9.5 |
| 17 | O link de redefinição de senha vale 15 minutos | ERS RF04; BD 3.9 |
| 18 | A data prevista é obrigatória em toda tarefa | ERS RF05; BD 3.4 |
| 19 | Uma tarefa remarcada e concluída na mesma semana conta como concluída | ERS RN10; BD 5.1 |
| 20 | Vincular a uma meta uma tarefa que já está em outra é recusado; para trocar de meta, é preciso desvincular primeiro | ERS RN07, RF18; TST CT-31 |

Encaminhamentos:

- [x] Confirmar a lista de presentes desta ata
- [x] Decidir o comportamento do CT-31 (decisão 20: a API recusa)
- [x] Revisar e aprovar o PGC e a Lista de ICs para a BL-PLAN, e a ERS e a Matriz de Rastreabilidade para a BL-REQ (ATA-002)

### ATA-002, 18/11/2026

O CCB aprovou as baselines BL-PLAN e BL-REQ. Os quatro ICs incluídos passaram para a versão 1.0 e, a partir de agora, só mudam por Solicitação de Mudança.

- Tipo: reunião do CCB
- Presentes: *Hugo Henry Lemos Carvalho, Renata Martins da Silva, João Vitor Simonetti e Iago Medice Ferreira da Silva (4 de 4 integrantes; quórum atingido)*
- Presidente: Hugo Henry Lemos Carvalho

| Item | SM | Assunto | Decisão | Responsável |
| --- | --- | --- | --- | --- |
| 1 | Não se aplica | Baseline BL-PLAN: DGD-GER-001 (PGC) v1.0 e DGD-GER-002 (Lista de ICs) v1.0 | Aprovada | Hugo |
| 2 | Não se aplica | Baseline BL-REQ: DGD-REQ-001 (ERS) v1.0 e DGD-REQ-002 (Matriz de Rastreabilidade) v1.0 | Aprovada | Renata |

As duas baselines foram aprovadas em 18/11/2026, antes das datas previstas no PGC (19/11 e 20/11).

Encaminhamentos:

- [x] Criar as tags `BL-PLAN` e `BL-REQ` em `main` (PGC, seção 6.4): criadas no repositório local `daygrid` em 18/11/2026; falta publicar no GitHub
- [x] Exportar os quatro documentos aprovados para `docs/gerencia/` e `docs/requisitos/`: feito no repositório local `daygrid`
- [x] Confirmar a lista de presentes desta ata
- [ ] Publicar o repositório `daygrid` no GitHub, com as tags, e proteger `main`

### ATA-003, 18/11/2026

O CCB analisou e aprovou a SM-001. Foi criada a baseline BL-PROJ, com os documentos técnicos do projeto, que passaram para a versão 1.0 e, a partir de agora, só mudam por Solicitação de Mudança.

- Tipo: reunião do CCB
- Presentes: *Hugo Henry Lemos Carvalho, Renata Martins da Silva, João Vitor Simonetti e Iago Medice Ferreira da Silva (4 de 4 integrantes; quórum atingido)*
- Presidente: Hugo Henry Lemos Carvalho

| Item | SM | Assunto | Decisão | Responsável |
| --- | --- | --- | --- | --- |
| 1 | SM-001 | Criar a baseline BL-PROJ entre BL-REQ e BL-IMPL; PGC (seção 7) e Lista de ICs passam para a v1.1 | Aprovada por unanimidade | Hugo |
| 2 | SM-001 | Baseline BL-PROJ: DGD-ARQ-001 (Arquitetura) v1.0, DGD-BD-001 (Modelo de Dados) v1.0 e DGD-TST-001 (Plano de Testes) v1.0 | Aprovada | João Vitor (ARQ, BD) e Iago (TST) |
| 3 | Não se aplica | BL-IMPL e BL-REL | Ficam para depois: os critérios do PGC (código, testes executados, FCA e PCA) ainda não foram cumpridos | Hugo |

Encaminhamentos:

- [x] Atualizar o PGC (seção 7) e a Lista de ICs para a v1.1
- [x] Passar Arquitetura, Modelo de Dados e Plano de Testes para a v1.0
- [x] Criar a tag `BL-PROJ` em `main` (commit ce033bf) e copiar os documentos aprovados para os locais da Lista de ICs (`docs/arquitetura/`, `database/migrations/` e `tests/`): feito no repositório local `daygrid`
- [ ] Publicar o repositório `daygrid` no GitHub, com as tags `BL-PLAN`, `BL-REQ` e `BL-PROJ`

### ATA-004, 18/11/2026

O CCB analisou e aprovou a SM-002, uma revisão editorial dos documentos em baseline. Nenhum requisito, regra ou valor foi alterado.

- Tipo: reunião do CCB
- Presentes: *Hugo Henry Lemos Carvalho, Renata Martins da Silva, João Vitor Simonetti e Iago Medice Ferreira da Silva (4 de 4 integrantes; quórum atingido)*
- Presidente: Hugo Henry Lemos Carvalho

| Item | SM | Assunto | Decisão | Responsável |
| --- | --- | --- | --- | --- |
| 1 | SM-002 | Retirar os travessões e dar fundo cinza claro ao cabeçalho das tabelas no PGC, na ERS, na Arquitetura, no Modelo de Dados e no Plano de Testes | Aprovada por unanimidade | Renata |
| 2 | SM-002 | Novas versões: PGC e Lista de ICs na v1.2; ERS, Arquitetura, Modelo de Dados e Plano de Testes na v1.1 | Aprovada | Hugo |
| 3 | SM-002 | Exportar os arquivos .docx com o modelo padrão do projeto (texto justificado, cabeçalho com o nome do documento e numeração de páginas) | Aprovada | Hugo |

Encaminhamentos:

- [x] Aceitar as sugestões da SM-002 nos cinco documentos
- [x] Atualizar as versões e os históricos dos documentos e a Lista de ICs
- [x] Gerar de novo os arquivos e fazer o commit no repositório local `daygrid`
- [ ] Publicar o repositório `daygrid` no GitHub

### ATA-005, 19/11/2026

O CCB analisou e aprovou a SM-003, que adapta a documentação aos templates da disciplina.

- Tipo: reunião do CCB
- Presentes: *Hugo Henry Lemos Carvalho, Renata Martins da Silva, João Vitor Simonetti e Iago Medice Ferreira da Silva (4 de 4 integrantes; quórum atingido)*
- Presidente: Hugo Henry Lemos Carvalho

| Item | SM | Assunto | Decisão | Responsável |
| --- | --- | --- | --- | --- |
| 1 | SM-003 | DGD-REQ-001 reorganizado no template de Documento de Requisitos e renomeado; versão 1.2 | Aprovada por unanimidade | Renata |
| 2 | SM-003 | Nova ERS (DGD-REQ-003) v1.0 no template da disciplina, incluída na BL-PROJ | Aprovada | Renata e João Vitor |
| 3 | SM-003 | Novo Plano de Projeto (DGD-GER-006) v1.0, incluído na BL-PLAN | Aprovada | Hugo |
| 4 | SM-003 | PGC e Lista de ICs na v1.3; Arquitetura, Modelo de Dados e Plano de Testes na v1.2, com referências atualizadas | Aprovada | Hugo |

Encaminhamentos:

- [x] Atualizar os documentos no Docs
- [x] Gerar de novo os arquivos e fazer o commit no repositório `daygrid`
- [x] Atualizar o CHANGELOG (DGD-REL-001)
