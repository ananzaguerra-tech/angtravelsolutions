# Critérios de aceite — staging

O staging somente pode avançar quando todos os itens abaixo estiverem aprovados.

## Código e pacote
- PHP sem erro de sintaxe.
- JSON válido.
- Nenhuma credencial ou arquivo proibido.
- Checksum SHA-256 conferido.
- Plugin único `ang-enterprise-suite`.
- Rollback documentado.

## Importador
- Pré-visualização executada antes de qualquer importação.
- `writes_performed = 0` no preview.
- Deduplicação considera País → Cidade.
- Conteúdo permanece como rascunho.
- Nenhuma página aprovada é sobrescrita.
- Logs não expõem dados sensíveis.

## Infraestrutura
- ANG Connect em `localhost:8088` preservado.
- Containers e volumes existentes intactos.
- Backup verificável disponível.
- WordPress staging separado da produção.
- Nenhuma ação anônima permitida.

## Site
- Produção permanece em manutenção durante a construção.
- Rotas, menus, imagens, formulários e links validados no staging.
- Responsividade, acessibilidade, SEO e desempenho verificados.
- Nenhuma página vazia ou imagem quebrada.

## Promoção
Promoção para `main` e produção exige:
1. todos os itens críticos aprovados;
2. relatório final;
3. rollback testado;
4. autorização explícita da proprietária.
