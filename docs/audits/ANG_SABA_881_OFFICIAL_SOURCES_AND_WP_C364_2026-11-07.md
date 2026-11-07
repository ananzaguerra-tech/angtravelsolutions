# ANG Saba — Official Sources, 881 Reconciliation & WordPress Audit

- **Cycle:** C364
- **Unit:** Saba (Block 12, unit 06)
- **checked_at:** 2026-11-07T04:57:01-03:00
- **Operational state:** `REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL / MEDIA_PENDING`
- **Publication:** `HOLD`

## 1. 881/WORLD reconciliation

The canonical Google Sheet `1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg` was scanned in `A1:Z1900` on both tabs:

- `Item Register`
- `WP Export Identity 24-07`

Aliases checked: `Saba`, `Saba Island`, `The Unspoiled Queen`, `SAB`.

Result: **0 matches for every alias in both tabs**. This is a fail-closed offline dedupe result; it does not authorize insertion or publication. Machine-readable receipt: `ops/control/ANG_SABA_881_OFFLINE_DEDUPE_RECEIPT_C364_2026-11-07.json`.

## 2. Official-source editorial dossier

### Stable facts suitable for editorial review

- Saba Tourism identifies The Bottom as the capital and lists Windwardside, St. John's and Zion's Hill among the four main villages.
- The official tourism page places Saba about 28 miles southwest of St. Maarten and describes air and ferry access from that hub.
- The official Mount Scenery page lists the trail origin near Windwardside, a summit elevation of 887 m, 1,015 stone steps and an approximate 2.5-hour round trip. Trail conditions and advisories remain dynamic.
- Saba Tourism describes the island's hiking network and recommends consulting current trail advisories.
- Rijksdienst Caribisch Nederland states that non-Dutch/non-US visitors may generally stay up to 90 days in any 180-day period, subject to entry conditions and possible visa requirements.
- NetherlandsWorldwide states that visa need depends on nationality and publishes current entry conditions for visa-free travelers.

### Candidate destination/module expansion

1. The Bottom — capital, local services, The Ladder/Well's Bay context.
2. Windwardside — tourism services and access to the Mount Scenery trail.
3. Mount Scenery — hiking module; safety/advisory recheck required.
4. St. John's — village/cultural context pending source-backed enrichment.
5. Zion's Hill — village/airport approach context pending source-backed enrichment.
6. Saba Marine Park — diving/conservation module pending current operational and rights checks.

### SEO/schema/CTA draft state

- Working SEO intent: `Saba travel guide`, `The Bottom`, `Windwardside`, `Mount Scenery hike`.
- Proposed schema only: `TouristDestination` + nested `Place`; dynamic travel requirements must remain dated and sourced.
- CTA remains non-public: "Planeje Saba com curadoria ANG" / "Plan Saba with ANG curation".
- No media asset or logo master was attached; therefore `REAL_MEDIA_VERIFIED`, `MASTER_LOGO_VERIFIED`, `NO_DUPLICATE_PASS` and `COPY_QA_PASS` are not satisfied.

## 3. Dynamic-fact holds

Recheck immediately before any customer-facing release:

- flight and ferry schedules, fares and baggage rules;
- visa/entry rules by nationality and transit routing;
- trail openings, advisories, weather and guided-access rules;
- nature, accommodation or visitor fees;
- operator availability and all commercial claims.

## 4. WordPress/site P0 evidence

- WPWriter connection metadata reports the site as **Active** via REST API, but posts and pages are **unable to fetch**.
- Listing pages and posts failed with `No such host is known`.
- Public homepage probe returned HTTP 502.
- Public `/area-restrita/` was not accessible to the probe.

Therefore WordPress P0 and Console end-to-end remain **not PASS**. No page, post, route, CTA, maintenance setting, plugin, database record or production content was changed.

## 5. Partnership and publication gate

Gmail check in this cycle found no new clearly positive reply from Accor, Club Med, Guilherme Valle/TTW Group or Simone Pampaloni/Il Borro. The only relevant recent inbound remains the TTW negative response from 2026-10-30 (message ID `1a18d4c08afc1a18`).

No social, Google Business, WordPress or blog publication was attempted.

## 6. Official URLs checked

- https://www.sabatourism.com/about-saba/
- https://www.sabatourism.com/getting-here
- https://www.sabatourism.com/hiking/mt-scenery/
- https://www.sabatourism.com/hiking/
- https://english.rijksdienstcn.com/immigration-naturalisation/tourist-stay
- https://english.rijksdienstcn.com/justice--security/royal-netherlands-marechaussee/travel-with-a-non-dutch-passport
- https://www.netherlandsworldwide.nl/caribbean-visa/visa-needed-caribbean
- https://www.netherlandsworldwide.nl/caribbean-visa/travel-without-visa
- https://www.sabagov.nl/units-directorates/juancho-e-irausquin-airport/entry-requirements

## 7. Rollback

Revert this documentation commit and the machine-readable receipt commit. No external production mutation occurred.
