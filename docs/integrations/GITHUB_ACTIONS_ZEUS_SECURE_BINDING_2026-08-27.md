# GitHub Actions → ZEUS/n8n — binding seguro

Data: 2026-08-27

## Estado verificado

- Instância n8n existente: `https://ananza.app.n8n.cloud`.
- Workflow operacional visto/publicado anteriormente: `ZEUS — Operações sem IA — VALIDADO V2`.
- Em 27/08/2026 o n8n também notificou falha do workflow `ZEUS — MASTER OPERACIONAL SEM IA — V3 FINAL IMPORT`; portanto não tratar V3 como substituto comprovado do V2.
- Workflow GitHub `Zeus social dispatch` já valida a fila e executa em modo fail-closed.
- Check atual do dispatcher passou sem publicar porque o segredo `ZEUS_SOCIAL_WEBHOOK` não está configurado no repositório.

## Binding aprovado

O endpoint de produção do Webhook node do workflow ZEUS deve ser armazenado somente como GitHub Actions secret `ZEUS_SOCIAL_WEBHOOK`.

Regras:
1. Não versionar a URL completa do webhook se ela funcionar como segredo/capability URL.
2. Nunca incluir token, cookie, senha ou credencial em commit, issue ou log.
3. Endpoint deve ser HTTPS e pertencer à instância `ananza.app.n8n.cloud`.
4. O dispatcher só envia itens com `publish_authorized=true` e `status=READY_TO_DISPATCH`.
5. Nenhum item pode ser marcado `PUBLISHED` sem permalink/post ID real devolvido ou armazenado pelo ZEUS/n8n.
6. Em caso de endpoint ausente, inválido ou erro HTTP, falhar fechado sem publicação externa.

## Ação humana mínima ainda necessária

O conector GitHub disponível nesta sessão não expõe a API de Actions Secrets. Portanto o único passo que não pode ser executado por esta sessão é cadastrar no GitHub o valor secreto copiado do campo **Production URL** do Webhook node correto do ZEUS:

`Settings → Secrets and variables → Actions → New repository secret`

Nome exato: `ZEUS_SOCIAL_WEBHOOK`

Valor: Production URL do Webhook node do workflow ZEUS já operacional.

Depois disso, o workflow `Zeus social dispatch` pode ser reexecutado sem alterar código.

## Gates após binding

- `Resolve latest queue`: PASS
- `Validate Zeus endpoint availability`: deve detectar o secret sem imprimir seu valor
- `Dispatch authorized queue to Zeus/n8n`: deve executar
- Evidência exigida por item: permalink/post ID real

## Segurança

A URL e qualquer token permanecem fora do Git. O repositório contém somente o contrato de integração e a fila autorizada.
