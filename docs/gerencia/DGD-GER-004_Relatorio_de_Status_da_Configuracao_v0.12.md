# DGD-GER-004: Relatório de Status da Configuração do DayGrid

## 1. Identificação do documento

Em 22/11/2026, três das cinco baselines estão criadas (BL-PLAN, BL-REQ e BL-PROJ): 9 ICs estão aprovados (PGC na v1.3 e Lista de ICs na v1.4; Documento de Requisitos na v1.2; Arquitetura, Modelo de Dados e Plano de Testes na v1.3; Matriz na v1.1; Plano de Projeto e ERS na v1.0), 4 estão em elaboração e 2 (o código) estão planejados para a fase de implementação, depois da entrega.

| Campo | Valor |
| --- | --- |
| ID do IC | DGD-GER-004 |
| Título | Relatório de Status da Configuração |
| Versão | 0.12 (rascunho) |
| Data | 22/11/2026 |
| Responsável | Hugo Henry Lemos Carvalho (Gerente de Configuração) |
| Período coberto | 08/09/2026 a 22/11/2026 |
| Frequência | Atualizado a cada baseline e a cada SM fechada (PGC, seção 9.1) |

### Histórico de revisões

| Versão | Data | Autor | Descrição |
| --- | --- | --- | --- |
| 0.12 | 22/11/2026 | Equipe DayGrid | SM-004 aprovada (ATA-006) e implementada; novas versões da Matriz, da Arquitetura, do Modelo de Dados, do Plano de Testes e da Lista de ICs |
| 0.11 | 22/11/2026 | Equipe DayGrid | SM-004 aberta (correções de consistência), em análise pelo CCB |
| 0.10 | 18/11/2026 | Equipe DayGrid | Consolidação da documentação: rascunhos sem travessões, bases atualizadas e arquivos do repositório regenerados |
| 0.9 | 17/11/2026 | Equipe DayGrid | SM-003 aprovada (ATA-005) e implementada no Docs; novos ICs DGD-GER-006 e DGD-REQ-003 |
| 0.8 | 10/11/2026 | Equipe DayGrid | SM-002 aprovada (ATA-004) e implementada; novas versões dos documentos em baseline |
| 0.7 | 03/11/2026 | Equipe DayGrid | SM-001 aprovada (ATA-003); baseline BL-PROJ criada e tag `BL-PROJ` no repositório local |
| 0.6 | 29/10/2026 | Equipe DayGrid | SM-001 aberta (baseline do projeto técnico), em análise pelo CCB |
| 0.5 | 27/10/2026 | Equipe DayGrid | Tags BL-PLAN e BL-REQ criadas no repositório local; documentos aprovados copiados para `docs/` |
| 0.4 | 13/10/2026 | Equipe DayGrid | Revisão de consistência de toda a documentação; versões atualizadas |
| 0.3 | 06/10/2026 | Equipe DayGrid | Baselines BL-PLAN e BL-REQ criadas (ATA-002) |
| 0.2 | 02/10/2026 | Equipe DayGrid | ATA-001 completa e CT-31 decidido; pendências atualizadas |
| 0.1 | 01/10/2026 | Equipe DayGrid | Primeiro relatório, em 01/10/2026 |

## 2. Situação dos ICs

| ID | Item | Versão | Status | Baseline prevista |
| --- | --- | --- | --- | --- |
| DGD-GER-001 | Plano de Gerência de Configuração | 1.3 | Aprovado | BL-PLAN (06/10) |
| DGD-GER-002 | Lista de Itens de Configuração | 1.4 | Aprovado | BL-PLAN (06/10) |
| DGD-GER-006 | Plano de Projeto | 1.0 | Aprovado | BL-PLAN (06/10) |
| DGD-REQ-001 | Documento de Requisitos | 1.2 | Aprovado | BL-REQ (06/10) |
| DGD-REQ-002 | Matriz de Rastreabilidade | 1.1 | Aprovado | BL-REQ (06/10) |
| DGD-REQ-003 | Especificação de Requisitos de Software (ERS) | 1.0 | Aprovado | BL-PROJ (03/11) |
| DGD-ARQ-001 | Documento de Arquitetura | 1.3 | Aprovado | BL-PROJ (03/11) |
| DGD-BD-001 | Modelo de dados e scripts de migração | 1.3 | Aprovado | BL-PROJ (03/11) |
| DGD-TST-001 | Plano e Casos de Teste | 1.3 | Aprovado | BL-PROJ (03/11) |
| DGD-COD-001 | Código-fonte do front-end |  | Planejado | BL-IMPL (fase futura) |
| DGD-COD-002 | Código-fonte do back-end |  | Planejado | BL-IMPL (fase futura) |
| DGD-GER-003 | Registro de SMs e Atas do CCB | 0.13 | Em elaboração | BL-REL (22/11) |
| DGD-GER-004 | Relatório de Status da Configuração | 0.12 | Em elaboração | BL-REL (22/11) |
| DGD-GER-005 | Relatório de Auditoria de Configuração | 0.4 | Em elaboração | BL-REL (22/11) |
| DGD-REL-001 | Notas de Release (CHANGELOG) | 0.9 | Em elaboração | BL-REL (22/11) |

## 3. Baselines e SMs

### 3.1 Baselines

| Baseline | Data prevista | Situação | Tag |
| --- | --- | --- | --- |
| BL-PLAN | 06/10/2026 | **Criada em 06/10/2026** (ATA-002): PGC v1.0 e Lista de ICs v1.0; PGC na v1.3 e Lista de ICs na v1.4 depois das SM-001 a SM-004; Plano de Projeto v1.0 incluído pela SM-003 | `BL-PLAN` criada no repositório local (commit c90d3c6); falta publicar no GitHub |
| BL-REQ | 06/10/2026 | **Criada em 06/10/2026** (ATA-002): ERS v1.0 e Matriz de Rastreabilidade v1.0; a antiga ERS virou o Documento de Requisitos, hoje na v1.2 (SM-002 e SM-003); Matriz na v1.1 (SM-004) | `BL-REQ` criada no repositório local (commit dc350f2); falta publicar no GitHub |
| BL-PROJ | 03/11/2026 | **Criada em 03/11/2026** (ATA-003, SM-001): Arquitetura v1.0, Modelo de Dados v1.0 e Plano de Testes v1.0; os três na v1.3 depois das SM-002 a SM-004; ERS (DGD-REQ-003) v1.0 incluída pela SM-003 | `BL-PROJ` criada no repositório local (commit d0dab18); falta publicar no GitHub |
| BL-IMPL | Fase futura | Fica para a fase de implementação, depois da entrega: código (DGD-COD-001 e DGD-COD-002) e execução dos testes | Ainda não criada |
| BL-REL | 22/11/2026 | Depende da auditoria física (PCA) | Ainda não criada |

### 3.2 Solicitações de Mudança

| Abertas | Em análise | Aprovadas | Rejeitadas | Fechadas |
| --- | --- | --- | --- | --- |
| 4 | 0 | 4 | 0 | 4 |

Quatro SMs foram abertas, aprovadas por unanimidade e implementadas: a SM-001, que criou a baseline BL-PROJ (ATA-003), e a SM-002, revisão editorial que retirou os travessões e padronizou o cabeçalho das tabelas nos documentos em baseline (ATA-004), em 03/11/2026 e 10/11/2026, e a SM-003, que adaptou a documentação aos templates da disciplina e criou o Plano de Projeto e a ERS (ATA-005, 17/11/2026). Daqui em diante, mudanças em qualquer documento em baseline exigem SM. A SM-004 (22/11/2026), com correções de consistência na Matriz, na Arquitetura, no Modelo de Dados e no Plano de Testes, foi aprovada na ATA-006 e implementada no mesmo dia. As decisões estão nas atas ATA-001 a ATA-006 (DGD-GER-003).

## 4. Mudanças no período

As mudanças abaixo aconteceram entre 08/09/2026 e 22/11/2026. Elas estão listadas da mais recente para a mais antiga.

| IC | Versão | Mudança |
| --- | --- | --- |
| DGD-REQ-002, DGD-ARQ-001, DGD-BD-001, DGD-TST-001, DGD-GER-002, DGD-GER-003, DGD-GER-004, DGD-GER-005, DGD-REL-001 | 1.1, 1.3, 1.3, 1.3, 1.4, 0.13, 0.12, 0.4, 0.9 | SM-004 aprovada (ATA-006): módulos da Matriz sem travessão, campo Baseline corrigido para BL-PROJ e local do script inicial corrigido |
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
| BL-IMPL (fase futura) | Escrever o código do front-end e do back-end | João Vitor |
| BL-IMPL (fase futura) | Criar a conta Gmail do projeto e a senha de app | João Vitor |
| BL-IMPL (fase futura) | Executar os 44 casos de teste e a FCA | Iago e Renata |
| BL-REL | Executar a PCA | Hugo e João Vitor |
