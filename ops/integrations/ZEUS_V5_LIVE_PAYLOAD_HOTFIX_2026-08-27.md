# ZEUS V5 — live payload hotfix

## Evidence

GitHub Actions run `33113378016` reached the published V5 gateway with valid ephemeral GitHub authentication, but n8n returned `HOLD_MISSING_IMAGE_URL`.

A hardened second run `33113486049` duplicated `image_url`, `format`, `caption`, `page_name`, `brand` and `queue_id` at both envelope and payload levels; n8n still returned `HOLD_MISSING_IMAGE_URL`.

Therefore the blocker is no longer GitHub secret, endpoint reachability, media reachability, payload file, or GitHub authentication. The live n8n workflow is losing/reading the publication payload incorrectly after authorization.

## Required live n8n correction

Workflow: `FzQQYBrgzo2wU8bm`

Do not use: `n5MIoBQbV5DpWp7H`.

### Node `Meta — Selecionar Página`

Source the authorized payload directly from `Extrair envelope GitHub`, not from an intermediate HTTP result:

```js
const e = $('Extrair envelope GitHub').first().json;
const p = e.payload || {};
const pages = $json.data || [];
const wanted = String(p.page_name || p.brand || '').toLowerCase();
const page = pages.find(x => String(x.name || '').toLowerCase().includes(wanted)) || pages[0];
if (!page) return [{json:{request_id:e.request_id,status:'META_PAGE_NOT_FOUND',payload:p}}];
return [{json:{request_id:e.request_id,payload:p,page_id:page.id,page_name:page.name,page_access_token:page.access_token}}];
```

### Node `Instagram — Preparar formato`

Read the publication payload directly from the original envelope, while using the selected page only for page token metadata:

```js
const env = $('Extrair envelope GitHub').first().json;
const selected = $('Meta — Selecionar Página').first().json;
const ig = $json.instagram_business_account || {};
const p = env.payload || {};
if (!ig.id) return [{json:{request_id:env.request_id,status:'INSTAGRAM_BUSINESS_ACCOUNT_NOT_FOUND'}}];
return [{json:{
  request_id:env.request_id,
  instagram_business_account_id:ig.id,
  username:ig.username || '',
  page_access_token:selected.page_access_token,
  format:String(p.format || 'feed_4x5'),
  image_url:String(p.image_url || ''),
  image_urls:Array.isArray(p.image_urls) ? p.image_urls : [],
  caption:String(p.caption || '')
}}];
```

## Gate after hotfix

Execute only `CURADORIA_ANG_AGOSTO_FEED`.

Success requires `PUBLISHED` plus non-empty `publication_id`. No Story/Carousel until this passes. No retry loop.
