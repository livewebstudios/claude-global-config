# MAS ARCHITECT — design spec
## Location: ~/.claude/specs/designs/mas-architect.md
## Source: https://mas-architect.netlify.app/ (canonical: mas-architect.net) — pulled live 26_07_02
## Client: MAS Architect, East Rutherford NJ. Contact: Mark. See clients.md for roster entry.
## Applies to: MAS Architect site work, and as a reference template for other architecture/
## construction-adjacent LWS clients (Ives Architecture, WJG Architects, MBS NJ).

---

## Concept

"Rebuilding Neighborhoods, One House at a Time." Warm-professional, craft-and-listening framed,
not a glossy starchitect portfolio. 35+ years, 250+ projects, residential and commercial both.

## Visual direction

- Theme color (confirmed from live meta tag): `#262261` — deep indigo/navy. Use as primary
  accent. Pair with white/off-white space and warm photography, not a cold corporate palette.
- Hero: full-bleed golden-hour photo of a completed home, not a rendering. Photography-led, not
  illustration-led.
- Numbered section pattern throughout: "01 What We Do," "02 Selected Work," "03 Planbooks," "04
  Who We Are," "05 Testimonials," "06 Journal." Reuse this numbered-section convention, it reads
  as a deliberate portfolio walkthrough rather than a stacked list of homepage blocks.

## Structure (confirmed from live page)

1. Hero: tagline + one-line description + dual CTA ("View Our Work" / "Start a Project") + a
   credibility stat line ("35+ Years · 250+ Projects").
2. Six-service icon grid: Residential, Commercial, Renovations & Additions, Interior Design,
   Consulting & Planning, Sustainable Design.
3. Selected Work: photo-card portfolio grid, each card names the project type, bed count, and
   town (Belleville, Hasbrouck Heights, etc.) — local SEO signal embedded directly in the card
   caption, not just alt text.
4. Planbooks section: pre-designed 3/4/5-bedroom plans as a productized offering, distinct from
   custom work. Worth flagging as a pattern for other clients who sell a mix of custom and
   templated work.
5. "Who We Are" narrative block with a single supporting photo.
6. Stat counters: Completed Projects / Years of Experience / Client Satisfaction / Communities
   Served (animated counters on the live site, currently rendering as 0+ in static fetch).
7. Testimonials: three short client quotes, each attributed with first name + company. Direct
   contractor and builder-partner quotes, not homeowner-only.
8. Journal (blog): confirmed live posts include AI-in-architecture content ("How AI Is Changing
   Architectural Visualization") — this client's blog already leans into the same AI-forward
   positioning LWS uses generally. Good venue for cross-referencing AI Platformed language if
   Jon ever wants to draw that thread.
9. Closing CTA: "Let's build something lasting."

## Voice

Mode B (web copy) from `jon_voice_master.md`, architecture-register: confident, craft-forward,
client-listening emphasis. "We design spaces that are functional and inspiring, listening
closely, drafting precisely, and building work that stands the test of time" is the anchor
sentence for tone, professional without being stiff, sensory without being flowery.

JSON-LD: use `@type: Architect` per `seo-standards.md`'s vertical mapping. Service area: East
Rutherford plus Bergen County towns shown in the portfolio (Belleville, Hasbrouck Heights).
