# ANG SOCIAL — MATERIAL MEDIA AND SHA-256 GUARD — C305 — 2026-10-30

Status: STATIC_GUARD_PASS / IMPORT_INACTIVE / NO_PUBLISH

## Executed

The inactive staging social import was hardened before any Meta discovery call:

- supported feed/story payloads now require a non-empty HTTPS `image_url`;
- `carousel_3` requires at least two HTTPS entries in `image_urls`;
- text-only, empty, non-HTTPS and unsupported-format media payloads return `MEDIA_MATERIAL_MISSING_OR_UNSUPPORTED`;
- `sha256` must be exactly 64 hexadecimal characters or returns `INVALID_SHA256`;
- the CI validator now asserts both executable controls and their regression fixture.

## Evidence

- Guard commit: `6b55e248af2cb2a0af85ead232d738ba40d38cc6`
- Guard blob: `31e60a3a8fc26a66ff77d95f7aa7b5d087020380`
- Validator commit: `8af83db011980855a2847569ac036da77aec5abd`
- Validator blob: `439eb01e521e6cae6eef97e136379bba3ec40673`
- Static readback: 20/20 controls PASS.
- Gmail: zero received replies from Accor, Club Med, TTW/Guilherme Valle or Il Borro/Simone in the checked window; the two broad-query matches were unrelated bank promotions.
- Drive: zero results for `ANG STATUS LIVE C304 C305`.
- Library master observed at version 15 before this checkpoint.

## Not executed

No n8n import or execution, Meta call, post creation/deletion, WordPress mutation, Google Business mutation or media publication occurred.

## Remaining blocks

- `REMOTE_CI_RUN_NOT_PROVEN`: combined status and workflow-run lookup returned zero records for the validator commit.
- `IDEMPOTENCY_PERSISTENCE_NOT_IMPLEMENTED`: an idempotency key is required but durable preflight lookup and post-success persistence are not yet proven.
- `META_ORGANIC_AUTH_READBACK_MISSING`.
- `INCORRECT_POST_DELETE_NOT_PROVEN`.
- `MEDIA_LICENSE_MASTER_AUTH_PENDING`.
- `N8N_SERVICE_OAUTH_HUMAN_GATE`.

## Minimum human action

Regularize n8n and complete Meta OAuth in the official portals. After authentication, execute only a non-publishing negative canary missing `image_url` and with an invalid SHA-256; both must HOLD before any Meta request.

## Next action

Design a durable idempotency ledger and fail-closed preflight that proves `idempotency_key` is unused before publication and persists publication ID, permalink and execution ID after success. Do not import the workflow until that control and the media/license/master gates are objectively verified.

## Rollback

Revert, in reverse order, the audit commit, `8af83db011980855a2847569ac036da77aec5abd` and `6b55e248af2cb2a0af85ead232d738ba40d38cc6`. No external state requires rollback.
