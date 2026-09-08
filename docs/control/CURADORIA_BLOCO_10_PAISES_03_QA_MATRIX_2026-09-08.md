# Curadoria — Matriz de QA do Bloco Gigante 10 Países 03

**Data do QA:** 2026-09-08  
**Fonte canônica:** Google Drive `1apuJxa8HVC9Qp1QdpdfJJzISuJUYJ6a2Uh28e_V-KN8`  
**Revisão auditada:** `ANLCKQl5H8RdtCXAnZrGiuxygBP-RotOpE5pA_Ob_0sG-woJ-9WZV3aDwhpLZdcuIXIj8pNqGFAE9egXTP51LxsWafE0u1JZq0JpdkXXgg`  
**Branch:** `staging`  
**Estado:** `REVIEW_REQUIRED / MEDIA_PENDING / UPLOAD_PENDING_CHANNEL`

## Escopo fechado

O pacote contém exatamente 10 países: Sri Lanka, Seychelles, Maurício, Marrocos, Egito, Quênia, Tanzânia, Namíbia, Botswana e Argentina.

Foram auditados **136 parágrafos**, **12.954 caracteres** e **10/10 cabeçalhos canônicos**. A checagem é estrutural e fail-closed; não equivale a aprovação factual, consular, comercial, de mídia ou de publicação.

## Critério

Foram avaliados 16 eixos: visão/posicionamento; dados essenciais; documentação; saúde/seguro/menores; sazonalidade; destinos/cidades; logística; cultura/atrações; gastronomia; hotelaria; experiências; wellness/especialidades; compras/etiqueta; SEO/schema; CTA; fonte oficial.

Uma menção textual conta apenas como presença estrutural. Todos os países permanecem `REVIEW_REQUIRED` porque não há URL oficial diretamente rastreável nem `checked_at=AAAA-MM-DD` dentro dos segmentos.

## Resultado por país

| País | Parágrafos | Caracteres | Eixos presentes | Lacunas estruturais | URLs oficiais diretas | checked_at datado | Gate |
|---|---:|---:|---:|---|---:|---|---|
| SRI LANKA | 11 | 1.318 | 15/16 | compras/etiqueta | 0 | NÃO | REVIEW_REQUIRED |
| SEYCHELLES | 11 | 1.130 | 12/16 | saúde/seguro/menores; cultura/atrações; gastronomia; compras/etiqueta | 0 | NÃO | REVIEW_REQUIRED |
| MAURÍCIO | 11 | 1.025 | 15/16 | cultura/atrações | 0 | NÃO | REVIEW_REQUIRED |
| MARROCOS | 11 | 1.081 | 14/16 | saúde/seguro/menores; wellness/especialidades | 0 | NÃO | REVIEW_REQUIRED |
| EGITO | 11 | 1.142 | 12/16 | saúde/seguro/menores; gastronomia; hotelaria; compras/etiqueta | 0 | NÃO | REVIEW_REQUIRED |
| QUÊNIA | 11 | 975 | 13/16 | saúde/seguro/menores; gastronomia; compras/etiqueta | 0 | NÃO | REVIEW_REQUIRED |
| TANZÂNIA | 11 | 1.040 | 14/16 | gastronomia; compras/etiqueta | 0 | NÃO | REVIEW_REQUIRED |
| NAMÍBIA | 11 | 1.032 | 12/16 | saúde/seguro/menores; gastronomia; wellness/especialidades; compras/etiqueta | 0 | NÃO | REVIEW_REQUIRED |
| BOTSWANA | 11 | 1.023 | 13/16 | gastronomia; wellness/especialidades; compras/etiqueta | 0 | NÃO | REVIEW_REQUIRED |
| ARGENTINA | 11 | 1.173 | 14/16 | saúde/seguro/menores; cultura/atrações | 0 | NÃO | REVIEW_REQUIRED |

## Rastreabilidade de fontes

- URLs encontradas dentro dos dez segmentos: **0**.
- `checked_at` datado dentro dos dez segmentos: **0/10**.
- O rótulo “Fontes-base” lista entidades, mas não fornece URL, página específica, data de verificação ou evidência suficiente para fechar QA factual.
- Dados dinâmicos — imigração, saúde, segurança, horários, transporte, tarifas, operadores e clima operacional — continuam fail-closed.

## Mídia e deduplicação

O manifesto global define campos obrigatórios, mas os ativos ainda não estão materializados país a país. Permanecem pendentes origem direta, autor, licença, dimensões, SHA-256 local, perceptual hash, QA geográfico, currentness e brand fit. Nenhum ativo está liberado para Canva, WordPress ou social.

## Gates operacionais

- `CMS_MUTATION_EXECUTED=false`
- `SOCIAL_PUBLICATION_EXECUTED=false`
- `UPLOAD_PENDING_CHANNEL`
- Preservar `post_id`, `external_id`, 881/WORLD e todos os drafts.
- Gerar payload JSON/CSV somente após fontes oficiais rastreáveis, `checked_at`, mídia licenciada e QA.
- Antes de qualquer carga: backup, staging autenticado, dry-run, smoke test e rollback comprovado.

## Próxima ação corretiva

1. Inserir URL oficial específica e `checked_at` em 10/10 países.
2. Completar as lacunas estruturais indicadas na tabela.
3. Materializar e deduplicar mídia licenciada com SHA-256.
4. Reexecutar QA e criar a matriz destino/cidade → slug → `external_id`.
5. Manter WordPress e social sem publicação até todos os gates passarem.

## Rollback

Reverter o commit que introduz este arquivo. Nenhum conteúdo-fonte, draft, ID canônico, CMS ou canal social foi alterado por esta auditoria.
