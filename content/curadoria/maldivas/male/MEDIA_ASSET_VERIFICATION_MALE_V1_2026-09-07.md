# Verificação de ativos — Malé V1

- `checked_at`: 2026-09-07
- destino: Malé, Maldivas
- origem: Wikimedia Commons
- escopo: cinco originais licenciados do manifesto V1
- regra: nenhuma publicação, Canva ou WordPress nesta etapa

## Resultado de integridade

| Uso | Arquivo | Bytes | Dimensões/duração | SHA-1 informado | SHA-1 calculado | SHA-256 calculado | Integridade |
|---|---|---:|---|---|---|---|---|
| Hero | Malé Maldives (1).jpg | 5802599 | 4708×2301 | 5f8a71dc60fc5c95e27973b0e5329ce635604ede | 5f8a71dc60fc5c95e27973b0e5329ce635604ede | 2e1db2d1dffde5e4d1ff5752b33afac718339820ebadd3222a8458e4ccfebf80 | MATCH |
| Patrimônio | Male' Hukuru Miskiy 3.jpg | 5227969 | 4546×3386 | c8332b1ff54619f2928de166652961b481df218a | c8332b1ff54619f2928de166652961b481df218a | d7680540aed219554dd8a9139a795338070e0ef2d770e8fdee2bf814fa64419c | MATCH |
| Cultura | Fishmonger in Malé.jpg | 5025557 | 3379×2253 | fe2c3ce228cbac26008f1275886351ca1b413f81 | fe2c3ce228cbac26008f1275886351ca1b413f81 | d4ddddd9fdc7a2157147b222fab4b4e2bcb59d0c3fda734e796253669c9ae29c | MATCH |
| Logística | Villingili Ferry Terminal.jpg | 153283 | 1024×768 | 408563db738f9cfa15f6a08d2919284f6f55f9e7 | 408563db738f9cfa15f6a08d2919284f6f55f9e7 | 286aa5e36ecb871e7c2148a795c9044a5b0d0706f778643b681d6a4c9ad82323 | MATCH |
| Vídeo | Fish Market Tour - Maldives.webm | 15171371 | 1920×1080; 57,08 s; VP9 | ee8ecf5cc599ae0f92ebf068a1428483cce7219c | ee8ecf5cc599ae0f92ebf068a1428483cce7219c | bf4e3f1628170f7f0bc8f53c71e872de0b99f26e2f9215c3f359445b090cee11 | MATCH |

## QA visual

1. Hero aéreo — `VISUAL_QA_PASS`, `BRAND_FIT_PASS_EDITORIAL`. Vista urbana inequívoca de Malé, amplo contexto costeiro e espaço de corte horizontal. Há leve suavidade na imagem; não usar para ampliações extremas.
2. Hukuru Miskiy — `VISUAL_QA_PASS`, `BRAND_FIT_PASS_EDITORIAL`. Fachada e ornamentação legíveis, enquadramento documental adequado. Requer legenda patrimonial e atribuição.
3. Mercado de peixe — `VISUAL_QA_PASS_WITH_RESTRICTION`, `BRAND_FIT_HOLD_SENSITIVITY`. Conteúdo autêntico, mas exibe peixes abatidos e processamento; inadequado como hero ou social. Somente seção gastronômica com aviso/editorial aprovado.
4. Terminal de Villingili — `VISUAL_QA_PASS_INLINE_ONLY`, `BRAND_FIT_PASS_EDITORIAL`. Contexto de transporte reconhecível; resolução suficiente apenas para uso inline, não hero.
5. Vídeo Fish Market Tour — amostragem visual em 5 s, 28 s e 50 s; `VISUAL_QA_PASS_WITH_RESTRICTION`, `BRAND_FIT_HOLD_SENSITIVITY_AND_OVERLAYS`. Contém título sobreposto, preparação gráfica de peixe e chamada promocional de terceiro. Não usar em social ou hero; requer revisão editorial e eventual edição licenciada antes de incorporação.

## Status operacional

- `SHA256_PENDING_DOWNLOAD` → RESOLVIDO para 5/5.
- `PROVIDER_SHA1_MATCH` → 5/5.
- `VISUAL_QA` → concluído para 5/5; dois ativos permanecem em HOLD editorial.
- `READY_REVIEW` → 3/5 ativos estáticos (hero, patrimônio, logística), condicionados à atribuição e ao QA final de layout.
- `HOLD` → imagem de mercado e vídeo, por sensibilidade/overlays.
- `BINARY_UPLOAD_PENDING_CHANNEL` → 5/5.
- `PUBLISHED` → nenhum.
- `CANVA_DESIGN_ID` → inexistente; nenhum envio ao Canva.

## Fontes/licenças

Conferir o manifesto `content/curadoria/maldivas/male/MEDIA_MANIFEST_MALE_V1_2026-09-07.md` para página de origem, autor e licença individual. As licenças permanecem Creative Commons e exigem atribuição conforme indicado no arquivo-fonte.

## Próximo gate

Gerar crops derivados somente dos três ativos estáticos aprovados, preservar os originais imutáveis, registrar SHA-256 dos derivados e submeter o pacote a QA de layout. Os dois ativos em HOLD não devem seguir sem validação editorial explícita.
