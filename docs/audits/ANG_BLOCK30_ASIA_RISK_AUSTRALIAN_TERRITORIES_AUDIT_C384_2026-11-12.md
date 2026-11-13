# ANG C384 — Block 30 — Asia risk and Australian territories audit

Checked at: 2026-11-12 22:00 BRT  
Status: `OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING`  
Publication: `false`

## Executed

- Read Library master v96 and confirmed `STATUS LIVE C383`; Drive contained no C384 document.
- Produced 10 units and 160 editorial axes: Iran, Iraq, Syria, Yemen, Afghanistan, Pakistan, Christmas Island, Cocos (Keeling) Islands, Norfolk Island and Ashmore and Cartier Islands.
- Reconciled official immigration/tourism and current government risk sources with `checked_at=2026-11-12`.
- Applied commercial/CTA holds to Iran, Iraq, Syria, Yemen, Afghanistan and Pakistan; applied special environmental authorisation hold to Ashmore and Cartier.
- Read 883 rows from `Item Register` and 20 rows from `WP Export Identity 24-07`; evaluated 60 alias slots. Raw hits, canonical matches, false positives and errors all remained zero.
- Imported the block as native Google Doc `1m2amqfX3j6hOxCjtH-FA6GzDnhmsBv9QRucoAtesv28`; readback confirmed `cycle_id=C384`, 10 units/160 axes, 11 `PUBLISHED=false` markers and zero `PUBLISHED=true`.

## Entry and operating result

- Iran: entry channel requires recheck; no commercial offer under current all-travel warning.
- Iraq: official eVisa selector exists but Brazil requires nominal readback; no commercial offer under current regional warnings.
- Syria: official AIP requires prior visa unless exempt; Brazil not proven exempt; all-travel hold.
- Yemen: official tourist entry rule not reproducible; all-travel hold.
- Afghanistan: official MFA tourist visa guidance says three-month validity and one-month stay; all-travel hold remains.
- Pakistan: prior visa through official online system; regional security and permit hold.
- Christmas, Cocos and Norfolk: Australian visa rules apply; Brazilian traveler requires appropriate visa before travel, with route-dependent controls.
- Ashmore and Cartier: no conventional tourism; commercial access requires environmental authorisation and compliant maritime operation.

## Partnerships

- Gmail searches after C383 found no new messages from Accor, Club Med, TTW/Guilherme Valle or Simone Pampaloni/Il Borro.
- No interest, meeting, commercial term, benefit, co-marketing permission, media or logo licence was received.
- No partnership article or social publication was authorized.

## WordPress / Console evidence

- Public home now returns HTTP 503; `/acesso-ang/`, `/area-restrita/` and `/wp-json/` remain inaccessible externally.
- WPWriter connection remains active through REST, but site settings return `403 rest_forbidden`.
- Jetpack Backup reports `state=unavailable`, `state_reason=no_site_found`; there is no verified backup or staging rollback point.
- Published page 108 still contains 14 `data-map-address` values and 14 hidden full-address spans.
- Published page 153423 points login to `/area-restrita/`; published page 2109 remains a dashboard with `Homologação`/`E2E pendente` modules.
- Exact `/area-restrita-ang/` appears 21 times in 18 draft pages: 77999, 78001, 78002, 73950, 73951, 73952, 73720, 73721, 73722, 73723, 73724, 73530, 73531, 73537, 73545, 70511, 70387 and 70389. No occurrence was confirmed in inspected critical published pages.
- Exact readback found no `Área do Cliente`, `Local de referência` or `Endereço institucional` in the inspected published candidates; fuzzy search hits were false positives.
- `PUBLIC_P0_PASS=false`; `BACKUP_STAGING_PASS=false`; `RBAC_PASS=false`; `CONSOLE_E2E_PASS=false`; no mutation was attempted.

## Media and publication gates

- Every unit retains null media/master/hash fields; risk units are blocked.
- `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `NO_DUPLICATE_PASS=false`; `COPY_QA_PASS=false`; `LIVE_CMS_DEDUPE_PASS=false`; `CONSOLE_E2E_PASS=false`; `PUBLISHED=false`.
- No AI-generated image, text-only post, repeated visual, unlicensed media or unvalidated logo was created or published.
- Facebook Page `353450855530042` was preserved; Page `1214700205067389` was not used.

## Blockers and minimum action

- WordPress P0 and Console remain pending objective public-origin, backup/staging, RBAC and quotation E2E proof.
- Page 108 hidden/full-address finding from C383 remains a fail-closed blocker until reversible staging correction and readback.
- Live CMS dedupe is unavailable; current 881 snapshots are only an offline fallback.
- Minimum human action: restore public origin/Jetpack, approve adequate WordPress permissions, create backup/staging, correct page 108 in staging, and run full Console quotation E2E.
- Media/logo and partnership permissions require traceable real licensed assets and explicit written authorization.

## Next action

Advance to Block 31 without restarting Blocks 12–30. Keep risk/authorisation holds closed and continue WordPress recovery plus staging remediation when objectively available.

## Rollback

Remove only C384 Drive Doc `1m2amqfX3j6hOxCjtH-FA6GzDnhmsBv9QRucoAtesv28` and revert only the C384 receipt/audit commits. Preserve all earlier blocks and existing site content.
