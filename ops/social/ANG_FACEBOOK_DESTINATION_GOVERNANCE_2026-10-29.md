# ANG SOCIAL — FACEBOOK DESTINATION GOVERNANCE — 2026-10-29

Status: ACTIVE_POLICY / FAIL_CLOSED / NO_PUBLISH_WITHOUT_MEDIA_GATES

## Canonical Facebook destination

- Page: ANG TRAVEL (legacy/canonical group page)
- Page ID: `353450855530042`
- Rule: the only Facebook destination authorized for content from ANG Travel & Celebrations, ANG Travel Solutions, ANG Luxury Brazil and ANG Business Travel & MICE.
- Protection: NEVER DELETE / NEVER ALTER PAGE OWNERSHIP / NEVER REPLACE AS DESTINATION.
- Alignment: Facebook publication must mirror the approved Instagram asset/copy for the corresponding unit.

## Forbidden Facebook destination

- Page: ANG Travel Solutions (separate page)
- Page ID: `1214700205067389`
- Rule: NEVER PUBLISH.
- State: HUMAN_ADMIN_DELETE_PENDING.
- This repository policy does not claim that the page was deleted.

## Incorrect posts requiring authenticated correction

| Post ID | Current state | Required action |
|---|---|---|
| `1214700205067389_122123660331441523` | DELETE_NOT_PROVEN | Remove only after authenticated readback confirms the exact post/page relationship. |
| `353450855530042_1651151673688735` | DELETE_NOT_PROVEN | Remove only after authenticated readback confirms the exact post/page relationship. |

No deletion is declared until the connector returns the exact post ID plus success receipt and subsequent not-found/readback evidence.

## Absolute media gate

Facebook, Instagram and Google publishing MUST be blocked unless all fields below are present and pass:

- `media_id`
- `source`
- `author_or_owner`
- `license_or_permission`
- `brand_master_id`
- `theme_key`
- `sha256`
- `visual_hash`
- `REAL_MEDIA_VERIFIED=true`
- `MASTER_LOGO_VERIFIED=true`
- `NO_DUPLICATE_PASS=true`
- `COPY_QA_PASS=true`
- channel authentication readback = `AUTH_PASS`

Text-only posts are forbidden even when they contain a link. AI-generated destination imagery is forbidden. Static images cannot substitute for required video deliverables.

## Execution guard

Any social executor or payload MUST:

1. reject `facebook_page_id=1214700205067389`;
2. reject any Facebook Page ID other than `353450855530042`;
3. reject empty media, text-only payloads and unverified URLs;
4. reject legacy payload `CURADORIA_ANG_AGOSTO`;
5. require an idempotency key;
6. return and persist `publication_id`, permalink and execution ID after success;
7. perform post-publication readback before marking `PUBLISHED`.

Unknown or mismatched destinations must return `HOLD_UNSUPPORTED_OR_FORBIDDEN_DESTINATION`.

## Repository scan evidence

A code search of the default branch on 2026-10-29 found zero occurrences of either Page ID and zero occurrences of the two incorrect Post IDs. This means the canonical Facebook destination was not yet encoded in the searched repository state; it does not prove external Meta configuration.

## Rollback

Delete or revert only this policy file and its referencing checkpoint. This policy introduces no Facebook, Instagram, Google Business or n8n mutation.
