# ANG Curadoria — Canonical Remediation Package — 2026-09-12

Status global: `READY_QA / NO_PUBLISH`
Policy: fail-closed. This package does not authorize CMS publication.
Checked_at: 2026-09-13

## Objective
Close the canonical-identity gap for four countries identified by the 2026-09-12 reconciliation as true-absent candidates while preserving the 881/WORLD map, existing IDs, drafts and deduplication rules.

## Mandatory gates before any publication
- `CANONICAL_IDENTITY_DEDUPE_PASS`
- `REAL_MEDIA_VERIFIED`
- `LICENSE_OR_PERMISSION_RECORDED`
- `DYNAMIC_FACTS_CHECKED_AT_CURRENT`
- `SEO_SCHEMA_PASS`
- `STAGING_QA_PASS`
- `CMS_ID_EXTERNAL_ID_RECONCILED`

No record in this package is PUBLISHED or PASS.

---

## 1. Kiribati
Canonical country key candidate: `kiribati`
Primary destination seeds: South Tarawa; Kiritimati; Gilbert Islands; Phoenix Islands Protected Area.
Editorial status: `READY_FACT_QA / PUBLICATION_BLOCK`.
Official sources checked 2026-09-12:
- Immigration: https://immigration.mfai.gov.ki/visas-entry/
- Tourism: https://kiribatitourism.gov.ki/
- Activities: https://kiribatitourism.gov.ki/things-to-do
Dynamic entry note: the official portal confirms a visa-exemption framework and a general maximum stay of 90 days in any 12-month period. Brazil was not independently located in the accessible official output during the 2026-09-13 recheck; nationality-specific eligibility is therefore `NATIONALITY_CONFIRMATION_HOLD` and must be confirmed before quote or publication.
Editorial modules: overview; islands/regions; climate/best time; arrival/logistics; WWII heritage; fishing; surfing; diving; birdwatching; culture/homestays; sustainability/PIPA; CTA; SEO/schema.
SEO slug candidate: `/curadoria/kiribati/`
Schema candidates: `TouristDestination`, `Place`, `FAQPage`, `BreadcrumbList`.
Media: `MISSING_VERIFIED_MEDIA_MANIFEST`.
Canonical action: create identity only after duplicate search against 881/WORLD and historical aliases.

## 2. Nauru
Canonical country key candidate: `nauru`
Primary destination seeds: Yaren; Anibare Bay; Buada Lagoon; Topside; Naoero Museum.
Editorial status: `READY_FACT_QA / PUBLICATION_BLOCK`.
Official sources checked 2026-09-12:
- Immigration: https://justice.gov.nr/immigration-division/
- Visitor visa form: https://justice.gov.nr/wp-content/uploads/2023/12/Application-Form-Visitor-Visa.pdf
- Government information: https://www.nauru.gov.nr/government-information-office/
- Tourism: https://naurutourism.com.nr/explore-nauru/
- Tours: https://naurutourism.com.nr/tour-packages/
Dynamic entry note: published visitor-visa rules and fees are dynamic and must be revalidated at quote/publication time; no nationality exemption is inferred.
Editorial modules: overview; districts; climate; arrival/logistics; Anibare Bay; WWII trails; Topside; Buada Lagoon; museum; fishing/boat charters; culture/crafts; CTA; SEO/schema.
SEO slug candidate: `/curadoria/nauru/`
Schema candidates: `TouristDestination`, `Place`, `FAQPage`, `BreadcrumbList`.
Media: `MISSING_VERIFIED_MEDIA_MANIFEST`.
Canonical action: create identity only after duplicate search against 881/WORLD and historical aliases.

## 3. Tuvalu
Canonical country key candidate: `tuvalu`
Primary destination seeds: Funafuti; Funafuti Conservation Area; outer atolls/islands subject to factual QA.
Editorial status: `READY_FACT_QA / ENTRY_FACT_HOLD / PUBLICATION_BLOCK`.
Official sources checked 2026-09-12:
- Tourism: https://tourism.gov.tv/
- Tourism contact: https://tourism.gov.tv/contact/
Dynamic entry note: nationality-specific visitor-entry rules remain HOLD until a competent current immigration/foreign-affairs source is verified.
Editorial modules allowed now: overview; geography/atolls; culture; lagoons/reefs; low-impact travel positioning; climate; sustainability; CTA; SEO/schema. Entry/logistics claims remain fail-closed where not officially verified.
SEO slug candidate: `/curadoria/tuvalu/`
Schema candidates: `TouristDestination`, `Place`, `FAQPage`, `BreadcrumbList`.
Media: `MISSING_VERIFIED_MEDIA_MANIFEST`.
Canonical action: create identity only after duplicate search against 881/WORLD and historical aliases.

## 4. Libya
Canonical country key candidate: `libya`
Primary editorial seeds: Tripoli; Leptis Magna; Sabratha; Cyrene, subject to competent-source verification and safety constraints.
Editorial status: `RESTRICTED_QA / PUBLICATION_BLOCK`.
Official sources checked 2026-09-12:
- Tourism: https://tourism.gov.ly/
- Foreign Affairs: https://foreign.gov.ly/
Rule: heritage/editorial research only. No commercial destination promotion or client-facing travel encouragement while restrictive safety/security conditions remain unresolved.
Editorial modules allowed now: historical/cultural research, UNESCO/heritage references after source QA, geography/context, safety disclaimer architecture, SEO metadata in non-promotional form.
SEO slug candidate: `/curadoria/libia/`
Schema candidates: `TouristDestination` only after safety/release review; `Place`, `BreadcrumbList` may be prepared in staging.
Media: `MISSING_VERIFIED_MEDIA_MANIFEST`.
Canonical action: identity may be staged only after dedupe; publication remains blocked pending safety, entry and operational-accessibility revalidation.

---

## Canonical reconciliation procedure
For each country before assigning any new CMS/Post/external ID:
1. Normalize country name, ISO aliases, Portuguese/English variants and historical aliases.
2. Search 881/WORLD exact and hierarchical mappings.
3. Search WordPress `ang_curated` and `ang_lounge` by slug/title/external_id.
4. If any plausible match exists, classify `MERGE_REVIEW`; do not create a new identity.
5. Only a zero-match result may advance to `NEW_CANONICAL_CANDIDATE`.
6. Record `slug -> post_id -> external_id` before any content merge.

## Media manifest requirement
For every eventual asset record: `media_id | destination_key | source | author | license_or_permission | source_url | dimensions | local_path_or_asset_id | sha256 | visual_hash | checked_at | dedupe_status`.
AI-generated media is prohibited for final use.

## Current outcome
- 4/4 countries now have a controlled canonical remediation package.
- 0/4 have new CMS IDs assigned.
- 0/4 have verified real-media manifests.
- 0/4 are authorized for publication.
- No WordPress, Google Business, social or n8n state was changed by this package.
