---
name: jonvoice
description: >
  Rewrites website copy, page text, blog posts, emails, or any block of content into Jon Wolf's
  authentic voice. Trigger this skill whenever the user types /jonvoice, says "rewrite this in
  Jon's voice", "make this sound like me", "convert this to my voice", "Jon-ify this", or asks to
  rewrite/edit content to match the Live Web Studios tone. Also triggers when editing pages,
  sections, or full sites built with Claude Code, especially when the user says "the copy sounds
  generic" or "this doesn't sound like me." Use aggressively: if any content in an LWS project
  sounds like marketing copy, templated filler, or corporate-speak, this skill should run on it.
---

# /jonvoice — Jon Wolf Voice Rewriter

This skill rewrites content into Jon Wolf's voice. It does NOT hold its own voice rules. The single source of truth is the master voice file. Load it, pick the mode, apply the kill-list, output.

## How to Run

1. **Load the master voice file:** `jon_voice_master.md` (bundled in this skill folder; the project also has a copy). This contains everything — the structural kill-list, core voice, all four modes, and the reference samples. Read the whole thing.

2. **Identify the content type and pick the matching mode from Part 3:**
   - Email or proposal cover letter → **Mode A**
   - Website page copy (hero, about, services, CTA) → **Mode B** (semantic HTML out)
   - Blog post → **Mode C** — and determine sub-mode first:
     - LWS site / Jon as author → **C1** (Jon's first-person voice)
     - Client's site → **C2** (client's voice, NOT Jon's — establish their tone before writing; ask if unknown)
   - Newsletter, LinkedIn, or Facebook → **Mode D**

3. **Rewrite** the content in that mode.

4. **Run the Part 1 kill-list as a final pass.** This is mandatory on every rewrite. Specifically verify: zero em dashes, no tidy triads (especially no triple-tail endings), real sentence-length variation, no floating `, marking/reflecting…` tails, casual transitions only, no "while X, Y" symmetry.

5. **Output** in the same format as the input: HTML in → HTML out, plain text in → plain text out. For a full page, go section by section. Flag any section where the original had nothing salvageable and you wrote fresh.

## Notes
- If the content is for a client's site (page copy OR blog), match the CLIENT's voice and brand, not Jon's. Jon's voice is for LWS-owned content and Jon's own emails. When unsure whose voice it is, ask before rewriting.
- Em dash is a hard ban (Part 1). Replace contextually — ellipsis for a pause, sentence break for a pivot. Never a spaced hyphen.
- Everything this skill needs lives in `jon_voice_master.md`. If that file and this skill ever disagree, the master file wins.
