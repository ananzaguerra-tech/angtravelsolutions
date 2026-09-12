# ZEUS V5 — Google Business Route Hotfix — 2026-09-12

## Evidência

Run GitHub Actions `34704321539` enviou `action=google_business_status` ao webhook `zeus-social-v5-ghauth` com `read_only=true` e recebeu HTTP 200, porém o corpo retornou `HOLD_MISSING_IMAGE_URL`. Isso prova que a ação não social caiu no publisher Instagram.

Run `34704363233` isolou a autenticação GitHub→n8n usando `action=status/auth` e recebeu HTTP 200 com `status=AUTH_PASS`, `authorized=true`, `auth_status=PASS`. Logo, o bloqueio não é a autenticação do gateway.

## Causa raiz

O artefato `docs/integrations/ZEUS_SOCIAL_EXECUTOR_GITHUB_AUTH_V5_IMPORT.json` possui apenas dois caminhos lógicos após `Autorizado?`:
1. `Status/Auth?` = true -> resposta AUTH;
2. false -> `Meta — Descobrir Páginas` -> Instagram publisher.

Não existe roteamento dedicado para `google_business_status`. Assim, qualquer ação diferente de `status/auth` cai no publisher social e passa a exigir mídia.

## Correção obrigatória — fail closed

Antes de `Meta — Descobrir Páginas`, inserir um gate explícito de ação:

- `status/auth` -> resposta AUTH PASS;
- ações sociais permitidas -> publisher social;
- `google_business_status` -> rota Google Business READ-ONLY dedicada;
- qualquer ação desconhecida -> `HOLD_UNSUPPORTED_ACTION` e responder sem chamar Meta/Instagram.

A rota `google_business_status` deve:
- ser somente leitura;
- nunca criar, atualizar, excluir, reivindicar ou duplicar ficha;
- executar readback de contas/localizações por conector/credencial Google Business apropriado;
- retornar Location ID, profile URL quando disponível, NAP e status de verificação/eligibilidade;
- mascarar tokens e não incluir segredos no payload de resposta;
- respeitar o manifesto `ops/google-business/verified-location-manifest-2026-08-27.json` em modo FAIL_CLOSED.

## Estado atual

`GITHUB_TO_N8N_AUTH=PASS`
`GOOGLE_BUSINESS_ROUTE=BLOCKED_NOT_IMPLEMENTED`
`GOOGLE_BUSINESS_MUTATION=PROHIBITED_UNTIL_READBACK`

## Próximo passo técnico mínimo

Aplicar este roteamento no workflow n8n de produção correto, mantendo o workflow social separado da operação Google Business; depois repetir o probe `google_business_status` e exigir resposta de leitura real. Sem isso, não declarar Google Business PASS.
