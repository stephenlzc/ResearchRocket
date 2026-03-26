#!/bin/bash
set +e
INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
  FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
else
  FILE_PATH=$(echo "$INPUT" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*: *"//;s/"$//')
fi

FILE_PATH=$(echo "$FILE_PATH" | sed 's|\\|/|g')

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

if ! echo "$FILE_PATH" | grep -qE '\.tex$'; then
  exit 0
fi

if ! echo "$FILE_PATH" | grep -qE '(^|/)research/papers/|(^|/)deliverables/'; then
  exit 0
fi

if [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

if grep -nE 'TODO_VENUE|TBD_VENUE|ANON_TBD' "$FILE_PATH" >/dev/null 2>&1; then
  echo "ERROR: venue-format placeholder found in $FILE_PATH" >&2
  grep -nE 'TODO_VENUE|TBD_VENUE|ANON_TBD' "$FILE_PATH" >&2
  exit 1
fi

if grep -nE '\\author\{.+\}' "$FILE_PATH" >/dev/null 2>&1; then
  if grep -nEi 'anonymous|double[- ]blind' "$FILE_PATH" >/dev/null 2>&1; then
    :
  else
    echo "WARNING: author block found; verify anonymity requirements for target venue in $FILE_PATH" >&2
  fi
fi

exit 0
