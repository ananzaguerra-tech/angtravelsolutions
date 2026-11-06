# ANG Curadoria 881 — C348 Guiana Francesa

**checked_at:** 2026-11-06T13:05:36-03:00  
**baseline:** relatório mestre Library v59  
**estado:** HOLD (fail-closed)

## Executado

- Reconciliada a seção histórica 10 do Bloco 12 para Guiana Francesa.
- Consultadas as abas canônicas `Item Register` e `WP Export Identity 24-07` com quatro aliases: `Guiana Francesa`, `French Guiana`, `Guyane` e `GUF`.
- Resultado: **8 buscas, 0 correspondências canônicas**.
- Escopo histórico preservado: Cayenne, Kourou, Îles du Salut, Saint-Laurent-du-Maroni, Rémire-Montjoly e Kaw.
- Fonte turística territorial primária respondeu HTTP 403. Como paliativo seguro, o portal institucional France.fr confirmou Cayenne, Kourou, Îles du Salut, Saint-Laurent-du-Maroni e a floresta amazônica.
- Légifrance foi revalidado. O Arrêté du 31 juillet 2026 dispensa temporariamente de visto os brasileiros com passaporte comum para estadias na Guiana Francesa de até 30 dias em qualquer período de 180 dias; a regra vale por seis meses a partir de 31/07/2026 e exige nova conferência antes de cotação/publicação.
- WordPress público respondeu HTTP 502; `/area-restrita/` e leitura de páginas/posts permaneceram indisponíveis.
- Gmail de parcerias consultado: 0 novas respostas qualificáveis.
- Drive consultado por STATUS LIVE C348: 0 resultado.

## Gates

| Gate | Estado | Evidência |
|---|---|---|
| Identidade canônica 881 | HOLD | 8 buscas/0 matches |
| Turismo oficial territorial | DEGRADED | fonte primária HTTP 403; France.fr usado como fallback |
| Entrada para brasileiros | PASS_DATED | Légifrance, regra temporária, checked_at 2026-11-06 |
| Mídia real/licenciada | HOLD | 0/10 |
| SEO/schema/CTA | HOLD | identidade canônica ausente |
| Publicação WordPress | HOLD | HTTP 502; nenhum permalink/ID |
| Social/Google Business | HOLD | gates de mídia/master/copy/deduplicação incompletos |

## Resultado

Nenhuma publicação, alteração em produção ou declaração PUBLISHED/GO-LIVE foi realizada. O resultado de identidade permanece `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`, sem equivaler a deduplicação no CMS vivo.

## Evidência técnica

- Receipt C348: commit `353a89614f745931536e918a9c7dba2d717d1ace`
- Légifrance: https://www.legifrance.gouv.fr/loda/id/JORFTEXT000054594286/
- Turismo fallback: https://www.france.fr/fr/destination/guyane-amazonie/
- Rollback: reverter este arquivo e o receipt; nenhuma publicação/mutação externa requer rollback.
