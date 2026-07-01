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

**Exception — canonical tags only:** `<link rel="canonical">` requires the full absolute
HTTPS URL. This is the ONE place an absolute URL is correct in the `<head>`.

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

## FORBIDDEN COPY PHRASES — HARD STOP

Never write these in any page copy, CTA, button, or form label:

- "Submit" → use "Send" or a contextual verb ("Get My Quote", "Let's Talk")
- "Click Here" → use descriptive anchor text only
- "Learn More" (as a bare CTA with no context) → name what they're learning
- "Don't hesitate to reach out" → delete entirely
- "Schedule a free consultation" → use "Let's talk." or "Call me."

**Preferred CTAs:** "Let's talk." / "Reach out." / "Call me." / "We should talk about this."

---

## PAGE BUILD REQUIREMENTS — EVERY PAGE, EVERY TIME

- Mobile-first, fully responsive
- Semantic HTML5: `<section>` `<nav>` `<header>` `<footer>` `<main>` `<article>`
- Single `<h1>` only per page
- Heading hierarchy must cascade: H1 → H2 → H3. No skipped levels. Ever.
- All meta tags, JSON-LD schema, and Open Graph tags included (see SEO section for specs)
- `<meta name="viewport" content="width=device-width, initial-scale=1">` on every page
- Contact form via Formspree (default) — Tally or Netlify Forms only if Jon specifies
- Google Analytics 4 snippet placeholder on every page
- CSS custom properties (variables) for all colors and fonts — no hardcoded values
- No inline styles
- No JavaScript frameworks — vanilla JS only when needed
- Sticky navigation
- Footer: address, phone, email, copyright, internal links, LWS badge
- Fast loading — no unnecessary assets

---

## IMAGE OPTIMIZATION — EVERY BUILD

Run before final delivery. No exceptions.

- Max width: 1600px
- JPG quality: 82
- PNG: lossless
- Strip metadata
- Skip files under 100kb
- Print before/after size report in terminal

Every `<img>` tag must include:
- `alt` attribute (descriptive, not filename)
- `width` and `height` attributes (prevents layout shift / CLS)
- `loading="lazy"` on all images **except** the hero/above-fold image

Hero image gets:
```html
<link rel="preload" as="image" href="images/hero.jpg"> <!-- in <head> -->
```

---

## SEO — TECHNICAL REQUIREMENTS — EVERY PAGE

### HEAD BLOCK — REQUIRED ELEMENTS (in this order)

```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>[Page-Specific Title — under 60 chars]</title>
<meta name="description" content="[Unique description — under 155 chars]">
<link rel="canonical" href="https://[domain.com/page-slug]">

<!-- Open Graph -->
<meta property="og:title" content="[Page Title]">
<meta property="og:description" content="[Page description]">
<meta property="og:image" content="https://[domain.com/images/og-image.jpg]">
<meta property="og:url" content="https://[domain.com/page-slug]">
<meta property="og:type" content="website">

<!-- JSON-LD Schema (see below for type requirements) -->
<script type="application/ld+json">...</script>

<!-- GA4 placeholder -->
<!-- GA4: replace G-XXXXXXXXXX -->
```

**og:image minimum dimensions: 1200×630px.** If none exists, note it for Jon. Do not omit the tag.

### CANONICAL TAG — REQUIRED ON EVERY PAGE

```html
<link rel="canonical" href="https://[full-absolute-url-of-this-page]">
```
This is the ONLY place in the codebase where an absolute URL is correct and required.
Fill the real domain once it's known. Use a placeholder comment if domain is TBD:
`<!-- CANONICAL: update to https://clientdomain.com/page-slug before go-live -->`

### JSON-LD SCHEMA — TYPE REQUIREMENTS

Default schema type for LWS clients: **LocalBusiness**

Required fields — always include all of these:
```json
{
  "@context": "https://schema.org",
  "@type": "[BusinessType]",
  "name": "[Business Name]",
  "url": "https://[domain.com]",
  "telephone": "[phone]",
  "email": "[email]",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "[street]",
    "addressLocality": "[city]",
    "addressRegion": "[state abbreviation]",
    "postalCode": "[zip]",
    "addressCountry": "US"
  },
  "areaServed": ["[Primary City]", "[City 2]", "[City 3]"],
  "description": "[One sentence about the business]"
}
```

**@type by client vertical:**
- Plumber → `Plumber`
- Electrician → `Electrician`
- General contractor → `GeneralContractor`
- Architect → `Architect`
- Counselor / therapist → `MedicalBusiness` or `LocalBusiness`
- Law firm → `LegalService`
- Logistics / transport → `LocalBusiness`
- Church → `Church`
- Default / everything else → `LocalBusiness`

Add `ServiceArea` and `hasMap` when address and service region are known.

### CONTENT SEO — RULES PER PAGE

- Primary keyword appears in: H1, opening paragraph (first 100 words), at least one H2
- Internal link anchor text must describe the destination topic — never "click here" or "read more"
- Service-area clients: primary city + at least 2 surrounding towns named naturally in body copy
- No keyword stuffing — integrate naturally

### SITEMAP CONVENTION

- Include content pages only (exclude thank-you pages, intake forms, admin routes)
- Hub/main service page priority: `0.90`
- Child/supporting pages priority: `0.80`
- No trailing slash on URLs
- `changefreq`: monthly for most pages, weekly for blog

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

## STAGING & GO-LIVE CONVENTION

- Go-live = move files to public root + global find-replace of all path prefixes
- For Netlify deploys: find-replace all `/newsite/` prefixes across `.html` and `.js` before pushing

---

## CMS SCOPE (DECAP CMS)

- Clients manage blog posts only via `/admin/`
- Jon manages all page-level edits
- Collections defined in `config.yml` — Netlify Identity handles auth
- **Always use file collections (single JSON file), never folder/markdown collections.**
  File collections write directly to one JSON file; Netlify redeploys in ~30 seconds.
  Folder collections require a GitHub Action — fragile, skip it entirely.

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

**Netlify Identity widget** must be present on `index.html` BEFORE the client clicks
any invitation link. Missing it breaks the auth flow entirely.

**When to include:** Only when INSTRUCTIONS.md flags `DECAP CMS: Yes`.
Do not create an `admin/` folder or `admin/index.html` on non-CMS builds.

### DECAP RENDERER PATTERN

Each renderer fetches `_content/[collection].json` directly. Renderers must:
1. Use `fetch()` with `?v=Date.now()` cache-bust
2. Call `window.LWS.observe(el)` after `appendChild()` with `.classList.add('visible')` fallback
3. Use correct CSS class names matching the existing `style.css` — verify class names before writing renderer

### ANIMATIONS + DYNAMIC CONTENT

`animations.js` IntersectionObserver never fires on dynamically inserted elements.
Fix: `animations.js` must expose `window.LWS.observe(el)`.
Every renderer (blog.js, portfolio.js, team.js) must call `window.LWS.observe(card)` after insertion.

---

## PRE-LAUNCH SEO AUDIT — REQUIRED BEFORE CLIENT DELIVERY

Confirm all of the following before flagging any site as ready:

- [ ] Each page has a unique title tag (under 60 chars) and meta description (under 155 chars)
- [ ] One H1 per page only
- [ ] Heading hierarchy cascades correctly (H1 → H2 → H3, no skipped levels)
- [ ] `<link rel="canonical">` present with correct absolute URL on every page
- [ ] `<meta name="viewport">` present on every page
- [ ] JSON-LD LocalBusiness schema present with all required fields on every page
- [ ] og:image specified and at least 1200×630px
- [ ] Internal linking logical and complete — anchor text is descriptive (no "click here")
- [ ] All images have descriptive alt text + width/height attributes
- [ ] Hero image has `<link rel="preload">` in `<head>`
- [ ] All non-hero images have `loading="lazy"`
- [ ] Primary keyword in H1, opening paragraph, and at least one H2
- [ ] Service-area copy includes primary city + surrounding towns
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
Each pass has a slash command in `~/.claude/commands/` (synced from this repo). If a
command isn't installed on this machine, execute the pass by following its checklist below.

### 1. /polish — COPY, GRAMMAR, TONE

- Proofread every visible string: spelling, grammar, punctuation.
- Enforce FORBIDDEN COPY PHRASES — replace with a preferred CTA.
- Voice: run copy through Jon's voice (the `jonvoice` skill) — no generic marketing filler,
  no corporate-speak, no templated CTA language.
- No placeholder/lorem-ipsum text left anywhere.
- Consistency: business name, phone format, email, and address spelled identically on every page.
- Typography hygiene: no double spaces, consistent em-dash / en-dash use, consistent quote style.
- Nav link text is ALL CAPS (cross-check NAV TEXT RULE).
- Headings read as real hierarchy, not keyword stuffing.

### 2. /colorize — CONTRAST & BRAND COLOR

- All colors come from CSS custom properties — grep for hardcoded hex/rgb and replace.
- Contrast: body text ≥ 4.5:1, large text (≥24px or 19px bold) ≥ 3:1, UI/icons/borders ≥ 3:1.
- Verify contrast on EVERY background: light sections, dark sections, image overlays, buttons.
- Brand palette used consistently across buttons, links, headings, accents, icons.
- Hover / focus / active / disabled states stay on-palette AND still pass contrast.
- Links are visually distinct from body text (not color alone — add underline/weight).
- No accidental pure-black-on-pure-white unless intended.

### 3. /layout — SPACING, ALIGNMENT, RESPONSIVE

- Consistent spacing scale via variables; even vertical rhythm between sections.
- Alignment: shared grid, no orphaned or misaligned elements, optical centering where needed.
- Responsive check at 320 / 375 / 768 / 1024 / 1440px — no horizontal scroll, no overflow, no clipping.
- Tap targets ≥ 44×44px on mobile; adequate spacing between them.
- Visual hierarchy: H1 > H2 > H3 sizing is obvious; clear separation between sections.
- Every image has width/height set (CLS); confirm no layout shift on load.
- Sticky nav never overlaps or hides content; anchor-scroll offsets account for it.
- Footer complete (address, phone, email, copyright, internal links, LWS badge) and aligned.

### 4. /animate — MOTION & MICRO-INTERACTIONS

- Section entrance animations wired via IntersectionObserver.
- `window.LWS.observe(el)` called for any dynamically inserted content (cross-check DECAP RENDERER PATTERN).
- Scroll-triggered reveals are smooth — no jank, no layout shift from animation.
- Micro-interactions present: button hover, link underline/slide, card lift/shadow.
- `prefers-reduced-motion: reduce` respected — animations disabled or minimized.
- Transition timing and easing consistent across the site via variables.
- No infinite/distracting loops; nothing animates above-the-fold content out of view on load.

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

## HOSTING REFERENCE

- **KH VPS:** `root@158.106.145.226` port `2200` | WHM at port `2087`
- **Netlify static IP (apex A record):** `75.2.60.5` — permanent
- **Netlify www:** CNAME to `{site-name}.netlify.app`
- **GitHub username:** `livewebstudios`
- **Formspree:** use `_next` hidden field for thank-you redirect (bypasses branding on free plan)
- **Formspree honeypot:** include `<input type="text" name="_gotcha" style="display:none">` on every form

---

## DEFAULT .gitignore — ADD TO EVERY NEW PROJECT

Every new website build must include a `.gitignore` file in the project root.
Create it automatically at the start of every build if it doesn't exist.

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

---

## SESSION RULES

- Maximum 6 tasks per Claude Code session. Start a fresh session for new phases.
- Paste relevant context from previous session when starting fresh.
- Long sessions degrade output quality. Hard stop at 6.

---

*Live Web Studios — Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
