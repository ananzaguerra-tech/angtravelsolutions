<?php
/**
 * Plugin Name: ANG Área Restrita Label Hotfix
 * Description: Normaliza exclusivamente o título legado emitido pelo shortcode [ang_v13_dashboard].
 * Version: 1.0.0
 * Author: ANG Group
 * Requires at least: 6.4
 * Requires PHP: 8.1
 */

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Corrige somente a saída do shortcode alvo.
 *
 * Fail-closed:
 * - não altera banco de dados;
 * - não intercepta outros shortcodes;
 * - não modifica a saída se o marcador legado exato não existir;
 * - remover/desativar este plugin restaura imediatamente o comportamento anterior.
 */
function ang_area_restrita_normalize_dashboard_label(
    string $output,
    string $tag,
    array $attr,
    array $match
): string {
    if ($tag !== 'ang_v13_dashboard') {
        return $output;
    }

    $legacy_heading = '<h2>Área do Cliente</h2>';
    if (substr_count($output, $legacy_heading) !== 1) {
        return $output;
    }

    return str_replace(
        $legacy_heading,
        '<h2>Área do Agente</h2>',
        $output
    );
}
add_filter(
    'do_shortcode_tag',
    'ang_area_restrita_normalize_dashboard_label',
    10,
    4
);
