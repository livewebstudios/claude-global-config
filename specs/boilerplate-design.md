# BOILERPLATE / DESIGN (spec)
## Location: ~/.claude/specs/boilerplate-design.md
## Applies to: every website build. Loaded when a task involves page build, HTML structure, images, file delivery, nav injection, LiteSpeed, or .gitignore.

---

## PAGE BUILD SPEC: EVERY PAGE

- Semantic HTML5. One H1 per page.
- Heading hierarchy must cascade: H1 -> H2 -> H3. No skipped levels, ever.
- All meta tags, JSON-LD schema, and Open Graph tags included (see `seo-standards.md`).
- `<meta name="viewport" content="width=device-width, initial-scale=1">` on every page.
- Contact form via Formspree (default). Tally or Netlify Forms only if Jon specifies.
- Google Analytics 4 snippet placeholder on every page.
- CSS custom properties (variables) for all colors and fonts. No hardcoded values.
- No inline styles.
- No JavaScript frameworks. Vanilla JS only when needed.
- Sticky navigation.
- Footer: address, phone, email, copyright, internal links, LWS badge.
- Fast loading. No unnecessary assets.

---

## IMAGE OPTIMIZATION: EVERY BUILD

Run before final delivery. No exceptions.

- Max width: 1600px.
- JPG quality: 82.
- PNG: lossless.
- Strip metadata.
- Skip files under 100kb.
- Print before/after size report in terminal.

Every `<img>` tag must include:
- `alt` attribute (descriptive, not filename).
- `width` and `height` attributes (prevents layout shift / CLS).
- `loading="lazy"` on all images **except** the hero / above-fold image.

Hero image gets:
```html
<link rel="preload" as="image" href="images/hero.jpg"> <!-- in <head> -->
```

---

## FILE DELIVERY RULES

- Relative paths only. Verified before packaging (see the path hard-stop in CLAUDE.md).
- Zips extract flat. No wrapper subfolder. Root-relative structure only.
- Send only changed files when 1-2 files changed. Not a full-site zip.

---

## NAV INJECTION RULE

When using a shared JS nav injector, always strip existing headers/footers FIRST.
Remove: `.top-bar` `.site-header` `.footer-wave` `.site-footer`.
"Skip if exists" logic causes double-rendering bugs. Strip, then inject. Always.

---

## LITESPEED CACHE-BUSTING

Rename files to force cache bypass (e.g., `nav.js` -> `nav2.js`).
Never assume a non-updating file is a code problem before ruling out LiteSpeed cache.

---

## HOSTING REFERENCE

- GitHub username: `livewebstudios`.
- Formspree: use `_next` hidden field for thank-you redirect (bypasses branding on free plan).
- Formspree honeypot: include `<input type="text" name="_gotcha" style="display:none">` on every form.

---

## DEFAULT .gitignore: ADD TO EVERY NEW PROJECT

Every new website build must include a `.gitignore` in the project root. Create it
automatically at the start of every build if it does not exist.

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

*Live Web Studios, Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
