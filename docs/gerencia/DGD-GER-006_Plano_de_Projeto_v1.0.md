# PLANO DE PROJETO: DayGrid

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-GER-006 |
| Título | Plano de Projeto |
| Versão | 1.0 |
| Baseline | BL-PLAN |
| Responsável | Hugo Henry Lemos Carvalho (Gerente de Projeto e de Configuração) |

Tabela 1 Registro de Alterações

| Data | Versão | Descrição | Responsável |
| --- | --- | --- | --- |
| 17/11/2026 | 1.0 | Criação no template da disciplina; aprovado pelo CCB (SM-003, ATA-005) e incluído na BL-PLAN | Hugo Henry Lemos Carvalho |

## 1. Identificação do Projeto

| Campo | Valor |
| --- | --- |
| Projeto | DayGrid: lista de afazeres diária |
| Instituição | Centro Universitário FAMETRO, curso de Engenharia de Software |
| Equipe | Hugo Henry Lemos Carvalho, Renata Martins da Silva, João Vitor Simonetti e Iago Medice Ferreira da Silva |
| Gerente do projeto | Hugo Henry Lemos Carvalho |
| Início | 08/09/2026 |
| Entrega final | 25/11/2026 (versão 1.0.0 da documentação) |
| Repositório | `daygrid` (GitHub) |
| Documentos relacionados | DGD-GER-001 (PGC), DGD-REQ-001 (Documento de Requisitos), DGD-REQ-003 (ERS) |

## 2. Objetivo do Projeto

Especificar e documentar um sistema web de lista de afazeres diária, que ajude o usuário a organizar o dia em tarefas, receber lembretes por e-mail, acompanhar metas e ver toda semana um resumo da própria produtividade. A implementação fica para uma fase futura, depois desta entrega. O sistema tem cinco módulos principais:

- Módulo M0: Usuários (cadastro, login, logout e redefinição de senha)
- Módulo M1: Tarefas (tarefas com status, prioridade, etiqueta e subtarefas, lista do dia, filtros e remarcação)
- Módulo M2: Lembretes (lembretes por e-mail, com recorrência diária, semanal ou mensal)
- Módulo M3: Metas (metas com prazo e barra de progresso automática)
- Módulo M4: Relatório semanal (percentual de tarefas concluídas e adiadas, dias mais produtivos e progresso das metas)

## 3. Escopo

### 3.1 Incluído no escopo:

- Os 25 requisitos funcionais, 10 regras de negócio e 8 requisitos não funcionais do Documento de Requisitos (DGD-REQ-001).
- Especificação da aplicação web responsiva (front-end em HTML, CSS e JavaScript), da API REST em Python/Flask e do banco MySQL (ERS, Arquitetura e Modelo de Dados).
- Projeto do envio de lembretes por e-mail (SMTP do Gmail) e da geração automática do relatório semanal.
- Plano e casos de teste (DGD-TST-001) e auditoria física de configuração (PCA).
- Documentação e gerência de configuração do projeto, conforme o PGC (DGD-GER-001).

### 3.2 Fora do escopo:

- Aplicativo mobile nativo.
- Compartilhamento de tarefas entre usuários.
- Notificações por push ou SMS.
- Exclusão da conta do usuário.
- Implementação do código, execução dos testes, baseline BL-IMPL e auditoria funcional (FCA), que ficam para uma fase futura.

## 4. Cronograma Geral (Macro)

O projeto vai de 08/09/2026 a 25/11/2026, e o cronograma é organizado por fase.

| Período | Entregas Previstas |
| --- | --- |
| 08/09 a 06/10/2026 | Planejamento, requisitos e primeiras versões da arquitetura, do modelo de dados e do plano de testes; baselines BL-PLAN e BL-REQ (concluído) |
| 07/10 a 03/11/2026 | Revisão de consistência dos documentos técnicos; baseline BL-PROJ (concluído) |
| 04/11 a 22/11/2026 | Solicitações de Mudança de documentação (SM-002 a SM-004) (concluído) |
| 22/11/2026 | Auditoria física (PCA) e baseline BL-REL, depois da ATA-006 |
| 25/11/2026 | Entrega da versão 1.0.0 da documentação |
| Fase futura (depois da entrega) | Implementação dos módulos M0 a M4, execução dos 44 casos de teste, baseline BL-IMPL e auditoria funcional (FCA) |

## 5. Metodologia de Desenvolvimento

Nesta entrega, o trabalho é só de documentação. Na fase de implementação, que fica para depois, o desenvolvimento será iterativo e incremental: cada módulo (M0 a M4) será implementado e testado em sequência e só entrará na branch principal depois de passar no CI. Nas duas fases, o trabalho segue o GitHub Flow, com branches curtas por tarefa, pull requests revisados e commits no padrão Conventional Commits (PGC, seção 6).

A gerência de configuração segue o PGC (DGD-GER-001): os artefatos são itens de configuração, entram em baselines aprovadas pelo CCB e, depois disso, só mudam por Solicitação de Mudança. Nesta entrega, a qualidade é verificada pelas revisões do CCB e pela auditoria física (PCA); na fase de implementação, pelos testes do Plano de Testes (DGD-TST-001), executados com pytest no GitHub Actions, e pela auditoria funcional (FCA).

## 6. Papéis e Responsabilidades

| Papel | Responsável | Atividades principais |
| --- | --- | --- |
| Gerente de Projeto e de Configuração | Hugo Henry Lemos Carvalho | Mantém este plano, o PGC e a Lista de ICs, cria baselines e tags, conduz o CCB e as auditorias |
| Analista de Requisitos | Renata Martins da Silva | Mantém o Documento de Requisitos, a ERS e a Matriz de Rastreabilidade, e faz a análise de impacto das SMs de requisitos |
| Desenvolvedor full-stack, DBA e DevOps | João Vitor Simonetti | Mantém a Arquitetura e o Modelo de Dados; na fase de implementação, implementa front-end, back-end e banco e mantém o CI e as migrações |
| Analista de Testes (QA) | Iago Medice Ferreira da Silva | Mantém o Plano e os Casos de Teste; na fase de implementação, executa os testes e fornece as evidências da auditoria funcional |

## 7. Recursos Necessários

- Pessoas: os quatro integrantes da equipe, nos papéis da seção 6.
- Tecnologia: HTML, CSS e JavaScript; Python 3 com Flask, SQLAlchemy, Flask-Migrate, Flask-Login, Flask-Bcrypt, Flask-Mail e APScheduler; MySQL 8.0.16 ou superior.
- Ferramentas: Git e GitHub (repositório, Issues e Projects), GitHub Actions, pytest e Postman.
- Infraestrutura (fase de implementação): um servidor ligado continuamente, rodando a aplicação em um único processo (DA-07), e uma conta Gmail do projeto com senha de app para o envio de e-mails.

## 8. Riscos e Estratégias de Mitigação

| Risco | Probabilidade | Impacto | Mitigação |
| --- | --- | --- | --- |
| Prazo curto não ser suficiente para documentar todos os requisitos | Alta | Alto | Baselines intermediárias e documentação dos requisitos Essenciais primeiro |
| Ausência de um integrante durante o projeto | Média | Alto | Papéis e responsabilidades documentados; toda mudança passa por pull request revisado |
| Mudança de requisitos depois da BL-REQ | Média | Alto | Toda mudança passa por SM, com análise de impacto e decisão do CCB |
| Envio duplicado de lembretes se a aplicação rodar com mais de um processo | Média | Médio | Execução em processo único (DA-07) e verificação do último envio |
| Erros de fuso horário em lembretes e no relatório | Média | Médio | Datas em UTC no banco e exibição no fuso America/Manaus (DA-09), com casos de teste específicos |
| Limite de 500 e-mails por dia da conta Gmail gratuita | Baixa | Médio | Conta só do projeto; o provedor SMTP pode ser trocado pela configuração (DA-08) |
| Vazamento de credenciais do banco ou do e-mail | Baixa | Alto | Credenciais no `.env`, fora do Git (DA-10) |

## 9. Critérios de Sucesso

- Versão 1.0.0 da documentação entregue até 25/11/2026.
- Todos os requisitos especificados, rastreados na Matriz e ligados a pelo menos um caso de teste.
- Os 44 casos de teste especificados no Plano de Testes, prontos para a fase de implementação.
- Requisitos não funcionais com valores mensuráveis, como o envio do lembrete em até 5 minutos (RNF05) e a lista de tarefas carregada em até 2 segundos com 100 tarefas (RNF06).
- Auditoria física (PCA) aprovada e baseline BL-REL criada.

## 10. Comunicação

- Reuniões do CCB para aprovar baselines e Solicitações de Mudança, registradas em atas no DGD-GER-003.
- Relatório de Status da Configuração (DGD-GER-004), atualizado a cada baseline e a cada SM fechada.
- GitHub Issues para tarefas, defeitos e Solicitações de Mudança (modelo de SM do PGC), e pull requests para revisão.
- Acompanhamento das tarefas no GitHub Projects.
