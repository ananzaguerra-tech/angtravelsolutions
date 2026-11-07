# ANG Curadoria — Turks e Caicos 881/WORLD — C357

checked_at: 2026-11-06T21:58:38-03:00  
status: REVIEW_REQUIRED / HOLD  
publication: false

## Reconciliation

- Block 11, unit 09: Turks e Caicos / Turks and Caicos Islands / TCA.
- Eight searches across `Item Register` and `WP Export Identity 24-07` for four aliases returned zero matches.
- Result: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.
- This is not a live-CMS dedupe PASS and does not authorize an `external_id`, canonical, publication, or migration.
- Proposed slug remains `/destinos/turks-e-caicos/` pending live CMS reconciliation.

## Official tourism and editorial modules

The official Tourist Board supports destination modules for Providenciales, Grand Turk, North Caicos, Middle Caicos, South Caicos, Salt Cay, Parrot Cay, Pine Cay, and Ambergris Cay. Editorial themes include beaches, diving, snorkeling, boats, wellness, island hopping, history, and nature.

Two official tourism pages conflict on the number of inhabited islands (one says nine; another says eight). The disputed count is not promoted into copy and remains `HOLD_SOURCE_RECONCILIATION`.

Official sources:
- https://turksandcaicostourism.com/our-islands-turks-and-caicos-islands-cays/
- https://turksandcaicostourism.com/islands-of-turks-and-caicos/

## Immigration and entry

TCI Border Force explicitly lists Brazil among visa-exempt travellers. Classification: `PASS_DATED_RECHECK`; admission is not guaranteed.

Current official requirements captured:
- international visitors must carry a valid passport; Border Force states at least six months;
- boarding permission is not admission;
- a Border Force Officer determines entry on arrival;
- adults travelling with minors may be asked for proof of relationship or a consent letter.

The legacy government visa page independently lists Brazil among countries whose nationals do not require a visa.

Official sources:
- https://borderforce.gov.tc/entry-requirements
- https://www.gov.tc/bordercontrol/services/visa

## WordPress / restricted area

- Public home: HTTP 502.
- `/area-restrita/`: inaccessible.
- WPWriter: site record Active, but pages/posts fail with `No such host is known`.
- Page 2109 unchanged; maintenance and existing content preserved.
- No production write or publish attempted.

## Media, social, branding and Google Business

No media was selected. Gates remain false:
- `REAL_MEDIA_VERIFIED=false`
- `MASTER_LOGO_VERIFIED=false`
- `NO_DUPLICATE_PASS=false`
- `COPY_QA_PASS=false`
- `PUBLISHED=false`

No Facebook, Instagram, Google Business, WordPress, Reel, Short, or blog publication occurred. Facebook destination remains limited to Page ID 353450855530042 only after all gates; Page ID 1214700205067389 remains prohibited.

## Partnerships

Gmail review found no new positive response from Accor, Club Med, TTW/Guilherme Valle, or Il Borro/Simone Pampaloni. The 2026-10-30 TTW response remains negative. No co-marketing or media permission was inferred.

## Rollback

Evidence-only commits may be reverted. No external production mutation requires rollback.
