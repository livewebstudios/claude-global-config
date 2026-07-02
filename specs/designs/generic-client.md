# GENERIC CLIENT — design spec
## Location: ~/.claude/specs/designs/generic-client.md
## Applies to: default fallback for any LWS small-business AI Platformed build with no
## client-specific design file of its own. This is the starting template, not a finished
## look, adapt the accent color and photography to the client's trade before shipping.

---

## Concept

Most of the roster (see `clients.md`) is local trade and professional services: plumbers,
electricians, architects, counselors, insurance, legal, construction. None of them need a bold
creative concept, they need a fast, clean, credible site that reads as "this business has its
act together" in under five seconds. This spec is the load-bearing default, `lws-dark.md` and
per-client files are the exceptions that override it.

## Visual direction

- Light base, high contrast, one accent color pulled from the client's existing brand (logo,
  truck wrap, signage) if one exists. If none exists, ask, don't invent one silently, this is a
  genuine decision fork per Jon's working style.
- Photography over illustration wherever the client can supply real photos (their own work,
  their own team, their own storefront). Stock photography only as a last resort, and flagged as
  a placeholder to swap.
- No dark hero video by default, that's the `lws-dark.md` signature, not the baseline. Static
  hero image or simple color block is the safe default here.

## Structure (baseline, adapt per client)

1. Hero: one-line value prop naming the trade and the service area, phone number visible above
   the fold, single clear CTA.
2. Services grid: 3 to 6 cards, plain language, no "comprehensive solutions."
3. About: first-person or business-voice depending on relationship warmth (see `clients.md`
   Voice Tone field), short, credibility-forward (years in business, license/certification if
   relevant), no corporate bio padding.
4. Social proof: testimonials or review snippets if the client has them. Real names, real
   businesses, no anonymized quotes.
5. Local SEO block: service area named explicitly, primary city plus 2-3 surrounding towns per
   `seo-standards.md`.
6. Closing CTA: phone number as a tappable link, plus a contact form. Never bury the phone
   number below a form.
7. Footer: standard LWS "Powered by Live Web Studios" credit per the `powered-by` skill.

## Voice

Mode B from `jon_voice_master.md`, full strength. Pull the specific tone from the client's
`clients.md` Voice Tone field (Formal, Warm/Casual, Direct/Peer, Very Casual) and calibrate
against that, this file sets structure, `clients.md` and `jon_voice_master.md` set register.

JSON-LD: default `LocalBusiness`, override per the vertical mapping table in `seo-standards.md`.

## When NOT to use this file

Any client with its own file in `specs/designs/` (currently `mas-architect.md`,
`british-invasion.md`) uses that instead. This file is the fallback for everyone else, and the
starting point if a new per-client design file gets written later.
