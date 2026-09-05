<?php
/**
 * Plugin Name: ANG Agent Access
 * Description: Login seguro e gate de acesso para a Área do Agente ANG Travel Solutions.
 * Version: 0.2.0
 * Author: ANG Travel Solutions
 */

if (!defined('ABSPATH')) { exit; }

final class ANG_Agent_Access {
    const ROLE = 'ang_agent';
    const CAP  = 'ang_agent_portal';
    const NONCE_ACTION = 'ang_agent_login';
    const NONCE_NAME = 'ang_agent_nonce';
    const LOGIN_PATH = '/acesso-ang/';
    const PORTAL_PATH = '/area-do-agente/';

    public static function boot() {
        add_action('init', [__CLASS__, 'handle_login'], 1);
        add_shortcode('ang_agent_login', [__CLASS__, 'login_shortcode']);
        add_shortcode('ang_agent_gate', [__CLASS__, 'gate_shortcode']);
        add_filter('login_redirect', [__CLASS__, 'login_redirect'], 20, 3);
        add_action('wp_logout', [__CLASS__, 'logout_redirect']);
    }

    public static function activate() {
        $role = get_role(self::ROLE);
        if (!$role) {
            add_role(self::ROLE, 'Agente ANG', [
                'read' => true,
                self::CAP => true,
            ]);
        } else {
            $role->add_cap(self::CAP, true);
        }
        if ($admin = get_role('administrator')) {
            $admin->add_cap(self::CAP, true);
        }
    }

    private static function client_fingerprint($username = '') {
        $ip = isset($_SERVER['REMOTE_ADDR']) ? sanitize_text_field(wp_unslash($_SERVER['REMOTE_ADDR'])) : 'unknown';
        return hash('sha256', strtolower(trim($username)) . '|' . $ip . '|' . wp_salt('auth'));
    }

    private static function rate_key($username = '') {
        return 'ang_agent_login_' . substr(self::client_fingerprint($username), 0, 40);
    }

    private static function is_rate_limited($username = '') {
        $state = get_transient(self::rate_key($username));
        return is_array($state) && isset($state['count']) && (int)$state['count'] >= 5;
    }

    private static function register_failure($username = '') {
        $key = self::rate_key($username);
        $state = get_transient($key);
        $count = is_array($state) && isset($state['count']) ? (int)$state['count'] : 0;
        set_transient($key, ['count' => $count + 1], 15 * MINUTE_IN_SECONDS);
    }

    private static function clear_failures($username = '') {
        delete_transient(self::rate_key($username));
    }

    public static function handle_login() {
        if (empty($_POST['ang_agent_action']) || 'login' !== sanitize_key(wp_unslash($_POST['ang_agent_action']))) {
            return;
        }

        $username = isset($_POST['log']) ? sanitize_user(wp_unslash($_POST['log'])) : '';
        $password = isset($_POST['pwd']) ? (string) wp_unslash($_POST['pwd']) : '';
        $honeypot = isset($_POST['company_website']) ? trim((string) wp_unslash($_POST['company_website'])) : '';

        if ($honeypot !== '') {
            self::register_failure($username);
            self::redirect_with_error('invalid');
        }

        if (!isset($_POST[self::NONCE_NAME]) || !wp_verify_nonce(sanitize_text_field(wp_unslash($_POST[self::NONCE_NAME])), self::NONCE_ACTION)) {
            self::register_failure($username);
            self::redirect_with_error('expired');
        }

        if (self::is_rate_limited($username)) {
            self::redirect_with_error('limited');
        }

        $credentials = [
            'user_login'    => $username,
            'user_password' => $password,
            'remember'      => !empty($_POST['rememberme']),
        ];

        $user = wp_signon($credentials, is_ssl());
        if (is_wp_error($user)) {
            self::register_failure($username);
            self::redirect_with_error('invalid');
        }

        if (!user_can($user, self::CAP)) {
            wp_logout();
            self::register_failure($username);
            self::redirect_with_error('access');
        }

        self::clear_failures($username);
        wp_safe_redirect(self::portal_url());
        exit;
    }

    private static function redirect_with_error($code) {
        $target = wp_get_referer();
        if (!$target) { $target = self::login_url(); }
        $target = remove_query_arg('ang_login_error', $target);
        wp_safe_redirect(add_query_arg('ang_login_error', sanitize_key($code), $target));
        exit;
    }

    public static function login_shortcode() {
        if (is_user_logged_in()) {
            $user = wp_get_current_user();
            if (user_can($user, self::CAP)) {
                return '<div class="ang-agent-login ang-agent-login--ok"><h2>Área do Agente</h2><p>Seu acesso está ativo.</p><p><a class="ang-agent-btn" href="' . esc_url(self::portal_url()) . '">Entrar no portal</a> <a class="ang-agent-link" href="' . esc_url(wp_logout_url(self::login_url())) . '">Sair</a></p></div>';
            }
            return '<div class="ang-agent-login ang-agent-login--error"><p>Este usuário não possui permissão para a Área do Agente.</p></div>';
        }

        $messages = [
            'invalid' => 'Não foi possível validar o acesso. Confira os dados e tente novamente.',
            'expired' => 'A sessão do formulário expirou. Tente novamente.',
            'limited' => 'Muitas tentativas em sequência. Aguarde alguns minutos e tente novamente.',
            'access'  => 'O usuário informado não possui acesso liberado à Área do Agente.',
        ];
        $code = isset($_GET['ang_login_error']) ? sanitize_key(wp_unslash($_GET['ang_login_error'])) : '';
        $notice = isset($messages[$code]) ? '<div class="ang-agent-notice" role="alert">' . esc_html($messages[$code]) . '</div>' : '';

        ob_start();
        ?>
        <div class="ang-agent-login">
            <div class="ang-agent-login__intro">
                <span class="ang-agent-kicker">ANG TRAVEL SOLUTIONS</span>
                <h2>Login Área do Agente</h2>
                <p>Acesso exclusivo para agências e profissionais credenciados.</p>
            </div>
            <?php echo $notice; // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?>
            <form method="post" class="ang-agent-form" autocomplete="on">
                <?php wp_nonce_field(self::NONCE_ACTION, self::NONCE_NAME); ?>
                <input type="hidden" name="ang_agent_action" value="login">
                <div class="ang-agent-hp" aria-hidden="true"><label>Website<input type="text" name="company_website" tabindex="-1" autocomplete="off"></label></div>
                <label>E-mail ou usuário
                    <input type="text" name="log" autocomplete="username" required maxlength="120">
                </label>
                <label>Senha
                    <input type="password" name="pwd" autocomplete="current-password" required>
                </label>
                <label class="ang-agent-remember"><input type="checkbox" name="rememberme" value="1"> Manter conectado neste dispositivo</label>
                <button type="submit" class="ang-agent-btn">Acessar área segura</button>
                <p class="ang-agent-help"><a href="<?php echo esc_url(wp_lostpassword_url()); ?>">Esqueci minha senha</a></p>
            </form>
        </div>
        <style>
            .ang-agent-login{max-width:620px;margin:48px auto;padding:clamp(28px,5vw,54px);border:1px solid rgba(184,137,54,.28);border-radius:24px;background:#071018;color:#fff;box-shadow:0 26px 70px rgba(0,0,0,.22)}
            .ang-agent-kicker{font:700 .75rem/1.2 Montserrat,sans-serif;letter-spacing:.16em;color:#e0b85f}.ang-agent-login h2{font-size:clamp(2rem,5vw,3.5rem);margin:.55rem 0 1rem}.ang-agent-login p{line-height:1.65}.ang-agent-form{display:grid;gap:18px;margin-top:26px}.ang-agent-form label{display:grid;gap:8px;font-weight:600}.ang-agent-form input[type=text],.ang-agent-form input[type=password]{width:100%;min-height:50px;border:1px solid rgba(255,255,255,.22);border-radius:12px;background:#0d1822;color:#fff;padding:0 14px}.ang-agent-form input:focus-visible,.ang-agent-btn:focus-visible,.ang-agent-link:focus-visible{outline:3px solid #e0b85f;outline-offset:3px}.ang-agent-btn{display:inline-flex;align-items:center;justify-content:center;min-height:50px;padding:0 22px;border:0;border-radius:999px;background:#b88936;color:#090909;font-weight:800;text-decoration:none;cursor:pointer}.ang-agent-link,.ang-agent-help a{color:#e0b85f}.ang-agent-notice{padding:14px 16px;border-radius:12px;background:#2d1b19;border:1px solid rgba(255,128,96,.35)}.ang-agent-remember{grid-template-columns:auto 1fr!important;align-items:center;justify-content:start}.ang-agent-hp{position:absolute!important;left:-9999px!important;width:1px!important;height:1px!important;overflow:hidden!important}
        </style>
        <?php
        return ob_get_clean();
    }

    public static function gate_shortcode($atts, $content = '') {
        if (!is_user_logged_in()) {
            return '<div class="ang-agent-gate"><p>Conteúdo exclusivo da Área do Agente.</p><p><a class="ang-agent-btn" href="' . esc_url(self::login_url()) . '">Fazer login</a></p></div>';
        }
        $user = wp_get_current_user();
        if (!user_can($user, self::CAP)) {
            return '<div class="ang-agent-gate"><p>Acesso não autorizado para este perfil.</p></div>';
        }
        return do_shortcode($content);
    }

    public static function login_redirect($redirect_to, $requested, $user) {
        if ($user instanceof WP_User && user_can($user, self::CAP)) {
            return self::portal_url();
        }
        return $redirect_to;
    }

    public static function logout_redirect() {
        wp_safe_redirect(self::login_url());
        exit;
    }

    private static function login_url() {
        return home_url(self::LOGIN_PATH);
    }

    private static function portal_url() {
        return home_url(self::PORTAL_PATH);
    }
}

register_activation_hook(__FILE__, ['ANG_Agent_Access', 'activate']);
ANG_Agent_Access::boot();
