#!/bin/bash
# Usage: wait-secret-file.sh <file> <VAR_NAME>
# Opens <file> in TextEdit, blocks until its window is closed, then reports
# whether VAR_NAME has a non-empty value. Never prints the value.
f="$(cd "$(dirname "$1")" && pwd -P)/$(basename "$1")"; var="$2"
touch "$f"
grep -q "^${var}=" "$f" || echo "${var}=" >> "$f"
open -a TextEdit "$f"
sleep 2
while osascript -e 'tell application "TextEdit" to get path of every document' 2>/dev/null \
  | tr ',' '\n' | sed 's/^ *//' | grep -Fxq "$f"; do sleep 1; done
if grep -q "^${var}=.\+" "$f"; then echo "DONE: $var is set in $f"; else echo "EMPTY: window closed but $var is still empty in $f"; fi
