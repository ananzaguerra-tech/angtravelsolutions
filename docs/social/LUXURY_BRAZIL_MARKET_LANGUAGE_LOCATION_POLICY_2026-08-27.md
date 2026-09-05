# ANG Luxury Brazil — market/language/location policy — 2026-08-27

## Regra operacional aprovada
Cada publicação da ANG Luxury Brazil deve usar o idioma do país/mercado onde a mídia é relevante. A marcação de localização deve apontar exclusivamente para a ficha Google correta e verificada da empresa/unidade elegível. Nunca usar geotag aproximada, endereço inferido ou ficha duplicada.

## Pipeline obrigatório
1. Definir mercado-alvo da peça.
2. Definir idioma principal desse mercado e adaptar copy/CTA de forma editorial, não tradução literal quando o contexto exigir.
3. Validar a ficha Google elegível e seu URL/Place ID antes de incluir localização.
4. Validar master da ANG Luxury Brazil: opção 30; `Brazil` com Z.
5. Usar mídia real/licenciada/adequada ao mercado.
6. Publicar somente via canal autenticado/API oficial.
7. Registrar permalink/post ID e, quando houver geotag, referência da ficha Google utilizada.

## Estados
- `READY_MARKET_COPY`: idioma/mercado definidos, ainda sem GBP validada.
- `READY_LOCATION`: GBP verificada e location resolvida.
- `READY_TO_DISPATCH`: branding + mídia + idioma + location + canal prontos.
- `PUBLISHED`: somente com ID/permalink real.

## Proibição
Não publicar uma peça internacional genérica em inglês automaticamente para todos os países. Inglês pode ser usado quando for o idioma editorial adequado ao mercado-alvo ou audiência internacional definida.
