# ANG U.S. Virgin Islands — Official Sources, 881 Reconciliation & WordPress Audit

- **Cycle:** C366
- **Unit:** Ilhas Virgens Americanas / U.S. Virgin Islands (Block 12, unit 08)
- **checked_at:** 2026-11-07T07:00:29-03:00
- **Operational state:** `REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL / MEDIA_PENDING`
- **Publication:** `HOLD`

## 1. 881/WORLD reconciliation

The canonical Google Sheet `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg` was scanned in `A1:Z1900` on:

- `Item Register`
- `WP Export Identity 24-07`

Aliases: `Ilhas Virgens Americanas`, `U.S. Virgin Islands`, `US Virgin Islands`, `USVI`.

Result: **0 matches for every alias in both tabs**. This is a fail-closed offline dedupe result. It does not authorize insertion, derive an `external_id`, or prove live-CMS uniqueness.

Machine receipt: `ops/control/ANG_US_VIRGIN_ISLANDS_881_OFFLINE_DEDUPE_RECEIPT_C366_2026-11-07.json`.

## 2. Official-source editorial dossier

### Stable facts suitable for editorial review

- The official tourism portal organizes the destination around St. Thomas, St. John and St. Croix.
- St. Thomas supports the Charlotte Amalie/culture module and is served by Cyril E. King Airport.
- St. John has no airport and is reached by ferry/boat; Virgin Islands National Park and Trunk Bay are core nature modules.
- St. Croix supports Christiansted, Frederiksted, history and Buck Island Reef National Monument.
- National Park Service sources confirm Virgin Islands National Park, Christiansted National Historic Site and Buck Island Reef National Monument as protected federal units.

### Candidate destination/module expansion

1. St. Thomas — Charlotte Amalie, culture, Fort Christian, beaches and ferry gateway.
2. St. John — Cruz Bay, Virgin Islands National Park and Trunk Bay.
3. St. Croix — Christiansted, Frederiksted and heritage.
4. Buck Island Reef National Monument — access only by vessel; operator/permit/conditions recheck.
5. Water Island — limited-capacity island extension.
6. Inter-island logistics — STT/STX airports and domestic versus international ferry controls.

### SEO/schema/CTA draft state

- Working intent: `U.S. Virgin Islands travel guide`, `St Thomas`, `St John`, `St Croix`, `Trunk Bay`, `Buck Island`.
- Proposed schema only: `TouristDestination` + nested `Place`; no `Offer`, ratings or availability claims.
- Proposed CTA remains non-public: "Planeje as Ilhas Virgens Americanas com curadoria ANG" / "Plan the U.S. Virgin Islands with ANG curation".
- No media or logo master attached. `REAL_MEDIA_VERIFIED`, `MASTER_LOGO_VERIFIED`, `NO_DUPLICATE_PASS` and `COPY_QA_PASS` remain false.

## 3. Entry, visa and transport gates

- Visit USVI states that entry rules for non-US citizens are the same as entering the United States from a foreign destination.
- The US Department of State states that foreign nationals traveling for tourism need a B-2 or B1/B2 visitor visa unless eligible for the Visa Waiver Program.
- Brazil is not listed among Visa Waiver Program countries. Therefore the standard Brazilian-passport path is treated as `US_VISITOR_VISA_REQUIRED=PASS_DATED_RECHECK`, an inference from the official rule and current VWP list. A valid visa, dual nationality, residency or other status can change the result.
- ESTA applies only to eligible VWP nationals and is not a substitute for a visa for a standard Brazilian passport.
- Ferry travel to the British Virgin Islands crosses an international border and must not be treated as domestic island hopping.
- Air/ferry schedules, fares, baggage, marine conditions, park hours, fees and permits remain `HOLD_RECHECK`.

## 4. WordPress/site P0 evidence

- WPWriter metadata reports **Active** via REST API, but posts and pages remain unavailable.
- Page/post listing failed with `No such host is known`.
- Public homepage probe returned HTTP 502.
- Public `/area-restrita/` was inaccessible to the probe.

WordPress P0, login/RBAC and quote end-to-end remain **not PASS**. No page, route, shortcode, maintenance state, plugin, database record or production content was changed.

## 5. Partnership and publication gate

Gmail check found no new clearly positive response from Accor, Club Med, Guilherme Valle/TTW Group or Simone Pampaloni/Il Borro. The only relevant recent inbound remains TTW's negative response dated 2026-10-30, message ID `1a18d4c08afc1a18`.

No WordPress, Meta, Facebook, Instagram, Google Business or blog publication was attempted.

## 6. Official URLs checked

- https://www.visitusvi.com/travel-information/transportation/
- https://www.visitusvi.com/st-thomas/
- https://www.visitusvi.com/st-john/
- https://www.visitusvi.com/st-croix/
- https://www.nps.gov/viis/planyourvisit/hours.htm
- https://www.nps.gov/state/vi/index.htm
- https://www.nps.gov/buis/planyourvisit/basicinfo.htm
- https://travel.state.gov/content/travel/en/us-visas/tourism-visit.html
- https://travel.state.gov/content/travel/en/us-visas/tourism-visit/visa-waiver-program.html
- https://travel.state.gov/content/travel/en/us-visas/Visa-Reciprocity-and-Civil-Documents-by-Country/Brazil.html

## 7. Rollback

Revert this documentation commit and the machine-readable receipt commit. No external production mutation occurred.
