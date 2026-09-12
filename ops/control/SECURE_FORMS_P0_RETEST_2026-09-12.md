# Secure Forms P0 Retest — 2026-09-12

Production target: `https://angtravelsolutions.com.br/fale-conosco/`

## Current evidence

| Test | Expected | Observed | Gate |
|---|---|---|---|
| Invalid email | ERROR | `?ang_form_status=error#ang-form` | PASS |
| Valid email without consent | ERROR | `?ang_form_status=error#ang-form` | PASS |
| Honeypot `ang_website` filled | ERROR / reject | `?ang_form_status=success#ang-form` | **FAIL** |

All three requests returned HTTP 200 after redirect. The problem is now isolated to server-side honeypot/antispam enforcement; email and consent validation are functioning in production.

## Launch gate

`SECURE_FORMS_P0=FAIL_HONEYPOT`

Do not mark total go-live PASS until a honeypot-filled request is rejected and a valid request still succeeds.

## Corrective action already prepared

A theme-draft validation patch was prepared earlier to reject non-empty `ang_website`, validate email/consent, and enforce timing. It has not been promoted to production. WPVibe reached its daily plan limit, so production mutation through that route is unavailable today.

## Safe alternate route assessment

Repository `ang-enterprise-suite` exposes the Curadoria importer only via authenticated `admin-post` + `manage_options` + nonce; WordPress core REST credentials stored in GitHub Actions secrets do not provide a code/plugin-edit endpoint. Do not bypass authentication or elevate permissions.
