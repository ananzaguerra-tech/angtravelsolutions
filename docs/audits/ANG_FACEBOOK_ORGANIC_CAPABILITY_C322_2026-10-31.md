# ANG — Auditoria da capacidade Facebook Organic — C322

**Data:** 2026-10-31 01:00 BRT  
**Política:** fail-closed, destino canônico e nenhuma afirmação de remoção sem readback.

## EXECUTADO

- Relatório Mestre lido e confirmado na Biblioteca como versão 33.
- Gmail verificado: nenhuma nova resposta positiva de Accor, Club Med ou Il Borro; somente a recusa TTW já registrada.
- Drive verificado: zero resultado para `ANG STATUS LIVE C322`.
- Inventário autenticado do Windsor confirmou duas contas Facebook Organic conectadas:
  - ANG TRAVEL, Page ID `353450855530042`;
  - ANG Travel Solutions, Page ID `1214700205067389`.
- As únicas ações disponíveis são `create_photo_post`, `create_post` e `upload_photo`.
- Não há ação de atualizar, excluir, ocultar ou despublicar post.
- A leitura filtrada dos posts incorretos foi tentada com campos `post_id`, mensagem, imagem, permalink, tipo e publicação.
- O provedor retornou apenas placeholders porque nove contas conectadas excedem o limite de uma conta do plano Free. Esses valores foram rejeitados como evidência.
- A governança do destino Facebook foi atualizada com a capacidade real e o gate humano.
- A ação `create_post` foi explicitamente classificada como proibida pela política ANG, embora exista no conector.

## EVIDÊNCIA / URL / ID / COMMIT

- Governança atualizada: `ops/social/ANG_FACEBOOK_DESTINATION_GOVERNANCE_2026-10-29.md`.
- Commit da governança: `b0c10efe6fdd7c97fe511407090254dd4cc6c202`.
- Página canônica: `353450855530042`.
- Página proibida: `1214700205067389`.
- Posts pendentes:
  - `1214700205067389_122123660331441523`;
  - `353450855530042_1651151673688735`.

## NÃO FEITO / MOTIVO

- Os dois posts não foram corrigidos nem removidos porque o conector não oferece update/delete/hide/unpublish.
- A existência ou remoção dos posts não foi afirmada: a leitura retornou placeholders, não dados reais.
- Nenhuma página foi desativada, excluída ou alterada.
- Nenhum post novo foi criado.
- Nenhuma publicação Instagram, GBP, WordPress ou execução n8n ocorreu.

## BLOQUEIO

- `FACEBOOK_ORGANIC_NO_UPDATE_DELETE_ACTION`.
- `WINDSOR_READS_PAUSED_ACCOUNT_LIMIT`.
- `INCORRECT_POSTS_HUMAN_OR_AUTHENTICATED_META_GATE`.
- `TEXT_ONLY_CREATE_POST_ACTION_FORBIDDEN_BY_ANG_POLICY`.

## SOLUÇÃO TENTADA

- Inventário de contas e ações do conector autenticado.
- Descoberta de campos oficiais do conector.
- Leitura filtrada dos dois Post IDs sem mutação.
- Atualização da governança para impedir interpretação indevida da capacidade `create_post`.

## AÇÃO HUMANA MÍNIMA

- No Meta Business Suite, abrir cada Post ID, remover ou corrigir com mídia real/licenciada e registrar screenshot/URL após a ação; nunca alterar ou excluir a página ANG TRAVEL.
- Alternativamente, conectar uma integração que ofereça update/delete e readback autenticado para esses Post IDs.
- Não desconectar contas apenas para contornar o limite do plano sem decisão explícita da proprietária.

## PRÓXIMA AÇÃO

- Verificar novamente o estado dos dois posts quando houver acesso de leitura real ou evidência do Meta Business Suite.
- Manter toda publicação bloqueada até os gates de mídia, master, deduplicação, copy e destino canônico.

## ROLLBACK

- Reverter apenas o commit de documentação `b0c10efe6fdd7c97fe511407090254dd4cc6c202`.
- Nenhuma mutação externa de página ou post precisa de rollback.
