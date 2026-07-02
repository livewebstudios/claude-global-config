# REQUIRED SKILLS: borrowed, per-machine (NOT vendored in this repo)
## Location: ~/.claude/REQUIRED-SKILLS.md

Some skills the QA workflow depends on are third-party. They are deliberately **not**
committed to `claude-global-config`. They are installed per machine with the `skills` CLI
and live outside the repo tree.

## Why borrowed skills stay out of the repo

- The `skills` CLI installs them as a **symlink** (for example `~/.claude/skills/impeccable`
  points to `~/.agents/skills/impeccable`), so the real files live outside `.claude` anyway.
- Symlinks do not survive the Mac-symlink / Windows-copy sync cleanly, and a copied symlink
  target would rot.
- Vendoring third-party code means stale forks accumulating in the repo with no upstream.

Rule: **Jon's own skills are the repo's source of truth. Borrowed skills are a per-machine
install.** Each new machine runs the commands below once after cloning.

## The borrowed skills

### 1. impeccable (pbakaus/impeccable)
The frontend-design verb-family suite. Provides the passes the QA checklist calls for
(`polish`, `colorize`, `layout`/arrange, `animate`, plus adapt, audit, bolder, clarify,
critique, delight, distill, extract, normalize, optimize, overdrive, quieter, typeset).

Install (both machines):
```
npx skills add pbakaus/impeccable
```
Verify it landed:
- Mac: `ls ~/.claude/skills/impeccable`
- Windows: `dir %USERPROFILE%\.claude\skills\impeccable`

Note: this counts as "1 skill" in the installer but is a full verb family, each sub-skill
runs with full agent permissions. Review individual `SKILL.md` files before relying on a
new verb.

### 2. ui-ux-pro-max
The final accessibility / interaction-layer audit skill. Invoked by `qa-checklist.md` via
its `scripts/search.py` (design-system recommendation + UX audit by vertical).

Install path / command: **TBD, confirm and record here.** It is not on the `pbakaus/impeccable`
registry entry. When the real install command or repo is confirmed, paste it here so a fresh
machine can reproduce it. Until then, point `<skill-path>` in `qa-checklist.md` at wherever
the skill folder actually sits (normally the project root or a sibling `ui-ux-pro-max-skill-*`).

## Relationship to /qa

The repo's `commands/qa.md` reads its pass criteria straight from `specs/qa-checklist.md`
and executes them inline, on purpose. It does **not** call the impeccable `/polish`,
`/colorize`, `/layout`, `/animate` commands by name, so the QA run behaves identically
whether or not impeccable is installed, and a same-named borrowed verb can never shadow it.
Impeccable is still worth installing for standalone use of those passes outside `/qa`.

---

*Live Web Studios, Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
