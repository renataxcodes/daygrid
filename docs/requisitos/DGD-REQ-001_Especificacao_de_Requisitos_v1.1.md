# DGD-REQ-001: Especificação de Requisitos de Software do DayGrid

Data: 18/11/2026

## 1. Identificação do documento

Esta ERS define o que o DayGrid deve fazer: 25 requisitos funcionais, 10 regras de negócio e 8 requisitos não funcionais. Ela está na baseline BL-REQ, criada em 18/11/2026: a partir daqui, qualquer mudança exige uma Solicitação de Mudança aprovada pelo CCB.

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-REQ-001 |
| Título | Especificação de Requisitos de Software (ERS) |
| Versão | 1.1 (aprovada, baseline BL-REQ, alterada pela SM-002) |
| Responsável | Renata Martins da Silva (Analista de Requisitos) |
| Aprovação | CCB do projeto (ATA-002, 18/11/2026) |
| Baseline | BL-REQ (criada em 18/11/2026) |

### Histórico de revisões

| Versão | Data | Autor | Descrição |
| --- | --- | --- | --- |
| 1.1 | 18/11/2026 | Renata Martins da Silva | SM-002 (ATA-004): travessões retirados e cabeçalho das tabelas padronizado; sem mudança de conteúdo |
| 1.0 | 18/11/2026 | Renata Martins da Silva | Aprovada pelo CCB (ATA-002); entra na baseline BL-REQ |
| 0.8 | 18/11/2026 | Renata Martins da Silva | Troca de meta exige desvincular antes (RN07 e RF18), conforme ATA-001, decisão 20 |
| 0.7 | 18/11/2026 | Renata Martins da Silva | Link de redefinição passa a valer 15 minutos (RF04); data prevista obrigatória na tarefa (RF05) |
| 0.6 | 18/11/2026 | Renata Martins da Silva | Validade do link de redefinição (RF04); tarefa remarcada e concluída na semana conta como concluída (RN10) |
| 0.5 | 18/11/2026 | Renata Martins da Silva | Respondidas as últimas questões em aberto (RN05, RN08, RN09, RN10 e RF21) |
| 0.4 | 18/11/2026 | Renata Martins da Silva | Etiqueta passa a ser obrigatória em toda tarefa (RN01 e RF05) |
| 0.3 | 18/11/2026 | Renata Martins da Silva | Definido o que acontece ao excluir uma etiqueta em uso (RN01 e RF25) |
| 0.2 | 18/11/2026 | Renata Martins da Silva | Etiquetas personalizáveis (RN01 alterada, RF25 incluído); valores dos RNF confirmados pela equipe |
| 0.1 | 18/11/2026 | Renata Martins da Silva | Criação a partir do escopo aprovado pela equipe |

## 2. Introdução

### 2.1 Propósito

O DayGrid ajuda o usuário a organizar o dia a dia em tarefas, receber lembretes por e-mail, acompanhar metas e ver, toda semana, um resumo da própria produtividade.

### 2.2 Escopo

O sistema é uma aplicação web com cinco módulos:

| Módulo | Requisitos |
| --- | --- |
| M0: Usuários | RF01 a RF04 |
| M1: Tarefas | RF05 a RF12 e RF25 |
| M2: Lembretes | RF13 a RF16 |
| M3: Metas | RF17 a RF20 |
| M4: Relatório semanal | RF21 a RF24 |

Fora do escopo da versão 1.0: aplicativo mobile nativo, compartilhamento de tarefas entre usuários e notificações por push ou SMS.

### 2.3 Usuários

Há um único perfil: o **usuário cadastrado**, que gerencia apenas os próprios dados. O **agendador do sistema** atua como ator secundário: ele dispara os lembretes e gera o relatório semanal.

### 2.4 Convenções

- `RFxx`: requisito funcional · `RNxx`: regra de negócio · `RNFxx`: requisito não funcional.
- Prioridade: **Essencial** (sem ele não há entrega), **Importante** (esperado na v1.0) ou **Desejável** (pode ficar para depois).

## 3. Requisitos funcionais

### 3.1 M0: Usuários

| ID | Requisito | Prioridade | Critério de aceitação |
| --- | --- | --- | --- |
| RF01 | O sistema deve permitir o cadastro de usuário com nome, e-mail e senha. | Essencial | Um e-mail já cadastrado é recusado com mensagem; o cadastro válido leva à tela inicial |
| RF02 | O sistema deve permitir login com e-mail e senha. | Essencial | Credenciais erradas mostram mensagem sem informar qual campo está errado |
| RF03 | O sistema deve permitir que o usuário encerre a sessão. | Essencial | Depois do logout, as páginas internas redirecionam para o login |
| RF04 | O sistema deve permitir redefinir a senha por um link enviado ao e-mail cadastrado. | Desejável | O link vale por 15 minutos e expira depois de usado |

### 3.2 M1: Tarefas

| ID | Requisito | Prioridade | Critério de aceitação |
| --- | --- | --- | --- |
| RF05 | O sistema deve permitir criar uma tarefa com título, descrição, data prevista, prioridade e etiqueta. | Essencial | Título, data prevista e etiqueta são obrigatórios (RN01); a tarefa criada aparece na lista com status Pendente (RN02) |
| RF06 | O sistema deve permitir editar os dados de uma tarefa. | Essencial | As alterações aparecem na lista sem recarregar a sessão |
| RF07 | O sistema deve permitir excluir uma tarefa, com confirmação. | Essencial | A exclusão remove também as subtarefas e os lembretes vinculados |
| RF08 | O sistema deve permitir alterar o status da tarefa entre Pendente, Em andamento e Concluída. | Essencial | Ao concluir, a data de conclusão é registrada |
| RF09 | O sistema deve permitir adicionar, marcar como concluída e remover subtarefas de uma tarefa. | Importante | A tarefa mostra quantas subtarefas foram concluídas (ex.: 2/5) |
| RF10 | O sistema deve exibir as tarefas do dia, ordenadas por prioridade. | Essencial | Tarefas de prioridade Alta aparecem primeiro |
| RF11 | O sistema deve permitir filtrar tarefas por status, prioridade e etiqueta. | Importante | Os filtros podem ser combinados |
| RF12 | O sistema deve permitir remarcar a data prevista de uma tarefa. | Importante | A remarcação para uma data posterior marca a tarefa como adiada (RN04) |
| RF25 | O sistema deve permitir que o usuário crie, renomeie e exclua as próprias etiquetas (RN01). | Importante | Nomes de etiqueta repetidos são recusados; ao excluir uma etiqueta em uso, o usuário deve escolher outra etiqueta para as tarefas afetadas |

### 3.3 M2: Lembretes

| ID | Requisito | Prioridade | Critério de aceitação |
| --- | --- | --- | --- |
| RF13 | O sistema deve permitir criar um lembrete com data e horário, vinculado a uma tarefa ou independente. | Essencial | Data e horário no passado são recusados |
| RF14 | O sistema deve permitir definir a recorrência do lembrete: nenhuma, diária, semanal ou mensal. | Importante | Um lembrete recorrente mostra a data do próximo envio |
| RF15 | O sistema deve enviar o lembrete por e-mail ao endereço cadastrado no horário definido. | Essencial | O e-mail traz o título do lembrete e, se houver, o da tarefa |
| RF16 | O sistema deve permitir editar e excluir lembretes. | Essencial | Um lembrete excluído não é mais enviado |

### 3.4 M3: Metas

| ID | Requisito | Prioridade | Critério de aceitação |
| --- | --- | --- | --- |
| RF17 | O sistema deve permitir criar uma meta com título, descrição e prazo. | Essencial | Título e prazo são obrigatórios |
| RF18 | O sistema deve permitir vincular e desvincular tarefas de uma meta. | Essencial | Uma tarefa só pode pertencer a uma meta (RN07); vincular uma tarefa que já está em outra meta é recusado |
| RF19 | O sistema deve exibir uma barra de progresso da meta, calculada automaticamente (RN06). | Essencial | O percentual muda assim que uma tarefa vinculada é concluída ou reaberta |
| RF20 | O sistema deve permitir editar e excluir metas. | Importante | Ao excluir a meta, as tarefas vinculadas continuam existindo, sem meta |

### 3.5 M4: Relatório semanal

| ID | Requisito | Prioridade | Critério de aceitação |
| --- | --- | --- | --- |
| RF21 | O sistema deve gerar automaticamente, todo domingo às 23h59, o relatório da semana e exibi-lo na tela Relatórios. | Essencial | Relatórios de semanas anteriores continuam disponíveis para consulta |
| RF22 | O relatório deve mostrar o percentual de tarefas concluídas e o de tarefas adiadas (RN04, RN10). | Essencial | Os percentuais conferem com a contagem das tarefas da semana |
| RF23 | O relatório deve indicar os dias da semana mais produtivos (RN10). | Importante | Em caso de empate, todos os dias empatados aparecem |
| RF24 | O relatório deve mostrar o progresso acumulado de cada meta ativa (RN06). | Importante | O valor é o mesmo da barra de progresso no fim da semana |

## 4. Regras de negócio

As regras abaixo registram as decisões tomadas pela equipe em 18/11/2026 para os pontos do escopo que estavam ambíguos.

| ID | Regra | Requisitos |
| --- | --- | --- |
| RN01 | O sistema já vem com três etiquetas (Estudos, Trabalho e Pessoal). Toda tarefa deve ter uma etiqueta. Cada usuário pode criar, renomear e excluir as próprias etiquetas, que só ele vê. Ao excluir uma etiqueta em uso, o usuário deve escolher outra etiqueta para as tarefas que a usavam. | RF05, RF11, RF25 |
| RN02 | Toda tarefa nasce com status Pendente. Os status possíveis são Pendente, Em andamento e Concluída. | RF05, RF08 |
| RN03 | As prioridades são Baixa, Média e Alta. Quando o usuário não escolhe, vale Média. | RF05, RF10 |
| RN04 | Uma tarefa é **adiada** quando a data prevista passa sem que ela esteja concluída, ou quando a data prevista é remarcada para depois. | RF12, RF22 |
| RN05 | Subtarefas funcionam como checklist da tarefa principal. Elas não contam no progresso de metas nem no relatório semanal. A tarefa principal pode ser concluída mesmo com subtarefas pendentes. | RF09, RF19, RF22 |
| RN06 | O progresso de uma meta é o percentual de tarefas vinculadas concluídas (fórmula abaixo). Uma meta sem tarefas vinculadas tem progresso 0%. | RF19, RF24 |
| RN07 | Uma tarefa pode estar vinculada a no máximo uma meta. Vinculá-la a uma segunda meta é recusado: para trocar de meta, é preciso desvincular da atual primeiro. | RF18 |
| RN08 | Um lembrete pode ser vinculado a uma tarefa ou ser independente, e é sempre entregue por e-mail ao endereço cadastrado. Um lembrete vinculado a uma tarefa já concluída não é enviado. | RF13, RF15 |
| RN09 | Depois de cada envio, um lembrete recorrente é agendado para o mesmo horário no próximo dia, semana ou mês, conforme a recorrência. Na recorrência mensal, se o dia não existir no mês seguinte, o envio vai para o último dia daquele mês (por exemplo, um lembrete do dia 31 é enviado em 30 de abril). | RF14, RF15 |
| RN10 | O relatório cobre a semana de segunda a domingo e é gerado todo domingo às 23h59 (fuso America/Manaus). O **dia mais produtivo** é o dia com mais tarefas concluídas. Uma tarefa remarcada e concluída na mesma semana conta como concluída, e não como adiada. | RF21, RF22, RF23 |

### 4.1 Fórmulas

Progresso de uma meta (RN06):

```
progresso = (tarefas vinculadas concluídas / total de tarefas vinculadas) × 100
```

Percentuais do relatório (RN10), sobre as tarefas com data prevista na semana:

```
% concluídas = (concluídas / tarefas da semana) × 100
% adiadas    = (adiadas / tarefas da semana) × 100
```

Exemplo: uma meta com 8 tarefas vinculadas, das quais 3 foram concluídas, mostra 3 / 8 × 100 = 37,5%.

## 5. Requisitos não funcionais

Os valores numéricos abaixo foram confirmados pela equipe em 18/11/2026.

| ID | Categoria | Requisito |
| --- | --- | --- |
| RNF01 | Compatibilidade | Funcionar nas versões atuais do Chrome, Firefox e Edge |
| RNF02 | Usabilidade | Interface responsiva, usável em desktop e celular |
| RNF03 | Segurança | Senhas armazenadas apenas como hash (por exemplo, bcrypt), nunca em texto puro |
| RNF04 | Segurança | Cada usuário acessa somente as próprias tarefas, lembretes, metas e relatórios |
| RNF05 | Confiabilidade | Lembretes enviados em até 5 minutos após o horário definido |
| RNF06 | Desempenho | Lista de tarefas carregada em até 2 segundos com 100 tarefas cadastradas |
| RNF07 | Localização | Interface em português do Brasil, datas no formato dd/mm/aaaa e horários no fuso America/Manaus |
| RNF08 | Manutenibilidade | Código versionado no GitHub conforme o PGC (DGD-GER-001), com testes automatizados executados no CI |

## 6. Restrições, premissas e questões em aberto

### 6.1 Restrições

- Entrega final em 25/11/2026.
- Stack definida no PGC: HTML/CSS/JS, Python/Flask e MySQL.

### 6.2 Premissas

- O sistema terá acesso a um servidor SMTP para enviar e-mails.
- O servidor fica ligado continuamente, para que o agendador dispare lembretes e relatórios.

### 6.3 Questões em aberto

Nenhuma questão em aberto: todas foram respondidas pela equipe em 18/11/2026.
