# QA — Bloco Gigante 10 Países 05

- Data de auditoria: 2026-09-09
- Documento-fonte: [Drive — Bloco 05](https://docs.google.com/document/d/1or0v6P1QnZinrnnurPATb45tIFAMewG9JICXHKKpkoE/edit)
- Escopo exato: Eslovênia, República Tcheca, Hungria, Polônia, Dinamarca, Suécia, Noruega, Finlândia, Islândia e Irlanda.
- Estado: `REVIEW_REQUIRED / MEDIA_PENDING_LICENSE / UPLOAD_PENDING_CHANNEL`
- Regra: fail-closed; QA estrutural não autoriza publicação nem alteração de 881/WORLD.

## Resultado quantitativo

O documento contém 134 parágrafos e 14.942 caracteres. Foram avaliados 10 países × 16 eixos, totalizando 160 células:

- PASS estrutural: 120/160
- PARTIAL: 10/160
- GAP: 30/160
- Países em PASS integral: 0/10
- CTAs específicos: 10/10
- SEO/slug/schema: 10/10
- URLs oficiais diretamente registradas: 0
- `checked_at` datados: 0
- Mídias materializadas / SHA-256: 0/0

Legenda: P = PASS estrutural; △ = PARTIAL; — = GAP.

| País | Visão | Essenciais | Docs | Saúde | Sazon. | Destinos | Logística | Cultura | Gastro | Hotel | Exper. | Wellness/espec. | Compras/etiqueta | SEO/schema | CTA | Fonte |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Eslovênia | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |
| República Tcheca | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |
| Hungria | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |
| Polônia | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |
| Dinamarca | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |
| Suécia | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |
| Noruega | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |
| Finlândia | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |
| Islândia | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |
| Irlanda | P | P | — | — | P | P | P | P | P | P | P | P | — | P | P | △ |

## Achados

1. O bloco tem boa estrutura editorial país→destino e preserva exatamente dez países.
2. Dados essenciais, sazonalidade, logística, hotelaria/experiências, CTA e SEO estão presentes em 10/10.
3. As fontes são apenas nomes de portais/órgãos; não há URL direta, data de verificação nem mapeamento fato→fonte.
4. Documentação/consular, saúde/seguro/menores e compras/etiqueta não estão desenvolvidos por país.
5. A seção de mídia define intenção, mas não registra asset_id, origem, autor, licença, dimensões, hash, QA ou deduplicação.
6. Islândia possui alerta editorial correto sobre segurança/clima/geologia, porém sem URLs operacionais e `checked_at`.

## Ações corretivas

- Criar source registry por país com portal turístico, imigração/consular, saúde, aeroportos/transporte e fonte operacional quando aplicável.
- Registrar `checked_at` por fato dinâmico; abertura da fonte não equivale a validação universal.
- Parametrizar documentação por nacionalidade, trânsito, duração e finalidade.
- Completar saúde, seguro, menores, compras e etiqueta.
- Selecionar mídia real/licenciada; materializar somente após confirmação de licença; calcular SHA-256 e hash perceptual.
- Construir matriz destino→slug→post_id→external_id antes de qualquer payload.
- Manter `execute=false` e `UPLOAD_PENDING_CHANNEL` até staging autenticado, backup, dry-run, smoke e rollback.

## Gate de promoção

`BLOCKED_FOR_881_PAYLOAD` até que as 30 lacunas e 10 fontes parciais sejam fechadas. Nenhum item pode receber `PUBLISHED` sem URL/ID/permalink real.

## Rollback

Remover somente este arquivo de controle ou reverter seu commit. Nenhum conteúdo em produção, fila social, ficha GBP, post, `post_id` ou `external_id` foi alterado.
