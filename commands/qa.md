---
description: Full Live Web Studios pre-delivery QA. Runs the pre-launch SEO audit, the four Impeccable passes (polish, colorize, layout, animate) in order, then UI/UX Pro Max, reading every criterion from specs/qa-checklist.md. Self-contained so a same-named CLI skill cannot shadow it.
---

# /qa: Live Web Studios pre-delivery QA run

Run the complete LWS QA sequence on the current build before any client delivery. Report pass/fail on every step. Do not declare the build ready until the whole sequence is clean.

## Source of truth

Load `~/.claude/specs/qa-checklist.md` and use ITS criteria for every step below.

**Do NOT invoke the standalone `/polish`, `/colorize`, `/layout`, or `/animate` commands or any skill of those names.** Read each pass definition out of `qa-checklist.md` and execute it inline. This keeps the run identical on Mac and Windows, and stops any CLI-installed skill of the same name (for example a borrowed impeccable verb) from shadowing the intended pass.

## Sequence (in order, do not skip a step)

1. **Pre-launch SEO audit.** Run the full checklist from `qa-checklist.md` against every page. Report each failing item with the file and line. Fix what is safely fixable, list what needs Jon.
2. **Pass 1: polish.** Copy tightening, grammar, spacing, tone consistency. (Criteria per `qa-checklist.md`.)
3. **Pass 2: colorize.** Contrast ratios, brand color consistency across all elements.
4. **Pass 3: layout.** Spacing, alignment, responsive integrity, visual hierarchy.
5. **Pass 4: animate.** Entrance animations, scroll triggers, micro-interactions.
6. **UI/UX Pro Max.** The final accessibility / interaction audit per `qa-checklist.md`: focus rings, keyboard nav, touch-vs-hover dropdowns, ARIA live regions, contrast at the 4.5:1 boundary, and vertical-appropriate patterns. Fix P0/P1 gaps.
7. **Hard-stop grep.** Final pass for the two CLAUDE.md hard stops:
   - Em dash scan: search all output for the em dash character (U+2014). Must be zero.
   - Path grep: search for `href="/"` and `src="/"` and any `https://<own-domain>/` internal asset reference. Must be zero (the only allowed absolute internal URL is `<link rel="canonical">`).
   - Logo grep: confirm the logo is `<img src="images/logoRGB.png" ...>`, not a div/background construction.
   - Nav grep: confirm all nav link text is ALL CAPS.

## Output

A checklist-style report: each of the seven steps, pass or fail, the specific fixes applied, and anything still open that needs Jon. State the time to check back if any long pass (image optimization, Pro Max search) is still running. **Do not mark the build complete or package a zip until every step is clean.**

---

*Live Web Studios, Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
