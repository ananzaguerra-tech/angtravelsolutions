# ZEUS / n8n — checkpoint operacional 2026-08-27

## Evidência visual recebida

A instância existente `https://ananza.app.n8n.cloud` foi exibida autenticada no navegador da titular.

Workflow visível: `ZEUS — Operações sem IA — VALIDADO V2`.

Estado visual exibido pelo n8n: `Publicado`.

A tela mostra múltiplas entradas/rotas convergindo para saídas de operação e um acionamento manual identificado como `Executar fluxo de trabalho do Portal de Comando ZEUS`.

## O que esta evidência comprova

- A instância n8n correta está acessível pela titular.
- O workflow `ZEUS — Operações sem IA — VALIDADO V2` existe na instância atual.
- O workflow aparece em estado publicado no editor.
- Não é necessário criar uma segunda instância n8n.

## O que ainda NÃO deve ser declarado como concluído somente com esta evidência

O estado `Publicado` não prova, isoladamente, homologação ponta a ponta de Meta/WhatsApp → webhook n8n → Concierge/ZEUS → resposta outbound.

Para marcar a integração como `E2E_PASS`, registrar evidência dos seguintes gates:

1. WABA ID correto do ativo WhatsApp Business que contém o número comercial alvo.
2. Phone Number ID correto, exibido na mesma tela autenticada que mostre o número alvo.
3. GET webhook challenge da Meta com retorno esperado.
4. POST inbound real chegando ao workflow publicado.
5. Validação HMAC SHA-256 usando raw body quando aplicável.
6. ACK rápido e tratamento de arrays/batches.
7. Idempotência por `wamid` e prevenção de respostas duplicadas.
8. Error Workflow associado e evidência de falha controlada.
9. Handoff humano / consentimento / retenção minimizada conforme LGPD.
10. Outbound real via Graph API retornando sucesso e mensagem entregue ao número de teste autorizado.
11. Registro sanitizado do teste sem token, app secret, cookie, senha ou credencial.

## Regras de preservação

- Usar somente a instância n8n existente.
- Não imprimir, exportar ou versionar credenciais.
- Não alterar ANG Connect, containers, volumes ou banco.
- Não criar número WhatsApp paralelo.
- Não reutilizar Phone Number ID do número de teste da Meta como produção.
- Não tratar IDs de dataset/eventos como WABA ID ou Phone Number ID.

## Critério de fechamento

Status atual deste checkpoint: `WORKFLOW_PUBLISHED_EVIDENCE_PASS / META_WHATSAPP_E2E_PENDING`.

Fechar P2 de Concierge/n8n somente quando os 11 gates acima tiverem evidência verificável e sanitizada.
