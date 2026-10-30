# ANG Social Executor — Facebook Destination Guard — C300 — 2026-10-29

Status: `STAGING_IMPORT_CANDIDATE_INACTIVE / NO_PUBLISH`

## Finding
The fail-closed n8n import selected a Meta Page by payload name and fell back to `pages[0]`. Neither the canonical Page ID `353450855530042` nor the forbidden Page ID `1214700205067389` was enforced. Because the selected Facebook Page supplies the Instagram Business account and access token, the fallback could target the wrong ANG asset.

The older import lacked the C296 publication gates and remained an unsafe import candidate even though `active=false`.

## Corrective action
- Fail-closed import now requires payload field `facebook_page_id`.
- Only Page ID `353450855530042` passes.
- Page ID `1214700205067389`, a missing ID, any other ID and a missing canonical page all stop execution.
- Name matching and `pages[0]` fallback were removed.
- The legacy import was renamed `QUARANTINED — NEVER IMPORT`, kept inactive and its page-selection node now stops with `HOLD_SUPERSEDED_EXECUTOR_NEVER_IMPORT`.
- No workflow was imported, activated or executed.

## Verification
- Both files parse as valid JSON after update.
- Fail-closed import: `active=false`; canonical ID present; forbidden ID present; `pages[0]` absent; `facebook_page_id` required; canonical-page gate present.
- Legacy import: `active=false`; name contains `QUARANTINED — NEVER IMPORT`; selection stops explicitly; `pages[0]` absent.

## Evidence
- Fail-closed import: `docs/integrations/ZEUS_SOCIAL_EXECUTOR_GITHUB_AUTH_V5_FAIL_CLOSED_IMPORT.json`
- Commit: `fe40639e63697dafe1c61a69e6d63ae69b13972a`
- Content SHA: `73c5b8a3506a26f53a455ae65d1cb7e4cf982b12`
- Legacy import: `docs/integrations/ZEUS_SOCIAL_EXECUTOR_GITHUB_AUTH_V5_IMPORT.json`
- Commit: `90b3fd9df381f976bd6f860a500e544c6be50040`
- Content SHA: `09783c765efe7e266e4792a3dce668a49b451278`

## Publication controls
No text-only post, real-media claim, license, logo master, duplicate pass, copy pass, publication ID or execution ID was created. `CURADORIA_ANG_AGOSTO` remains quarantined. Facebook publishing is not implemented or authorized by this checkpoint.

## Blockers
- `META_ORGANIC_AUTH_READBACK_MISSING`
- `INCORRECT_POST_DELETE_NOT_PROVEN`
- `MEDIA_LICENSE_MASTER_AUTH_PENDING`
- `N8N_SERVICE_OAUTH_HUMAN_GATE`

## Next action
After n8n regularization and OAuth, import only the fail-closed candidate in staging, keep it inactive, run `status/auth`, then test a rejected non-canonical Page ID before any allowed canary. A canary remains prohibited until all media, master, dedupe and copy gates pass.

## Rollback
Revert commits `90b3fd9df381f976bd6f860a500e544c6be50040` and `fe40639e63697dafe1c61a69e6d63ae69b13972a`. No external Meta/n8n state changed.
