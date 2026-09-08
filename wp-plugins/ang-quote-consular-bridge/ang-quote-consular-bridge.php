<?php
/**
 * Plugin Name: ANG Quote Consular Bridge
 * Description: Adds nationality/passenger-composition consular gates to agent-generated quotes without replacing ANG Quote Engine.
 * Version: 0.1.0-staging
 */

if (!defined('ABSPATH')) { exit; }

final class ANG_Quote_Consular_Bridge {
    const META_KEY = '_ang_quote_consular_payload';

    public static function init() {
        add_filter('ang_quote_payload_before_render', [__CLASS__, 'enrich_quote_payload'], 20, 1);
        add_filter('ang_quote_pdf_context', [__CLASS__, 'enrich_quote_payload'], 20, 1);
        add_filter('ang_quote_share_context', [__CLASS__, 'enrich_quote_payload'], 20, 1);
        add_action('rest_api_init', [__CLASS__, 'register_routes']);
    }

    public static function register_routes() {
        register_rest_route('ang/v1', '/quote-consular/validate', [
            'methods' => 'POST',
            'permission_callback' => function() {
                return current_user_can('ang_agent_portal') || current_user_can('edit_posts');
            },
            'callback' => [__CLASS__, 'validate_request'],
        ]);
    }

    public static function validate_request(WP_REST_Request $request) {
        $payload = $request->get_json_params();
        $result = self::build_consular_context(is_array($payload) ? $payload : []);
        if (is_wp_error($result)) { return $result; }
        return rest_ensure_response($result);
    }

    public static function enrich_quote_payload($payload) {
        if (!is_array($payload)) { return $payload; }
        $context = self::build_consular_context($payload);
        if (is_wp_error($context)) {
            $payload['consular_gate'] = [
                'status' => 'BLOCKED',
                'code' => $context->get_error_code(),
                'message' => $context->get_error_message(),
            ];
            return $payload;
        }
        $payload['consular_gate'] = $context;
        return $payload;
    }

    private static function build_consular_context(array $payload) {
        $nationalities = self::normalize_list($payload['passenger_nationalities'] ?? $payload['nationalities'] ?? []);
        $destination_country = sanitize_text_field($payload['destination_country'] ?? '');
        $passengers = is_array($payload['passengers'] ?? null) ? $payload['passengers'] : [];

        if (!$destination_country) {
            return new WP_Error('missing_destination_country', 'País de destino é obrigatório para validar requisitos consulares.', ['status' => 422]);
        }
        if (!$nationalities) {
            return new WP_Error('missing_passenger_nationality', 'Nacionalidade de cada passageiro é obrigatória antes da emissão da cotação final.', ['status' => 422]);
        }

        $minors = [];
        foreach ($passengers as $idx => $pax) {
            $age = isset($pax['age']) ? intval($pax['age']) : null;
            if ($age !== null && $age < 18) {
                $minors[] = [
                    'index' => $idx,
                    'age' => $age,
                    'travelling_with' => sanitize_text_field($pax['travelling_with'] ?? ''),
                    'authorization_status' => sanitize_text_field($pax['minor_authorization_status'] ?? 'TO_VERIFY'),
                ];
            }
        }

        return [
            'status' => 'REQUIRES_DYNAMIC_SOURCE_LOOKUP',
            'destination_country' => $destination_country,
            'passenger_nationalities' => $nationalities,
            'minor_passengers' => $minors,
            'required_sections' => [
                'passport_or_travel_document',
                'visa_or_electronic_authorization',
                'permitted_stay',
                'document_validity',
                'health_and_vaccines',
                'travel_insurance_if_applicable',
                'proof_of_funds_accommodation_or_onward_travel_if_applicable',
                'minor_travel_rules_if_applicable',
                'customs_and_currency_if_applicable',
                'official_sources',
                'checked_at',
            ],
            'source_policy' => [
                'brazilian_abroad' => ['destination_authority', 'MRE_PORTAL_CONSULAR'],
                'foreign_national_to_brazil' => ['MRE_BRAZIL', 'BRAZIL_CONSULAR_NETWORK', 'POLICIA_FEDERAL'],
            ],
            'render_targets' => ['agent_console', 'quote_pdf', 'secure_share_link'],
            'finalization_rule' => 'BLOCK_FINAL_OUTPUT_UNTIL_CONSULAR_DATA_RESOLVED',
            'disclaimer' => 'Requisitos migratórios e sanitários são dinâmicos e devem ser revalidados próximo da emissão e do embarque.',
        ];
    }

    private static function normalize_list($value) {
        if (is_string($value)) { $value = preg_split('/[,;]+/', $value); }
        if (!is_array($value)) { return []; }
        $out = [];
        foreach ($value as $item) {
            if (is_array($item)) { $item = $item['nationality'] ?? ''; }
            $item = trim(sanitize_text_field((string)$item));
            if ($item !== '') { $out[] = $item; }
        }
        return array_values(array_unique($out));
    }
}

ANG_Quote_Consular_Bridge::init();
