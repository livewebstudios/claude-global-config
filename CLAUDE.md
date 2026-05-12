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

### CUSTOM LOGIN PAGE — REQUIRED WHEN DECAP IS INCLUDED

When a build includes Decap CMS, the `admin/index.html` MUST use the
LWS custom branded login page — NOT the Decap default.

The master template lives at:
https://github.com/livewebstudios/claude-global-config/blob/main/index.html

**Per-client customization — one change only:**
Change the `<title>` tag to: `Site Admin — [Client Name]`
Everything else stays exactly as-is.

**Images are hotlinked — do not copy image files into the project:**
- Logo: `https://livewebstudios.com/hlink/logofaceFINAL.png`
- Badge: `https://livewebstudios.com/hlink/verifiedsecured.jpg`

**When to include:** Only when INSTRUCTIONS.md flags `DECAP CMS: Yes`.
Do not create an `admin/` folder or `admin/index.html` on non-CMS builds.
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

## 🔒 UI/UX PRO MAX — MUST-DO BEFORE DEPLOYING TO CLIENT

Before sending any build to the client (preview link, zip, staging URL, or production
deploy), run the **UI/UX Pro Max** skill against the project. It is the final
accessibility / interaction-layer audit and catches the issues the four Impeccable
passes do not — focus rings, keyboard nav, touch-vs-hover dropdowns, ARIA live regions,
contrast at the 4.5:1 boundary, and industry-pattern alignment for the project's
vertical (home services / SaaS / e-commerce / etc.).

**How to run it:**

```bash
# Generate a fresh design-system recommendation for the project's vertical
python3 <skill-path>/src/ui-ux-pro-max/scripts/search.py "<vertical keywords>" --design-system -p "<Client Name>"

# Then audit the actual build against UX guidelines
python3 <skill-path>/src/ui-ux-pro-max/scripts/search.py "accessibility contrast" --domain ux
python3 <skill-path>/src/ui-ux-pro-max/scripts/search.py "hover focus keyboard navigation" --domain ux
```

Map the findings to the build, fix any P0/P1 gaps, and only then ship to the client.

**This is non-negotiable. No client preview link goes out without a Pro Max pass.**

If the skill folder is not in the project, ask Jon for the location — it is normally in
the project root or a sibling folder named `ui-ux-pro-max-skill-*`.

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

## DEFAULT .gitignore — ADD TO EVERY NEW PROJECT

Every new website build must include a `.gitignore` file in the project root.
Create it automatically at the start of every build if it doesn't exist.

Contents:

```gitignore
# Windows
desktop.ini
Thumbs.db
ehthumbs.db
$RECYCLE.BIN/

# Mac
.DS_Store
.AppleDouble
.LSOverride

# Claude Code
*.log
.claude/
```

*Live Web Studios — Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
