<?php
/**
 * Plugin Name: ANG Secure Forms Guard
 * Description: Fail-closed server-side validation guard for ANG Secure Forms.
 * Version: 1.0.0
 */
if (!defined('ABSPATH')) { exit; }

function ang_sfg_reject($code) {
    $ref = wp_get_referer();
    if (!$ref) { $ref = home_url('/fale-conosco/'); }
    $target = add_query_arg('ang_form_status', 'error', remove_query_arg('ang_form_status', $ref));
    $target = add_query_arg('ang_form_error', sanitize_key($code), $target) . '#ang-form';
    wp_safe_redirect($target, 303);
    exit;
}

function ang_sfg_preflight() {
    if (strtoupper($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') { ang_sfg_reject('method'); }
    if (($_POST['action'] ?? '') !== 'ang_secure_form') { return; }
    if (!empty($_POST['ang_website'])) { ang_sfg_reject('spam'); }

    $email = sanitize_email(wp_unslash($_POST['ang_email'] ?? ''));
    if (!$email || !is_email($email)) { ang_sfg_reject('email'); }
    if (($_POST['ang_consent'] ?? '') !== '1') { ang_sfg_reject('consent'); }

    $started = absint($_POST['ang_started_at'] ?? 0);
    $now = time();
    if (!$started || $started > $now || ($now - $started) < 2 || ($now - $started) > 86400) {
        ang_sfg_reject('timing');
    }

    if (empty($_POST['ang_secure_form_nonce']) ||
        !wp_verify_nonce(sanitize_text_field(wp_unslash($_POST['ang_secure_form_nonce'])), 'ang_secure_form')) {
        ang_sfg_reject('nonce');
    }
}
add_action('admin_post_nopriv_ang_secure_form', 'ang_sfg_preflight', 0);
add_action('admin_post_ang_secure_form', 'ang_sfg_preflight', 0);
