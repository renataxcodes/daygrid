# DGD-TST-001 — Plano e Casos de Teste — DayGrid

Data: 18/11/2026

## 1. Identificação do documento

Este plano tem 44 casos de teste (CT-01 a CT-44) que cobrem os 33 requisitos da ERS. O resultado deles é a evidência da Auditoria Funcional (FCA) antes da entrega de 25/11/2026.

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-TST-001 |
| Título | Plano e Casos de Teste |
| Versão | 1.0 (aprovada — baseline BL-PROJ) |
| Responsável | Iago Medice Ferreira da Silva (Analista de Testes) |
| Baseline | BL-IMPL (prevista para 24/11/2026) |
| Local no repositório | `tests/` |
| Documentos de base | DGD-REQ-001 (ERS) v1.0 · DGD-ARQ-001 (Arquitetura) v1.0 · DGD-BD-001 (Modelo de Dados) v1.0 · DGD-REQ-002 (Matriz de Rastreabilidade) |

### Histórico de revisões

| Versão | Data | Autor | Descrição |
| --- | --- | --- | --- |
| 1.0 | 18/11/2026 | Equipe DayGrid | Aprovado pelo CCB (ATA-003, SM-001); entra na baseline BL-PROJ |
| 0.2 | 18/11/2026 | Equipe DayGrid | Revisão de consistência: documentos de base atualizados (ERS v1.0, ARQ v0.4, BD v0.4) |
| 0.1 | 18/11/2026 | Equipe DayGrid | Criação: 44 casos de teste |

## 2. Estratégia

Os testes seguem a separação em camadas da arquitetura (DA-03). Por isso, a maior parte pode ser automatizada sem abrir o navegador.

| Nível | O que testa | Como | Casos |
| --- | --- | --- | --- |
| Unitário | Serviços e regras de negócio (RN01 a RN10), sem HTTP | pytest, chamando os serviços diretamente | 4 |
| Integração | Rotas da API + banco MySQL de teste | pytest com o cliente de testes do Flask | 34 |
| Sistema (manual) | Front-end, e-mail real no Gmail, navegadores e celular | Roteiro executado por uma pessoa, com captura de tela como evidência | 6 |

- Os testes automáticos rodam no GitHub Actions a cada pull request (RNF08). Um PR com teste falhando não pode ser integrado a `main`.
- Os jobs do agendador (lembretes e relatório) são testados chamando a função do job diretamente, com um relógio controlado. Assim, não é preciso esperar o domingo às 23h59.
- Nos testes automáticos, o envio de e-mail é simulado (o Flask-Mail guarda as mensagens em vez de enviá-las). O envio real pelo Gmail é testado só nos casos manuais.

## 3. Ambiente, ferramentas e dados de teste

| Item | Definição |
| --- | --- |
| Banco | MySQL 8.0, banco `daygrid_teste`, separado do banco de desenvolvimento. Ele é recriado a partir das migrações (DGD-BD-001) antes de cada execução |
| Configuração | Arquivo `.env.test`, com `TESTING=True` e `MAIL_SUPPRESS_SEND=True` (e-mails simulados) |
| Ferramentas | pytest, cliente de testes do Flask, Postman (testes manuais da API) e DevTools do navegador |
| Relógio | Os serviços recebem a hora atual por parâmetro, para que os testes fixem datas como "domingo, 22/11/2026 às 23h59" |
| E-mail real | Conta Gmail do projeto (DGD-ARQ-001, seção 9.5), usada só nos casos manuais |
| Navegadores | Versões atuais do Chrome, Firefox e Edge (RNF01) |

### 3.1 Dados de teste

| Dado | Conteúdo |
| --- | --- |
| Usuário A | `ana@teste.com`, com as 3 etiquetas iniciais |
| Usuário B | `bruno@teste.com`, usado para testar o isolamento (RNF04) |
| Semana de referência | Segunda 16/11/2026 a domingo 22/11/2026 |
| Meta "Entregar o DayGrid" | 8 tarefas vinculadas, 3 delas concluídas |
| Carga de desempenho | 100 tarefas do usuário A (RNF06) |

## 4. Critérios

| Critério | Condição |
| --- | --- |
| **Entrada** (pode começar a testar) | O código do módulo está em um pull request com o CI configurado; o banco de teste sobe pelas migrações; a ERS está na BL-REQ |
| **Saída** (pode criar a BL-IMPL) | Todos os 44 casos foram executados; todos os casos de requisitos **Essenciais** foram aprovados; nenhum defeito de severidade Alta está aberto |
| **Suspensão** (para de testar) | O banco de teste não sobe, o login (RF02) falha, ou o CI está quebrado em `main`. Os testes recomeçam quando o problema é corrigido |

Um caso de requisito Importante ou Desejável pode ficar reprovado na BL-IMPL somente se o CCB aprovar e o defeito ficar registrado nas Notas de Release (DGD-REL-001) como problema conhecido.

## 5. Casos de teste — M0 Usuários

| ID | Requisito | Tipo | Cenário e passos | Resultado esperado |
| --- | --- | --- | --- | --- |
| CT-01 | RF01 | Integração | `POST /api/auth/cadastro` com nome, e-mail novo e senha | `201`; o usuário existe e tem as etiquetas Estudos, Trabalho e Pessoal |
| CT-02 | RF01 | Integração | Cadastrar de novo com o e-mail `ana@teste.com` | `409`, com a mensagem de e-mail já cadastrado; nenhum usuário novo |
| CT-03 | RF02 | Integração | `POST /api/auth/login` com e-mail e senha corretos | `200`; a sessão fica aberta e `GET /api/tarefas` responde `200` |
| CT-04 | RF02 | Integração | Login com senha errada e, depois, com e-mail inexistente | `401` nos dois casos, com a **mesma** mensagem, que não diz qual campo está errado |
| CT-05 | RF03 | Integração | Logar, chamar `POST /api/auth/logout` e depois `GET /api/tarefas` | O logout responde `204`; a rota interna responde `401` |
| CT-06 | RF04 | Integração | Pedir a redefinição, usar o link 5 minutos depois e logar com a senha nova | Um e-mail com o link é gerado; a senha é trocada; `usado_em` é preenchido |
| CT-07 | RF04 | Integração | Usar o mesmo link uma segunda vez | Recusado; a senha não muda |
| CT-08 | RF04 | Integração | Pedir a redefinição e usar o link 16 minutos depois | Recusado por expiração (validade de 15 minutos) |
| CT-09 | RNF03 | Unitário | Cadastrar o usuário e ler `senha_hash` no banco | O valor começa com `$2b$` (bcrypt), tem 60 caracteres e é diferente da senha digitada |
| CT-10 | RNF04 | Integração | Logado como Bruno, pedir `GET`, `PUT` e `DELETE` em uma tarefa da Ana | `404` nas três chamadas; a tarefa da Ana não muda |

## 6. Casos de teste — M1 Tarefas e etiquetas

| ID | Requisito | Tipo | Cenário e passos | Resultado esperado |
| --- | --- | --- | --- | --- |
| CT-11 | RF05, RN02, RN03 | Integração | Criar uma tarefa com título, data prevista e etiqueta, sem informar prioridade | `201`; status Pendente e prioridade Média |
| CT-12 | RF05, RN01 | Integração | Tentar criar três tarefas: sem título, sem data prevista e sem etiqueta | `400` em cada uma, com a mensagem do campo que falta; nenhuma tarefa criada |
| CT-13 | RF06 | Integração | Editar título, descrição e prioridade de uma tarefa | `200`; `GET` devolve os dados novos |
| CT-14 | RF07 | Integração | Excluir uma tarefa que tem 2 subtarefas, 1 lembrete e 1 remarcação | `204`; a tarefa, as subtarefas, o lembrete e a remarcação somem do banco |
| CT-15 | RF08, RN02 | Integração | Mudar o status para Concluída, depois para Pendente, depois para um valor inválido | Concluída preenche `concluida_em`; voltar para Pendente limpa `concluida_em`; o valor inválido dá `400` |
| CT-16 | RF09, RN05 | Integração | Adicionar 5 subtarefas, concluir 2 e então concluir a tarefa principal | A tarefa mostra 2/5; a tarefa principal pode ser concluída com 3 subtarefas pendentes |
| CT-17 | RF10, RN03 | Integração | Criar 3 tarefas para hoje (Baixa, Alta, Média) e 1 para amanhã; chamar `GET /api/tarefas` | Vem só as 3 de hoje, na ordem Alta, Média, Baixa |
| CT-18 | RF11 | Integração | Filtrar por status Pendente + prioridade Alta + etiqueta Estudos | Vem só as tarefas que atendem aos três filtros ao mesmo tempo |
| CT-19 | RF12, RN04 | Integração | Remarcar uma tarefa de 18/11 para 20/11 e outra de 20/11 para 19/11 | A primeira gera um registro em `remarcacao` (adiada); a segunda muda a data, sem registro |
| CT-20 | RF25, RN01 | Integração | Criar a etiqueta "Academia"; depois tentar criar "academia" | A primeira dá `201`; a segunda dá `409` (nome repetido, sem diferença de maiúsculas) |
| CT-21 | RF25 | Integração | Renomear "Academia" para "Saúde" | `200`; as tarefas com essa etiqueta passam a mostrar "Saúde" |
| CT-22 | RF25, RN01 | Integração | Excluir uma etiqueta usada por 3 tarefas: primeiro sem `substituta`, depois com `substituta` = Pessoal | Sem substituta: `400` e nada muda. Com substituta: as 3 tarefas passam para Pessoal e a etiqueta é excluída |

## 7. Casos de teste — M2 Lembretes

| ID | Requisito | Tipo | Cenário e passos | Resultado esperado |
| --- | --- | --- | --- | --- |
| CT-23 | RF13, RN08 | Integração | Criar um lembrete vinculado a uma tarefa, um independente e um com data e hora no passado | Os dois primeiros dão `201`; o do passado dá `400` |
| CT-24 | RF14 | Integração | Criar um lembrete semanal para quarta, 18/11, às 9h00 e listar os lembretes | A listagem mostra a recorrência semanal e o primeiro envio em 18/11 às 9h00 |
| CT-25 | RF15, RN09 | Integração | Com o relógio fixado 1 minuto depois do horário de um lembrete diário, executar o job `enviar_lembretes` | 1 e-mail gerado para o endereço do usuário; `proximo_envio` avança 1 dia; `ultimo_envio` é preenchido |
| CT-26 | RN08 | Integração | Concluir a tarefa de um lembrete vencido e executar o job | Nenhum e-mail gerado; o lembrete avança para a próxima ocorrência (ou é desativado, se não tiver recorrência) |
| CT-27 | RN09 | Unitário | Calcular os próximos envios mensais de um lembrete do dia 31/01/2027 e de outro do dia 31/01/2028 | 2027: 28/02 → 31/03 → 30/04 → 31/05. 2028 (bissexto): 29/02 → 31/03 |
| CT-28 | RF16 | Integração | Editar o horário de um lembrete; excluir outro e executar o job no horário dele | A edição muda `proximo_envio`; o lembrete excluído não gera e-mail |
| CT-29 | RF15, RNF05 | Manual | Com a conta Gmail real, criar um lembrete para daqui a 3 minutos e aguardar | O e-mail chega à caixa de entrada em até 5 minutos depois do horário; anotar o horário de chegada como evidência |

## 8. Casos de teste — M3 Metas

| ID | Requisito | Tipo | Cenário e passos | Resultado esperado |
| --- | --- | --- | --- | --- |
| CT-30 | RF17 | Integração | Criar uma meta sem prazo e depois uma com título e prazo | Sem prazo: `400`. Com prazo: `201` e progresso 0% |
| CT-31 | RF18, RN07 | Integração | Vincular a tarefa X à meta A; tentar vinculá-la também à meta B; desvincular de A e vincular a B | A segunda vinculação dá `409` (já está em outra meta); depois de desvincular de A, a vinculação a B dá `200` |
| CT-32 | RF19, RN06 | Integração | Na meta "Entregar o DayGrid" (8 tarefas, 3 concluídas), consultar o progresso; concluir mais 1 e consultar de novo; consultar uma meta sem tarefas | 37,5% → 50,0%; a meta sem tarefas mostra 0% |
| CT-33 | RF20 | Integração | Editar o prazo da meta e depois excluí-la | A edição dá `200`; após a exclusão, as 8 tarefas continuam existindo, com `meta_id` nulo |

## 9. Casos de teste — M4 Relatório semanal

Todos os casos usam a semana de referência: de segunda 16/11/2026 a domingo 22/11/2026.

| ID | Requisito | Tipo | Cenário e passos | Resultado esperado |
| --- | --- | --- | --- | --- |
| CT-34 | RF21, RN10 | Integração | Fixar o relógio em 22/11/2026 às 23h59 (Manaus) e executar `gerar_relatorios` duas vezes | 1 relatório por usuário, de 16/11 a 22/11; a segunda execução não duplica (UNIQUE por semana); `GET /api/relatorios` lista o relatório |
| CT-35 | RF22, RN04 | Integração | 10 tarefas na semana: 7 concluídas, 2 vencidas sem conclusão e 1 remarcada para a semana seguinte | 70% concluídas e 30% adiadas |
| CT-36 | RF22, RN10 | Integração | Remarcar uma tarefa de 17/11 para 19/11 e concluí-la em 19/11 | No relatório, ela conta como **concluída**, e não como adiada |
| CT-37 | RF23, RN10 | Unitário | Concluir 3 tarefas na terça, 3 na quinta e 1 na sexta | Dias mais produtivos: terça e quinta (empate, ambos aparecem) |
| CT-38 | RF24, RN06 | Integração | Gerar o relatório com a meta "Entregar o DayGrid" em 37,5% e depois concluir mais uma tarefa da meta | O relatório guarda 37,5%. A barra da meta passa para 50%, mas o relatório já gerado não muda |
| CT-39 | RN05 | Unitário | Uma tarefa da semana com 4 subtarefas concluídas e a tarefa principal pendente | O relatório conta 1 tarefa (adiada), e não 5; subtarefas não entram na contagem |

## 10. Casos de teste — Requisitos não funcionais

Os RNF03 e RNF04 já estão cobertos pelos casos CT-09 e CT-10, e o RNF05 pelo CT-29.

| ID | Requisito | Tipo | Cenário e passos | Resultado esperado |
| --- | --- | --- | --- | --- |
| CT-40 | RNF01 | Manual | No Chrome, no Firefox e no Edge: cadastrar, logar, criar tarefa, concluir tarefa, criar meta e abrir o relatório | O fluxo funciona sem erros nos três navegadores; o console não mostra erros de JavaScript |
| CT-41 | RNF02 | Manual | Repetir o fluxo do CT-40 com o DevTools simulando uma tela de celular (375 px de largura) | Nenhum conteúdo cortado nem rolagem horizontal; botões e campos podem ser usados com o dedo |
| CT-42 | RNF06 | Manual | Com as 100 tarefas da carga de teste, abrir a lista de tarefas e medir o tempo na aba Rede do DevTools | A lista termina de carregar em até 2 segundos |
| CT-43 | RNF07 | Manual | Concluir uma tarefa às 23h30 (Manaus), que é 03h30 do dia seguinte em UTC, e conferir as telas | A tela mostra a data no formato dd/mm/aaaa e o dia de Manaus; no relatório, a conclusão conta no dia local, e não no dia seguinte |
| CT-44 | RNF08 | Manual | Abrir um pull request com um teste falhando de propósito | O GitHub Actions executa o pytest, marca o PR como falho e bloqueia o merge em `main` |

## 11. Exemplos de testes automatizados

Cada teste automático tem o ID do caso no nome da função (`test_ct27_...`). Assim, o relatório do pytest no CI mostra diretamente quais casos passaram.

### 11.1 Teste unitário — CT-27 (RN09)

Este teste foi executado contra a função `proximo_mensal` do Documento de Arquitetura (seção 6.1), e os dois cenários passaram.

```python
# tests/unit/test_lembrete_service.py
from datetime import datetime
import pytest
from app.services.lembrete_service import proximo_mensal

def sequencia(inicio, dia_referencia, n):
    datas, atual = [], inicio
    for _ in range(n):
        atual = proximo_mensal(atual, dia_referencia)
        datas.append(atual.strftime("%d/%m/%Y"))
    return datas

@pytest.mark.parametrize("inicio, esperado", [
    (datetime(2027, 1, 31, 9, 0), ["28/02/2027", "31/03/2027", "30/04/2027", "31/05/2027"]),
    (datetime(2028, 1, 31, 9, 0), ["29/02/2028", "31/03/2028", "30/04/2028", "31/05/2028"]),  # bissexto
])
def test_ct27_recorrencia_mensal_vai_para_ultimo_dia(inicio, esperado):
    assert sequencia(inicio, 31, 4) == esperado
```

### 11.2 Teste de integração — CT-22 (RF25, RN01)

```python
# tests/integration/test_etiquetas.py
def test_ct22_excluir_etiqueta_em_uso_exige_substituta(cliente_ana, etiqueta_em_3_tarefas, etiqueta_pessoal):
    url = f"/api/etiquetas/{etiqueta_em_3_tarefas.id}"

    # Sem substituta: recusa e não muda nada
    resposta = cliente_ana.delete(url)
    assert resposta.status_code == 400
    assert Etiqueta.query.get(etiqueta_em_3_tarefas.id) is not None

    # Com substituta: move as tarefas e exclui a etiqueta
    resposta = cliente_ana.delete(f"{url}?substituta={etiqueta_pessoal.id}")
    assert resposta.status_code == 204
    assert Etiqueta.query.get(etiqueta_em_3_tarefas.id) is None
    assert Tarefa.query.filter_by(etiqueta_id=etiqueta_pessoal.id).count() == 3
```

`cliente_ana`, `etiqueta_em_3_tarefas` e `etiqueta_pessoal` são *fixtures* do pytest: elas preparam o banco de teste antes de cada caso e ficam em `tests/conftest.py`.

### 11.3 Comando de execução

```bash
pytest tests/ -v              # todos os casos automáticos
pytest tests/ -k ct22 -v      # só um caso, pelo ID
```

## 12. Defeitos, cronograma e responsabilidades

### 12.1 Gestão de defeitos

Todo caso reprovado vira uma issue no GitHub com o rótulo `bug`, o ID do caso no título (ex.: `[CT-22] Etiqueta excluída sem substituta`) e uma severidade:

| Severidade | Quando usar | Bloqueia a BL-IMPL? |
| --- | --- | --- |
| Alta | Requisito Essencial não funciona, ou há perda ou vazamento de dados | Sim |
| Média | Requisito Importante não funciona, ou existe um jeito de contornar o problema | Só se o CCB decidir que sim |
| Baixa | Problema visual ou de texto | Não |

A correção segue o fluxo normal de branch (`fix/<id-issue>-...`) e pull request. O caso é executado de novo antes de fechar a issue. Se a correção exigir mudar um IC que já está em baseline, abre-se também uma Solicitação de Mudança.

### 12.2 Cronograma

| Período | Atividade |
| --- | --- |
| 19/11 a 23/11/2026 | Testes unitários e de integração escritos junto com o código, executados no CI a cada pull request |
| 23/11/2026 | Casos manuais (CT-29 e CT-40 a CT-44) |
| 24/11/2026 | Reteste dos defeitos corrigidos e execução completa; criação da BL-IMPL |
| 25/11/2026 | Auditoria Funcional (FCA) a partir da Matriz de Rastreabilidade; BL-REL |

### 12.3 Responsabilidades

| Integrante | Responsabilidade nos testes |
| --- | --- |
| Iago Medice Ferreira da Silva | Mantém este plano, executa os casos manuais e registra os resultados na Matriz de Rastreabilidade |
| João Vitor Simonetti | Escreve os testes automáticos com o código e mantém o CI |
| Renata Martins da Silva | Confere se os resultados esperados correspondem à ERS e participa da FCA |
| Hugo Henry Lemos Carvalho | Decide no CCB sobre defeitos de severidade Média e cria a BL-IMPL |

### 12.4 Registro dos resultados

O resultado de cada caso vai para a coluna "Resultado do teste" da Matriz de Rastreabilidade (DGD-REQ-002), com os valores Não executado, Aprovado ou Reprovado. Um requisito só fica "Testado" quando **todos** os seus casos estão aprovados.
