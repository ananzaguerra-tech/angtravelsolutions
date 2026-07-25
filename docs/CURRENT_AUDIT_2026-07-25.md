# Current audit — 2026-07-25

## Verified

- Repository exists and is writable through the connected GitHub integration.
- `main`, `staging` and `development` branches exist.
- ANG Connect must remain untouched at `localhost:8088`.
- The public domain returned HTTP 503 during external validation on 2026-07-25.
- The latest available visual evidence showed a partially updated premium Home, but internal pages, menu contrast, logos, addresses and media remained incomplete.
- The repository initially contained only the project instruction file `READ ME`.

## Production blockers

1. Public site availability must be restored from HTTP 503.
2. WordPress inventory is still required: active theme, plugins, MU-plugins, page IDs, menus, cache and PHP errors.
3. No production deployment should run before a verified backup and staging check.
4. Social and Google Business integrations require existing OAuth sessions/tokens; credentials must never be committed.
5. Mass destination content needs staged publication with source tracking, deduplication and review.

## Approved design rules

- Premium editorial international layout.
- Full-screen luxury hero.
- Dark transparent horizontal header.
- Gold accents: `#b88936` and `#e0b85f`.
- Ink: `#070707`; cream: `#f7f1e7`; navy: `#080d3a`.
- ANG in Montserrat ExtraBold; supporting uppercase names in Montserrat SemiBold.
- Real, product-faithful imagery with recorded source and usage permission.

## Approved wording

### Espaços ANG Worldwide

Agentes afiliados e franqueados contam com acesso a espaços de coworking e salas de reunião em destinos internacionais, mediante reserva, disponibilidade.

## Next safe execution sequence

1. Restore availability and collect read-only WordPress inventory.
2. Generate verified backup.
3. Package one theme and one plugin only.
4. Import content in batches to staging.
5. Validate routes, media, menus, SEO, mobile and forms.
6. Promote to production after critical checks pass.
