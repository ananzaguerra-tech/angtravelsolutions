# ANG — Ciclo C315 — Normalização de CTA e nomenclatura da Área Restrita

**Data:** 2026-10-30 (America/Sao_Paulo)  
**Modo:** fail-closed, correção reversível, sem publicação nova

## EXECUTADO

1. Relatório Mestre confirmado na Biblioteca como versão 26.
2. Monitoramento Gmail de Accor, Club Med, TTW e Il Borro:
   - nenhuma resposta nova de Accor, Club Med ou Il Borro;
   - a única mensagem retornada foi a recusa TTW já registrada.
3. Google Drive:
   - zero resultados para `ANG STATUS LIVE C314 C315`;
   - zero resultados para `Accor Preferred HERA STEP`.
4. WordPress / referências Accor:
   - `HERA`: zero resultado após uma repetição segura da consulta (a primeira tentativa recebeu erro transitório de banco);
   - `STEP`: zero resultado público;
   - `Pipa`: zero resultado público;
   - o resultado de busca para `Accor Preferred`/ `Accor` apontou a página 67207 por correspondência lexical ampla; leitura integral do conteúdo atual não encontrou alegação literal Accor, HERA ou STEP. Nenhuma alteração nessa página.
5. Console / nomenclatura:
   - busca pública por `area-restrita-ang`: zero resultado;
   - busca no tema draft por `area-restrita-ang` e `Área do Cliente`: zero resultado em 9 arquivos;
   - a busca de conteúdo retornou 14 candidatos e a leitura autenticada encontrou somente dois resíduos exatos.
6. Correções WordPress:
   - post 142808: `/area-do-cliente/` → `/area-restrita/`;
   - post 142808: `Acessar a área do cliente` → `Acessar a Área Restrita`;
   - post 142809: `canais oficiais da área do cliente` → `canais oficiais da Área Restrita`.
7. Readback autenticado:
   - 142808: 0 ocorrência antiga; 1 ocorrência de cada valor novo; status `publish`;
   - 142809: 0 ocorrência antiga; 1 ocorrência do valor novo; status `publish`;
   - página destino 2109 `/area-restrita/` permanece publicada.

## EVIDÊNCIA / URL / ID

- Artigo 142808: https://angtravelsolutions.com.br/a-nova-descoberta-de-viagens-como-a-inteligencia-artificial-esta-redesenhando-o-turismo/
- Artigo 142809: https://angtravelsolutions.com.br/viagens-corporativas-em-2026-eficiencia-bem-estar-e-decisoes-orientadas-por-dados/
- Destino canônico: https://angtravelsolutions.com.br/area-restrita/
- Revisões WordPress criadas: `153640` (pai 142808) e `153641` (pai 142809).
- Backups integrais pré-alteração:
  - `docs/backups/wordpress/ANG_POST_142808_PRE_C315_2026-10-30.json`
  - `docs/backups/wordpress/ANG_POST_142809_PRE_C315_2026-10-30.json`

## NÃO FEITO / MOTIVO / BLOQUEIO

- Nenhuma resposta enviada à Accor: IATA/TIDS/CLIA próprio, e-mail em domínio ANG e afiliação vigente continuam sem prova canônica.
- Nenhuma publicação social/Meta/n8n/Google Business: gates de mídia, master, deduplicação, ledger e autenticação permanecem fechados.
- A busca site-wide por WP-CLI não foi autorizada: a conta conectada não possui `manage_options` (HTTP 403). A solução paliativa foi a varredura autenticada dos 14 conteúdos candidatos.
- Console não recebeu PASS: cotação E2E, RBAC, Secure Forms e persistência continuam sem evidência integral.
- Manutenção pública preservada.

## SOLUÇÃO TENTADA

- Uma consulta WordPress `HERA` que retornou erro 500 de banco foi repetida uma única vez; o readback posterior retornou `[]`.
- Para a nomenclatura, a tentativa de busca site-wide por WP-CLI foi interrompida no 403 e substituída por busca REST + leitura autenticada individual, sem solicitar ou expor credenciais.

## AÇÃO HUMANA MÍNIMA

1. Accor: confirmar IATA/TIDS/CLIA ou outro identificador próprio, e-mail corporativo e afiliação vigente — ou confirmar formalmente que não existem.
2. WordPress: conceder temporariamente `manage_options` ou reconectar uma conta administradora somente se for necessário executar varredura global de banco; nenhuma senha deve ser compartilhada.
3. Club Med e Il Borro: aguardar resposta aos follow-ups já enviados.

## PRÓXIMA AÇÃO

- Continuar a reconciliação de CTAs/nomenclatura em novos candidatos e testar o fluxo `/acesso-ang/` → `/area-restrita/` sem promover o Console a PASS.
- Monitorar novas respostas de fornecedores.
- Manter as fichas Accor STEP em draft até fontes e direitos serem comprovados.

## ROLLBACK

- Restaurar a revisão `153640` para o post 142808 e a revisão `153641` para o post 142809, ou usar os backups integrais do GitHub.
- Nenhum post foi excluído, recriado ou teve slug/status alterado.
