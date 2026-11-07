# C375 — Block 21 Europe official sources and WordPress audit

## Outcome

- Ten previously unrecorded units were reconciled into a 160-axis block: Cyprus, Malta, Romania, Bulgaria, Serbia, Montenegro, Albania, Bosnia and Herzegovina, North Macedonia and Slovakia.
- Drive readback confirmed 10 unit headings, 160 numbered axes and `PUBLISHED=false` on every unit plus the global gate.
- Sixty read-only 881 queries returned zero raw matches, zero canonical matches, zero unknowns and zero errors.
- WordPress remains fail-closed: `Active/rest_api`, but posts/pages cannot be fetched; list operations return `No such host is known`; home is HTTP 502 and protected routes/public REST are inaccessible.
- Gmail review found no new positive partnership response for Accor, Club Med, TTW/Guilherme Valle or Il Borro/Simone Pampaloni; TTW message `1a18d4c08afc1a18` remains negative.
- No WordPress, Meta, Facebook, Instagram, Google Business, n8n, media or production mutation was made.

## Official source register

| Unit | Official sources | Status |
|---|---|---|
| Cyprus | Cyprus MFA entry regulations; `visitcyprus.com` | `PASS_DATED_RECHECK`; separate non-Schengen count |
| Malta | `identita.gov.mt`; `visitmalta.com` | `PASS_DATED_RECHECK`; Schengen 90/180 |
| Romania | `eviza.mae.ro`; EU Decision 2024/3212 | `PASS_DATED_RECHECK`; Schengen 90/180 |
| Bulgaria | `mfa.bg`; `tourism.government.bg` | `PASS_DATED_RECHECK`; Schengen 90/180 |
| Serbia | `mfa.gov.rs`; `serbia.travel` | `PASS_DATED_RECHECK`; 90 days in six months from first entry |
| Montenegro | `gov.me`; `montenegro.travel` | `PASS_DATED_RECHECK`; national regime |
| Albania | `punetejashtme.gov.al`; Brazil–Albania agreement; `akt.gov.al` | `PASS_DATED_RECHECK`; 90/180 |
| Bosnia and Herzegovina | `mvp.gov.ba`; `fipa.gov.ba` | `PASS_DATED_RECHECK`; retain official duration formula |
| North Macedonia | Brazil–North Macedonia agreement; `mfa.gov.mk`; `tourismmacedonia.gov.mk` | `PASS_DATED_RECHECK`; 90 days per semester |
| Slovakia | `mzv.sk`; `slovakia.travel` | `PASS_DATED_RECHECK`; Schengen 90/180 |

EES was recorded as operational for participating Schengen borders on `checked_at=2026-11-07`. ETIAS was explicitly recorded as not yet in operation and no application was requested. Work, study, paid activity, long stay, transit and border discretion remain outside the short-stay classifications.

## WordPress / Console gates

- `WORDPRESS_ORIGIN_UNREACHABLE`
- `PUBLIC_HOME_HTTP_502`
- `AREA_RESTRITA_UNREACHABLE`
- `ACESSO_ANG_UNREACHABLE`
- `PUBLIC_REST_UNREACHABLE`
- `LIVE_CMS_DEDUPE_PASS=false`
- `CONSOLE_E2E_PASS=false`
- `PUBLISHED=false`

Minimum human action: restore a resolvable DNS/origin/upstream while preserving maintenance and existing content, then repeat backup, staging, redirects, login/RBAC and quote-to-PDF persistence.

## Media and publication controls

No AI-generated media was used. No real-media licence, approved master logo, visual hash, worldwide non-repetition pass or full copy QA was proved. Social, Miami Beach, Il Borro, Google Business and blog publication remain blocked.

## Rollback

Delete the C375 Drive document and revert the two C375 commits only if this evidence checkpoint must be withdrawn. No production rollback is required because the cycle was read-only outside evidence creation.
