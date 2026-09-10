# ANG Curadoria — Canonical Coverage Gate — 2026-09-10

Status: FAIL-CLOSED / NO CMS PUBLICATION

## Objective
Prevent duplicate country/territory creation before the next mass-expansion macro-lot. This control reconciles the current 13-block production regime with the earlier lexical lot audit and the 881 WordPress identity map.

## Current 13-block production regime (130 units)

### Block 01
Brazil; United States; France; Italy; Portugal; Switzerland; Japan; Greece; United Arab Emirates; Maldives.

### Block 02
Spain; Türkiye; Thailand; Indonesia; Vietnam; Singapore; Malaysia; Philippines; South Korea; India.

### Block 03
Sri Lanka; Seychelles; Mauritius; Morocco; Egypt; Kenya; Tanzania; Namibia; Botswana; Argentina.

### Block 04
Chile; Peru; Mexico; Colombia; Uruguay; Netherlands; Belgium; Germany; Austria; Croatia.

### Block 05
Slovenia; Czech Republic; Hungary; Poland; Denmark; Sweden; Norway; Finland; Iceland; Ireland.

### Block 06
Canada; Costa Rica; Panama; Ecuador; Bolivia; Paraguay; Australia; New Zealand; South Africa; Qatar.

### Block 07
United Kingdom; Luxembourg; China; Cambodia; Laos; Nepal; Bhutan; Jordan; Oman; Saudi Arabia.

### Block 08
Bahrain; Kuwait; Israel; Lebanon; Georgia; Armenia; Azerbaijan; Kazakhstan; Uzbekistan; Mongolia.

### Block 09
Dominican Republic; Jamaica; Bahamas; Barbados; Fiji; Trinidad and Tobago; Cuba; Belize; Guatemala; Honduras.

### Block 10
El Salvador; Nicaragua; Guyana; Suriname; Venezuela; Aruba; Curaçao; Puerto Rico; Saint Lucia; Grenada.

### Block 11
Antigua and Barbuda; Dominica; Saint Kitts and Nevis; Saint Vincent and the Grenadines; Martinique; Guadeloupe; Bermuda; Cayman Islands; Turks and Caicos Islands; British Virgin Islands.

### Block 12
Anguilla; Montserrat; Saint Martin (French part); Sint Maarten; Bonaire; Saba; Sint Eustatius; U.S. Virgin Islands; Saint Barthélemy; French Guiana.

### Block 13
Cook Islands; Niue; Samoa; Tonga; Vanuatu; Solomon Islands; Papua New Guinea; New Caledonia; French Polynesia; Guam.

## Historical lexical audit gate
The prior A–08 reconciliation audited 240 rows and found 191 normalized unique identities with 49 duplicate occurrences. Therefore the 130-unit block list above MUST NOT be interpreted as the complete historical coverage universe.

Required crosswalk before opening the next macro-lot:
1. Build normalized key for each historical A–08 identity.
2. Compare against the 130-unit production regime.
3. Preserve the four 08M-only identities already identified historically: State of Palestine / Palestinian Territories; Burundi; Micronesia (Federated States of Micronesia); Marshall Islands.
4. Mark every overlap as MERGE_REVIEW rather than NEW.
5. Only identities absent from both the historical 191 set and the current 130-unit regime may enter NEW_CANDIDATE.

## 881 WordPress map guardrail
The 881 map is a dense module/destination inventory for ten countries, not a world-country inventory. Do not infer NEW or DUPLICATE solely from country absence/presence in the 881 map. Reconciliation must use country/territory → city/destination → title → slug → external_id/post_id where applicable.

## HOLD artifacts
- Any duplicate/collision block previously renamed HOLD_RENUMBER_RECONCILE remains HOLD.
- Do not promote or reuse duplicated units as new coverage.

## Publication gates
No item from this control is APPROVED or PUBLISHED. Before CMS payload: official-source QA, checked_at, media license/provenance, SHA-256/dedup, canonical ID reconciliation, staging, backup/rollback and owner approval where required.

## Next deterministic action
Extract the full 191 historical identities from the A–08 source lots into a machine-readable crosswalk and calculate exactly: CURRENT_130 ∩ HISTORICAL_191, HISTORICAL_ONLY, CURRENT_ONLY, and TRUE_ABSENT. Only after that calculation should a 100-country macro-lot be assembled, preferably as 10-country transactional sublots to preserve QA and rollback granularity.
