# ANG Sint Eustatius — Official Sources, 881 Reconciliation & WordPress Audit

- **Cycle:** C365
- **Unit:** Sint Eustatius / Statia (Block 12, unit 07)
- **checked_at:** 2026-11-07T06:01:55-03:00
- **Operational state:** `REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL / MEDIA_PENDING`
- **Publication:** `HOLD`

## 1. 881/WORLD reconciliation

The canonical Google Sheet `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg` was scanned in `A1:Z1900` on both tabs:

- `Item Register`
- `WP Export Identity 24-07`

Aliases checked: `Sint Eustatius`, `Saint Eustatius`, `Statia`, `EUX`.

Result: **0 matches for every alias in both tabs**. This is a fail-closed offline dedupe result. It does not authorize insertion, derive an `external_id`, or prove live-CMS uniqueness.

Machine receipt: `ops/control/ANG_SINT_EUSTATIUS_881_OFFLINE_DEDUPE_RECEIPT_C365_2026-11-07.json`.

## 2. Official-source editorial dossier

### Stable facts suitable for editorial review

- The official tourism portal identifies Sint Eustatius as Statia and presents hiking, nature, marine activities and history as core editorial themes.
- STENAPA manages The Quill and Boven National Park, the St. Eustatius National Marine Park and the Miriam C. Schmidt Garden.
- The official tourism material identifies Oranjestad, Fort Oranje, historical warehouse ruins, The Quill and protected marine environments as priority themes.
- F.D. Roosevelt Airport uses IATA code `EUX`; scheduled service and all operational claims require recheck before sale.
- The island uses the US dollar; local transport, opening hours, flight/ferry schedules and prices are dynamic.

### Candidate destination/module expansion

1. Oranjestad — historic core, Fort Oranje and Lower Town context.
2. The Quill — hiking/nature module with current trail and safety advisory.
3. Boven National Park — hiking and conservation module.
4. St. Eustatius National Marine Park — diving/snorkeling/conservation module.
5. Gallows Bay / Lower Town — harbour, waterfront and archaeological context.
6. Fort Oranje — heritage module requiring current access and opening-hour confirmation.

### SEO/schema/CTA draft state

- Working intent: `Sint Eustatius travel guide`, `Statia`, `The Quill hike`, `Fort Oranje`.
- Proposed schema only: `TouristDestination` + nested `Place`; no `Offer`, rating or availability claim.
- Proposed CTA remains non-public: "Planeje Sint Eustatius com curadoria ANG" / "Plan Statia with ANG curation".
- No media or logo master attached. `REAL_MEDIA_VERIFIED`, `MASTER_LOGO_VERIFIED`, `NO_DUPLICATE_PASS` and `COPY_QA_PASS` remain false.

## 3. Entry, nature and transport gates

- NetherlandsWorldwide lists Brazil among nationalities not requiring a Caribbean visa, subject to all entry conditions.
- Rijksdienst states a general maximum of 90 days in any 180-day period for eligible non-Dutch/non-US visitors; border authorities may shorten the stay.
- Passport validity through departure, purpose, onward/return travel, accommodation, funds and applicable insurance requirements must be rechecked for the actual traveler and routing.
- The official tourism practical-information page links to the **Sint Maarten** ED form, while an airline operational page states Statia has no separate tourist form and the Sint Maarten form may apply when connecting there. Therefore `STATIA_ENTRY_FORM_PASS=HOLD_SOURCE_CONTEXT`; no standalone Statia form was asserted.
- STENAPA currently displays a USD 10 hiking nature fee valid for a calendar year. This is `PASS_DATED_RECHECK`, not a permanent price.
- Air/ferry operators, schedules, baggage, fares and connection margins remain `HOLD_RECHECK`.

## 4. WordPress/site P0 evidence

- WPWriter metadata reports the site as **Active** via REST API, while posts and pages remain unavailable.
- Page and post listing failed with `No such host is known`.
- Public homepage probe returned HTTP 502.
- Public `/area-restrita/` was inaccessible to the probe.

WordPress P0, login/RBAC and quote end-to-end remain **not PASS**. No page, route, shortcode, maintenance state, plugin, database record or production content was changed.

## 5. Partnership and publication gate

Gmail check found no new clearly positive response from Accor, Club Med, Guilherme Valle/TTW Group or Simone Pampaloni/Il Borro. The only relevant recent inbound remains TTW's negative response dated 2026-10-30, message ID `1a18d4c08afc1a18`.

No WordPress, Meta, Facebook, Instagram, Google Business or blog publication was attempted.

## 6. Official URLs checked

- https://www.statia-tourism.com/
- https://www.statia-tourism.com/practical-information-about-sint-eustatius
- https://www.statia-tourism.com/frequently-asked-questions
- https://statiapark.org/
- https://statiapark.org/hiking-2/
- https://www.statiagovernment.com/residents-visitors/travel-tourism/travel-requirements
- https://www.statiagovernment.com/units-directorates/directorate-of-transport/airport
- https://english.rijksdienstcn.com/immigration-naturalisation/tourist-stay
- https://english.rijksdienstcn.com/justice--security/royal-netherlands-marechaussee/travel-with-a-non-dutch-passport
- https://www.netherlandsworldwide.nl/caribbean-visa/visa-needed-caribbean
- https://www.netherlandsworldwide.nl/caribbean-visa/travel-without-visa

## 7. Rollback

Revert this documentation commit and the machine-readable receipt commit. No external production mutation occurred.
