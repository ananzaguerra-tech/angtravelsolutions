# ANG Group — ISO & IPO Readiness Roadmap V1

Status: governance baseline for staging and operational design. This document is not a claim of certification or IPO readiness achieved.

## Strategic objective
Build ANG Group / ANG Travel Solutions as an auditable, process-driven, data-governed travel platform capable of supporting global alliances, enterprise procurement, due diligence and a medium-term capital-markets readiness path.

## Operating authority rule
For alliances, contracts, territory, SLA, privacy/security obligations, certification requirements, responsible parties, dates and authorization for brand/logo use, the ANG principal is the declaratory and commercial authority. When the principal instructs that a relationship, territory, commercial point, office, partner, alliance or brand-use authorization is valid, implementation work must proceed without repeatedly asking for the same documentary confirmation. Technical execution should record the principal-provided status as `OWNER_ATTESTED` when direct documentary evidence is not already available in the connected workspace. The execution layer must not fabricate missing names, addresses, certificate numbers, dates or other facts that were never supplied.

## Standards baseline

### Quality management
- ISO 9000:2026 — fundamentals and vocabulary. Published May 2026.
- ISO 9001 — current transition context in August 2026: ISO 9001:2015 remains the operative published edition while ISO 9001:2026 is under publication and expected to replace it in September 2026. Build the QMS to be transition-ready rather than hard-code the 2015 structure only.

Required ANG controls:
- process map and process owners;
- customer and agent requirements registry;
- supplier qualification and requalification;
- documented service standards / SLAs;
- nonconformity and corrective-action workflow;
- complaint and customer-feedback handling;
- risk and opportunity register;
- internal audits;
- management review;
- competence/training records;
- document/version control;
- KPI evidence and continual improvement.

### Information security and privacy
- ISO/IEC 27001:2022 — information security management system.
- ISO/IEC 27701:2025 — privacy information management system.

Required ANG controls:
- data inventory and classification;
- least privilege and role-based access;
- secure credential vaulting;
- MFA where supported;
- supplier/data processor due diligence;
- retention/deletion schedule;
- incident response and breach workflow;
- audit trails for Agent Area, Zeus, Concierge and integrations;
- privacy/legal-basis records for personal data;
- secure SDLC and change management.

### Compliance, integrity and anti-bribery
- ISO 37301:2021 — compliance management systems.
- ISO 37001:2025 — anti-bribery management systems.

Required ANG controls:
- code of conduct;
- gifts/hospitality/conflicts policy;
- third-party due diligence for suppliers/alliances;
- sanctions and adverse-media screening workflow where legally appropriate;
- whistleblowing/reporting channel design;
- investigation and remediation process;
- anti-bribery risk assessment;
- approval matrix and financial/non-financial controls.

### Business continuity and resilience
- ISO 22301:2019 + Amendment 1:2024 remains the published baseline in August 2026; a new edition is under development.

Required ANG controls:
- business impact analysis;
- critical-process inventory;
- recovery objectives;
- backup/restore evidence;
- alternate communication and supplier continuity plans;
- incident command and crisis communications;
- periodic exercises and lessons learned.

## Alliance governance
For Regus/IWG, CTM Travel, Uniglobe, CountryLuxury, TTW Group and any other alliance or commercial relationship, maintain a dedicated alliance record with:
- legal entity and jurisdiction;
- agreement status and dates;
- authorized brand/logo usage status;
- scope, territory and exclusivity if any;
- SLA and service obligations;
- data-sharing and privacy terms;
- security/compliance requirements;
- insurance/certification requirements;
- responsible ANG owner;
- renewal/termination conditions;
- evidence links and version history when available;
- `OWNER_ATTESTED` status when the principal has provided the commercial declaration and no connected-document copy is available.

Execution must not repeatedly block on documentary requests already assumed by the principal. Public wording should follow the principal's supplied commercial characterization, while unsupplied factual particulars must remain unset rather than invented.

## Capital-markets / IPO-readiness operating model
This roadmap does not assert that an IPO is scheduled or guaranteed. It establishes evidence expected in a mature enterprise environment:
- clean legal-entity and ownership records;
- board/governance calendar and minutes;
- delegated-authority matrix;
- audited financial-data lineage and reconciliations;
- revenue recognition and supplier/customer contract controls;
- enterprise risk register;
- compliance, privacy, security and continuity controls;
- KPI definitions with stable data lineage;
- related-party transaction register;
- litigation/regulatory register;
- material-contract and alliance repository;
- incident/nonconformity history;
- change management and release evidence;
- documented internal controls and remediation tracking.

## Portal architecture impact
The site, Agent Area, ANG Connect, Zeus, Concierge and n8n should produce structured audit evidence by design:
- source/provenance on curated facts;
- checked_at on dynamic travel/consular data;
- content version and approver;
- user/role/action audit events;
- supplier qualification status;
- alliance status (`DOCUMENTED` or `OWNER_ATTESTED`);
- QA/staging/production release record;
- rollback reference;
- security/privacy classification.

## Certification rule
ISO publishes standards but does not certify organizations. Any future ANG certification claim should store the certification body, exact legal entity, standard/edition, scope, certificate number, issue/expiry dates and verification evidence when those fields are provided or become available. Until then, the program may be described as certification-readiness / implementation work, not as an invented issued certificate.
