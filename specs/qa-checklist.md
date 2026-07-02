# QA CHECKLIST (spec)
## Location: ~/.claude/specs/qa-checklist.md
## Applies to: before ANY client delivery. Loaded when a task involves "is this ready", pre-launch audit, or wrapping a build.

---

## PRE-LAUNCH SEO AUDIT: REQUIRED BEFORE CLIENT DELIVERY

Confirm all of the following before flagging any site as ready:

- [ ] Each page has a unique title tag (under 60 chars) and meta description (under 155 chars)
- [ ] One H1 per page only
- [ ] Heading hierarchy cascades correctly (H1 -> H2 -> H3, no skipped levels)
- [ ] `<link rel="canonical">` present with correct absolute URL on every page
- [ ] `<meta name="viewport">` present on every page
- [ ] JSON-LD LocalBusiness schema present with all required fields on every page
- [ ] og:image specified and at least 1200x630px
- [ ] Internal linking logical and complete, anchor text is descriptive (no "click here")
- [ ] All images have descriptive alt text plus width/height attributes
- [ ] Hero image has `<link rel="preload">` in `<head>`
- [ ] All non-hero images have `loading="lazy"`
- [ ] Primary keyword in H1, opening paragraph, and at least one H2
- [ ] Service-area copy includes primary city plus surrounding towns
- [ ] sitemap.xml exists or generation instructions provided
- [ ] robots.txt is correct
- [ ] No duplicate content across pages
- [ ] Google Analytics 4 wired up (placeholder minimum)
- [ ] Google Search Console submission instructions provided

Flag anything missing. Do not mark the build complete until this list is clean.

---

## POST-BUILD QA: IMPECCABLE PASSES (REQUIRED BEFORE ANY DELIVERY)

After all pages are built, the following four Impeccable passes are required in this order.
**Do NOT package a zip or mark a build complete until all four are done.** If they have not
been run in this session, remind Jon before wrapping up.

```
1. /polish    copy tightening, grammar, spacing, tone consistency
2. /colorize  contrast ratios, brand color consistency across all elements
3. /layout    spacing, alignment, responsive integrity, visual hierarchy
4. /animate   entrance animations, scroll triggers, micro-interactions
```

These are not optional. They are part of what "done" means at Live Web Studios.

---

## UI/UX PRO MAX: MUST-DO BEFORE DEPLOYING TO CLIENT

Before sending any build to the client (preview link, zip, staging URL, or production
deploy), run the **UI/UX Pro Max** skill against the project. It is the final
accessibility / interaction-layer audit and catches the issues the four Impeccable passes
do not: focus rings, keyboard nav, touch-vs-hover dropdowns, ARIA live regions, contrast at
the 4.5:1 boundary, and industry-pattern alignment for the project's vertical (home
services / SaaS / e-commerce / etc.).

**How to run it:**

```bash
# Generate a fresh design-system recommendation for the project's vertical
python3 ~/.agents/skills/ui-ux-pro-max/scripts/search.py "<vertical keywords>" --design-system -p "<Client Name>"

# Then audit the actual build against UX guidelines
python3 ~/.agents/skills/ui-ux-pro-max/scripts/search.py "accessibility contrast" --domain ux
python3 ~/.agents/skills/ui-ux-pro-max/scripts/search.py "hover focus keyboard navigation" --domain ux
```

Map the findings to the build, fix any P0/P1 gaps, and only then ship to the client.

**This is non-negotiable. No client preview link goes out without a Pro Max pass.**

If the skill folder is not in the project, ask Jon for the location. It is normally in the
project root or a sibling folder named `ui-ux-pro-max-skill-*`.

> **Path note:** the four Impeccable commands and UI/UX Pro Max are Claude Code skills that
> live on Jon's machine, not skills bundled into the claude.ai chat environment. This
> checklist states the RULE (that they must run). When the real installed skill paths are
> confirmed, replace `<skill-path>` above with the actual location.

---

*Live Web Studios, Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
