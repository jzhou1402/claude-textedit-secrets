#!/bin/bash
# Installs the rule + script into ~/.claude. Safe to re-run.
set -e
BASE=https://raw.githubusercontent.com/jzhou1402/claude-textedit-secrets/main
mkdir -p ~/.claude/rules ~/.claude/bin
curl -fsSL "$BASE/rules/secrets-open-in-textedit.md" -o ~/.claude/rules/secrets-open-in-textedit.md
curl -fsSL "$BASE/bin/wait-secret-file.sh" -o ~/.claude/bin/wait-secret-file.sh
chmod +x ~/.claude/bin/wait-secret-file.sh
echo "Installed. New Claude Code sessions will open TextEdit when they need a key."
