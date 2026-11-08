# ANG C379 — Block 25 — British Isles, Eurasia and Caucasus audit

Checked at: 2026-11-07 BRT  
Status: `OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING`  
Publication: `false`

## Executed

- Produced 10 units and 160 editorial axes: Ireland, United Kingdom, Türkiye, Georgia, Armenia, Azerbaijan, Ukraine, Belarus, Russia and Gibraltar.
- Reconciled 60 read-only alias slots in the 881 spreadsheet across `Item Register` and `WP Export Identity 24-07` (`A1:Z1900`).
- Confirmed zero canonical matches. The single raw `TUR` hit was a substring collision in reconciliation text and was classified as a false positive.
- Verified current governmental immigration sources, official tourism sources where appropriate, territorial exclusions and security gates with `checked_at=2026-11-07`.
- Imported the block as a native Google Doc and read it back: `1QIjaA5W_kqG49vJuTJbTYLd5gkX0dgR1iH8-BJ7sYfE`.
- Rechecked WordPress, Console entry routes and Gmail partnerships without writes.

## Entry and safety result

- Ireland: non-Schengen; Brazilian ordinary passport generally visa-exempt for visits under 90 days, subject to border control. Northern Ireland follows the UK ETA regime.
- United Kingdom: ETA required for eligible Brazilian visa-free visits; ETA is not a visa or guaranteed entry.
- Türkiye: visa-free up to 90 days according to MFA, with regional border exclusions.
- Georgia and Armenia: visa-free regimes, with explicit territorial/border exclusions.
- Azerbaijan: `VISA_REQUIRED_RECHECK` for Brazilian ordinary passports; official/diplomatic exemptions must not be generalized.
- Gibraltar: `PASS_WITH_BORDER_REGIME_RECHECK`; implementation and Spanish border transit must be revalidated.
- Ukraine, Belarus and Russia: `HOLD_NOT_MARKETABLE_CURRENTLY`. They remain inventory-only, without commercial CTA, hotel recommendation, media, promotion or publication.

## WordPress / Console evidence

- Public home remains HTTP 502 Bad Gateway.
- `/acesso-ang/`, `/area-restrita/` and `/wp-json/` remain unavailable.
- WPWriter site `6445b831-8563-4c9a-8f58-fb8bec94af13`: Active / `rest_api`, but pages/posts fail with `No such host is known`.
- WordPress.com blog `256300923`: active/launched; Jetpack remains disconnected (`site_disconnected`).
- No change since C378; no backup, staging, shortcode/CTA edit or quotation E2E could be safely executed.
- `WORDPRESS_P0_PASS=false`; `CONSOLE_E2E_PASS=false`.

## Partnerships

- TTW Group: negative response `1a18d4c08afc1a18`, thread `1a0975c1c9addd0a`; no current interest or authorization.
- Accor: no new response; historical interest is not permission for co-marketing, media or logos.
- Club Med: no inbound response; HOLD.
- Simone Pampaloni / Il Borro: no inbound response; HOLD.
- No institutional article or social post was created or published.

## Media and publication gates

All commercial media manifests remain unset. Ukraine, Belarus and Russia are additionally blocked by conflict/sanctions context.

- `REAL_MEDIA_VERIFIED=false`
- `MASTER_LOGO_VERIFIED=false`
- `NO_DUPLICATE_PASS=false`
- `COPY_QA_PASS=false`
- `LIVE_CMS_DEDUPE_PASS=false`
- `CONSOLE_E2E_PASS=false`
- `PUBLISHED=false`

No AI-generated image, text-only post, repeated visual, unlicensed media or unvalidated logo was created or published. Facebook Page `353450855530042` was preserved; Page `1214700205067389` was not used.

## Blockers, attempted solution and minimum human action

- WordPress origin/DNS 502 and disconnected Jetpack: public, WPWriter and WordPress.com probes were retried. Minimum action: restore origin/upstream and reconnect Jetpack, then run backup/staging and quotation E2E.
- Live CMS dedupe unavailable: complete 881 snapshots and alias evaluation were used as safe offline fallback. Minimum action: restore authenticated CMS before deriving `external_id`.
- Media/logo rights absent: every media field stayed null. Minimum action: supply licensed real media and unequivocal approved masters.
- Partner permissions absent: Gmail was rechecked. Minimum action: obtain explicit written co-marketing and media authorization.
- Ukraine/Belarus/Russia: external conflict, sanctions, border, financial and consular risks. No commercial activation while official advisories persist.

## Next action

Advance to Block 26 without restarting Blocks 12–25. Repeat WordPress/Console probes; reconcile live CMS only after authenticated recovery; keep social, Google Business, Miami Beach, Il Borro and partnerships in review until all gates pass.

## Rollback

Remove only Drive Doc `1QIjaA5W_kqG49vJuTJbTYLd5gkX0dgR1iH8-BJ7sYfE` and revert only the C379 receipt/audit commits. Preserve all earlier blocks and existing site content.
