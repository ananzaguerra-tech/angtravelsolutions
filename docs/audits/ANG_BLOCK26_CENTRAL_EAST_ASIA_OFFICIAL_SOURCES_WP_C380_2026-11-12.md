# ANG C380 — Block 26 — Central and East Asia audit

Checked at: 2026-11-12 BRT  
Status: `OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING`  
Publication: `false`

## Executed

- Resumed the incomplete C380 draft only after confirming that Library v91 still ended at C379 and Drive contained no C380 document.
- Produced 10 units and 160 editorial axes: Kazakhstan, Kyrgyzstan, Uzbekistan, Turkmenistan, Tajikistan, Mongolia, China, Hong Kong, Macao and Taiwan.
- Reconciled current governmental entry rules and official tourism sources with `checked_at=2026-11-12`.
- Read 883 rows from `Item Register` and 20 rows from `WP Export Identity 24-07`; evaluated 60 alias slots and found zero raw or canonical matches.
- Imported the block as a native Google Doc and read it back: `1eraiuDM1DfJCa14yf80rObKI9cKIo-FyKVr1CsbTUdU`.
- Rechecked WordPress/Console and Gmail partnerships without writes.

## Entry result

- Kazakhstan: visa-free up to 30 days — `PASS_DATED_RECHECK`.
- Kyrgyzstan: official dynamic selector did not expose a static nominal Brazil result — `HOLD_NOMINAL_VISA_CHECK`.
- Uzbekistan: Brazil nominally visa-free up to 30 days; lodging registration applies — `PASS_DATED_RECHECK`.
- Turkmenistan: visa and invitation/migration basis required — `VISA_REQUIRED_HIGH_FRICTION`.
- Tajikistan: visa-free up to 30 days; GBAO/Pamir requires separate permission — `PASS_WITH_GBAO_BORDER_GATES`.
- Mongolia: visa-free up to 90 days under the bilateral agreement — `PASS_DATED_RECHECK`.
- China mainland: temporary 30-day visa waiver valid through 2026-12-31 — `PASS_TEMPORARY_VISA_WAIVER_EXP_2026-12-31`.
- Hong Kong: visa-free up to 90 days — `PASS_DATED_RECHECK`.
- Macao: visa-free up to 30 days — `PASS_DATED_RECHECK`.
- Taiwan: Brazil is absent from the official visa-free and eVisa lists — `VISA_REQUIRED_RECHECK`.
- China mainland, Hong Kong, Macao and Taiwan remain four separate entry regimes.

## WordPress / Console evidence

- Public home remains HTTP 502 Bad Gateway.
- `/acesso-ang/`, `/area-restrita/` and `/wp-json/` remain unavailable.
- WPWriter site `6445b831-8563-4c9a-8f58-fb8bec94af13`: Active / `rest_api`; pages and posts fail with `No such host is known`.
- WordPress.com blog `256300923`: active/launched; Jetpack remains `site_disconnected` and site tools unavailable.
- No backup, staging, CTA/shortcode mutation or quotation E2E was performed.
- `WORDPRESS_P0_PASS=false`; `CONSOLE_E2E_PASS=false`.

## Partnerships

- Current Gmail search returned only the known TTW negative response `1a18d4c08afc1a18`, thread `1a0975c1c9addd0a`.
- No new qualifying response from Accor, Club Med or Simone Pampaloni / Il Borro.
- No co-marketing, logo or media authorization was inferred or published.

## Media and publication gates

- Every unit retains `media_id=null`, `source_url=null`, `license_or_permission=null`, `brand_master_id=null` and `visual_hash=null`.
- `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `NO_DUPLICATE_PASS=false`; `COPY_QA_PASS=false`; `LIVE_CMS_DEDUPE_PASS=false`; `CONSOLE_E2E_PASS=false`; `PUBLISHED=false`.
- No AI-generated image, text-only post, repeated visual, unlicensed media or unvalidated logo was created or published.
- Facebook Page `353450855530042` was preserved; Page `1214700205067389` was not used.

## Blockers, attempted solution and minimum human action

- WordPress origin/DNS 502 and disconnected Jetpack: public, WPWriter and WordPress.com probes were repeated. Minimum action: restore origin/upstream and reconnect Jetpack; then run backup/staging and quotation E2E.
- Live CMS dedupe unavailable: current 881 snapshots were used as safe offline fallback. Minimum action: restore authenticated CMS before deriving `external_id`.
- Media/logo rights absent: all media fields remain null. Minimum action: provide traceable licensed real media and unequivocal approved masters.
- Partner permissions absent: Gmail was rechecked. Minimum action: obtain explicit written co-marketing/media authorization.

## Next action

Advance to Block 27 without restarting Blocks 12–26. Repeat WordPress/Console probes; reconcile live CMS only after authenticated recovery; keep social, Google Business, Miami Beach, Il Borro and partnerships in review until every gate passes.

## Rollback

Remove only Drive Doc `1eraiuDM1DfJCa14yf80rObKI9cKIo-FyKVr1CsbTUdU` and revert only the C380 receipt/audit commits. Preserve all earlier blocks and existing site content.
