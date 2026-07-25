# ANG Travel Solutions

Production repository for the ANG Travel Solutions public WordPress site and its curated-content import pipeline.

## Non-negotiable preservation

- Preserve ANG Connect at `http://localhost:8088`.
- Do not stop or delete its containers, volumes, database, routes, dashboard or console.
- Public WordPress and ANG Connect are parallel products.
- No production overwrite before backup and staging validation.

## Approved public architecture

Home; Quem Somos; Serviços & Outsourcing; Luxury Brazil; Conteúdo Global; Sustentabilidade; Seja Cliente; Blog & Tendências; Fale Conosco; Idioma; Área Restrita.

## Working branches

- `main`: production-approved code only
- `staging`: release validation
- `development`: active construction

## Content pipeline

Content is organized as Country → City → attractions, museums, parks, restaurants, practical information, premium experiences and source metadata. Importers must support CSV, JSON and WordPress WXR/XML, duplicate protection, rollback and audit logs.
