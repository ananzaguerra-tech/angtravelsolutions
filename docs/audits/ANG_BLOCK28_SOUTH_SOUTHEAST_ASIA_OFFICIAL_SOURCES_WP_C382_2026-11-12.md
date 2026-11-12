# ANG C382 — Block 28 — South and Southeast Asia audit

Checked at: 2026-11-12 BRT  
Status: `OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING`  
Publication: `false`

## Executed

- Read Library master v93 and confirmed `STATUS LIVE C381`; Drive contained no C382 document.
- Produced 10 units and 160 editorial axes: Indonesia, Philippines, Brunei, Timor-Leste, India, Nepal, Bhutan, Bangladesh, Sri Lanka and Maldives.
- Reconciled current entry rules and official tourism sources with `checked_at=2026-11-12`.
- Read 883 rows from `Item Register` and 20 rows from `WP Export Identity 24-07`; evaluated 60 alias slots. The sole raw hit, `IND` within the header word `Índice`, was a false positive; canonical matches remained zero.
- Imported the block as a native Google Doc and read it back: `10XF0sFwQMBxz9UMv0oPTBU1efAblTik-6orZyPdIIjs`.
- Rechecked WordPress/Console and Gmail partnerships without writes.

## Entry result

- Indonesia: VoA/e-VoA for 30 days, extendable once to 60 — `VISA_ON_ARRIVAL_OR_EVOA_30D_EXTENDABLE`.
- Philippines: bilateral visa waiver for up to 59 days — `VISA_NOT_REQUIRED_59D_BILATERAL`.
- Brunei: pre-arrival visa through a mission — `VISA_REQUIRED_PREARRIVAL_MISSION`.
- Timor-Leste: 30-day VoA at Dili airport/seaport; land entry requires preauthorization — `VISA_ON_ARRIVAL_30D_AIR_SEA_LAND_PREAUTH`.
- India: Brazil is eligible for eVisa; category and validity must be selected before travel — `VISA_REQUIRED_EVISA_AVAILABLE`.
- Nepal: tourist visa on arrival for 15, 30 or 90 days — `VISA_ON_ARRIVAL_15_30_90D`.
- Bhutan: eVisa before arrival plus SDF/tax validation — `VISA_REQUIRED_EVISA_PREARRIVAL_SDF`.
- Bangladesh: VoA up to 30 days remains discretionary and document-dependent — `VISA_ON_ARRIVAL_30D_DISCRETIONARY_RECHECK`.
- Sri Lanka: paid 30-day double-entry ETA, retained in recheck due to prior conflicting official notices — `ETA_PAID_30D_DOUBLE_ENTRY_RECHECK`.
- Maldives: tourist visa on arrival, normally 30 days, with IMUGA declaration — `VISA_ON_ARRIVAL_30D_IMUGA`.

## WordPress / Console evidence

- Public home remains HTTP 502; `/acesso-ang/`, `/area-restrita/` and `/wp-json/` remain externally unavailable.
- Read-only connector access improved in C382: WPWriter can again read site status, pages and posts.
- `Acesso ANG` page ID `153423` is published; form readback points to `/area-restrita/`.
- `Área Restrita` page ID `2109` is published and its module map is readable, but modules remain marked `Homologação` or `E2E pendente`; this is not RBAC or quotation proof.
- WPVibe read-only inventory succeeded: WordPress `7.1.4`, PHP `8.3.36`, ANG theme `1.8.4`.
- WPVibe reports `manage_options=false`; a read-only WP-CLI diagnostic received 403. No privilege bypass was attempted.
- WordPress.com blog `256300923` remains active but Jetpack is `site_disconnected`.
- No backup, staging, shortcode mutation or quotation E2E was performed.
- `PUBLIC_P0_PASS=false`; `RBAC_PASS=false`; `CONSOLE_E2E_PASS=false`; `BACKUP_STAGING_PASS=false`.

## Partnerships

- Gmail search since 2026-11-12 returned no new messages from Accor, Club Med, TTW/Guilherme Valle or Simone Pampaloni/Il Borro.
- TTW remains the historical negative response; no partner provided new media/logo/co-marketing authorization.
- No partnership article or social publication was authorized.

## Media and publication gates

- Every unit retains `media_id=null`, `source_url=null`, `license_or_permission=null`, `brand_master_id=null` and `visual_hash=null`.
- `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `NO_DUPLICATE_PASS=false`; `COPY_QA_PASS=false`; `LIVE_CMS_DEDUPE_PASS=false`; `CONSOLE_E2E_PASS=false`; `PUBLISHED=false`.
- No AI-generated image, text-only post, repeated visual, unlicensed media or unvalidated logo was created or published.
- Facebook Page `353450855530042` was preserved; Page `1214700205067389` was not used.

## Blockers, attempted solution and minimum human action

- Public WordPress origin remains 502 although authenticated read-only connectors recovered. Minimum action: restore public origin/upstream, reconnect Jetpack and approve a connector account with `manage_options`; then run backup/staging and quotation E2E.
- Live CMS dedupe unavailable: current 881 snapshots were used as safe offline fallback. Minimum action: restore authenticated CMS search before deriving `external_id`.
- Media/logo rights absent: all media fields remain null. Minimum action: provide traceable licensed real media and unequivocal approved masters.
- Partner permissions absent: Gmail was rechecked. Minimum action: obtain explicit written co-marketing/media authorization.

## Next action

Advance to Block 29 without restarting Blocks 12–28. Use recovered read-only WordPress access to expand diagnostics without mutation; repeat public probes and only proceed with backup/staging or fixes after public recovery and sufficient authenticated permissions.

## Rollback

Remove only Drive Doc `10XF0sFwQMBxz9UMv0oPTBU1efAblTik-6orZyPdIIjs` and revert only the C382 receipt/audit commits. Preserve all earlier blocks and existing site content.
