# RELEASE HOLD — version drift

Date: 2026-08-14  
State: **PROTOTYPE_DO_NOT_DEPLOY**

## Authoritative inventory

| Component | GitHub prototype | Production inventory | Decision |
|---|---:|---:|---|
| ANG Enterprise Suite | 0.3.0 | 2.14.1 | Never install over production |
| ANG Travel Solutions theme | not present in this build | 1.8.4 | Obtain active snapshot before reconciliation |

The code currently stored in this repository is a prototype and validation scaffold. It is not a production release source.

## Mandatory controls

1. Keep the public site in maintenance.
2. Do not install any repository ZIP on the public WordPress.
3. Obtain read-only snapshots of active plugin 2.14.1 and theme 1.8.4.
4. Create a reconciliation branch from the newest active source.
5. Port only reviewed, intentional changes.
6. Validate on isolated staging with PHP 8.1+, WordPress tests, backup restoration and rollback.
7. Require explicit owner authorization before any production promotion.

## Preserved systems

- ANG Connect at `http://localhost:8088`.
- Existing containers, volumes and database.
- WordPress production content and credentials.
- `main` branch.

The packaging workflow is manual-only and labels all artifacts `PROTOTYPE-DO-NOT-DEPLOY`.
