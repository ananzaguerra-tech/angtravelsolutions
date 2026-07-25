<?php
/**
 * Plugin Name: ANG Enterprise Suite
 * Description: Safe, auditable ANG Travel Solutions content import and presentation helpers.
 * Version: 0.1.0
 * Author: ANG Group
 */

if (!defined('ABSPATH')) {
    exit;
}

final class ANG_Enterprise_Suite {
    private const OPTION_LOG = 'ang_enterprise_import_log';

    public static function init(): void {
        add_action('admin_menu', [self::class, 'register_admin_page']);
        add_action('admin_post_ang_import_destinations', [self::class, 'handle_import']);
        add_action('wp_enqueue_scripts', [self::class, 'enqueue_public_styles']);
    }

    public static function register_admin_page(): void {
        add_management_page(
            'ANG Importador',
            'ANG Importador',
            'manage_options',
            'ang-importador',
            [self::class, 'render_admin_page']
        );
    }

    public static function render_admin_page(): void {
        if (!current_user_can('manage_options')) {
            return;
        }

        $log = get_option(self::OPTION_LOG, []);
        ?>
        <div class="wrap">
            <h1>ANG Importador Seguro</h1>
            <p>Importa o lote editorial para páginas hierárquicas País → Cidade, sem apagar conteúdo existente.</p>
            <p><strong>Origem:</strong> <code>content/destinations/batch-001.json</code></p>
            <form method="post" action="<?php echo esc_url(admin_url('admin-post.php')); ?>">
                <?php wp_nonce_field('ang_import_destinations'); ?>
                <input type="hidden" name="action" value="ang_import_destinations">
                <?php submit_button('Importar lote para rascunho', 'primary', 'submit', false); ?>
            </form>
            <h2>Último registro</h2>
            <pre><?php echo esc_html(wp_json_encode($log, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE)); ?></pre>
        </div>
        <?php
    }

    public static function handle_import(): void {
        if (!current_user_can('manage_options')) {
            wp_die('Permissão insuficiente.');
        }
        check_admin_referer('ang_import_destinations');

        $path = plugin_dir_path(__FILE__) . 'data/batch-001.json';
        if (!is_readable($path)) {
            wp_die('Arquivo de conteúdo não encontrado.');
        }

        $payload = json_decode((string) file_get_contents($path), true);
        if (!is_array($payload) || empty($payload['destinations'])) {
            wp_die('Arquivo de conteúdo inválido.');
        }

        $summary = [
            'started_at' => current_time('mysql'),
            'countries_created' => 0,
            'countries_updated' => 0,
            'cities_created' => 0,
            'cities_updated' => 0,
            'errors' => [],
        ];

        $root_id = self::upsert_page('Destinos', 'destinos', 0, self::render_root_content(), $summary, 'country');

        foreach ($payload['destinations'] as $country) {
            try {
                $country_slug = sanitize_title((string) $country['country']);
                $country_id = self::upsert_page(
                    (string) $country['country'],
                    $country_slug,
                    $root_id,
                    self::render_country_content($country),
                    $summary,
                    'country'
                );

                foreach (($country['cities'] ?? []) as $city) {
                    self::upsert_page(
                        (string) $city['name'] . ' — Curadoria',
                        sanitize_title((string) $city['name']),
                        $country_id,
                        self::render_city_content($country, $city),
                        $summary,
                        'city'
                    );
                }
            } catch (Throwable $e) {
                $summary['errors'][] = [
                    'country' => $country['country'] ?? 'desconhecido',
                    'message' => $e->getMessage(),
                ];
            }
        }

        $summary['finished_at'] = current_time('mysql');
        update_option(self::OPTION_LOG, $summary, false);

        wp_safe_redirect(add_query_arg(['page' => 'ang-importador', 'imported' => 1], admin_url('tools.php')));
        exit;
    }

    private static function upsert_page(string $title, string $slug, int $parent, string $content, array &$summary, string $type): int {
        $existing = get_page_by_path($slug, OBJECT, 'page');
        $postarr = [
            'post_title' => $title,
            'post_name' => $slug,
            'post_parent' => $parent,
            'post_content' => $content,
            'post_type' => 'page',
            'post_status' => 'draft',
            'comment_status' => 'closed',
        ];

        if ($existing instanceof WP_Post) {
            $postarr['ID'] = $existing->ID;
            $result = wp_update_post(wp_slash($postarr), true);
            $summary[$type . 's_updated'] = ($summary[$type . 's_updated'] ?? 0) + 1;
        } else {
            $result = wp_insert_post(wp_slash($postarr), true);
            $summary[$type . 's_created'] = ($summary[$type . 's_created'] ?? 0) + 1;
        }

        if (is_wp_error($result)) {
            throw new RuntimeException($result->get_error_message());
        }

        update_post_meta((int) $result, '_ang_content_source', 'batch-001.json');
        update_post_meta((int) $result, '_ang_content_status', 'draft_for_staging');
        return (int) $result;
    }

    private static function render_root_content(): string {
        return '<div class="ang-page"><p class="ang-eyebrow">CONTEÚDO GLOBAL</p><h1>Destinos do mundo</h1><p>Curadoria organizada por país e cidade, com informações práticas, atrações, museus, parques e experiências premium.</p></div>';
    }

    private static function render_country_content(array $country): string {
        $cities = array_map(static fn(array $city): string => esc_html((string) $city['name']), $country['cities'] ?? []);
        return sprintf(
            '<div class="ang-page"><p class="ang-eyebrow">PAÍS</p><h1>%1$s</h1><div class="ang-facts"><p><strong>Moeda:</strong> %2$s</p><p><strong>Idiomas:</strong> %3$s</p><p><strong>Voltagem:</strong> %4$s</p><p><strong>Melhor época:</strong> %5$s</p></div><h2>Cidades em destaque</h2><p>%6$s</p></div>',
            esc_html((string) $country['country']),
            esc_html((string) ($country['currency'] ?? '')), 
            esc_html(implode(', ', $country['languages'] ?? [])),
            esc_html((string) ($country['voltage'] ?? '')),
            esc_html((string) ($country['best_time'] ?? '')),
            esc_html(implode(' · ', $cities))
        );
    }

    private static function render_city_content(array $country, array $city): string {
        $attractions = self::list_html($city['attractions'] ?? []);
        $premium = self::list_html($city['premium_experiences'] ?? []);
        return sprintf(
            '<div class="ang-page"><p class="ang-eyebrow">%1$s</p><h1>%2$s</h1><p class="ang-lead">%3$s</p><section><h2>Informações práticas</h2><div class="ang-facts"><p><strong>Moeda:</strong> %4$s</p><p><strong>Idiomas:</strong> %5$s</p><p><strong>Voltagem:</strong> %6$s</p><p><strong>Melhor época:</strong> %7$s</p></div></section><section><h2>Pontos turísticos, museus e parques</h2>%8$s</section><section><h2>Experiências premium</h2>%9$s</section><section><h2>Curadoria gastronômica</h2><p>Restaurantes, cafés, bares e experiências são selecionados conforme o perfil do viajante e devem ter endereço, contato, horários e disponibilidade reconfirmados antes da publicação comercial.</p></section><section><h2>Planejamento responsável</h2><p>Horários, ingressos, regras de acesso e condições operacionais são dinâmicos e devem ser reconfirmados antes da viagem.</p></section></div>',
            esc_html((string) $country['country']),
            esc_html((string) $city['name']),
            esc_html((string) ($city['summary'] ?? '')),
            esc_html((string) ($country['currency'] ?? '')),
            esc_html(implode(', ', $country['languages'] ?? [])),
            esc_html((string) ($country['voltage'] ?? '')),
            esc_html((string) ($country['best_time'] ?? '')),
            $attractions,
            $premium
        );
    }

    private static function list_html(array $items): string {
        $html = '<ul class="ang-grid-list">';
        foreach ($items as $item) {
            $html .= '<li>' . esc_html((string) $item) . '</li>';
        }
        return $html . '</ul>';
    }

    public static function enqueue_public_styles(): void {
        wp_enqueue_style(
            'ang-enterprise-suite',
            plugin_dir_url(__FILE__) . 'assets/public.css',
            [],
            '0.1.0'
        );
    }
}

ANG_Enterprise_Suite::init();
