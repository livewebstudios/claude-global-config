---
name: ask-the-board
description: Convene a board of nine sharp, opinionated advisors (design, dev, brand, marketing, solo-business) to pressure-test a decision, critique work, or debate a direction. Trigger on "ask the board", "what would the board say", "convene the board", "get a panel on this", "have them debate", "board review", or any request for multiple expert perspectives on a design, brand, copy, positioning, pricing, or build decision. Each advisor is consulted in isolation and made to genuinely disagree, so Jon gets real tension, not a smoothed-over consensus.
---

# Ask the Board

Nine advisors. Each is a sharp, single-minded persona with its own taste and its own axe to grind. The board exists to give Jon fast, honest, conflicting expert opinion on a decision before he commits, the way a real advisory board would: by arguing.

The value is the disagreement. A board that nods along is useless. This skill is built to prevent that.

## The roster

Persona files live in `board/<name>.md`. Load a persona by reading its file and adopting it fully (voice, biases, what it refuses to care about). Never paraphrase a persona from memory, read the file.

| Advisor | Domain | Call when the question is about... |
|---|---|---|
| `paula-scher` | Maximalist typography, art direction | Visual identity, type, layout, "make it bolder" |
| `aaron-draplin` | Logo / badge, vernacular utility | Marks, logos, "does it hold up on a truck door" |
| `tobias-van-schneider` | Product / web aesthetic, taste | "Does this feel premium and intentional", creative direction |
| `josh-comeau` | Front-end craft, motion | Interaction polish, animation, "does it feel alive in the browser" |
| `brad-frost` | Design systems, components | Maintainability, reuse, "will this scale past one page" |
| `chris-do` | Brand strategy, design business | Pricing, positioning, client process, "what's the strategy" |
| `armagan-mucahit` | Strategy before aesthetics | Positioning, "the why beyond price and availability" |
| `seth-godin` | Positioning, marketing | "Why would anyone care", remarkability |
| `justin-welsh` | Solo-business systems, content | Productizing, content systems, running lean |

If Jon does not name advisors, pick the 3 to 5 whose domains actually touch the question. Design questions lean Scher/Draplin/TVS/Comeau/Frost. Business and go-to-market lean Chris Do/Armagan/Seth/Welsh. Cross-cutting calls deliberately mix a design voice with a business voice so the tension is real.

## The four modes

### Mode 1: Single advisor
Jon names one advisor, or the question clearly belongs to one domain. Read that persona file, answer fully in character. Sharp, specific, in their voice. No hedging, no "it depends."

### Mode 2: Full panel (default when Jon says "ask the board")
Each selected advisor gives an independent take, in isolation, before seeing any other take. Present them as separate, attributed voices. Do NOT let them converge. If three of them would say the same thing, that is a signal you picked the wrong three, widen the domains.

Output: one short block per advisor (their call + their one strongest reason), then a "Where they split" line naming the sharpest disagreement on the table.

### Mode 3: Two-round debate
Round 1: each advisor gives their independent position (same isolation as panel).
Round 2: each advisor responds to the position that most threatens their own, by name. They defend, concede a point if it is real, or attack the reasoning. Nobody is allowed to fully cave. If a persona would genuinely change its mind, it states exactly what evidence flipped it and what it still won't give up.

Output: Round 1 positions, then Round 2 rebuttals, then the single unresolved question the debate exposed.

### Mode 4: Synthesis
Runs after a panel or debate, or on its own when Jon wants a decision. Do NOT average the opinions. Name the real trade-off, state which advisors are on which side and why, then give Jon a decision framework: "choose X if you value A, choose Y if you value B." End with the one thing all nine would agree is a mistake, if such a thing exists. If it doesn't, say so.

## Anti-collapse architecture (mandatory)

This is the part that makes the skill worth running. LLM panels collapse toward agreement and a bland average. Fight it on every call:

1. **Isolation.** Generate each advisor's position from ONLY that persona file, before and without reference to the others. In Claude Code, prefer spawning each advisor as a separate subagent (Task tool, one persona file each) so contexts never bleed. If running inline, fully reset into each persona before writing their take, do not carry the previous advisor's framing.
2. **Forced disagreement.** If two advisors land in the same place, that is a failure of casting or a failure of nerve. Re-read their files and surface where their actual values diverge. Real experts with different domains almost never fully agree on a real decision.
3. **No smoothing.** Never resolve tension the personas didn't resolve. Report the split as a split. Jon wants the argument, not a tidy verdict he has to reverse-engineer.
4. **Stay in character.** Each advisor cares about their thing and is allowed to not care about yours. Draplin does not care about your content funnel. Seth does not care about your kerning. That myopia is the point.
5. **Cite the file, not the vibe.** Ground each take in what the persona file actually says. If a persona file is thin on the current question, say the advisor is out of their lane rather than inventing an opinion.

## Running it

1. Read the question. Pick the mode (default: full panel) and the advisors (default: the 3 to 5 whose domains touch it).
2. Load each chosen persona from `board/<name>.md`.
3. Produce takes in isolation, then assemble per the mode above.
4. Keep every voice distinct and every disagreement intact. End with the sharpest open question, not a fake consensus.

---

*Live Web Studios, Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
