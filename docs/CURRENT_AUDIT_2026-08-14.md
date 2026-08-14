# Auditoria contínua — 2026-08-14

## Escopo
Revisão não destrutiva do repositório, código de importação e disponibilidade pública.

## Verificado
- Repositório `ananzaguerra-tech/angtravelsolutions` acessível com permissão de escrita.
- Branches `main`, `staging` e `development` existentes.
- `main` contém somente o arquivo inicial `READ ME`.
- `staging` e `development` contêm a estrutura inicial do projeto.
- Site público responde e exibe a página provisória "Portal em atualização estrutural".
- Concierge ANG está presente na página provisória.
- ANG Connect deve permanecer preservado em `http://localhost:8088`.
- Gordon informou que ANG Connect, WordPress e containers estão operacionais, mas ainda falta anexar a saída técnica bruta para inventário verificável.

## Código existente
- Plugin único: `plugin/ang-enterprise-suite`, versão 0.1.0.
- Importação protegida por capacidade `manage_options` e nonce.
- Conteúdo é criado como `draft`.
- Lote `batch-001.json`: 8 países e 16 cidades.

## Bloqueios antes da importação
1. A função de upsert usa `get_page_by_path($slug)` sem o caminho hierárquico completo. Cidades homônimas em países diferentes podem ser confundidas ou atualizadas incorretamente.
2. A contagem real do lote não corresponde à referência anterior de 881 itens.
3. Falta inventário técnico bruto de containers, portas, compose, WordPress e logs.
4. Falta backup verificado e staging funcional antes de qualquer promoção.
5. A Home provisória ainda controla o domínio público.

## Segurança
- O script `deploy/emergency-repair-503.sh` não foi executado porque desativa plugins durante o diagnóstico.
- Nenhum container, volume, banco, plugin ou conteúdo de produção foi alterado.
- Nenhuma credencial foi consultada ou registrada.

## Próxima sequência segura
1. Receber saída técnica bruta do Gordon.
2. Corrigir deduplicação hierárquica na branch `development`.
3. Adicionar validação de schema, dry-run e relatório de importação.
4. Testar o lote somente em staging.
5. Inventariar WordPress e identificar o controlador da Home provisória.
6. Gerar e verificar backup.
7. Validar staging antes de solicitar promoção para produção.
