# ANG Google Business — Fail-Closed Governance

**Effective:** 2026-10-31  
**Scope:** Google Business Profile actions through connected tools, APIs and workflows.

## Canonical connected locations

- Campinas — `locations/13216142187597837770` — connector label `ANG TRAVEL SOLUTIONS | Campinas`.
- Americana — `locations/9303824683971440569` — connector label `ANG TRAVEL | AGÊNCIA DE VIAGENS, TURISMO, EVENTOS & OUTSOURCING`.

Connection is not proof of verification, OPEN state, public address, eligibility, ownership or a valid Maps URL. Those fields must be read back from Google before any write.

## Absolute controls

1. Never delete, deactivate or duplicate a profile.
2. Never set `CLOSED_TEMPORARILY` automatically.
3. Never change or hide an address, service area, primary category or map pin without explicit owner approval and a complete pre-change backup.
4. Never claim verification or OPEN state from connector presence alone.
5. Never publish a text-only or link-only local post. Although `create_local_post.photo_url` is optional in the connector schema, it is mandatory under ANG policy.
6. Post media must be real and licensed, with `media_id`, source, permission/license, `brand_master_id`, `theme_key`, cryptographic hash and deduplication evidence.
7. Require `REAL_MEDIA_VERIFIED`, `MASTER_LOGO_VERIFIED`, `NO_DUPLICATE_PASS` and `COPY_QA_PASS`.
8. Record Location ID, post resource ID and readback URL only after confirmed success.
9. If Google requests verification or re-verification, preserve the listing and record the minimum human action; do not work around the gate.
10. Address and service-area actions that can trigger re-verification remain HOLD even when the connector accepts `acknowledge_reverification_risk`.

## Connector capability audit — C323

The connected Windsor Google My Business connector exposes create/update local post, review reply, media upload, location details, services, categories, service area, attributes, address, hours and open-status actions. Some schemas replace full lists, some can trigger re-verification, and `set_open_status` can mark a profile temporarily closed.

A live read of title, open status, Maps URI, Place ID, locality, address and verification state was attempted on 2026-10-31. Windsor returned placeholder strings because nine connected accounts exceed the Free plan allowance of one. Placeholder values are invalid evidence.

Therefore both locations remain `CONNECTED_ID_CONFIRMED / VERIFICATION_AND_OPEN_STATE_UNPROVEN / NO_WRITE`. No GBP action is authorized until Google returns real current values and the intended write passes this policy.

## Rollback

This file changes no Google profile. Revert the documentation commit if the governance text itself must be rolled back.
