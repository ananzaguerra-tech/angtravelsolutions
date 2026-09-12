# ANG Brand Master Library Manifest — 2026-09-12

Policy: FAIL_CLOSED. No social, Google Business or site artwork may publish without the correct brand master/reference bound to the item. Library assets are authoritative only when canonical identity evidence supports the intended use; exploratory boards are not masters.

| Brand / usage | Library evidence | Status | Publication rule |
|---|---|---|---|
| ANG Luxury Brazil | `file_00000000a1f8820e9b6707b21ec79769` / recent visual using approved option 30; Drive master `ANG_LUXURY_BRAZIL_MASTER_OPCAO_30_TRANSPARENT.png` | CONFIRMED | READY for compliant artwork after dedupe/media QA |
| ANG Travel & Celebrations — combined social profile usage | `file_000000004e10820e8c5d7657e9716951` (`ang-salento-destination-wedding-celebrations.png`) visibly carries the ANG Travel & Celebrations signature on a real destination-wedding piece; later social architecture places Travel + Celebrations together on `@angtravelbr` | CONFIRMED_SOCIAL_REFERENCE | May be used as the visual/signature reference for the combined social profile after real-media/dedupe QA; does not merge the two institutional brands |
| ANG Travel — institutional | Canonical identity record says keep current approved ANG Travel logo intact | HOLD_MASTER_FILE | Do not substitute exploratory boards or combined social lockups for the institutional master |
| ANG Celebrations — institutional | Canonical identity record says Celebrations remains a separate brand; final historical master color not unambiguously recovered | HOLD_MASTER_FILE | Combined social signature does not replace the separate institutional master |
| ANG Travel Solutions | Recent Library candidate `file_000000006310820eb80cbc2edb35d4f5` and named files `Logo da ANG Travel Solutions.png` / `Logo ANG Travel Solutions em dourado.png`; canonical spec requires approved lilac architecture and preserved insignia | HOLD_CANONICAL_MATCH | Use only after exact approved variant is matched |
| ANG MICE & Business Travel | Recent Library candidate `file_000000004f0c820e98f2967ff91d79a8` / `file_000000000bdc820e80e8e25574da37e1`; visual shows MICE & Business Travel | HOLD_CANONICAL_MATCH | Do not publish until matched to canonical combined profile usage |
| ANG Group / Global Hub | Recent Library candidate `file_000000007b34820ea52e8cd8ad354e74` / `file_00000000af74820ea6790cd8eedc4f46` shows ANG Global Travels; canonical ANG Group specification instead says preserve official sphere/insignia in institutional gold `#b88936` | HOLD_IDENTITY_CONFLICT | Do not equate Global Travels artwork with ANG Group without explicit canonical evidence |

Canonical constraints recovered from Library:
- ANG Group: institutional gold `#b88936`; preserve official sphere/insignia.
- ANG Travel: keep current approved logo intact.
- ANG Travel Solutions: approved lilac architecture; preserve insignia/composition.
- ANG Business Travel: former ANG Corporate insignia in gold; text `#f2c84b`.
- ANG MICE: own insignia inspired by Corporate; `#b14b1e`.
- ANG Celebrations: separate institutional brand; final historical master color not unambiguously recovered.
- ANG Luxury Brazil: option 30, three-stroke flowing gold gesture, horizontal signature.

Hard rules:
1. No exploratory board/options may be treated as a final master except Luxury Brazil option 30, which has an explicit later approval.
2. Combined `ANG Travel & Celebrations` usage is allowed only for the explicitly combined social/profile context; it does not rewrite the institutional identity matrix.
3. No AI-generated/reconstructed logo.
4. Public captions contain no photo/data source credits; provenance remains internal.
5. Every dispatch item must carry `brand_master_id` or an explicitly permitted combined-profile reference and pass zero-duplication preflight for media, video, copy, topic, layout/design and composition.
6. If identity evidence conflicts, HOLD rather than publish.