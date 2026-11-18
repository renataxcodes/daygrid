# PLANO DE PROJETO: DayGrid

Item de configuração DGD-GER-006, versão 1.0, baseline BL-PLAN. Responsável: Hugo Henry Lemos Carvalho (Gerente de Projeto e de Configuração).

Tabela 1 Registro de Alterações

| Data | Versão | Descrição | Responsável |
| --- | --- | --- | --- |
| 19/11/2026 | 1.0 | Criação no template da disciplina; aprovado pelo CCB (SM-003, ATA-005) e incluído na BL-PLAN | Hugo Henry Lemos Carvalho |

## 1. Identificação do Projeto

| Campo | Valor |
| --- | --- |
| Projeto | DayGrid: lista de afazeres diária |
| Instituição | Centro Universitário FAMETRO, curso de Engenharia de Software |
| Equipe | Hugo Henry Lemos Carvalho, Renata Martins da Silva, João Vitor Simonetti e Iago Medice Ferreira da Silva |
| Gerente do projeto | Hugo Henry Lemos Carvalho |
| Início | 18/11/2026 |
| Entrega final | 25/11/2026 (versão 1.0.0) |
| Repositório | `daygrid` (GitHub) |
| Documentos relacionados | DGD-GER-001 (PGC), DGD-REQ-001 (Documento de Requisitos), DGD-REQ-003 (ERS) |

## 2. Objetivo do Projeto

Desenvolver um sistema web de lista de afazeres diária, que ajude o usuário a organizar o dia em tarefas, receber lembretes por e-mail, acompanhar metas e ver toda semana um resumo da própria produtividade. O sistema tem cinco módulos principais:

- Módulo M0: Usuários (cadastro, login, logout e redefinição de senha)
- Módulo M1: Tarefas (tarefas com status, prioridade, etiqueta e subtarefas, lista do dia, filtros e remarcação)
- Módulo M2: Lembretes (lembretes por e-mail, com recorrência diária, semanal ou mensal)
- Módulo M3: Metas (metas com prazo e barra de progresso automática)
- Módulo M4: Relatório semanal (percentual de tarefas concluídas e adiadas, dias mais produtivos e progresso das metas)

## 3. Escopo

### 3.1 Incluído no escopo:

- Os 25 requisitos funcionais, 10 regras de negócio e 8 requisitos não funcionais do Documento de Requisitos (DGD-REQ-001).
- Aplicação web responsiva (front-end em HTML, CSS e JavaScript), API REST em Python/Flask e banco MySQL.
- Envio de lembretes por e-mail (SMTP do Gmail) e geração automática do relatório semanal.
- Testes automatizados e manuais (DGD-TST-001) e auditorias de configuração FCA e PCA.
- Documentação e gerência de configuração do projeto, conforme o PGC (DGD-GER-001).

### 3.2 Fora do escopo:

- Aplicativo mobile nativo.
- Compartilhamento de tarefas entre usuários.
- Notificações por push ou SMS.
- Exclusão da conta do usuário.

## 4. Cronograma Geral (Macro)

O projeto dura oito dias, por isso o cronograma é organizado por data, e não por semana.

| Período | Entregas Previstas |
| --- | --- |
| 18/11/2026 | Planejamento, requisitos, arquitetura, modelo de dados e plano de testes; baselines BL-PLAN, BL-REQ e BL-PROJ (concluído) |
| 19/11 a 23/11/2026 | Implementação dos módulos M0 a M4, com testes unitários e de integração executados no CI a cada pull request; casos manuais em 23/11 |
| 24/11/2026 | Reteste dos defeitos corrigidos e execução completa dos 44 casos de teste; baseline BL-IMPL |
| 25/11/2026 | Auditorias FCA e PCA, baseline BL-REL e entrega da versão 1.0.0 |

## 5. Metodologia de Desenvolvimento

O desenvolvimento é iterativo e incremental: cada módulo (M0 a M4) é implementado e testado em sequência, e só entra na branch principal depois de passar no CI. O trabalho segue o GitHub Flow, com branches curtas por tarefa, pull requests revisados e commits no padrão Conventional Commits (PGC, seção 6).

A gerência de configuração segue o PGC (DGD-GER-001): os artefatos são itens de configuração, entram em baselines aprovadas pelo CCB e, depois disso, só mudam por Solicitação de Mudança. A qualidade é verificada pelos testes do Plano de Testes (DGD-TST-001), executados com pytest no GitHub Actions, e pelas auditorias FCA e PCA antes da entrega.

## 6. Papéis e Responsabilidades

| Papel | Responsável | Atividades principais |
| --- | --- | --- |
| Gerente de Projeto e de Configuração | Hugo Henry Lemos Carvalho | Mantém este plano, o PGC e a Lista de ICs, cria baselines e tags, conduz o CCB e as auditorias |
| Analista de Requisitos | Renata Martins da Silva | Mantém o Documento de Requisitos, a ERS e a Matriz de Rastreabilidade, e faz a análise de impacto das SMs de requisitos |
| Desenvolvedor full-stack, DBA e DevOps | João Vitor Simonetti | Implementa front-end, back-end e banco, mantém o pipeline de CI e os scripts de migração |
| Analista de Testes (QA) | Iago Medice Ferreira da Silva | Mantém o Plano e os Casos de Teste, executa os testes e fornece as evidências da auditoria funcional |

## 7. Recursos Necessários

- Pessoas: os quatro integrantes da equipe, nos papéis da seção 6.
- Tecnologia: HTML, CSS e JavaScript; Python 3 com Flask, SQLAlchemy, Flask-Migrate, Flask-Login, Flask-Bcrypt, Flask-Mail e APScheduler; MySQL 8.0.16 ou superior.
- Ferramentas: Git e GitHub (repositório, Issues e Projects), GitHub Actions, pytest e Postman.
- Infraestrutura: um servidor ligado continuamente, rodando a aplicação em um único processo (DA-07), e uma conta Gmail do projeto com senha de app para o envio de e-mails.

## 8. Riscos e Estratégias de Mitigação

| Risco | Probabilidade | Impacto | Mitigação |
| --- | --- | --- | --- |
| Prazo curto (oito dias) não ser suficiente para todos os requisitos | Alta | Alto | Baselines intermediárias, implementação dos requisitos Essenciais primeiro e dos Desejáveis por último (RF04) |
| Ausência de um integrante durante a implementação | Média | Alto | Papéis e responsabilidades documentados; todo código passa por pull request revisado |
| Mudança de requisitos depois da BL-REQ | Média | Alto | Toda mudança passa por SM, com análise de impacto e decisão do CCB |
| Envio duplicado de lembretes se a aplicação rodar com mais de um processo | Média | Médio | Execução em processo único (DA-07) e verificação do último envio |
| Erros de fuso horário em lembretes e no relatório | Média | Médio | Datas em UTC no banco e exibição no fuso America/Manaus (DA-09), com casos de teste específicos |
| Limite de 500 e-mails por dia da conta Gmail gratuita | Baixa | Médio | Conta só do projeto; o provedor SMTP pode ser trocado pela configuração (DA-08) |
| Vazamento de credenciais do banco ou do e-mail | Baixa | Alto | Credenciais no `.env`, fora do Git (DA-10) |

## 9. Critérios de Sucesso

- Versão 1.0.0 entregue até 25/11/2026.
- Todos os requisitos funcionais Essenciais implementados e com casos de teste aprovados.
- Os 44 casos de teste executados, sem defeito de severidade alta em aberto.
- Lembretes enviados em até 5 minutos (RNF05) e lista de tarefas carregada em até 2 segundos com 100 tarefas (RNF06).
- Auditorias FCA e PCA aprovadas e baseline BL-REL criada.

## 10. Comunicação

- Reuniões do CCB para aprovar baselines e Solicitações de Mudança, registradas em atas no DGD-GER-003.
- Relatório de Status da Configuração (DGD-GER-004), atualizado a cada baseline e a cada SM fechada.
- GitHub Issues para tarefas, defeitos e Solicitações de Mudança (modelo de SM do PGC), e pull requests para revisão do código.
- Acompanhamento das tarefas no GitHub Projects.
