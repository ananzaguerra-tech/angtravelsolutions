# ANG C381 — Block 27 — East and Southeast Asia audit

Checked at: 2026-11-12 BRT  
Status: `OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING`  
Publication: `false`

## Executed

- Read Library master v92 and confirmed `STATUS LIVE C380`; Drive contained no C381 document.
- Produced 10 units and 160 editorial axes: Japan, South Korea, North Korea, Vietnam, Thailand, Cambodia, Laos, Myanmar, Malaysia and Singapore.
- Reconciled current entry rules and official tourism sources with `checked_at=2026-11-12`.
- Read 883 rows from `Item Register` and 20 rows from `WP Export Identity 24-07`; evaluated 60 alias slots and found zero raw or canonical matches.
- Imported the block as a native Google Doc and read it back: `1bVJVEWtT9VGh6cxJmi2HEq00Q0ghhcGr46_QxvqSaE4`.
- Rechecked WordPress/Console and Gmail partnerships without writes.

## Entry result

- Japan: 90-day visa waiver for ICAO-compliant Brazilian e-passports — `VISA_NOT_REQUIRED_90D_EPASSPORT`.
- South Korea: 90-day visa waiver; K-ETA remains required for Brazilian nationals — `VISA_NOT_REQUIRED_90D_KETA_REQUIRED`.
- North Korea: visa required, independent tourism unavailable and severe current risk — `HOLD_NOT_MARKETABLE_CURRENTLY`.
- Vietnam: official eVisa up to 90 days, single or multiple entry — `VISA_REQUIRED_EVISA_AVAILABLE_90D`.
- Thailand: bilateral 90-day exemption preserved; TDAC required — `VISA_NOT_REQUIRED_90D_BILATERAL_TDAC`.
- Cambodia: official tourist eVisa, single entry, one-month stay — `VISA_REQUIRED_EVISA_AVAILABLE_30D`.
- Laos: Brazil nominally eligible for official tourist eVisa, 30-day stay — `VISA_REQUIRED_EVISA_AVAILABLE_30D`.
- Myanmar: official eVisa route exists, but conflict and safety risks keep the unit out of market — `VISA_REQUIRED_EVISA_AVAILABLE_BUT_HOLD_NOT_MARKETABLE`.
- Malaysia: visa-free up to 90 days; MDAC and health rules require recheck — `VISA_NOT_REQUIRED_90D_MDAC`.
- Singapore: visa-free up to 30 days; SG Arrival Card required — `VISA_NOT_REQUIRED_30D_SGAC_REQUIRED`.

## WordPress / Console evidence

- Public home remains HTTP 502 Bad Gateway.
- `/acesso-ang/`, `/area-restrita/` and `/wp-json/` remain unavailable.
- WPWriter site `6445b831-8563-4c9a-8f58-fb8bec94af13`: connection exists as `rest_api`, but posts/pages cannot be read.
- WordPress.com blog `256300923`: active/launched/public; Jetpack remains `site_disconnected` and MCP access unavailable.
- WPVibe reports the origin unreachable; Jetpack Monitor is inactive with no current site status.
- No backup, staging, CTA/shortcode mutation or quotation E2E was performed.
- `WORDPRESS_P0_PASS=false`; `CONSOLE_E2E_PASS=false`.

## Partnerships

- Current Gmail search since 2026-11-11 returned no new messages from Accor, Club Med, TTW/Guilherme Valle or Simone Pampaloni/Il Borro.
- TTW remains a known negative response: message `1a18d4c08afc1a18`, thread `1a0975c1c9addd0a`.
- Accor has earlier interest but no unequivocal public co-marketing, logo or media authorization.
- Club Med and Il Borro have no new response or authorization.
- No partnership article or social publication was authorized.

## Media and publication gates

- Every marketable unit retains `media_id=null`, `source_url=null`, `license_or_permission=null`, `brand_master_id=null` and `visual_hash=null`.
- North Korea and Myanmar use blocked non-marketable media states and no CTA.
- `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `NO_DUPLICATE_PASS=false`; `COPY_QA_PASS=false`; `LIVE_CMS_DEDUPE_PASS=false`; `CONSOLE_E2E_PASS=false`; `PUBLISHED=false`.
- No AI-generated image, text-only post, repeated visual, unlicensed media or unvalidated logo was created or published.
- Facebook Page `353450855530042` was preserved; Page `1214700205067389` was not used.

## Blockers, attempted solution and minimum human action

- WordPress origin/DNS 502 and disconnected Jetpack: public, WPWriter, WPVibe and WordPress.com probes were repeated. Minimum action: restore origin/upstream and reconnect Jetpack; then run backup/staging and quotation E2E.
- Live CMS dedupe unavailable: current 881 snapshots were used as safe offline fallback. Minimum action: restore authenticated CMS before deriving `external_id`.
- Media/logo rights absent: all media fields remain null or blocked. Minimum action: provide traceable licensed real media and unequivocal approved masters.
- Partner permissions absent: Gmail was rechecked. Minimum action: obtain explicit written co-marketing/media authorization.
- North Korea and Myanmar: no commercial activation while official risk and operating conditions remain unacceptable.

## Next action

Advance to Block 28 without restarting Blocks 12–27. Repeat WordPress/Console probes; reconcile live CMS only after authenticated recovery; keep social, Google Business, Miami Beach, Il Borro and partnerships in review until every gate passes.

## Rollback

Remove only Drive Doc `1bVJVEWtT9VGh6cxJmi2HEq00Q0ghhcGr46_QxvqSaE4` and revert only the C381 receipt/audit commits. Preserve all earlier blocks and existing site content.
