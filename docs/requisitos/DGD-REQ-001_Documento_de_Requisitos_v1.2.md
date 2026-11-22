# DOCUMENTO DE REQUISITOS: DayGrid

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-REQ-001 |
| Título | Documento de Requisitos |
| Versão | 1.2 |
| Baseline | BL-REQ (alterada pelas SM-002 e SM-003) |
| Responsável | Renata Martins da Silva (Analista de Requisitos) |
| Aprovação | CCB do projeto (ATA-002, de 06/10/2026; ATA-005, de 17/11/2026) |

| Data | Versão | Descrição | Responsável |
| --- | --- | --- | --- |
| 17/11/2026 | 1.2 | SM-003 (ATA-005): documento reorganizado no template da disciplina e renomeado de "Especificação de Requisitos de Software" para "Documento de Requisitos"; critérios de aceitação incorporados à descrição dos RF; colunas "Depende de" e prioridade de RNF e RN incluídas | Renata Martins da Silva |
| 10/11/2026 | 1.1 | SM-002 (ATA-004): travessões retirados e cabeçalho das tabelas padronizado; sem mudança de conteúdo | Renata Martins da Silva |
| 06/10/2026 | 1.0 | Aprovada pelo CCB (ATA-002); entra na baseline BL-REQ | Renata Martins da Silva |
| 02/10/2026 | 0.8 | Troca de meta exige desvincular antes (RN07 e RF18), conforme ATA-001, decisão 20 | Renata Martins da Silva |
| 28/09/2026 | 0.7 | Link de redefinição passa a valer 15 minutos (RF04); data prevista obrigatória na tarefa (RF05) | Renata Martins da Silva |
| 25/09/2026 | 0.6 | Validade do link de redefinição (RF04); tarefa remarcada e concluída na semana conta como concluída (RN10) | Renata Martins da Silva |
| 17/09/2026 | 0.5 | Respondidas as últimas questões em aberto (RN05, RN08, RN09, RN10 e RF21) | Renata Martins da Silva |
| 16/09/2026 | 0.4 | Etiqueta passa a ser obrigatória em toda tarefa (RN01 e RF05) | Renata Martins da Silva |
| 15/09/2026 | 0.3 | Definido o que acontece ao excluir uma etiqueta em uso (RN01 e RF25) | Renata Martins da Silva |
| 11/09/2026 | 0.2 | Etiquetas personalizáveis (RN01 alterada, RF25 incluído); valores dos RNF confirmados pela equipe | Renata Martins da Silva |
| 08/09/2026 | 0.1 | Criação a partir do escopo aprovado pela equipe | Renata Martins da Silva |

## 1. Introdução

### 1.1 Objetivo

Este documento define o que o DayGrid deve fazer: 25 requisitos funcionais, 8 requisitos não funcionais e 10 regras de negócio. Ele faz parte da baseline BL-REQ, e por isso qualquer alteração depende de uma Solicitação de Mudança aprovada pelo CCB. A forma como o sistema atende a estes requisitos está na Especificação de Requisitos de Software (DGD-REQ-003).

### 1.2 Escopo do Sistema

O DayGrid é uma aplicação web que ajuda o usuário a organizar o dia a dia em tarefas, receber lembretes por e-mail, acompanhar metas e ver, toda semana, um resumo da própria produtividade. O sistema tem cinco módulos: usuários (M0, RF01 a RF04), tarefas (M1, RF05 a RF12 e RF25), lembretes (M2, RF13 a RF16), metas (M3, RF17 a RF20) e relatório semanal (M4, RF21 a RF24).

Ficam fora da versão 1.0 o aplicativo mobile nativo, o compartilhamento de tarefas entre usuários e as notificações por push ou SMS.

## 2. Definições, Acrônimos e Abreviações

| Termo | Definição |
| --- | --- |
| RF | Requisito funcional: o que o sistema deve fazer (RF01 a RF25) |
| RNF | Requisito não funcional: qualidade ou restrição do sistema (RNF01 a RNF08) |
| RN | Regra de negócio: decisão da equipe que os requisitos devem obedecer (RN01 a RN10) |
| Prioridade | Essencial (sem ele não há entrega), Importante (esperado na versão 1.0) ou Desejável (pode ficar para uma versão posterior) |
| Depende de | Requisitos ou regras que precisam existir para que o item funcione |
| Tarefa | Atividade do usuário com título, data prevista, prioridade, etiqueta e status |
| Subtarefa | Item de checklist de uma tarefa |
| Etiqueta | Classificação personalizável da tarefa (por exemplo, Estudos, Trabalho e Pessoal) |
| Tarefa adiada | Tarefa cuja data prevista passou sem conclusão, ou que foi remarcada para depois (RN04) |
| Lembrete | Aviso enviado por e-mail em data e horário definidos, com ou sem recorrência |
| Meta | Objetivo com prazo, ao qual o usuário vincula tarefas |
| Relatório semanal | Resumo da semana de segunda a domingo, gerado todo domingo às 23h59 |
| Agendador | Componente do sistema que dispara os lembretes e gera o relatório sem ação do usuário |
| SMTP | Protocolo de envio de e-mail; no DayGrid, o servidor do Gmail |
| CCB | Comitê de Controle de Configuração, que aprova baselines e Solicitações de Mudança |

## 3. Visão Geral do Sistema

O sistema tem um único perfil de usuário, o usuário cadastrado, que gerencia apenas os próprios dados. O agendador do sistema atua como ator secundário, responsável por disparar os lembretes e gerar o relatório semanal.

O usuário cria tarefas do dia, organiza-as por etiqueta, prioridade e status, divide-as em subtarefas e as vincula a metas, que mostram uma barra de progresso calculada automaticamente. Os lembretes chegam por e-mail no horário definido. Todo domingo, o sistema gera um relatório com o percentual de tarefas concluídas e adiadas, os dias mais produtivos e o progresso das metas.

Restrições: entrega da documentação em 25/11/2026; stack definida no PGC (HTML, CSS e JavaScript, Python com Flask e MySQL).

Premissas: o sistema tem acesso a um servidor SMTP para enviar e-mails, e o servidor fica ligado continuamente, para que o agendador dispare lembretes e relatórios.

## 4. Requisitos Funcionais (RF)

| ID | Descrição | Prioridade | Depende de |
| --- | --- | --- | --- |
| RF01 | O sistema deve permitir o cadastro de usuário com nome, e-mail e senha. Critério de aceitação: um e-mail já cadastrado é recusado com mensagem; o cadastro válido leva à tela inicial. | Essencial | Nenhum |
| RF02 | O sistema deve permitir login com e-mail e senha. Critério de aceitação: credenciais erradas mostram mensagem sem informar qual campo está errado. | Essencial | RF01 |
| RF03 | O sistema deve permitir que o usuário encerre a sessão. Critério de aceitação: depois do logout, as páginas internas redirecionam para o login. | Essencial | RF02 |
| RF04 | O sistema deve permitir redefinir a senha por um link enviado ao e-mail cadastrado. Critério de aceitação: o link vale por 15 minutos e expira depois de usado. | Desejável | RF01 |
| RF05 | O sistema deve permitir criar uma tarefa com título, descrição, data prevista, prioridade e etiqueta. Critério de aceitação: título, data prevista e etiqueta são obrigatórios (RN01); a tarefa criada aparece na lista com status Pendente (RN02). | Essencial | RF02, RN01, RN02, RN03 |
| RF06 | O sistema deve permitir editar os dados de uma tarefa. Critério de aceitação: as alterações aparecem na lista sem recarregar a sessão. | Essencial | RF05 |
| RF07 | O sistema deve permitir excluir uma tarefa, com confirmação. Critério de aceitação: a exclusão remove também as subtarefas e os lembretes vinculados. | Essencial | RF05 |
| RF08 | O sistema deve permitir alterar o status da tarefa entre Pendente, Em andamento e Concluída. Critério de aceitação: ao concluir, a data de conclusão é registrada. | Essencial | RF05, RN02 |
| RF09 | O sistema deve permitir adicionar, marcar como concluída e remover subtarefas de uma tarefa. Critério de aceitação: a tarefa mostra quantas subtarefas foram concluídas (ex.: 2/5). | Importante | RF05, RN05 |
| RF10 | O sistema deve exibir as tarefas do dia, ordenadas por prioridade. Critério de aceitação: tarefas de prioridade Alta aparecem primeiro. | Essencial | RF05, RN03 |
| RF11 | O sistema deve permitir filtrar tarefas por status, prioridade e etiqueta. Critério de aceitação: os filtros podem ser combinados. | Importante | RF05, RN01 |
| RF12 | O sistema deve permitir remarcar a data prevista de uma tarefa. Critério de aceitação: a remarcação para uma data posterior marca a tarefa como adiada (RN04). | Importante | RF05, RN04 |
| RF13 | O sistema deve permitir criar um lembrete com data e horário, vinculado a uma tarefa ou independente. Critério de aceitação: data e horário no passado são recusados. | Essencial | RF02, RN08 |
| RF14 | O sistema deve permitir definir a recorrência do lembrete: nenhuma, diária, semanal ou mensal. Critério de aceitação: um lembrete recorrente mostra a data do próximo envio. | Importante | RF13, RN09 |
| RF15 | O sistema deve enviar o lembrete por e-mail ao endereço cadastrado no horário definido. Critério de aceitação: o e-mail traz o título do lembrete e, se houver, o da tarefa. | Essencial | RF13, RN08, RN09 |
| RF16 | O sistema deve permitir editar e excluir lembretes. Critério de aceitação: um lembrete excluído não é mais enviado. | Essencial | RF13 |
| RF17 | O sistema deve permitir criar uma meta com título, descrição e prazo. Critério de aceitação: título e prazo são obrigatórios. | Essencial | RF02 |
| RF18 | O sistema deve permitir vincular e desvincular tarefas de uma meta. Critério de aceitação: uma tarefa só pode pertencer a uma meta (RN07); vincular uma tarefa que já está em outra meta é recusado. | Essencial | RF05, RF17, RN07 |
| RF19 | O sistema deve exibir uma barra de progresso da meta, calculada automaticamente (RN06). Critério de aceitação: o percentual muda assim que uma tarefa vinculada é concluída ou reaberta. | Essencial | RF18, RN06 |
| RF20 | O sistema deve permitir editar e excluir metas. Critério de aceitação: ao excluir a meta, as tarefas vinculadas continuam existindo, sem meta. | Importante | RF17 |
| RF21 | O sistema deve gerar automaticamente, todo domingo às 23h59, o relatório da semana e exibi-lo na tela Relatórios. Critério de aceitação: relatórios de semanas anteriores continuam disponíveis para consulta. | Essencial | RF05, RN10 |
| RF22 | O relatório deve mostrar o percentual de tarefas concluídas e o de tarefas adiadas (RN04, RN10). Critério de aceitação: os percentuais conferem com a contagem das tarefas da semana. | Essencial | RF21, RN04, RN10 |
| RF23 | O relatório deve indicar os dias da semana mais produtivos (RN10). Critério de aceitação: em caso de empate, todos os dias empatados aparecem. | Importante | RF21, RN10 |
| RF24 | O relatório deve mostrar o progresso acumulado de cada meta ativa (RN06). Critério de aceitação: o valor é o mesmo da barra de progresso no fim da semana. | Importante | RF19, RF21, RN06 |
| RF25 | O sistema deve permitir que o usuário crie, renomeie e exclua as próprias etiquetas (RN01). Critério de aceitação: nomes de etiqueta repetidos são recusados; ao excluir uma etiqueta em uso, o usuário deve escolher outra etiqueta para as tarefas afetadas. | Importante | RF02, RN01 |

## 5. Requisitos Não Funcionais (RNF)

Os valores numéricos abaixo foram confirmados pela equipe em 11/09/2026.

| ID | Descrição | Prioridade | Depende de |
| --- | --- | --- | --- |
| RNF01 | Compatibilidade: funcionar nas versões atuais do Chrome, Firefox e Edge. | Importante | Nenhum |
| RNF02 | Usabilidade: interface responsiva, usável em desktop e celular. | Importante | Nenhum |
| RNF03 | Segurança: senhas armazenadas apenas como hash (por exemplo, bcrypt), nunca em texto puro. | Essencial | RF01, RF02, RF04 |
| RNF04 | Segurança: cada usuário acessa somente as próprias tarefas, lembretes, metas e relatórios. | Essencial | RF02 |
| RNF05 | Confiabilidade: lembretes enviados em até 5 minutos após o horário definido. | Essencial | RF15 |
| RNF06 | Desempenho: lista de tarefas carregada em até 2 segundos com 100 tarefas cadastradas. | Importante | RF10 |
| RNF07 | Localização: interface em português do Brasil, datas no formato dd/mm/aaaa e horários no fuso America/Manaus. | Essencial | Nenhum |
| RNF08 | Manutenibilidade: código versionado no GitHub conforme o PGC (DGD-GER-001), com testes automatizados executados no CI. | Importante | Nenhum |

## 6. Regras de Negócio

As regras abaixo registram as decisões tomadas pela equipe entre 08/09/2026 e 02/10/2026 para os pontos do escopo que estavam ambíguos. A prioridade de cada regra é a do requisito de maior prioridade que a aplica. Os requisitos que aplicam cada regra aparecem na coluna "Depende de" da seção 4 e na Matriz de Rastreabilidade (DGD-REQ-002).

| ID | Descrição | Prioridade | Depende de |
| --- | --- | --- | --- |
| RN01 | O sistema já vem com três etiquetas (Estudos, Trabalho e Pessoal). Toda tarefa deve ter uma etiqueta. Cada usuário pode criar, renomear e excluir as próprias etiquetas, que só ele vê. Ao excluir uma etiqueta em uso, o usuário deve escolher outra etiqueta para as tarefas que a usavam. | Essencial | Nenhum |
| RN02 | Toda tarefa nasce com status Pendente. Os status possíveis são Pendente, Em andamento e Concluída. | Essencial | Nenhum |
| RN03 | As prioridades são Baixa, Média e Alta. Quando o usuário não escolhe, vale Média. | Essencial | Nenhum |
| RN04 | Uma tarefa é adiada quando a data prevista passa sem que ela esteja concluída, ou quando a data prevista é remarcada para depois. | Essencial | RN02 |
| RN05 | Subtarefas funcionam como checklist da tarefa principal. Elas não contam no progresso de metas nem no relatório semanal. A tarefa principal pode ser concluída mesmo com subtarefas pendentes. | Essencial | Nenhum |
| RN06 | O progresso de uma meta é o percentual de tarefas vinculadas concluídas (fórmula da seção 6.1). Uma meta sem tarefas vinculadas tem progresso 0%. | Essencial | RN02, RN07 |
| RN07 | Uma tarefa pode estar vinculada a no máximo uma meta. Vinculá-la a uma segunda meta é recusado: para trocar de meta, é preciso desvincular da atual primeiro. | Essencial | Nenhum |
| RN08 | Um lembrete pode ser vinculado a uma tarefa ou ser independente, e é sempre entregue por e-mail ao endereço cadastrado. Um lembrete vinculado a uma tarefa já concluída não é enviado. | Essencial | RN02 |
| RN09 | Depois de cada envio, um lembrete recorrente é agendado para o mesmo horário no próximo dia, semana ou mês, conforme a recorrência. Na recorrência mensal, se o dia não existir no mês seguinte, o envio vai para o último dia daquele mês (por exemplo, um lembrete do dia 31 é enviado em 30 de abril). | Essencial | Nenhum |
| RN10 | O relatório cobre a semana de segunda a domingo e é gerado todo domingo às 23h59 (fuso America/Manaus). O dia mais produtivo é o dia com mais tarefas concluídas. Uma tarefa remarcada e concluída na mesma semana conta como concluída, e não como adiada. | Essencial | RN04 |

### 6.1 Fórmulas

Progresso de uma meta (RN06):

```latex
\text{progresso} = \frac{\text{tarefas vinculadas concluídas}}{\text{total de tarefas vinculadas}} \times 100
```

Percentuais do relatório (RN10), sobre as tarefas com data prevista na semana:

```latex
\%\,\text{concluídas} = \frac{\text{concluídas}}{\text{tarefas da semana}} \times 100 \qquad \%\,\text{adiadas} = \frac{\text{adiadas}}{\text{tarefas da semana}} \times 100
```

Exemplo: uma meta com 8 tarefas vinculadas, das quais 3 foram concluídas, mostra 3 / 8 × 100 = 37,5%.
