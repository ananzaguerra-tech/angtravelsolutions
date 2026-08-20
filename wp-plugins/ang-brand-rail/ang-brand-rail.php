<?php
/**
 * Plugin Name: ANG Brand Rail
 * Description: Renders ANG Group and partner logo rails using only explicitly configured media assets. No fabricated logos or unverified partnership claims.
 * Version: 1.0.0
 */

if (!defined('ABSPATH')) { exit; }

function ang_brand_rail_sanitize_ids($value) {
    if (!is_array($value)) return [];
    return array_values(array_filter(array_map('absint', $value)));
}

function ang_brand_rail_register_settings() {
    register_setting('ang_brand_rail', 'ang_group_logo_ids', ['type'=>'array','sanitize_callback'=>'ang_brand_rail_sanitize_ids','default'=>[]]);
    register_setting('ang_brand_rail', 'ang_partner_logo_ids', ['type'=>'array','sanitize_callback'=>'ang_brand_rail_sanitize_ids','default'=>[]]);
    register_setting('ang_brand_rail', 'ang_partner_section_title', ['type'=>'string','sanitize_callback'=>'sanitize_text_field','default'=>'Parceiros & Ecossistema']);
}
add_action('admin_init', 'ang_brand_rail_register_settings');

function ang_brand_rail_render_images($ids, $context) {
    if (!$ids) return '';
    $html = '<div class="ang-logo-rail ang-logo-rail--'.esc_attr($context).'" role="list">';
    foreach ($ids as $id) {
        $mime = get_post_mime_type($id);
        if (!$mime || strpos($mime, 'image/') !== 0) continue;
        $alt = get_post_meta($id, '_wp_attachment_image_alt', true);
        $title = get_the_title($id);
        $img = wp_get_attachment_image($id, 'medium', false, [
            'class' => 'ang-logo-rail__image',
            'loading' => 'lazy',
            'decoding' => 'async',
            'alt' => $alt ? $alt : $title,
        ]);
        if (!$img) continue;
        $html .= '<div class="ang-logo-rail__item" role="listitem">'.$img.'</div>';
    }
    return $html.'</div>';
}

function ang_brand_group_shortcode() {
    $ids = ang_brand_rail_sanitize_ids(get_option('ang_group_logo_ids', []));
    if (!$ids) return '<!-- ANG Group logo rail: no approved media IDs configured -->';
    return '<section class="ang-brand-section ang-brand-section--group" aria-label="ANG Group">'.
        '<div class="ang-brand-section__eyebrow">ANG GROUP</div>'.
        '<h2 class="ang-brand-section__title">Um ecossistema de viagens, negócios, experiências e soluções.</h2>'.
        ang_brand_rail_render_images($ids, 'group').
        '</section>';
}
add_shortcode('ang_group_logos', 'ang_brand_group_shortcode');

function ang_partner_shortcode() {
    $ids = ang_brand_rail_sanitize_ids(get_option('ang_partner_logo_ids', []));
    if (!$ids) return '<!-- ANG partner logo rail: no verified partner media IDs configured -->';
    $title = get_option('ang_partner_section_title', 'Parceiros & Ecossistema');
    return '<section class="ang-brand-section ang-brand-section--partners" aria-label="'.esc_attr($title).'">'.
        '<div class="ang-brand-section__eyebrow">CURADORIA & CONECTIVIDADE</div>'.
        '<h2 class="ang-brand-section__title">'.esc_html($title).'</h2>'.
        ang_brand_rail_render_images($ids, 'partners').
        '</section>';
}
add_shortcode('ang_partner_logos', 'ang_partner_shortcode');

function ang_brand_rail_admin_menu() {
    add_options_page('ANG Brand Rail', 'ANG Brand Rail', 'manage_options', 'ang-brand-rail', 'ang_brand_rail_settings_page');
}
add_action('admin_menu', 'ang_brand_rail_admin_menu');

function ang_brand_rail_settings_page() {
    if (!current_user_can('manage_options')) return;
    $group = implode(',', ang_brand_rail_sanitize_ids(get_option('ang_group_logo_ids', [])));
    $partners = implode(',', ang_brand_rail_sanitize_ids(get_option('ang_partner_logo_ids', [])));
    ?>
    <div class="wrap">
      <h1>ANG Brand Rail</h1>
      <p>Configure somente IDs de anexos correspondentes a masters oficiais/aprovados. Este plugin não reconstrói logos e não cria alegações de parceria.</p>
      <form method="post" action="options.php">
        <?php settings_fields('ang_brand_rail'); ?>
        <table class="form-table">
          <tr><th>ANG Group media IDs</th><td><input class="regular-text" name="ang_group_logo_ids_csv" value="<?php echo esc_attr($group); ?>" disabled><p class="description">Provisionar via option API/CLI como array de attachment IDs após validação dos masters.</p></td></tr>
          <tr><th>Partner media IDs</th><td><input class="regular-text" name="ang_partner_logo_ids_csv" value="<?php echo esc_attr($partners); ?>" disabled><p class="description">Somente parceiros cuja relação e uso de marca estejam verificados.</p></td></tr>
        </table>
      </form>
      <h2>Shortcodes</h2>
      <code>[ang_group_logos]</code><br><code>[ang_partner_logos]</code>
    </div>
    <?php
}
