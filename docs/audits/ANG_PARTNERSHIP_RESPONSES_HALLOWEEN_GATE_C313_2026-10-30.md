# ANG — Partnership responses and Halloween social gate — C313

**Checked at:** 2026-10-30 16:02 BRT  
**Mode:** fail-closed / no publication

## EXECUTADO

### Parcerias

- **Accor Luxury & Lifestyle:** resposta positiva localizada e lida. A diretora comercial declarou interesse em conhecer o ANG Group e avaliar oportunidades de colaboração.
- A Accor solicitou quatro informações antes de avançar: e-mail corporativo/profissional, site institucional, código IATA ou identificador reconhecido e eventual participação em consórcio/rede/associação/programa de luxo.
- A conexão comercial inclui Luxury & Lifestyle South America e Grupos/Eventos do Fairmont Rio.
- Correção factual recebida: **Pipa não integra mais o portfólio Accor**. O cluster mencionado no Brasil inclui Sofitel Rio de Janeiro Ipanema, Fairmont Rio e Santa Teresa MGallery.
- O programa HERA foi indicado para cadastro com identificador de agência.
- **TTW Group:** resposta recebida em 2026-10-30 classificando a proposta como não necessária neste momento. Status: `DECLINED_CURRENTLY`; nenhuma alegação de parceria é permitida.
- **Club Med e Il Borro:** follow-ups já haviam sido enviados neste ciclo operacional; nenhuma resposta recebida até esta verificação.
- A resposta positiva da Accor **não autoriza co-marketing, logos, mídia, benefícios ou publicação institucional**. Status: `POSITIVE_INTEREST / INFO_REQUESTED / NO_COMARKETING_AUTH`.

### Ativo Halloween

- Arquivo auditado: `Post de Halloween da ANGTRAVEL (1).png`.
- Library ID: `libfile_b4b97423a5908191ad77fb34931ed2bf`.
- MIME/dimensões: `image/png`, 1080×1350, RGBA.
- SHA-256 / visual hash determinístico: `e86cee63c70c8b28dfb5d54dbf93c815e27e6e9ced288a9e1a93fc7d70c0b4ac`.
- Proveniência do contêiner: upload do usuário (`model_generated=false`).
- O visual contém a oferta **“10% OFF”** e a frase temporal **“No primeiro dia de Esquenta Black Friday”**, sem fonte de preço/desconto, regras, elegibilidade ou vigência comprovadas.
- Não foi localizado `brand_master_id` inequívoco para o logo incorporado nem licença/permissão rastreável da fotografia-base da abóbora.
- `REAL_MEDIA_VERIFIED=HOLD`; `MASTER_LOGO_VERIFIED=HOLD`; `NO_DUPLICATE_PASS=NOT_PROVEN`; `COPY_QA_PASS=FAIL_UNVERIFIED_OFFER_AND_DATE`; `READY_REVIEW=NO`; `PUBLISHED=NO`.

## EVIDÊNCIA / URL / ID / COMMIT

- Evidência privada das respostas preservada no Gmail; nenhum conteúdo privado ou endereço foi copiado ao repositório.
- Google Drive: nenhuma nova folha `STATUS LIVE` C311–C313 localizada.
- Relatório Mestre vigente antes deste checkpoint: Library version 24.
- Hash do ativo Halloween: `e86cee63c70c8b28dfb5d54dbf93c815e27e6e9ced288a9e1a93fc7d70c0b4ac`.

## NÃO FEITO / MOTIVO

- Nenhuma resposta foi enviada à Accor porque os quatro dados solicitados não estão todos comprovados no Relatório Mestre; não foi inferido IATA, e-mail corporativo, site ou afiliação.
- Nenhum artigo/post institucional Accor foi preparado ou publicado: não existe autorização pública inequívoca de co-marketing nem mídia/logos autorizados.
- Nenhuma publicação do Halloween foi executada: oferta e vigência não comprovadas, master sem ID, licença da imagem-base ausente e deduplicação não concluída.
- Nenhuma publicação, exclusão Meta, chamada n8n, alteração WordPress ou Google Business ocorreu neste checkpoint.

## BLOQUEIO

- `ACCOR_INFO_REQUEST_HUMAN_FACTS_REQUIRED`.
- `NO_COMARKETING_AUTH`.
- `HALLOWEEN_UNVERIFIED_DISCOUNT_AND_VALIDITY`.
- `HALLOWEEN_MEDIA_LICENSE_UNKNOWN`.
- `HALLOWEEN_MASTER_LOGO_ID_UNKNOWN`.
- `HALLOWEEN_NO_DUPLICATE_NOT_PROVEN`.
- `HOLD_SERVER_SIDE_LEDGER_AND_AUTH_NOT_WIRED`.

## SOLUÇÃO TENTADA

- Busca no Relatório Mestre por IATA, e-mail corporativo e domínio institucional: nenhum valor canônico comprovado.
- Busca no Drive por STATUS LIVE e master oficial ANG Travel: nenhum novo STATUS LIVE e nenhum master inequívoco vinculado ao PNG.
- Verificação técnica local do PNG, leitura visual, dimensões e hash.
- Reconciliação integral das mensagens Accor e TTW, sem extrapolar autorização comercial.

## AÇÃO HUMANA MÍNIMA

- Informar os quatro dados pedidos pela Accor: e-mail corporativo, site, IATA/identificador e rede/consórcio/programa. Somente depois responder à diretora comercial.
- Para o Halloween: fornecer comprovante da oferta de 10% com regras e vigência, licença/permissão da foto-base e ID do master oficial; caso contrário, retirar a oferta e substituir por mídia real/licenciada distinta, mantendo o post em revisão.

## PRÓXIMA AÇÃO

1. Preparar resposta Accor somente após os quatro dados canônicos.
2. Manter TTW como `DECLINED_CURRENTLY`, sem novo follow-up automático.
3. Monitorar Club Med e Il Borro sem publicar.
4. Bloquear o PNG de Halloween no ledger editorial até todos os gates passarem.
5. Continuar o lote Curadoria e P0 em frentes independentes.

## ROLLBACK

- GitHub: reverter o commit deste arquivo se necessário.
- Relatório Mestre: restaurar a versão 24 se a conciliação for revertida.
- Externo: nenhum rollback necessário, pois nenhuma publicação ou resposta externa foi executada.
