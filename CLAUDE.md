# LIVE WEB STUDIOS: GLOBAL RULES
## Jon Wolf | Owner | Est. 2004 | livewebstudios.com
## Location: ~/.claude/CLAUDE.md

This file is a table of contents plus hard-stop rules only. Every detailed spec
lives in a referenced file under ~/.claude/specs/ and loads on demand. Do not
paste build details, SEO specs, or QA checklists back into this file.

**LINE CEILING: keep this file under ~120 lines. Target ~100. Anything longer gets
extracted to a spec.** The ceiling is the point. It stops this file from becoming a
monolith again.

---

## HARD STOPS: NO EXCEPTIONS

### PATH RULE
ALWAYS use relative paths for ALL internal asset references. `css/style.css` not
`/css/style.css`. `../images/photo.jpg` from a subfolder, never `/images/...` or a
full `https://domain.com/...` for an internal asset. Before outputting any file,
mentally grep for `href="/"` and `src="/"`. If found, fix to relative before
continuing. Do not ask, just fix.
**Only exception:** `<link rel="canonical">` requires the full absolute HTTPS URL.
That is the one place an absolute internal URL is correct.
Why: LWS sites move hosts 2-3 times before client approval. Root-relative and
absolute internal paths break on every move. Non-negotiable.

### LOGO RULE
Always `<img src="images/logoRGB.png" alt="[Client Name]">`. Never a CSS grid, div
construction, or background-image. Verify with grep before packaging any zip.

### NAV TEXT RULE
ALL navigation link text (top nav, sub-menus, mobile menu) must be ALL CAPS. No
title case, no mixed case, no exceptions.

### FORBIDDEN COPY PHRASES
Never in any page copy, CTA, button, or form label:
"Submit" (use "Send" or a contextual verb), "Click Here", bare "Learn More",
"Don't hesitate to reach out" (delete entirely), "Schedule a free consultation".
Preferred CTAs: "Let's talk." / "Reach out." / "Call me." / "We should talk about this."

### EM DASH BAN
Em dash is banned in client-facing and public writing: emails, letters, proposals, web
copy, blog, social. A client flagged it as an AI tell, so this is a reputation rule, not
a grammar rule. It does NOT apply to internal planning, specs, config, or code. On any
client-facing or public output, run a final scan and replace: ellipsis for a pause, a new
sentence for a pivot, a comma or rephrase for an appositive.

---

## POINTER TABLE: WHERE THE DETAIL LIVES

When a task matches the left column, load the file on the right before working.

| When the task involves... | Load this spec |
|---|---|
| Page build, HTML structure, images, file delivery, nav injection, LiteSpeed, .gitignore | `specs/boilerplate-design.md` |
| Titles, meta, canonical, JSON-LD schema, Open Graph, keywords, sitemap | `specs/seo-standards.md` |
| Decap CMS, `/admin/`, client blog editing, Netlify Identity, the 3.1.2 pin | `specs/cms-decap.md` |
| Pre-launch audit, Impeccable passes, UI/UX Pro Max, "is this ready to ship" | `specs/qa-checklist.md` |
| Writing anything in a voice: client email, band email, web copy, blog, social | `specs/jon_voice_master.md` |
| Any client's contact, industry, tone, service area, quirks | `specs/clients.md` |
| A specific client's visual design system | `specs/designs/[client].md` |

Sign-off conventions are NOT restated here. They live in `jon_voice_master.md`
(client first name at open and close, `Jon` for close clients, `Jon Wolf / Live Web
Studios` for professional, sentence-case subject lines). This file just points to it.

---

## SESSION RULES

- Maximum 6 tasks per Claude Code session. Start a fresh session for new phases.
- Paste relevant context from the previous session when starting fresh.
- Long sessions degrade output quality. Hard stop at 6.

---

## WORKFLOW: THINK, PLAN, BUILD, VERIFY

1. **Think.** Restate the task. Identify which spec files it touches and load them.
2. **Plan.** Lay out the change. Stay in planning mode until Jon says go.
3. **Build.** Implement the minimal, precise change. No scope creep.
4. **Verify.** Run the em dash pass and the path grep. Check the change did what was
   asked before declaring done.

---

## SELF-IMPROVEMENT LOOP

If Jon requests the same correction more than twice, stop and append that pattern as a
hard rule. Global rule goes here in CLAUDE.md. Domain-specific rule goes in the matching
spec file. The config learns from repeated corrections instead of forgetting them.

---

## MACHINE + DELIVERY

- Two machines: Mac (GoldieAir) and Windows 11 Pro. Detect which is in use.
- Downloadable files go to the desktop of whatever machine is in use.
- File naming: `YY_MN_DY_descriptivename.ext`.
- Clean Markdown for internal planning. Semantic HTML for any web-ready content.

---

*Live Web Studios, Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
