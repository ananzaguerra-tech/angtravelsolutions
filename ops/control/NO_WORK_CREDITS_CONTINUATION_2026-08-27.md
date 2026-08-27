# Continuidade operacional sem créditos do Work — 2026-08-27

## Estado comprovado
- Workflow n8n correto: `FzQQYBrgzo2wU8bm`
- AUTH PASS real preservado (execução n8n 89, segundo evidência do Work)
- Feed autorizado: `CURADORIA_ANG_AGOSTO_FEED`
- Payload: `ops/social/payloads/ang-travel-feed-authorized-2026-08-27.json`
- Payload SHA: `b72733a919389c34744c763715822030d9a33652`
- Fila SHA: `587dae24d92e5cd517896ca0275621d599a12ef2`
- Commit com mídia/payload em staging: `f5ff4e72f998ecc90f51256f117af725dcb14a41`
- Mídia Feed validada pelo Work com HTTP 200 + `image/png`
- Workflow antigo `n5MIoBQbV5DpWp7H`: NÃO USAR / manter não publicado

## Gate autenticado remanescente
`ZEUS_SOCIAL_WEBHOOK` precisa receber, em GitHub Actions Secret, a Production URL do workflow `FzQQYBrgzo2wU8bm`.
A URL não deve ser escrita em arquivo, issue, log ou chat.
Sem essa vinculação, o dispatcher deve continuar fail-closed.

## Regra sem Work
Enquanto não houver nova sessão autenticada disponível:
1. continuar todas as frentes reversíveis e auditáveis via GitHub/Drive/Gmail/automations;
2. não fingir publicação Meta/Google/WordPress;
3. não expor capability URLs, tokens, senhas ou secrets;
4. preparar todos os artefatos necessários para que o próximo gate humano seja de um único clique/entrada de secret;
5. manter Story/Carrossel fechados até Feed retornar `PUBLISHED + publication_id`;
6. manter WordPress em HOLD para mudanças autenticadas, porém continuar QA estático, rollback, conteúdo, branding, Curadoria e documentação.

## Frentes que continuam sem navegador autenticado
- Curadoria 881 + batches WORLD e Brasil: enriquecimento/QA/SEO/schema/media gate sem mass publish.
- Branding: recuperação e inventário de masters; sem redesenhar por inferência.
- Google Business: preparação de Campinas/Americana e validação documental, sem duplicar fichas.
- Meta/WhatsApp: acompanhar ticket `2832394223808758`; preparar E2E e evidências; não burlar verificação.
- WordPress: revisar código de `/acesso-ang/`, Secure Forms, rollback e smoke scripts no repositório.
- Social: preparar fila, payloads, market/language/location policy; nenhuma marcação PUBLISHED sem ID real.

## Critério de verdade
Somente usar `PASS`, `PUBLISHED`, `CONCLUÍDO` ou `100%` com evidência verificável: URL/ID/log/teste/artefato/resposta de sistema.

## Próxima ação humana mínima quando canal autenticado voltar
1. abrir n8n `FzQQYBrgzo2wU8bm` e copiar Production URL;
2. cadastrar `ZEUS_SOCIAL_WEBHOOK` em GitHub Actions Secret sem expor valor;
3. executar somente Feed autorizado;
4. exigir `PUBLISHED + publication_id`;
5. se erro Meta, registrar HTTP status + code + message e parar.
