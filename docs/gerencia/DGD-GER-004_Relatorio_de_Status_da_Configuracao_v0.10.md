# DGD-GER-004: Relatório de Status da Configuração do DayGrid

Data: 19/11/2026

## 1. Identificação do documento

Em 19/11/2026, três das cinco baselines estão criadas (BL-PLAN, BL-REQ e BL-PROJ): 9 ICs estão aprovados (PGC e Lista de ICs na v1.3; Documento de Requisitos, Arquitetura, Modelo de Dados e Plano de Testes na v1.2; Plano de Projeto, ERS e Matriz na v1.0), 4 estão em elaboração e 2 (o código) estão planejados.

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-GER-004 |
| Título | Relatório de Status da Configuração |
| Versão | 0.10 (rascunho) |
| Responsável | Hugo Henry Lemos Carvalho (Gerente de Configuração) |
| Período coberto | 18/11/2026 a 19/11/2026 |
| Frequência | Atualizado a cada baseline e a cada SM fechada (PGC, seção 9.1) |

### Histórico de revisões

| Versão | Data | Autor | Descrição |
| --- | --- | --- | --- |
| 0.10 | 19/11/2026 | Equipe DayGrid | Consolidação da documentação: rascunhos sem travessões, bases atualizadas e arquivos do repositório regenerados |
| 0.9 | 19/11/2026 | Equipe DayGrid | SM-003 aprovada (ATA-005) e implementada no Docs; novos ICs DGD-GER-006 e DGD-REQ-003 |
| 0.8 | 18/11/2026 | Equipe DayGrid | SM-002 aprovada (ATA-004) e implementada; novas versões dos documentos em baseline |
| 0.7 | 18/11/2026 | Equipe DayGrid | SM-001 aprovada (ATA-003); baseline BL-PROJ criada e tag `BL-PROJ` no repositório local |
| 0.6 | 18/11/2026 | Equipe DayGrid | SM-001 aberta (baseline do projeto técnico), em análise pelo CCB |
| 0.5 | 18/11/2026 | Equipe DayGrid | Tags BL-PLAN e BL-REQ criadas no repositório local; documentos aprovados copiados para `docs/` |
| 0.4 | 18/11/2026 | Equipe DayGrid | Revisão de consistência de toda a documentação; versões atualizadas |
| 0.3 | 18/11/2026 | Equipe DayGrid | Baselines BL-PLAN e BL-REQ criadas (ATA-002) |
| 0.2 | 18/11/2026 | Equipe DayGrid | ATA-001 completa e CT-31 decidido; pendências atualizadas |
| 0.1 | 18/11/2026 | Equipe DayGrid | Primeiro relatório, ao fim do dia 18/11/2026 |

## 2. Situação dos ICs

| ID | Item | Versão | Status | Baseline prevista |
| --- | --- | --- | --- | --- |
| DGD-GER-001 | Plano de Gerência de Configuração | 1.3 | Aprovado | BL-PLAN (19/11) |
| DGD-GER-002 | Lista de Itens de Configuração | 1.3 | Aprovado | BL-PLAN (19/11) |
| DGD-GER-006 | Plano de Projeto | 1.0 | Aprovado | BL-PLAN (19/11) |
| DGD-REQ-001 | Documento de Requisitos | 1.2 | Aprovado | BL-REQ (20/11) |
| DGD-REQ-002 | Matriz de Rastreabilidade | 1.0 | Aprovado | BL-REQ (20/11) |
| DGD-REQ-003 | Especificação de Requisitos de Software (ERS) | 1.0 | Aprovado | BL-PROJ (21/11) |
| DGD-ARQ-001 | Documento de Arquitetura | 1.2 | Aprovado | BL-PROJ (21/11) |
| DGD-BD-001 | Modelo de dados e scripts de migração | 1.2 | Aprovado | BL-PROJ (21/11) |
| DGD-TST-001 | Plano e Casos de Teste | 1.2 | Aprovado | BL-PROJ (21/11) |
| DGD-COD-001 | Código-fonte do front-end |  | Planejado | BL-IMPL (24/11) |
| DGD-COD-002 | Código-fonte do back-end |  | Planejado | BL-IMPL (24/11) |
| DGD-GER-003 | Registro de SMs e Atas do CCB | 0.11 | Em elaboração | BL-REL (25/11) |
| DGD-GER-004 | Relatório de Status da Configuração | 0.10 | Em elaboração | BL-REL (25/11) |
| DGD-GER-005 | Relatório de Auditoria de Configuração | 0.3 | Em elaboração | BL-REL (25/11) |
| DGD-REL-001 | Notas de Release (CHANGELOG) | 0.8 | Em elaboração | BL-REL (25/11) |

## 3. Baselines e SMs

### 3.1 Baselines

| Baseline | Data prevista | Situação | Tag |
| --- | --- | --- | --- |
| BL-PLAN | 19/11/2026 | **Criada em 18/11/2026** (ATA-002): PGC v1.0 e Lista de ICs v1.0; ambos na v1.3 depois das SM-001 a SM-003; Plano de Projeto v1.0 incluído pela SM-003 | `BL-PLAN` criada no repositório local (commit 40b1ef7); falta publicar no GitHub |
| BL-REQ | 20/11/2026 | **Criada em 18/11/2026** (ATA-002): ERS v1.0 e Matriz de Rastreabilidade v1.0; a antiga ERS virou o Documento de Requisitos, hoje na v1.2 (SM-002 e SM-003) | `BL-REQ` criada no repositório local (commit a53edd2); falta publicar no GitHub |
| BL-PROJ | 21/11/2026 | **Criada em 18/11/2026** (ATA-003, SM-001): Arquitetura v1.0, Modelo de Dados v1.0 e Plano de Testes v1.0; os três na v1.2 depois das SM-002 e SM-003; ERS (DGD-REQ-003) v1.0 incluída pela SM-003 | `BL-PROJ` criada no repositório local (commit ce033bf); falta publicar no GitHub |
| BL-IMPL | 24/11/2026 | Falta o código (DGD-COD-001 e DGD-COD-002) e a execução dos testes | Ainda não criada |
| BL-REL | 25/11/2026 | Depende da BL-IMPL e das auditorias FCA e PCA | Ainda não criada |

### 3.2 Solicitações de Mudança

| Abertas | Em análise | Aprovadas | Rejeitadas | Fechadas |
| --- | --- | --- | --- | --- |
| 3 | 0 | 3 | 0 | 3 |

Três SMs foram abertas, aprovadas por unanimidade e implementadas: a SM-001, que criou a baseline BL-PROJ (ATA-003), e a SM-002, revisão editorial que retirou os travessões e padronizou o cabeçalho das tabelas nos documentos em baseline (ATA-004), ambas em 18/11/2026, e a SM-003, que adaptou a documentação aos templates da disciplina e criou o Plano de Projeto e a ERS (ATA-005, 19/11/2026). Daqui em diante, mudanças em qualquer documento em baseline exigem SM. As decisões estão nas atas ATA-001 a ATA-005 (DGD-GER-003).

## 4. Mudanças no período

As mudanças abaixo aconteceram entre 18/11/2026 e 19/11/2026. Elas estão listadas da mais recente para a mais antiga.

| IC | Versão | Mudança |
| --- | --- | --- |
| DGD-GER-003, DGD-GER-004, DGD-GER-005, DGD-REL-001 | 0.11, 0.10, 0.3, 0.8 | Consolidação: travessões retirados dos rascunhos, bases atualizadas para as versões vigentes, CHANGELOG atualizado e arquivos do repositório regenerados |
| DGD-REQ-001, DGD-REQ-003, DGD-GER-006, DGD-GER-001, DGD-GER-002, DGD-ARQ-001, DGD-BD-001, DGD-TST-001 | 1.2, 1.0, 1.0, 1.3, 1.3, 1.2, 1.2, 1.2 | SM-003 aprovada (ATA-005): documentos adaptados aos templates da disciplina; Plano de Projeto e ERS criados; referências atualizadas |
| DGD-GER-001, DGD-GER-002, DGD-REQ-001, DGD-ARQ-001, DGD-BD-001, DGD-TST-001, DGD-GER-003, DGD-GER-004, DGD-REL-001 | 1.2, 1.2, 1.1, 1.1, 1.1, 1.1, 0.9, 0.8, 0.7 | SM-002 aprovada (ATA-004): travessões retirados, cabeçalho das tabelas padronizado e novo modelo de exportação |
| DGD-GER-001, DGD-GER-002, DGD-ARQ-001, DGD-BD-001, DGD-TST-001, DGD-GER-003, DGD-GER-004, DGD-REL-001 | 1.1, 1.1, 1.0, 1.0, 1.0, 0.7, 0.7, 0.6 | SM-001 aprovada (ATA-003): nova baseline BL-PROJ no PGC e na Lista de ICs; documentos técnicos aprovados; tag BL-PROJ no repositório local |
| DGD-GER-003, DGD-GER-004, DGD-REL-001 | 0.5, 0.5, 0.4 | ATA-002 com presentes confirmados; tags BL-PLAN e BL-REQ criadas e documentos aprovados copiados para `docs/` no repositório local |
| DGD-ARQ-001 | 0.4 | Código do relatório alinhado à RN10; recusa (409) ao vincular tarefa a uma segunda meta; base atualizada |
| DGD-BD-001, DGD-TST-001 | 0.4, 0.2 | Documentos de base atualizados (ERS v1.0) |
| DGD-GER-003, DGD-GER-005 | 0.4, 0.2 | Base atualizada (PGC v1.0); pontuação corrigida no DGD-GER-003 |
| DGD-GER-004, DGD-REL-001 | 0.4, 0.3 | Versões atualizadas após a revisão de consistência |
| DGD-GER-001, DGD-GER-002, DGD-REQ-001, DGD-REQ-002 | 1.0 | Aprovados pelo CCB e incluídos nas baselines BL-PLAN e BL-REQ (ATA-002) |
| DGD-GER-003 | 0.3 | ATA-002 registrada |
| DGD-GER-004 | 0.2 | Pendências atualizadas |
| DGD-REQ-001 | 0.8 | Troca de meta exige desvincular antes (RN07, RF18) |
| DGD-GER-003 | 0.2 | ATA-001: presentes confirmados e decisão 20 (CT-31) |
| DGD-REL-001 | 0.1 | Criação do CHANGELOG |
| DGD-GER-005 | 0.1 | Criação dos roteiros da FCA e da PCA |
| DGD-GER-004 | 0.1 | Criação deste relatório |
| DGD-GER-003 | 0.1 | Criação, com os modelos de SM e de ata e a ATA-001 |
| DGD-REQ-002 | 0.4 | Casos de teste e resultados ligados aos 33 requisitos |
| DGD-TST-001 | 0.1 | Criação: 44 casos de teste |
| DGD-REQ-001 | 0.7 | Link de redefinição de 15 minutos; data prevista obrigatória |
| DGD-BD-001 | 0.3 | `data_prevista` NOT NULL; token de 15 minutos |
| DGD-REQ-001 | 0.6 | Tarefa remarcada e concluída na semana conta como concluída (RN10) |
| DGD-BD-001 | 0.2 | Validade do token e regra da semana confirmada |
| DGD-ARQ-001 | 0.3 | Entidade `remarcacao` incluída |
| DGD-REQ-002 | 0.3 | Coluna "Tabela" preenchida |
| DGD-BD-001 | 0.1 | Criação: 9 tabelas e script inicial |
| DGD-ARQ-001 | 0.2 | Gmail como provedor de SMTP |
| DGD-REQ-002 | 0.2 | Coluna "Componente" preenchida |
| DGD-ARQ-001 | 0.1 | Criação: 10 decisões, 9 componentes, 31 rotas |
| DGD-GER-001 | 0.3 | Horário do relatório alinhado à ERS (domingo às 23h59) |
| DGD-REQ-001 | 0.5 | Respondidas as últimas questões em aberto |
| DGD-REQ-001 | 0.4 | Etiqueta obrigatória |
| DGD-REQ-001 | 0.3 | Substituição de etiqueta ao excluir |
| DGD-REQ-002 | 0.1 | Criação: 33 requisitos e cruzamento RF × RN |
| DGD-REQ-001 | 0.2 | Etiquetas personalizáveis (RF25); RNF confirmados |
| DGD-GER-001 | 0.2 | Papéis e stack confirmados |
| DGD-GER-002 | 0.1 | Criação: 13 ICs planejados |
| DGD-REQ-001 | 0.1 | Criação |
| DGD-GER-001 | 0.1 | Criação |

## 5. Pendências que bloqueiam a próxima baseline

| Baseline | Pendência | Responsável |
| --- | --- | --- |
| BL-PLAN, BL-REQ e BL-PROJ | Publicar o repositório `daygrid` no GitHub (com as tags) e proteger `main` | Hugo |
| BL-IMPL | Escrever o código do front-end e do back-end | João Vitor |
| BL-IMPL | Criar a conta Gmail do projeto e a senha de app | João Vitor |
| BL-IMPL | Executar os 44 casos de teste | Iago |
| BL-REL | Executar a FCA e a PCA | Hugo, Iago, Renata e João Vitor |
