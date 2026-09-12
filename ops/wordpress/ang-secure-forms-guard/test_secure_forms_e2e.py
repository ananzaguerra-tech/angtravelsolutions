#!/usr/bin/env python3
import re, sys, time
from urllib.parse import urljoin
import requests

base = (sys.argv[1] if len(sys.argv) > 1 else 'https://angtravelsolutions.com.br').rstrip('/') + '/'
page_url = urljoin(base, 'fale-conosco/')
s = requests.Session()
r = s.get(page_url, timeout=20)
r.raise_for_status()
html = r.text

def hidden(name):
    m = re.search(r'name=["\']%s["\'][^>]*value=["\']([^"\']*)' % re.escape(name), html, re.I)
    if not m:
        m = re.search(r'value=["\']([^"\']*)["\'][^>]*name=["\']%s["\']' % re.escape(name), html, re.I)
    if not m:
        raise RuntimeError('missing field: ' + name)
    return m.group(1)

endpoint = urljoin(base, 'wp-admin/admin-post.php')
common = {
    'action': 'ang_secure_form',
    'ang_form_type': hidden('ang_form_type'),
    'ang_subject': hidden('ang_subject'),
    'ang_secure_form_nonce': hidden('ang_secure_form_nonce'),
    'ang_started_at': str(int(time.time()) - 5),
    'ang_name': 'ANG QA',
    'ang_email': 'qa@example.com',
    'ang_message': 'Teste controlado de validação.',
    'ang_consent': '1',
    'ang_website': '',
}

def post(label, overrides, expect_success):
    data = dict(common); data.update(overrides)
    x = s.post(endpoint, data=data, allow_redirects=False, timeout=20)
    loc = x.headers.get('Location', '')
    ok = 'ang_form_status=success' in loc
    passed = (ok == expect_success)
    print(f'{label}: status={x.status_code} location={loc} PASS={passed}')
    if not passed: raise SystemExit(2)

post('honeypot', {'ang_website':'bot'}, False)
post('invalid_email', {'ang_email':'not-an-email'}, False)
post('missing_consent', {'ang_consent':''}, False)
post('too_fast', {'ang_started_at':str(int(time.time()))}, False)
post('valid', {}, True)
print('SECURE_FORMS_E2E=PASS')
