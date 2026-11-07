# C374 — Block 20 official sources and WordPress audit

## Outcome

- Eight new units were reconciled into a 128-axis editorial block; Algeria and Tunisia were excluded because Block 15/C369 already completed them.
- The Drive readback confirmed 8 unit headings, 128 numbered axes, the SHN false-positive note, and `PUBLISHED=false` on every unit plus the global gate.
- Sixty read-only 881 queries produced zero canonical identity matches. The only raw hit, `SHN`, was a substring in a metadata URL.
- WordPress remains fail-closed: connector status is `Active/rest_api`, but posts/pages cannot be fetched and list operations return `No such host is known`; public home returns 502 and protected routes/REST are inaccessible.
- Gmail review found no new positive partnership response for Accor, Club Med, TTW/Guilherme Valle or Il Borro/Simone Pampaloni; TTW message `1a18d4c08afc1a18` remains the negative response.
- No WordPress, Meta, Facebook, Instagram, Google Business, n8n, media or production mutation was made.

## Official source register

| Unit | Official/authoritative sources | Status |
|---|---|---|
| Egypt | https://www.visa2egypt.gov.eg/eVisa/FAQ | `PASS_DATED_RECHECK` |
| Morocco | https://diplomatie.ma/fr/visiter-le-maroc ; https://www.acces-maroc.ma/ | `PASS_DATED_RECHECK` |
| Mauritania | https://anrpts.gov.mr/visa/requestvisa | `HOLD_NATIONALITY_RULE_RECHECK` |
| Western Sahara | https://peacekeeping.un.org/en/factsheet/minurso ; https://minurso.unmissions.org/en | `HOLD_TERRITORIAL_ACCESS_CONTEXT` |
| Reunion | https://www.france-visas.gouv.fr/en/la-france-dans-l-espace-schengen ; https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000051759462/2026-04-02 | `PASS_DATED_RECHECK` |
| Mayotte | https://www.france-visas.gouv.fr/en/la-france-dans-l-espace-schengen ; https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000051759443/2026-05-02 | `PASS_DATED_RECHECK` |
| Saint Helena / Ascension / Tristan da Cunha | https://www.sainthelena.gov.sh/st-helena/entry-requirements/ ; https://www.ascension.gov.ac/travel-and-shipping/immigration ; https://www.tristandc.com/visitsorganise.php | `HOLD_MULTI_JURISDICTION_ENTRY` |
| BIOT | https://www.biot.gov.io/visiting/ ; https://www.biot.gov.io/visiting/permits/ | `HOLD_NO_PUBLIC_TOURISM_ACCESS` |

`checked_at=2026-11-07`. Dynamic entry, health, security, transport and fee facts require revalidation immediately before quotation or operation.

## WordPress / Console gates

- `WORDPRESS_ORIGIN_UNREACHABLE`
- `PUBLIC_HOME_HTTP_502`
- `AREA_RESTRITA_UNREACHABLE`
- `ACESSO_ANG_UNREACHABLE`
- `LIVE_CMS_DEDUPE_PASS=false`
- `CONSOLE_E2E_PASS=false`
- `PUBLISHED=false`

Minimum human action: restore a resolvable DNS/origin/upstream while preserving maintenance and content, then repeat backup/staging, redirects, login/RBAC and the full quote-to-PDF persistence test.

## Media and publication controls

No AI-generated media was used. No real-media licence, approved master logo, visual hash, worldwide non-repetition pass or full copy QA was proved. All social, Miami Beach, Il Borro, Google Business and blog publication actions remain blocked.

## Rollback

Delete the new Drive document and revert the two C374 commits only if this offline checkpoint must be withdrawn. No production rollback is required because the cycle was read-only outside evidence creation.
