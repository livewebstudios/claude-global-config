#!/bin/bash
#
# Live Web Studios: Mac install for claude-global-config
# Symlinks the repo into ~/.claude so Git stays the source of truth, while letting
# CLI-installed borrowed skills (impeccable, ui-ux-pro-max) in ~/.claude/skills/ survive.
#
# Run once per Mac after cloning the repo. Safe to re-run (idempotent).

set -e

REPO="$HOME/Sites/claude-global-config"     # <-- Mac repo location (GoldieAir)
CLAUDE="$HOME/.claude"

if [ ! -d "$REPO" ]; then
  echo "Repo not found at $REPO"
  echo "Clone it first:  git clone git@github.com:livewebstudios/claude-global-config.git \"$REPO\""
  exit 1
fi

mkdir -p "$CLAUDE/skills"

# Core file + spec/command folders: symlink whole (repo is the source of truth)
ln -sfn "$REPO/CLAUDE.md" "$CLAUDE/CLAUDE.md"
ln -sfn "$REPO/specs"     "$CLAUDE/specs"
ln -sfn "$REPO/commands"  "$CLAUDE/commands"

# Jon's OWN skills: symlink each individually, so borrowed skills already installed
# under ~/.claude/skills/ (impeccable, etc.) are never clobbered by a blanket link.
for skill in jonvoice lws-proposal powered-by prompt-master 47 generate-clients-md process-interviewer ask-the-board; do
  if [ -d "$REPO/skills/$skill" ]; then
    ln -sfn "$REPO/skills/$skill" "$CLAUDE/skills/$skill"
    echo "linked skill: $skill"
  else
    echo "WARNING: $REPO/skills/$skill missing, skipped"
  fi
done

echo
echo "Mac install complete."
echo "  Source of truth: $REPO"
echo "  Linked into:     $CLAUDE"
echo
echo "Next: install borrowed skills per REQUIRED-SKILLS.md  ->  npx skills add pbakaus/impeccable"
