# DGD-ARQ-001: Documento de Arquitetura do DayGrid

## 1. Identificação do documento

O DayGrid é uma aplicação web em três camadas: um front-end estático em HTML/CSS/JS, uma API REST em Flask e um banco MySQL, com um agendador interno para os lembretes e para o relatório semanal.

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-ARQ-001 |
| Título | Documento de Arquitetura |
| Versão | 1.3 (aprovada, baseline BL-PROJ, alterada pelas SM-002, SM-003 e SM-004) |
| Data | 22/11/2026 |
| Responsável | João Vitor Simonetti (Desenvolvedor full-stack, DBA e DevOps) |
| Baseline | BL-PROJ (criada em 03/11/2026) |
| Documentos de base | DGD-GER-001 (PGC) v1.3 · DGD-REQ-001 (Documento de Requisitos) v1.2 · DGD-REQ-002 (Matriz de Rastreabilidade) v1.0 · DGD-BD-001 (Modelo de Dados) v1.2 |

### Histórico de revisões

| Versão | Data | Autor | Descrição |
| --- | --- | --- | --- |
| 1.3 | 22/11/2026 | Equipe DayGrid | SM-004 (ATA-006): campo Baseline corrigido para BL-PROJ; sem mudança de conteúdo |
| 1.2 | 17/11/2026 | Equipe DayGrid | SM-003 (ATA-005): referências atualizadas para o Documento de Requisitos (DGD-REQ-001) e o PGC v1.3; sem mudança de conteúdo |
| 1.1 | 10/11/2026 | Equipe DayGrid | SM-002 (ATA-004): travessões retirados e cabeçalho das tabelas padronizado; documentos de base atualizados; sem mudança de conteúdo |
| 1.0 | 03/11/2026 | Equipe DayGrid | Aprovado pelo CCB (ATA-003, SM-001); entra na baseline BL-PROJ |
| 0.4 | 20/10/2026 | Equipe DayGrid | Revisão de consistência: código do relatório alinhado à RN10 e ao DGD-BD-001 (6.2); recusa ao vincular tarefa a uma segunda meta (5.4); documentos de base atualizados |
| 0.3 | 24/09/2026 | Equipe DayGrid | Entidade `remarcacao` incluída (seção 7), alinhada ao DGD-BD-001 v0.1 |
| 0.2 | 22/09/2026 | Equipe DayGrid | Gmail definido como provedor de SMTP (DA-08 e seção 9) |
| 0.1 | 21/09/2026 | Equipe DayGrid | Criação a partir da ERS v0.5 |

## 2. Visão geral

Toda regra de negócio mora em um só lugar, a camada de serviços. Ela é usada tanto pelas rotas da API (ações do usuário) quanto pelo agendador (lembretes e relatório).

![Arquitetura do DayGrid · 9 componentes](../imagens/arquitetura.png)

O navegador conversa com as rotas em JSON. O agendador verifica os lembretes a cada minuto e gera o relatório todo domingo às 23h59. Os e-mails saem pelo EmailService para o servidor SMTP.

## 3. Decisões arquiteturais

Cada decisão abaixo recebe um ID (`DA-NN`). Como este documento está na BL-PROJ, mudar uma delas exige uma Solicitação de Mudança.

| ID | Decisão | Justificativa | Requisitos |
| --- | --- | --- | --- |
| DA-01 | O front-end é HTML/CSS/JS estático, servido pelo próprio Flask, e conversa com a API via `fetch` e JSON | Uma única origem dispensa configuração de CORS e mantém a stack que a equipe domina | RNF01, RNF02 |
| DA-02 | O back-end é uma API REST em Flask, organizada em *blueprints*, um por módulo (M0 a M4) | Cada módulo do Documento de Requisitos vira um pacote independente, o que facilita a rastreabilidade | Todos os RF |
| DA-03 | O código tem três camadas: rotas → serviços → modelos | As regras de negócio (RN01 a RN10) ficam só nos serviços e podem ser testadas sem HTTP | RN01 a RN10, RNF08 |
| DA-04 | O acesso ao banco usa SQLAlchemy (ORM) e Flask-Migrate (migrações versionadas) | As migrações viram o IC DGD-BD-001 e entram no Git | RNF08 |
| DA-05 | A autenticação usa sessão com cookie (Flask-Login), e as senhas usam hash bcrypt (Flask-Bcrypt) | É suficiente para um sistema de origem única, e o bcrypt atende diretamente o RNF03 | RF01 a RF03, RNF03 |
| DA-06 | Toda consulta filtra pelo usuário logado (`usuario_id`) | Garante o isolamento dos dados entre usuários | RNF04 |
| DA-07 | Lembretes e relatório são disparados pelo APScheduler, no mesmo processo do Flask | Não exige outro serviço. Como restrição, a aplicação roda com **um único processo**, para que o mesmo lembrete não seja enviado duas vezes | RF15, RF21, RNF05 |
| DA-08 | Os e-mails saem pelo SMTP do Gmail (`smtp.gmail.com`), com Flask-Mail | O provedor de SMTP é trocado só pela configuração, sem mudar código | RF04, RF15 |
| DA-09 | As datas são gravadas em UTC e exibidas no fuso America/Manaus. Os jobs agendados usam esse mesmo fuso | Evita erros de fuso e atende ao horário de 23h59 do relatório | RN10, RNF07 |
| DA-10 | Credenciais (banco, SMTP, chave da sessão) ficam em variáveis de ambiente (`.env`), fora do Git | O PGC exclui o `.env` dos ICs, e senhas não devem ir para o repositório | RNF03 |

## 4. Componentes do back-end

### 4.1 Camadas

Uma requisição sempre passa pelas três camadas, nesta ordem:

1. **Rotas** (`routes/`): recebem o HTTP, validam o formato do JSON, exigem login e devolvem a resposta com o código de status. Não têm regra de negócio.
2. **Serviços** (`services/`): aplicam as regras de negócio (RN01 a RN10) e coordenam os modelos. São chamados tanto pelas rotas quanto pelo agendador.
3. **Modelos** (`models/`): classes SQLAlchemy que representam as tabelas do MySQL.

Exemplo do fluxo do RF08 (alterar status):

```python
# routes/tarefas.py: só HTTP
@bp.patch("/<int:tarefa_id>/status")
@login_required
def alterar_status(tarefa_id):
    novo_status = request.json["status"]
    tarefa = tarefa_service.alterar_status(current_user.id, tarefa_id, novo_status)
    return jsonify(tarefa.to_dict()), 200

# services/tarefa_service.py: regras de negócio
STATUS_VALIDOS = {"pendente", "em_andamento", "concluida"}   # RN02

def alterar_status(usuario_id, tarefa_id, novo_status):
    if novo_status not in STATUS_VALIDOS:
        raise RegraNegocioError("Status inválido")
    tarefa = Tarefa.query.filter_by(id=tarefa_id, usuario_id=usuario_id).first_or_404()  # DA-06
    tarefa.status = novo_status
    tarefa.concluida_em = utcnow() if novo_status == "concluida" else None
    db.session.commit()
    return tarefa
```

### 4.2 Componentes e requisitos

Os IDs `CMP-NN` são os que vão para a coluna "Componente" da Matriz de Rastreabilidade (DGD-REQ-002).

| ID | Componente | Responsabilidade | Requisitos |
| --- | --- | --- | --- |
| CMP-01 | `auth` (rota) + `AuthService` | Cadastro, login, logout e redefinição de senha | RF01 a RF04, RNF03 |
| CMP-02 | `tarefas` (rota) + `TarefaService` | Tarefas, status, prioridade, subtarefas, lista do dia, filtros e remarcação | RF05 a RF12 |
| CMP-03 | `etiquetas` (rota) + `EtiquetaService` | Etiquetas iniciais, criação, renomeação e exclusão com substituição | RF25 |
| CMP-04 | `lembretes` (rota) + `LembreteService` | Cadastro de lembretes e cálculo da próxima ocorrência | RF13, RF14, RF16 |
| CMP-05 | `metas` (rota) + `MetaService` | Metas, vínculo de tarefas e cálculo do progresso | RF17 a RF20 |
| CMP-06 | `relatorios` (rota) + `RelatorioService` | Geração e consulta do relatório semanal | RF21 a RF24 |
| CMP-07 | `EmailService` | Montagem e envio dos e-mails por SMTP | RF04, RF15 |
| CMP-08 | Agendador (`scheduler/jobs.py`) | Jobs de envio de lembretes e de geração do relatório | RF15, RF21, RNF05 |
| CMP-09 | Front-end (`frontend/`) | Telas, chamadas à API e layout responsivo | Todos os RF, RNF01, RNF02, RNF07 |

## 5. API REST

Todas as rotas ficam sob `/api`, recebem e devolvem JSON, e todas, exceto as de cadastro, login e redefinição de senha, exigem login. Os códigos de resposta são: `200` ok, `201` criado, `204` sem conteúdo, `400` dado inválido, `401` sem login, `404` não encontrado (inclusive quando o recurso é de outro usuário) e `409` conflito (como e-mail ou etiqueta repetidos).

### 5.1 M0: Usuários (CMP-01)

| Método | Rota | Ação | RF |
| --- | --- | --- | --- |
| POST | `/api/auth/cadastro` | Cria o usuário e as três etiquetas iniciais | RF01 |
| POST | `/api/auth/login` | Abre a sessão | RF02 |
| POST | `/api/auth/logout` | Encerra a sessão | RF03 |
| POST | `/api/auth/esqueci-senha` | Envia o link de redefinição por e-mail | RF04 |
| POST | `/api/auth/redefinir-senha` | Troca a senha usando o token do link | RF04 |

### 5.2 M1: Tarefas e etiquetas (CMP-02, CMP-03)

| Método | Rota | Ação | RF |
| --- | --- | --- | --- |
| GET | `/api/tarefas?data=&status=&prioridade=&etiqueta=` | Lista as tarefas; sem filtros, traz as do dia ordenadas por prioridade | RF10, RF11 |
| POST | `/api/tarefas` | Cria uma tarefa | RF05 |
| PUT | `/api/tarefas/<id>` | Edita a tarefa, inclusive a data prevista | RF06, RF12 |
| DELETE | `/api/tarefas/<id>` | Exclui a tarefa, com subtarefas e lembretes | RF07 |
| PATCH | `/api/tarefas/<id>/status` | Altera o status | RF08 |
| POST | `/api/tarefas/<id>/subtarefas` | Adiciona uma subtarefa | RF09 |
| PATCH | `/api/tarefas/<id>/subtarefas/<sid>` | Marca ou desmarca a subtarefa | RF09 |
| DELETE | `/api/tarefas/<id>/subtarefas/<sid>` | Remove a subtarefa | RF09 |
| GET | `/api/etiquetas` | Lista as etiquetas do usuário | RF25 |
| POST | `/api/etiquetas` | Cria uma etiqueta | RF25 |
| PUT | `/api/etiquetas/<id>` | Renomeia a etiqueta | RF25 |
| DELETE | `/api/etiquetas/<id>?substituta=<id>` | Exclui a etiqueta; se ela estiver em uso, `substituta` é obrigatória | RF25 |

### 5.3 M2: Lembretes (CMP-04)

| Método | Rota | Ação | RF |
| --- | --- | --- | --- |
| GET | `/api/lembretes` | Lista os lembretes, com a data do próximo envio | RF14 |
| POST | `/api/lembretes` | Cria um lembrete, com ou sem tarefa e recorrência | RF13, RF14 |
| PUT | `/api/lembretes/<id>` | Edita o lembrete | RF16 |
| DELETE | `/api/lembretes/<id>` | Exclui o lembrete | RF16 |

O envio (RF15) não tem rota: ele é feito pelo agendador (seção 6).

### 5.4 M3: Metas (CMP-05)

| Método | Rota | Ação | RF |
| --- | --- | --- | --- |
| GET | `/api/metas` | Lista as metas com o progresso calculado | RF19 |
| POST | `/api/metas` | Cria uma meta | RF17 |
| PUT | `/api/metas/<id>` | Edita a meta | RF20 |
| DELETE | `/api/metas/<id>` | Exclui a meta; as tarefas ficam sem meta | RF20 |
| POST | `/api/metas/<id>/tarefas/<tid>` | Vincula a tarefa; se ela já estiver em outra meta, responde 409 (RN07) | RF18 |
| DELETE | `/api/metas/<id>/tarefas/<tid>` | Desvincula a tarefa | RF18 |

### 5.5 M4: Relatório semanal (CMP-06)

| Método | Rota | Ação | RF |
| --- | --- | --- | --- |
| GET | `/api/relatorios` | Lista os relatórios das semanas já geradas | RF21 |
| GET | `/api/relatorios/<id>` | Mostra percentuais, dias mais produtivos e progresso das metas | RF22, RF23, RF24 |

A geração (RF21) também não tem rota: ela é feita pelo agendador.

## 6. Processos agendados (CMP-08)

O APScheduler roda dois jobs no fuso America/Manaus (DA-07, DA-09):

| Job | Quando roda | O que faz | Regras e requisitos |
| --- | --- | --- | --- |
| `enviar_lembretes` | A cada 1 minuto | Envia os lembretes vencidos e agenda a próxima ocorrência | RF15, RN08, RN09, RNF05 |
| `gerar_relatorios` | Todo domingo às 23h59 | Gera o relatório da semana (segunda a domingo) de cada usuário | RF21 a RF24, RN04 a RN06, RN10 |

Como o job de lembretes roda a cada minuto, o atraso máximo fica perto de 1 minuto, dentro do limite de 5 minutos do RNF05.

### 6.1 Job de lembretes

```python
# scheduler/jobs.py
def enviar_lembretes():
    agora = utcnow()
    vencidos = Lembrete.query.filter(Lembrete.ativo, Lembrete.proximo_envio <= agora).all()
    for lembrete in vencidos:
        tarefa = lembrete.tarefa
        if tarefa is None or tarefa.status != "concluida":     # RN08
            email_service.enviar_lembrete(lembrete)
        lembrete_service.agendar_proxima(lembrete)             # RN09
    db.session.commit()
```

A regra da recorrência mensal (RN09) guarda o dia original do lembrete (`dia_referencia`). Assim, um lembrete do dia 31 vai para 30 de abril, mas volta para 31 em maio:

```python
# services/lembrete_service.py
import calendar

def proximo_mensal(data, dia_referencia):
    ano, mes = (data.year + 1, 1) if data.month == 12 else (data.year, data.month + 1)
    ultimo_dia = calendar.monthrange(ano, mes)[1]
    return data.replace(year=ano, month=mes, day=min(dia_referencia, ultimo_dia))

def agendar_proxima(lembrete):
    if lembrete.recorrencia == "nenhuma":
        lembrete.ativo = False
    elif lembrete.recorrencia == "diaria":
        lembrete.proximo_envio += timedelta(days=1)
    elif lembrete.recorrencia == "semanal":
        lembrete.proximo_envio += timedelta(weeks=1)
    else:  # mensal
        lembrete.proximo_envio = proximo_mensal(lembrete.proximo_envio, lembrete.dia_referencia)
```

| Lembrete criado em | Próximos envios (mensal) |
| --- | --- |
| 31/01 | 28/02 (29/02 em ano bissexto) → 31/03 → 30/04 → 31/05 |

### 6.2 Job do relatório semanal

```python
# scheduler/jobs.py
scheduler.add_job(gerar_relatorios, "cron", day_of_week="sun", hour=23, minute=59,
                  timezone="America/Manaus")                   # RN10

# services/relatorio_service.py
def gerar_para(usuario, inicio, fim):          # segunda 00h00 a domingo 23h59
    # data prevista na semana + remarcadas a partir de uma data da semana (DGD-BD-001, 5.1); sem subtarefas (RN05)
    tarefas = tarefas_da_semana(usuario.id, inicio, fim)
    total = len(tarefas)
    concluidas = [t for t in tarefas if t.concluida_ate(fim)]   # remarcada e concluída na semana conta como concluída (RN10)
    adiadas = total - len(concluidas)                            # as demais ficaram adiadas (RN04)
    por_dia = Counter(t.concluida_em_local().weekday()
                      for t in concluidas_entre(usuario.id, inicio, fim))   # DGD-BD-001, 5.2
    maximo = max(por_dia.values(), default=0)
    return RelatorioSemanal(
        usuario_id=usuario.id, inicio=inicio, fim=fim,
        pct_concluidas=percentual(len(concluidas), total),
        pct_adiadas=percentual(adiadas, total),
        dias_produtivos=[d for d, n in por_dia.items() if n == maximo and n > 0],  # empate: todos
        progresso_metas={m.id: m.progresso() for m in usuario.metas_ativas()},     # RN06
    )
```

O relatório é gravado no banco no momento da geração. Por isso, os relatórios de semanas anteriores não mudam quando uma tarefa antiga é editada depois.

## 7. Dados

O sistema tem nove entidades. Os campos, tipos, chaves e índices ficam no Modelo de Dados (DGD-BD-001). Esta seção registra só o que a arquitetura precisa.

| Entidade | Pertence a | Relações principais | Regras |
| --- | --- | --- | --- |
| `usuario` | Não se aplica | Tem etiquetas, tarefas, lembretes, metas e relatórios | RNF03, RNF04 |
| `etiqueta` | usuário | Usada por várias tarefas; nome único por usuário | RN01 |
| `tarefa` | usuário | Tem 1 etiqueta (obrigatória), 0 ou 1 meta, várias subtarefas, lembretes e remarcações | RN01 a RN04, RN07 |
| `subtarefa` | tarefa | Excluída junto com a tarefa | RN05 |
| `remarcacao` | tarefa | Histórico de cada adiamento (data anterior e data nova) | RN04 |
| `lembrete` | usuário | Pode ter 0 ou 1 tarefa; guarda `recorrencia`, `proximo_envio` e `dia_referencia` | RN08, RN09 |
| `meta` | usuário | Tem várias tarefas; ao ser excluída, as tarefas ficam sem meta | RN06, RN07 |
| `relatorio_semanal` | usuário | Guarda o resultado já calculado da semana | RN10 |
| `token_redefinicao` | usuário | Token de uso único para redefinir a senha | RF04 |

O progresso da meta (RN06) não é gravado: ele é calculado a cada consulta. Assim, o percentual nunca fica desatualizado (RF19).

## 8. Como a arquitetura atende aos RNF

| RNF | Como é atendido | Decisão ou componente |
| --- | --- | --- |
| RNF01: Navegadores | HTML, CSS e JavaScript padrão, sem bibliotecas que exijam compilação | DA-01, CMP-09 |
| RNF02: Responsivo | Layout com CSS Flexbox/Grid e *media queries* para telas pequenas | CMP-09 |
| RNF03: Hash de senha | Senhas gravadas só como hash bcrypt; segredos fora do Git | DA-05, DA-10 |
| RNF04: Isolamento | Toda consulta filtra por `usuario_id`; recurso de outro usuário responde `404` | DA-06 |
| RNF05: Lembrete em até 5 min | Job verifica os lembretes a cada 1 minuto | DA-07, CMP-08 |
| RNF06: Lista em até 2 s | Índices em `tarefa(usuario_id, data_prevista)` e `tarefa(usuario_id, status)` | DA-04, DGD-BD-001 |
| RNF07: Localização | Textos em português; datas em UTC no banco, exibidas como dd/mm/aaaa no fuso America/Manaus | DA-09, CMP-09 |
| RNF08: Manutenibilidade | Serviços testáveis sem HTTP; pytest executado no GitHub Actions a cada pull request | DA-03, DGD-TST-001 |

## 9. Estrutura de pastas e execução

### 9.1 Estrutura

A estrutura detalha as pastas `frontend/` e `backend/` definidas no PGC (seção 6.1).

```
daygrid/
├── frontend/                    # CMP-09 · DGD-COD-001
│   ├── index.html               # login e cadastro
│   ├── pages/                   # tarefas, lembretes, metas, relatorios, etiquetas
│   ├── css/
│   └── js/
│       ├── api.js               # funções fetch para /api
│       └── <tela>.js
├── backend/                     # DGD-COD-002
│   ├── app/
│   │   ├── __init__.py          # create_app(): registra blueprints e agendador
│   │   ├── config.py            # lê o .env
│   │   ├── extensions.py        # db, migrate, login_manager, bcrypt, mail, scheduler
│   │   ├── models/              # usuario, etiqueta, tarefa, subtarefa, lembrete, meta, ...
│   │   ├── routes/              # auth, tarefas, etiquetas, lembretes, metas, relatorios
│   │   ├── services/            # regras de negócio (RN01 a RN10)
│   │   ├── scheduler/jobs.py    # CMP-08
│   │   └── templates/email/     # corpo dos e-mails
│   ├── requirements.txt
│   └── run.py
├── database/migrations/         # DGD-BD-001 (Flask-Migrate)
└── tests/                       # DGD-TST-001
    ├── unit/                    # serviços
    └── integration/             # rotas da API
```

### 9.2 Dependências principais

`Flask`, `Flask-SQLAlchemy`, `Flask-Migrate`, `Flask-Login`, `Flask-Bcrypt`, `Flask-Mail`, `APScheduler`, `PyMySQL`, `python-dotenv` e, para testes, `pytest`. As versões exatas ficam fixadas no `requirements.txt`, que é parte do IC DGD-COD-002.

### 9.3 Variáveis de ambiente (`.env`)

| Variável | Para quê | Valor no DayGrid |
| --- | --- | --- |
| `SECRET_KEY` | Assinar o cookie de sessão | Texto aleatório longo |
| `DATABASE_URL` | Conexão com o MySQL | `mysql+pymysql://usuario:senha@localhost/daygrid` |
| `MAIL_SERVER` | Servidor SMTP | `smtp.gmail.com` |
| `MAIL_PORT` | Porta do SMTP | `587` |
| `MAIL_USE_TLS` | Criptografia STARTTLS | `True` |
| `MAIL_USERNAME` | Conta que envia | O endereço Gmail completo da equipe |
| `MAIL_PASSWORD` | Autenticação | A **senha de app** do Google (nunca a senha normal da conta) |
| `APP_TIMEZONE` | Fuso dos jobs e da exibição | `America/Manaus` |

O repositório guarda só um `.env.example`, com os nomes das variáveis e sem valores.

### 9.4 Execução

```bash
pip install -r backend/requirements.txt
flask --app backend/run.py db upgrade      # aplica as migrações
flask --app backend/run.py run             # um único processo (DA-07)
```

### 9.5 Configuração do Gmail

O Gmail é o provedor de SMTP do projeto, decisão da equipe em 22/09/2026. Para usá-lo:

1. Criar (ou escolher) uma conta Gmail só para o DayGrid, e não usar a conta pessoal de algum integrante.
2. Ativar a verificação em duas etapas nessa conta. Sem ela, o Google não permite criar senhas de app.
3. Gerar uma senha de app nas configurações de segurança da conta Google e colocá-la em `MAIL_PASSWORD`, no `.env` (DA-10).

Uma conta Gmail gratuita envia no máximo 500 e-mails a cada 24 horas. Isso basta para os testes e a apresentação, mas é um limite a revisar se o DayGrid tiver muitos usuários com lembretes diários ([fonte](https://developer.nylas.com/docs/cookbook/email/gmail-smtp-settings/)).
