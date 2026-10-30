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
- `idempotency_key`
- `idempotency_record_id`
- `idempotency_persistence_verified=true`
- `idempotency_state=UNUSED`
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
5. require an idempotency key plus a durable ledger record proving `idempotency_state=UNUSED` and `idempotency_persistence_verified=true`; absent, used or unknown keys MUST HOLD before any Meta request;
6. declare the requested channel explicitly and reject unsupported or ambiguous channel scope before any Meta request;
7. return and persist `publication_id`, permalink and execution ID after success;
8. perform post-publication readback of the exact ID and HTTPS permalink before marking `PUBLISHED`;
9. atomically update the durable idempotency ledger with publication ID, permalink and execution ID after success.

The inactive staging import enforces the preflight proof contract but does not implement or claim the durable ledger.

## Channel scope integrity

The current staging import is an **Instagram-only publisher**. It uses Page ID `353450855530042` solely to verify and discover the linked Instagram Business account. This does **not** prove or perform a Facebook publication. Any request containing `facebook` or an ambiguous/empty channel scope must return `UNSUPPORTED_OR_AMBIGUOUS_PUBLICATION_CHANNEL` before any Meta request. Facebook publishing remains `HOLD_FACEBOOK_PUBLISHER_NOT_IMPLEMENTED` until a dedicated canonical-page path applies the same media, provenance, idempotency and post-publication readback controls. Until an authenticated upstream ledger exists and the post-success write is verified, status remains `NO_PUBLISH`.

Unknown or mismatched destinations must return `HOLD_UNSUPPORTED_OR_FORBIDDEN_DESTINATION`.

## Repository scan evidence

A code search of the default branch on 2026-10-29 found zero occurrences of either Page ID and zero occurrences of the two incorrect Post IDs. This means the canonical Facebook destination was not yet encoded in the searched repository state; it does not prove external Meta configuration.

## Rollback

Delete or revert only this policy file and its referencing checkpoint. This policy introduces no Facebook, Instagram, Google Business or n8n mutation.

## Dedicated canonical Facebook staging candidate — C308

A separate inactive candidate, `ZEUS_FACEBOOK_CANONICAL_PUBLISHER_V1_FAIL_CLOSED_IMPORT.json`, now models Facebook publishing exclusively to Page ID `353450855530042`. It accepts only `channels=['facebook']` and `format=facebook_photo`; video and reels return `HOLD_FACEBOOK_VIDEO_NOT_IMPLEMENTED`. The forbidden Page ID `1214700205067389`, legacy payload `CURADORIA_ANG_AGOSTO`, text-only input, missing provenance and unverified HTTPS media are rejected before Meta.

This candidate is `STAGING_IMPORT_CANDIDATE_INACTIVE / NO_PUBLISH`. Even with all media gates present, it requires independently proven `durable_ledger_ready=true`, `post_success_atomic_write_ready=true` and `meta_auth_readback_verified=true`; those proofs do not yet exist. After a hypothetical photo creation, exact `post_id`, HTTPS `permalink_url`, execution ID and readback are required, and the status remains `HOLD_ATOMIC_LEDGER_WRITE_REQUIRED` until the durable ledger write is proven. No Facebook import or execution is authorized by this repository artifact.

## Server-side routing hardening — C309

The C308 candidate was corrected so a denied payload cannot flow into the Meta page-discovery request. `Fail Closed — Validar Facebook` now connects only to the physical `Rota Facebook autorizada?` IF node: the true branch is the sole route to Meta and the false branch goes directly to the webhook response.

Client payload fields `durable_ledger_ready`, `post_success_atomic_write_ready` and `meta_auth_readback_verified` are not trusted as evidence and cannot unlock the route. The inactive candidate now always returns `HOLD_SERVER_SIDE_LEDGER_AND_AUTH_NOT_WIRED` after all client-supplied gates pass, until durable ledger, atomic write and Meta-authentication checks exist as server-side nodes with independent evidence. Therefore C309 still authorizes no import, Meta call or publication.

## Durable idempotency ledger reference — C310

A PostgreSQL reference migration now defines a server-side ledger state machine: `UNUSED→RESERVED→PUBLISHED/FAILED`. Registration rejects duplicate idempotency or active visual/destination keys; reservation is a single atomic conditional update from `UNUSED`; publication requires an active reservation plus exact publication ID, HTTPS permalink, execution ID and verified readback. `PUBLISHED` and `FAILED` are terminal because no reset/reuse function exists.

The migration is explicitly `REFERENCE_ONLY / NOT_APPLIED / NO_CREDENTIALS`. It has not been executed against any database and is not wired into n8n. Its offline validator proves only repository structure and negative regression behavior, not database compatibility, transaction isolation, credentials, deployment or runtime persistence. Consequently the Facebook and Instagram candidates remain inactive and `HOLD_SERVER_SIDE_LEDGER_AND_AUTH_NOT_WIRED`.

## Offline ledger state-machine canaries — C311

A deterministic in-memory model now exercises eight negative and concurrency canaries: duplicate key, active visual/destination duplicate, two simultaneous reservations with exactly one winner, incomplete receipt, wrong reservation execution, terminal `PUBLISHED`, terminal `FAILED`, and unknown key. The CI executes these canaries without database, credentials, n8n or Meta access.

These tests prove only the intended state-machine behavior of the offline model. They do not execute the PostgreSQL migration and do not prove database isolation, function privileges, runtime persistence, crash recovery or n8n integration. The migration remains `REFERENCE_ONLY / NOT_APPLIED / NO_CREDENTIALS`, and all social publishers remain inactive.
