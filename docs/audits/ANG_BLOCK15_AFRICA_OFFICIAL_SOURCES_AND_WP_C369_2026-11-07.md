# ANG Curadoria — C369 — Bloco 15 África

Data de checagem: 2026-11-07

## Resultado verificável

- Documento Drive nativo: `1oguzaCSRAjHA9kYBnvfadnTpSrXiOmM2PPfwVGXYGxY`.
- Readback: 10 unidades, 160 eixos; revisão `AHj4eMRLUGt2STXOBEnevdqSEniIkPcSPtzGw6vv497453rS56Km5Xgfn20MZ21hZZa0DdVT6z-agDEedw06Ouj1xMrOOGY94sMdtrS5ww`.
- Dedupe offline: 60 consultas, 0 matches, 0 unknowns nas abas `Item Register` e `WP Export Identity 24-07`.
- Estado: `EDITORIAL_READY_REVIEW / CMS_NOT_VERIFIED / MEDIA_PENDING`.

## Fontes oficiais e classificação

| Unidade | Fonte principal | Classificação documental |
|---|---|---|
| Argélia | `mfa.gov.dz/services-for-foreigners/entry-visa-to-algeria` | Visto para passaporte brasileiro comum; `PASS_DATED_RECHECK` |
| Tunísia | acordo Brasil–Tunísia publicado pelo MRE | Isenção turismo/negócios até 90 dias, teto anual informado; `PASS_DATED_RECHECK` |
| Líbia | `evisa.gov.ly` | `HOLD_HIGH_RISK_SOURCE_DEGRADED`; nenhuma oferta |
| Etiópia | `evisa.gov.et/information/tourist` | eVisa turístico aberto a todas as nacionalidades; taxas em HOLD |
| Uganda | `immigration.go.ug` | eVisa; Brasil fora da lista de isentos; aviso de 02/10/2026 removeu certificado de febre amarela como requisito de entrada |
| Ruanda | `migration.gov.rw/visa/visitors-visa` | Visto na chegada disponível a todas as nacionalidades; recheck obrigatório |
| Gana | `gis.gov.gh` e `evisa.gov.gh` | Passaporte comum brasileiro não coberto pela isenção diplomática/serviço; eVisa |
| Senegal | `diplomatie.gouv.sn/services/visa-dentree-au-senegal` | Brasil isento para estadia inferior a 3 meses |
| Costa do Marfim | `diplomatie.gouv.ci` e `snedai.com/e-visa` | `HOLD_SOURCE_CONFLICT`; requer confirmação consular escrita |
| Cabo Verde | `gov.cv` e `ease.gov.cv` | Brasil isento por até 30 dias; EASE obrigatório e TSA quando aplicável |

## WordPress/site P0

- Conector informou site ativo, mas listagem de páginas e posts falhou com `No such host is known`.
- Prova pública em 2026-11-07: homepage retornou HTTP 502; `/area-restrita/` não ficou acessível no coletor.
- Não foi possível executar backup, staging, normalização de CTA, teste RBAC ou cotação ponta a ponta.
- `P0=FAIL_CLOSED`, `Console=NOT_PASS`, `PUBLISHED=false`.

## Gates de mídia e marca

`REAL_MEDIA_VERIFIED`, `MASTER_LOGO_VERIFIED`, `NO_DUPLICATE_PASS` e `COPY_QA_PASS` não estão todos satisfeitos. Todos os campos `media_id/source/license_or_permission/brand_master_id/visual_hash` permanecem nulos. Nenhuma peça foi criada ou publicada.

## Rollback

Não houve mutação em WordPress, Meta, Google Business ou n8n. Rollback operacional não se aplica; o documento Drive pode ser arquivado e os dois arquivos GitHub revertidos por commit se necessário.
