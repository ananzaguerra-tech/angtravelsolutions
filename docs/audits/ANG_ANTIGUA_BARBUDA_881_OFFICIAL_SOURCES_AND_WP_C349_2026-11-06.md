# ANG Curadoria 881 — C349 Antígua e Barbuda

**checked_at:** 2026-11-06T14:06:16-03:00  
**baseline:** relatório mestre Library v60  
**estado:** HOLD (fail-closed)

## Executado

- Confirmada a conclusão de reconciliação dos dez itens do Bloco 13; avanço sem reinício para o Bloco 11.
- Reconciliada a seção histórica 01 do Bloco 11 para Antígua e Barbuda.
- Consultadas as abas `Item Register` e `WP Export Identity 24-07` com quatro aliases: `Antígua e Barbuda`, `Antigua and Barbuda`, `Antigua & Barbuda` e `ATG`.
- Resultado: **8 buscas, 0 correspondências canônicas**.
- Fonte oficial de turismo acessível e atual, confirmando o destino de duas ilhas, St. John's, English Harbour, praias, cultura e vela.
- Department of Immigration acessível. Brasil consta na lista oficial de países cujos nacionais não necessitam de visto. O dado recebeu `PASS_DATED` e deve ser revalidado antes da viagem; admissão continua condicionada a documentação e decisão migratória.
- WordPress público respondeu HTTP 502; `/area-restrita/` e leitura de páginas/posts permaneceram indisponíveis.
- Gmail de parcerias consultado: 0 novas respostas qualificáveis.
- Drive consultado por STATUS LIVE C349: 0 resultado.

## Gates

| Gate | Estado | Evidência |
|---|---|---|
| Identidade canônica 881 | HOLD | 8 buscas/0 matches |
| Turismo oficial | PASS_DATED | portal oficial acessível |
| Entrada para brasileiros | PASS_DATED | Brasil na lista oficial de isenção de visto |
| Mídia real/licenciada | HOLD | 0/10 |
| SEO/schema/CTA | HOLD | identidade canônica ausente |
| Publicação WordPress | HOLD | HTTP 502; nenhum permalink/ID |
| Social/Google Business | HOLD | mídia/master/copy/deduplicação incompletos |

## Resultado

Nenhuma publicação, alteração em produção ou declaração PUBLISHED/GO-LIVE foi realizada. O resultado de identidade permanece `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`, sem equivaler a deduplicação no CMS vivo.

## Evidência técnica

- Receipt C349: commit `b825605d12815e4c1e4e24993417c1ef368ac905`
- Turismo: https://www.visitantiguabarbuda.com/
- Imigração: https://immigration.gov.ag/visa-services/countries-exempt-from-visa/
- Rollback: reverter este arquivo e o receipt; nenhuma publicação/mutação externa requer rollback.
