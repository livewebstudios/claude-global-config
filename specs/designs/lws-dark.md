# LWS DARK — design spec
## Location: ~/.claude/specs/designs/lws-dark.md
## Source: https://livewebstudios.com (pulled live 26_07_02)
## Applies to: Live Web Studios' own site, and any build where Jon wants the flagship AI Platformed look, not a client-specific theme.

---

## Concept

The theatrical metaphor carries the whole site: "Every site we launch is opening night." Dark,
cinematic staging, not corporate-agency polish. This is the reference build, the one that proves
what AI Platformed looks like when Jon builds it for himself.

Video hero, not a static image. Curtain imagery in the storytelling section reinforces the
opening-night line literally.

---

## Visual direction

- Dark base palette. Cinematic, not techy-dark. Think stage lighting, not terminal green.
- Exact hex values not yet extracted from live CSS. Placeholder until confirmed:
  `<!-- COLOR: pull real hex values from livewebstudios.com computed styles before reuse -->`
- Full-bleed hero video (`hero-1080.mp4`), autoplay, no controls clutter.
- Logo has an inverted-color variant for the dark footer (`Inverted_Color.png`), confirms the
  palette is genuinely dark-first, not a light site with a dark section bolted on.

## Structure (confirmed from live page)

1. Hero: video background, one-line value prop, two CTAs ("Let's talk", "See the work").
2. Scrolling service ticker: 13 services in a marquee-style repeating strip (Web Hosting, Website
   Design, AI Automation, SEO Optimization, E-Commerce, Logo & Brand Identity, Custom Graphics &
   Animation, Site Maintenance, Content Strategy, Monthly SEO & Keyword Reporting, Domain
   Registration, Social Media, Performance Audits).
3. Six-card service grid, one flagged "New" (AI Platformed Websites).
4. Personal "who you're working with" section. First person, photo of Jon, plumber-origin story
   in miniature. This is the About-page Mode B pattern from `jon_voice_master.md` applied at
   homepage scale.
5. Curtain image + "every site we launch is opening night" as a standalone brand statement block.
6. Closing CTA with phone number rendered as a real tappable link.
7. Cross-sell to the musician sub-brand: "Live Band Web Studios" for bands and solo artists.
   Worth noting as a pattern: LWS cross-promotes its music-vertical offshoot right on the main
   site footer-adjacent block.

## Voice on this site

Pure Mode B from `jon_voice_master.md`, tightened. Real lines from the live copy:

- "Not an agency of 40. Not a platform. Just me."
- "My number's on the website. I pick up."
- "No soft launches. No 'we'll fix it after.'"

No filler, no "comprehensive solutions" language anywhere on the page. Matches the kill-list.

## When to use this spec

This is the LWS self-referential build, not a generic client fallback. Use `generic-client.md`
for actual client work. Pull from here only when the ask is literally "make it feel like the LWS
site" or when building something in the Live Web Studios / Live Band Web Studios family.
