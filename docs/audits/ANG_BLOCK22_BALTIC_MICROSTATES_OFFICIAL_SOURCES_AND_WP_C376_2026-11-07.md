# C376 — Bloco 22 Báltico, Moldávia, Kosovo e microestados europeus

## Resultado verificável

- Bloco editorial criado: 10 unidades, 160 eixos, SEO/schema/CTA, fontes oficiais e `checked_at=2026-11-07`.
- Documento Drive: https://docs.google.com/document/d/1V7P33eK8Fpk5Lf4Xw2F6k8pDTR6BbJ4LUdSlpWtKSVY/edit
- Readback Drive: 10 unidades, 160 eixos, 11 ocorrências de `PUBLISHED=false` (10 unidades + gate global).
- Dedupe 881: 60 consultas, `A1:Z1900`, zero matches, `truncated=false`; nenhum write.
- Nenhuma publicação, mídia, logo, anúncio ou mutação de produção.

## Entrada e fontes oficiais

| Unidade | Estado fail-closed | Fonte oficial principal |
|---|---|---|
| Estônia | `PASS_DATED_RECHECK` — brasileiro 90/180 Schengen | https://www.vm.ee/en/consular-visa-and-travel-information/visa-information/who-does-not-need-visa-visit-estonia |
| Letônia | `PASS_DATED_RECHECK` — Brasil nominalmente isento 90/180 | https://www.mfa.gov.lv/en/countries-and-territories-whose-citizens-may-enter-latvia-without-visa |
| Lituânia | `PASS_DATED_RECHECK` — brasileiro sem visto Schengen 90/180 | https://br.mfa.lt/pt/informacao-consular/destaques/visto-e-autorizacao-de-permanencia/81 |
| Moldávia | `PASS_DATED_RECHECK` — Brasil isento até 90 dias em seis meses | https://www.mfa.gov.md/en/content/visa-regime-foreigners |
| Kosovo | `HOLD_CURRENTNESS_CONFIRMATION` — fonte principal arquivada | https://arkivi.mfa-ks.net/en/sherbimet_konsullore/503/kush-ka-nevoj-pr-viza-t-kosovs/503.html |
| San Marino | `HOLD_TRANSIT_SCHENGEN_CONTEXT` | https://www.gov.sm/pub1/EsteriSM/en/Servizi-per-utenza/Informazioni-per-chi-visita-SMR.html |
| Vaticano | `HOLD_TRANSIT_ITALY_CONTEXT` | https://www.vaticanstate.va/en/state-and-government/general-informations/geography.html |
| Mônaco | `PASS_WITH_FRANCE_SCHENGEN_GATE` | https://monservicepublic.gouv.mc/content/download/48067/file/welcomeofficeFR.pdf?inLanguage=fre-FR&version=1 |
| Liechtenstein | `PASS_DATED_RECHECK` — regra Schengen via Suíça/Liechtenstein | https://www.llv.li/en/national-administration/migration-and-passport-office/visa |
| Andorra | `PASS_WITH_SCHENGEN_TRANSIT_GATE` | https://www.govern.ad/es/ministerios-y-secretarias-de-estado/ministerio-de-asuntos-exteriores/viajar-a-andorra |

Transversal: EES plenamente operacional desde 10/04/2026; ETIAS ainda não operacional e sem solicitações. Fontes: https://home-affairs.ec.europa.eu/news/main-differences-between-ees-and-etias-what-travellers-need-know-2026-04-28_en e https://travel-europe.europa.eu/etias/faq.

## WordPress/site P0 e Console

- `https://angtravelsolutions.com.br/`: HTTP 502 Bad Gateway.
- `/area-restrita/`, `/acesso-ang/` e `/wp-json/`: inacessíveis.
- WPWriter `6445b831-8563-4c9a-8f58-fb8bec94af13`: `Active/rest_api`, mas posts/páginas não puderam ser obtidos.
- `list_pages` e `list_posts`: `WordPress connection failed: No such host is known`.
- P0 e Console permanecem `HOLD`; redirect, RBAC, módulos e cotação ponta a ponta não foram validados.
- Rollback WordPress: N/A, pois nenhuma mutação ocorreu.

## Parcerias e publicação

- Accor: interesse histórico e pedido de dados corporativos, sem nova resposta em 14 dias e sem autorização pública de co-marketing/mídia.
- Club Med e Il Borro: follow-ups sem resposta; direitos permanecem ausentes.
- TTW/Guilherme Valle: resposta negativa `1a18d4c08afc1a18`; frente encerrada sem insistência.
- Miami Beach, Il Borro, social e Google Business: `HOLD`, sem mídia/licença/master/dedupe/copy QA integral.

## Gates

`LIVE_CMS_DEDUPE_PASS=false`; `EXTERNAL_ID_DERIVATION_PASS=false`; `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `NO_DUPLICATE_PASS=false`; `COPY_QA_PASS=false`; `CONSOLE_E2E_PASS=false`; `PUBLISHED=false`.

## Rollback

- Excluir o documento Drive `1V7P33eK8Fpk5Lf4Xw2F6k8pDTR6BbJ4LUdSlpWtKSVY` somente se o Bloco 22 precisar ser desfeito.
- Reverter os commits deste recibo e desta auditoria após captura dos SHAs.
- Nenhuma mutação em produção requer rollback.
