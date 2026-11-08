# ANG C378 — Block 24 — Western and Nordic Europe audit

Checked at: 2026-11-07 BRT  
Status: `OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING`  
Publication: `false`

## Executed

- Produced Block 24 with 10 countries and 160 editorial axes: Belgium, Netherlands, Luxembourg, France, Switzerland, Denmark, Sweden, Norway, Finland and Iceland.
- Reconciled 60 read-only searches in the 881 spreadsheet across `Item Register` and `WP Export Identity 24-07` (`A1:Z1900`).
- Confirmed 0 canonical matches and classified all 79 raw hits as incidental false positives.
- Verified official national immigration and tourism sources, plus transversal EES/ETIAS sources, with `checked_at=2026-11-07`.
- Imported the block as a native Google Doc and read it back successfully: document ID `1ftLgLQysbAPrl6VRi7LDnSZEcIJKHqL2etLxJYrB7pA`.
- Re-probed WordPress and the restricted-area entry points without writes.
- Rechecked Gmail partner responses without sending messages.

## Official-source result

All ten destinations are in Schengen for the European itinerary scope. Brazilian ordinary-passport travellers remain visa-exempt for short stays up to 90 days in any 180-day period, subject to purpose and entry conditions. The EES is fully operational since 2026-04-10. ETIAS is not operational and does not accept applications.

Country-specific exceptions remain explicit: Dutch Caribbean, French overseas territories, Greenland/Faroe Islands, Svalbard/transit, and Iceland's bilateral-stay edge case require itinerary-specific validation. No static visa fact may be reused without recheck.

## WordPress / Console evidence

- Public home: HTTP 502 Bad Gateway.
- `/acesso-ang/`, `/area-restrita/` and `/wp-json/`: unavailable.
- WPWriter site `6445b831-8563-4c9a-8f58-fb8bec94af13`: Active / `rest_api`, but pages and posts fail with `No such host is known`.
- WordPress.com blog ID `256300923`: active/launched, but Jetpack is disconnected (`site_disconnected`) and scoped tools are unavailable.
- No backup/staging mutation, CTA normalization or end-to-end quotation test was attempted while the origin is unavailable.
- `WORDPRESS_P0_PASS=false`; `CONSOLE_E2E_PASS=false`.

## Partnerships / Il Borro

- TTW Group: negative response, Gmail message `1a18d4c08afc1a18`; no commercial or media authorization.
- Accor: no new reply in 14 days. Historical interest is not partnership approval and does not authorize co-marketing, logos or media.
- Club Med: no inbound response; HOLD.
- Simone Pampaloni / Il Borro: no inbound response; HOLD.
- No institutional article or social post was published.

## Media and social gates

Every Block 24 media manifest remains `MEDIA_PENDING` with `media_id`, `source_url`, `license_or_permission`, `brand_master_id` and `visual_hash` unset. Consequently:

- `REAL_MEDIA_VERIFIED=false`
- `MASTER_LOGO_VERIFIED=false`
- `NO_DUPLICATE_PASS=false`
- `COPY_QA_PASS=false`
- `PUBLISHED=false`

No AI-generated image, text-only post, repeated visual, unlicensed media or unvalidated logo was created or published. Facebook Page ID `353450855530042` was preserved; Page ID `1214700205067389` was not used.

## Blockers, attempted solution and minimum human action

- Blocker: WordPress origin/DNS 502 and disconnected Jetpack. Attempted solution: independent public, WPWriter and WordPress.com read-only probes. Minimum action: restore the origin/DNS and reconnect Jetpack, then rerun backup/staging and the full quotation flow.
- Blocker: no authenticated live-CMS dedupe. Attempted solution: 60-query offline 881 reconciliation. Minimum action: restore the authenticated CMS channel; do not derive `external_id` beforehand.
- Blocker: no traceable real media and unequivocal master evidence. Attempted solution: keep every media field null and all publication gates closed. Minimum action: provide licensed media evidence and approved masters.
- Blocker: no public co-marketing authorization from partners. Attempted solution: Gmail recheck. Minimum action: obtain explicit written authorization and supplied/authorized media before publication.

## Next action

Advance to Block 25 without restarting Blocks 12–24; repeat WordPress/Console probes; reconcile the live CMS and derive identifiers only after objective authenticated evidence; keep Google Business, Miami Beach, Il Borro and social in review until every gate passes.

## Rollback

Remove only Google Doc `1ftLgLQysbAPrl6VRi7LDnSZEcIJKHqL2etLxJYrB7pA` and revert only the C378 receipt/audit commits. Preserve all earlier blocks and existing site content.
