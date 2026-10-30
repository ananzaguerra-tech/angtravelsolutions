# ANG SOCIAL — IDEMPOTENCY PREFLIGHT CONTRACT — C306 — 2026-10-30

Status: FAIL_CLOSED_PREFLIGHT_CONTRACT / DURABLE_LEDGER_NOT_IMPLEMENTED / IMPORT_INACTIVE / NO_PUBLISH

## Executed

The inactive social staging import now blocks before any Meta request unless the authenticated payload includes:

- non-empty `idempotency_key`;
- non-empty `idempotency_record_id`;
- `idempotency_persistence_verified=true`;
- `idempotency_state=UNUSED`.

Missing persistence proof returns `IDEMPOTENCY_PERSISTENCE_NOT_VERIFIED`. A used, missing or unknown state returns `IDEMPOTENCY_KEY_ALREADY_USED_OR_UNKNOWN`.

The governance policy now requires atomic post-success persistence of publication ID, permalink and execution ID. It explicitly states that the inactive import enforces only the preflight proof contract and does not claim that a durable ledger exists.

## Evidence

- Guard commit: `8be0294a72f2069e166f9bda75f1e7f3757c2a97`
- Guard blob: `d3e0884ef00837201ef8114f4de4f46d5e82f3ca`
- Policy commit: `681171c3b68cf6b87b97fda75d83a0640de758c0`
- Policy blob: `4f1823ecf79f3e8fb88a9634344baf093be89333`
- Validator commit: `585028e6936c622d5ac9eda23b12f8c55f04a34b`
- Validator blob: `74025c523f719d2a168a28c480c9f5298c10bcae`
- Static readback: 24/24 controls PASS.
- Gmail: zero received results in the partnership/n8n/WhatsApp query window.
- Drive: zero results for `ANG STATUS LIVE C305 C306`.
- Library master observed at version 16 before this checkpoint.

## Not executed

No ledger was created, no n8n workflow was imported or executed, no Meta request was made, and no post, deletion, WordPress or Google Business mutation occurred.

## Remaining blocks

- `DURABLE_IDEMPOTENCY_LEDGER_NOT_IMPLEMENTED`.
- `POST_SUCCESS_ATOMIC_LEDGER_WRITE_NOT_PROVEN`.
- `REMOTE_CI_RUN_NOT_PROVEN`: combined status and workflow runs returned zero records.
- `META_ORGANIC_AUTH_READBACK_MISSING`.
- `INCORRECT_POST_DELETE_NOT_PROVEN`.
- `MEDIA_LICENSE_MASTER_AUTH_PENDING`.
- `N8N_SERVICE_OAUTH_HUMAN_GATE`.

## Minimum human action

Regularize n8n and complete Meta OAuth only in the official portals. No publishing canary is authorized. After authentication, test a negative payload without persistence proof and require HOLD before any Meta request.

## Next action

Select and verify a durable ledger with atomic conditional create/update semantics. Implement lookup-before-publish and post-success persistence, then prove duplicate rejection under two concurrent requests. Keep the import inactive until this is objectively demonstrated.

## Rollback

Revert, in reverse order, the audit commit, `585028e6936c622d5ac9eda23b12f8c55f04a34b`, `681171c3b68cf6b87b97fda75d83a0640de758c0` and `8be0294a72f2069e166f9bda75f1e7f3757c2a97`. No external state requires rollback.
