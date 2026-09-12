# ANG PRÉ-LANÇAMENTO — CONSOLE + ÁREA RESTRITA — 2026-09-12

## Estado geral

**Área Restrita / Portal do Agente: PARTIAL_PASS / PENDENTE CRÍTICO**

A estrutura existe, com login em `/acesso-ang/`, dashboard canônico em `/area-restrita/` e módulos publicados. A validação REST ao vivo confirmou que o dashboard principal expõe apenas quatro cards operacionais; os demais módulos existem como páginas, mas não estão integrados ao dashboard nem possuem prova ponta a ponta.

**Console de Cotação ANG: BLOQUEADO / EM IMPLEMENTAÇÃO**

A página `/console-cotacao-ang/` existe e declara dependência do plugin funcional e da integração Wooba White Label/documentação para gerar cotação, link e PDF. Não marcar PASS sem cotação ponta a ponta homologada.

## Evidência ao vivo — 2026-09-12

Página canônica WordPress: ID 2109, status `publish`, slug `area-restrita`, permalink https://angtravelsolutions.com.br/area-restrita/.

Conteúdo bruto preservado:
- `[ang_v13_dashboard]`
- `[ang_governance_library]`

Saída renderizada confirmada do dashboard:
1. Cotações e propostas → `/fale-conosco/`
2. Hotelaria → `/hotelaria-restrita/`
3. Conteúdo e biblioteca → `/biblioteca-premium/`
4. Meu perfil → `/meu-perfil/`

A biblioteca de governança informa 50 documentos controlados, mas esse conteúdo documental não comprova integração, RBAC, persistência ou operação dos módulos.

Achados:
- O card “Cotações e propostas” leva a Fale Conosco, não ao Console de Cotação.
- O shortcode ainda emite `<h2>Área do Cliente</h2>`.
- Relatórios, Financeiro, Condições, Intranet, Zendesk, Promoções, Academy, Wooba, Curadoria e Console não aparecem como cards no dashboard principal.
- A versão ativa `ang-enterprise-suite` 2.14.1 não está versionada no repositório; a versão histórica disponível é 0.3.0 e não contém `ang_v13_dashboard`.
- Hotfix reversível preparado em `plugin/ang-area-restrita-label-hotfix/ang-area-restrita-label-hotfix.php`, commit `34c158d082fc3cdc83aa4f4e7431f0aa9c721fbe`, ainda `UPLOAD_PENDING_CHANNEL`.

## Rotas principais verificadas

- `/acesso-ang/` — login do Portal do Agente, com destino esperado `/area-restrita/`.
- `/area-restrita/` — dashboard principal canônico, ID 2109.
- `/area-do-agente/` — dashboard legado/alternativo; não deve ser rota principal.
- `/console-cotacao-ang/` — Console de Cotação.
- `/treinamentos-curadoria/` — Treinamentos & Curadoria.
- `/academy/` — Academy ANG.
- `/biblioteca-premium/` — Biblioteca Premium.
- `/hotelaria-restrita/` — Hotelaria Restrita.
- `/wooba-white-label/` — estrutura de integração Wooba.
- `/relatorios/`, `/financeiro/`, `/meu-perfil/`, `/minhas-condicoes/`, `/intranet/`, `/zendesk/`, `/promocoes-fornecedores/`, `/curadoria-restrita/` — módulos existentes.

## Status por módulo

| Módulo | Status | Evidência / pendência |
|---|---|---|
| Login / Acesso ANG | READY_QA | Página existe; falta smoke autenticado com perfis reais, sessão, recuperação e menor privilégio. |
| Dashboard Área Restrita | PARTIAL_PASS | Página e quatro cards renderizam; navegação está incompleta e o heading legado continua no shortcode. |
| Cotações e propostas | GAP | Card atual aponta para Fale Conosco, não para o Console funcional. |
| Console de Cotação | BLOQUEADO | Página existe; falta entrada→cálculo/cotação→revisão→link protegido→PDF→persistência. |
| Wooba White Label | EM IMPLEMENTAÇÃO | Rota existe; falta integração, credenciais autorizadas e documentação homologada. |
| Academy / Treinamentos | EM IMPLEMENTAÇÃO | Rotas existem; falta provar vídeos, progresso, quizzes, badges e persistência por usuário. |
| Curadoria Restrita | EM IMPLEMENTAÇÃO | Rota existe; falta integração ao dashboard, autorização por perfil e exportação homologada. |
| Biblioteca Premium | READY_QA | Card presente; falta inventário real de downloads, permissões e teste por perfil. |
| Hotelaria Restrita | READY_QA | Card presente; falta conteúdo comercial homologado e teste por perfil. |
| Relatórios | EM IMPLEMENTAÇÃO | Rota existe, mas não aparece no dashboard e não há painel com dados reais comprovados. |
| Financeiro | EM IMPLEMENTAÇÃO | Rota existe, mas não aparece no dashboard; faltam dados reais, permissões e persistência. |
| Meu Perfil | READY_QA | Card presente; falta CRUD, autenticação e persistência comprovados. |
| Minhas Condições | EM IMPLEMENTAÇÃO | Rota existe, mas não aparece no dashboard; falta vínculo real por agência/perfil. |
| Intranet / Governança | PARTIAL | Biblioteca documental renderiza; falta navegação operacional dinâmica e RBAC comprovado. |
| Tickets / Zendesk | EM IMPLEMENTAÇÃO | Rota existe, mas não aparece no dashboard; falta integração real, fila e histórico. |
| Promoções de Fornecedores | HOLD_DYNAMIC_DATA | Rota existe; campanhas precisam de data, revalidação e autorização antes de exibição. |
| Secure Forms | READY_QA | Plugin ativo; falta smoke sucesso/erro/LGPD/antispam/mobile/persistência. |
| Concierge | BLOQUEADO P0 | Falta homologação real inbound/outbound e evidência do workflow correto. |

## Correções executadas

1. **PASS técnico** — nove CTAs publicados foram normalizados de `/area-restrita-ang/` para `/area-restrita/`; releitura pós-escrita confirmou zero ocorrências antigas.
2. **PASS técnico de conteúdo** — página 86740 teve uma ocorrência exata “Área do Cliente” normalizada para “Área do Agente”.
3. **PENDENTE DE IMPLANTAÇÃO** — heading legado emitido por `[ang_v13_dashboard]`; hotfix pronto, sem alegação de deploy.
4. Backup pré-mudança preservado no commit `91e846c6b53a1bdfad6ff09f887ce8938989e62b`.
5. Registro técnico completo no commit `054d90ef269b100fb843f56195fd1734bb86257e`.

## Correções obrigatórias antes de PASS

1. Implantar em staging a correção do heading na fonte do plugin 2.14.1 ou ativar o hotfix preparado.
2. Integrar ao dashboard os módulos autorizados, com links canônicos e controle por perfil.
3. Fazer o card de cotações apontar para o fluxo funcional correto somente após homologação.
4. Executar smoke autenticado com perfis e menor privilégio.
5. Validar Console ponta a ponta: entrada → cálculo/cotação → revisão → link protegido → PDF → persistência.
6. Validar Wooba/Infotravel/Sabre/CRM apenas com credenciais autorizadas, sem expor segredos.
7. Testar Secure Forms: LGPD, antispam, sucesso, erro, mobile e persistência.
8. Validar Biblioteca/Hotelaria/Curadoria por perfil, sem exposição pública de condições comerciais.
9. Validar Concierge real antes de retirar manutenção.

## Critério de lançamento

A manutenção pública só deve sair quando os gates P0 estiverem PASS e a Área Restrita mínima funcional estiver homologada. Módulos não essenciais podem permanecer `EM IMPLEMENTAÇÃO` desde que não sejam apresentados como funcionais nem exponham dados internos.

## Rollback

- Conteúdo: restaurar as revisões WordPress anteriores ou os conteúdos brutos preservados no commit `91e846c6b53a1bdfad6ff09f887ce8938989e62b`.
- Hotfix: desativar/remover `ang-area-restrita-label-hotfix`; não há escrita em banco.
- Dashboard: não alterar a rota canônica nem remover páginas existentes durante a homologação.
