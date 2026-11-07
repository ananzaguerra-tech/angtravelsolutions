# ANG Curadoria — Ilhas Cayman 881/WORLD — C356

checked_at: 2026-11-06T21:00:33-03:00  
status: REVIEW_REQUIRED / HOLD  
publication: false

## Scope and reconciliation

- Block 11, unit 08: Ilhas Cayman / Cayman Islands / CYM.
- Eight exact searches across `Item Register` and `WP Export Identity 24-07` for four aliases returned zero matches.
- Result: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.
- This is not a live-CMS dedupe PASS and does not authorize an `external_id`, canonical, publication, or migration.
- Proposed slug remains `/destinos/ilhas-cayman/` until live CMS reconciliation.

## Official tourism and editorial structure

Official tourism identifies the three-island structure: Grand Cayman, Cayman Brac, and Little Cayman. Editorial modules remain:

- Grand Cayman: George Town, Seven Mile Beach, Stingray City, West Bay, Cayman Crystal Caves, and Barkers National Park.
- Cayman Brac: The Bluff, caves, nature, seafaring heritage, and diving.
- Little Cayman: Bloody Bay Wall, Booby Pond Nature Reserve, Owen Island, diving, and low-density nature.
- Any schedule, fare, operator, capacity, or weather-sensitive claim remains `HOLD_RECHECK`.

Official source: https://www.visitcaymanislands.com/en-us/islands

## Immigration and entry

Customs & Border Control explicitly places Brazil in the `Visa Not Required` column. Classification: `PASS_DATED_RECHECK`; this does not guarantee admission.

Visitors must hold:
- passport or appropriate identity/nationality document valid beyond the return-ticket date;
- paid return/onward ticket;
- sufficient funds if requested.

CBC states visitors may be granted up to six months, at the officer's discretion, with extensions subject to application. Entry can still be refused. Tourism guidance also identifies immigration and customs cards supplied by the airline, with the immigration card retained until departure.

Official sources:
- https://gov.ky/web/cbc/travel/visas-extensions/visitors-visas/list-of-countries-visa-required
- https://otp.gov.ky/web/cbc/travel/entry-requirements
- https://www.visitcaymanislands.com/en-us/planning/travel-information

## WordPress / restricted area

- Public home: HTTP 502.
- `/area-restrita/`: inaccessible through the public diagnostic.
- WPWriter site record: Active, but pages/posts fail with `No such host is known`.
- Page 2109 was not changed.
- Maintenance and existing content were preserved.
- No production write or publish was attempted.

## Social, media, branding, Google Business

No media was selected. Gates remain false:
- `REAL_MEDIA_VERIFIED=false`
- `MASTER_LOGO_VERIFIED=false`
- `NO_DUPLICATE_PASS=false`
- `COPY_QA_PASS=false`
- `PUBLISHED=false`

No Facebook, Instagram, Google Business, WordPress, Reel, Short, or blog publication occurred. Facebook destination rules remain unchanged: only Page ID 353450855530042 is allowed after all gates; Page ID 1214700205067389 is prohibited.

## Partnerships

Gmail review returned no new positive response from Accor, Club Med, TTW/Guilherme Valle, or Il Borro/Simone Pampaloni. The TTW reply from 2026-10-30 remains negative. No co-marketing or media permission was inferred.

## Rollback

Evidence-only commits may be reverted. No external production mutation requires rollback.
