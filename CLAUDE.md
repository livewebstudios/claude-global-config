# LIVE WEB STUDIOS — GLOBAL BUILD RULES
## Jon Wolf | Owner | Est. 2004 | livewebstudios.com
## Place this file at: ~/.claude/CLAUDE.md

---

## ⚠️ PATH RULE — HARD STOP — NO EXCEPTIONS

ALWAYS use relative paths for ALL internal asset references.

| Context | CORRECT | WRONG |
|---|---|---|
| CSS link | `css/style.css` | `/css/style.css` |
| Subfolder CSS | `../css/style.css` | `/css/style.css` |
| Image | `images/photo.jpg` | `/images/photo.jpg` |
| JS | `js/nav.js` | `/js/nav.js` |
| Any internal asset | `relative/path` | `https://domain.com/...` |

**Before outputting any file:** mentally grep for `href="/"` and `src="/"`.
If found — fix to relative before continuing. Do not ask. Just fix.

**Why this matters:** LWS sites move hosts 2–3 times before client approval.
Root-relative and absolute internal paths break on every move. This is non-negotiable.

---

## LOGO RULE — HARD STOP

Always implement as:
```html
<img src="images/logoRGB.png" alt="[Client Name]">
```
NEVER as a CSS grid, div construction, or background-image.
Verify with grep before packaging any zip.

---

## FOOTER BADGE RULE — HARD STOP

Every site footer must include:
```html
<a href="https://livewebstudios.com">
  <img src="images/verifiedsecured.png" alt="Verified & Secured by Live Web Studios">
</a>
```
No exceptions unless Jon explicitly says otherwise in this session.

---

## NAV TEXT RULE — HARD STOP

ALL navigation link text — top nav, sub-menus, mobile menu — must be in **ALL CAPS / uppercase**.
No exceptions. No title case. No mixed case.

---

## PAGE BUILD REQUIREMENTS — EVERY PAGE, EVERY TIME

- Mobile-first, fully responsive
- Semantic HTML5: `<section>` `<nav>` `<header>` `<footer>` `<main>` `<article>`
- Single `<h1>` only per page
- All meta tags, JSON-LD schema, and Open Graph tags included
- Contact form via Formspree (default) — Tally or Netlify Forms only if Jon specifies
- Google Analytics 4 snippet placeholder on every page
- CSS custom properties (variables) for all colors and fonts — no hardcoded values
- No inline styles
- No JavaScript frameworks — vanilla JS only when needed
- Sticky navigation
- Footer: address, phone, email, copyright, internal links, LWS badge
- Fast loading — no unnecessary assets

---

## FILE DELIVERY RULES

- Relative paths only — verified before packaging (see above)
- Zips extract flat — no wrapper subfolder — root-relative structure only
- Send only changed files when 1–2 files changed — not a full-site zip
- File naming: `yy_mn_dy_clientname_deliverable` (e.g., `26_04_21_bline_homepage.html`)
- All downloads save to Desktop — never the Downloads folder

---

## NAV INJECTION RULE

When using a shared JS nav injector, always strip existing headers/footers FIRST.
Remove: `.top-bar` `.site-header` `.footer-wave` `.site-footer`
"Skip if exists" logic causes double-rendering bugs. Strip, then inject. Always.

---

## SERVER PERMISSIONS (post-deploy to KH VPS)

Run after every SCP deploy:
```bash
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
```
KH VPS defaults to 0600 after upload. This is required every time.
Note: `cp` is aliased to `cp -i` on KH — use `\cp -rf` to bypass.

---

## LITESPEED CACHE-BUSTING

Rename files to force cache bypass (e.g., `nav.js` → `nav2.js`).
Never assume a non-updating file is a code problem before ruling out LiteSpeed cache.

---

## CMS SCOPE (DECAP CMS)

- Clients manage blog posts only via `/admin/`
- Jon manages all page-level edits
- Collections defined in `config.yml` — Netlify Identity handles auth

---

## PRE-LAUNCH SEO AUDIT — REQUIRED BEFORE CLIENT DELIVERY

Confirm all of the following before flagging any site as ready:

- [ ] Each page has a unique title tag (under 60 chars) and meta description (under 155 chars)
- [ ] One H1 per page only
- [ ] Schema markup (JSON-LD) present and correct on every page
- [ ] Internal linking logical and complete
- [ ] All images have descriptive alt text
- [ ] sitemap.xml exists or generation instructions provided
- [ ] robots.txt is correct
- [ ] No duplicate content across pages
- [ ] Google Analytics 4 wired up (placeholder minimum)
- [ ] Google Search Console submission instructions provided

Flag anything missing. Do not mark build complete until this list is clean.

---

## ✅ POST-BUILD QA — IMPECCABLE PASSES — REQUIRED BEFORE ANY DELIVERY

After all pages are built, the following four Impeccable passes are required in this order.
**Do NOT package a zip or mark a build complete until all four are done.**
If they haven't been run in this session, remind Jon before wrapping up.

```
1. /polish    — copy tightening, grammar, spacing, tone consistency
2. /colorize  — contrast ratios, brand color consistency across all elements
3. /layout    — spacing, alignment, responsive integrity, visual hierarchy
4. /animate   — entrance animations, scroll triggers, micro-interactions
```

These are not optional. They are part of what "done" means at Live Web Studios.

---

## STAGING & GO-LIVE CONVENTION

- Go-live = move files to public root + global find-replace of all path prefixes
- For Netlify deploys: find-replace all `/newsite/` prefixes across `.html` and `.js` before pushing

---

## HOSTING REFERENCE

- **KH VPS:** `root@158.106.145.226` port `2200` | WHM at port `2087`
- **Netlify static IP (apex A record):** `75.2.60.5` — permanent
- **Netlify www:** CNAME to `{site-name}.netlify.app`
- **GitHub username:** `livewebstudios`
- **Formspree:** use `_next` hidden field for thank-you redirect (bypasses branding on free plan)

---

*Live Web Studios — Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
