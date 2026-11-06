# ANG Curadoria 881 — C347 Saint-Barthélemy

**checked_at:** 2026-11-06T12:04:16-03:00  
**baseline:** relatório mestre Library v58  
**estado:** HOLD (fail-closed)

## Executado

- Reconciliada a seção histórica 09 do Bloco 12 para Saint-Barthélemy.
- Consultadas as duas abas canônicas (`Item Register` e `WP Export Identity 24-07`) com quatro aliases: `Saint-Barthélemy`, `Saint Barthelemy`, `St. Barth` e `SBH`.
- Resultado: **8 buscas, 0 correspondências canônicas**.
- Destinos históricos preservados para futura curadoria: Gustavia, St. Jean/Saint-Jean, Colombier, Grand Cul-de-Sac, Saline/Grande Saline e Lorient.
- Fonte oficial de turismo acessível: https://www.saintbarth-tourisme.com/
- Portal geral oficial France-Visas acessível: https://france-visas.gouv.fr/en/web/france-visas/
- WordPress público e área restrita testados; origem respondeu HTTP 502.
- Gmail de parcerias consultado no ciclo: 0 novas respostas qualificáveis.
- Drive consultado por STATUS LIVE C347: 0 resultado.

## Gates

| Gate | Estado | Evidência |
|---|---|---|
| Identidade canônica 881 | HOLD | 8 buscas/0 matches |
| Turismo oficial | REACHABLE | portal oficial acessível |
| Entrada para nacionalidade brasileira | HOLD | portal geral acessível; fluxo específico por nacionalidade não concluído |
| Mídia real/licenciada | HOLD | 0/10 |
| SEO/schema/CTA | HOLD | identidade canônica ausente |
| Publicação WordPress | HOLD | HTTP 502; nenhum permalink/ID |
| Social/Google Business | HOLD | gates de mídia/master/copy/deduplicação não completos |

## Resultado

Nenhuma publicação, alteração em produção ou declaração PASS/PUBLISHED/GO-LIVE foi realizada. Saint-Barthélemy permanece distinto de Saint-Martin e Sint Maarten.

## Evidência técnica

- Receipt C347: commit `7718543887ab0c49406c00ccffe5fcef7ee5ca06`
- Rollback: reverter este arquivo e o receipt acima; nenhuma mutação externa/publicação requer rollback.
