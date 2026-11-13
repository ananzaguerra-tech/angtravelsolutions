# ANG C386 — Bloco 32: Dependências Europeias e Atlântico Norte/Sul

Data de checagem: 2026-11-13  
Estado: `OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING`  
Publicação: `PUBLISHED=false`

## EXECUTADO

- Produzidas 10 unidades e 160 eixos com destinos/módulos, logística, acesso, risco, SEO, schema, CTA condicionado, fontes oficiais e `checked_at`.
- Dedupe read-only: 883 linhas do `Item Register`, 20 do `WP Export Identity 24-07`, `A1:Z1900`, 60 aliases.
- Resultado: 33 hits brutos, todos falsos positivos de `ALA`; zero matches canônicos e zero erros. `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.
- Google Doc criado e relido: 10 unidades, 160 eixos, 11 `PUBLISHED=false`, zero `PUBLISHED=true`.
- WordPress/Console e Gmail de parcerias revalidados somente leitura.

## EVIDÊNCIA | URL/ID

- Drive: https://docs.google.com/document/d/1R3LaW8xu74nCK8R1NHbdpRki2YwoZ8LnYL4Wfo3HTds/edit
- Planilha 881: `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg`
- WPWriter site: `6445b831-8563-4c9a-8f58-fb8bec94af13`; WordPress.com blog: `256300923`.

## DECISÕES FAIL-CLOSED

| Unidade | Status |
|---|---|
| Jersey | `ETA_REQUIRED_6M_RECHECK` |
| Guernsey | `ETA_REQUIRED_DIRECT_OUTSIDE_CTA_AMOUNT_RECHECK` |
| Ilha de Man | `ETA_REQUIRED_6M_CTA_RECHECK` |
| Ilhas Faroé | `VISA_EXEMPT_BRAZIL_90D_SEPARATE_REGIME_RECHECK` |
| Ilhas Åland | `SCHENGEN_VISA_FREE_90_180_RECHECK` |
| Svalbard | `CONDITIONAL_READY_ORGANISED_OPERATOR_FIELD_SAFETY` |
| Jan Mayen | `HOLD_FOREIGN_PERMISSION_AND_LANDING_CLEARANCE_NO_GENERAL_CTA` |
| Akrotiri/Dhekelia | `HOLD_MILITARY_RESTRICTED_AREAS_CYPRUS_ENTRY_NO_INDEPENDENT_TOURISM_CTA` |
| Groenlândia | `VISA_EXEMPT_BRAZIL_SEPARATE_REGIME_90D_RECHECK` |
| Falkland/Malvinas | `CONDITIONAL_READY_VISITOR_PERMIT_INSURANCE_2M_DEPARTURE_TAX_RECHECK` |

## WORDPRESS/SITE P0 E CONSOLE

- Home pública HTTP 503; `/acesso-ang/`, `/area-restrita/` e `/wp-json/` inacessíveis.
- WPWriter ativo via REST; settings `403 rest_forbidden`.
- Jetpack Backup `unavailable/no_site_found`; nenhum backup/staging/rollback comprovado. `wpcom_site_settings` apenas confirmou site/home, front page 2845 e permalink, sem provar backup.
- Página 108: 14 `data-map-address` e 14 spans ocultos com endereços completos.
- Página 153423: login `/wp-login.php` com retorno `/area-restrita/`, mas fluxo real bloqueado pelo 503.
- Página 2109: módulos majoritariamente `Homologação`/`E2E pendente`; Secure Forms e Zendesk não aparecem nominalmente.
- CTA legado: 21 ocorrências em 18 páginas `draft`; página 70387 contém quatro. Zero nas críticas 108/153423/2109.
- `PUBLIC_P0_PASS=false`; `BACKUP_STAGING_PASS=false`; `RBAC_PASS=false`; `CONSOLE_E2E_PASS=false`.

## PARCERIAS / GMAIL

- Accor, Club Med, Guilherme Valle/TTW e Simone Pampaloni/Il Borro: zero mensagens novas após C385 e nas últimas três horas, excluindo spam/lixeira.
- Nenhum interesse, reunião, condição comercial, co-marketing, mídia ou logo autorizado. Nenhuma mensagem enviada.

## NÃO FEITO | MOTIVO | BLOQUEIO

- Sem mutação WordPress: origin, backup, staging e rollback não comprovados.
- Sem publicação social/Google/Blog: `REAL_MEDIA_VERIFIED`, `MASTER_LOGO_VERIFIED`, `NO_DUPLICATE_PASS` e `COPY_QA_PASS` fechados em false.
- Sem Concierge PASS: falta inbound/outbound real do workflow correto.
- Sem Google Business: nenhuma ficha autenticada comprovadamente OPEN/verified sem reverificação.
- Sem `external_id`: `LIVE_CMS_DEDUPE_PASS=false`.

## SOLUÇÃO TENTADA

- Pesquisa oficial, dedupe offline ampliado, readback do Drive, testes públicos/REST/Jetpack, inspeção exata das páginas/CTAs e verificação Gmail recente.

## AÇÃO HUMANA MÍNIMA

1. Restaurar origin e reconectar Jetpack; comprovar backup/staging.
2. Validar masters e autorizações de mídia/co-marketing.
3. Executar Console/Concierge E2E reais com evidência.

## PRÓXIMA AÇÃO

- Avançar ao Bloco 33 sem reiniciar os Blocos 12–32; após backup/staging, corrigir página 108 e CTAs, validar RBAC e cotação E2E.

## ROLLBACK

- Remover somente o Google Doc C386 e commits de evidência se defeito for comprovado; nenhuma mutação ocorreu em CMS, Meta, GBP ou n8n.
