#!/bin/bash
set +e
INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
  FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
else
  FILE_PATH=$(echo "$INPUT" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*: *"//;s/"$//')
fi

FILE_PATH=$(echo "$FILE_PATH" | sed 's|\\|/|g')

if ! echo "$FILE_PATH" | grep -qE '(^|/)research/papers/|(^|/)deliverables/'; then
  exit 0
fi

if [ -f "$FILE_PATH" ]; then
  if grep -nE 'TODO_CITATION|FAKE_CITATION|\[CITATION\]|TBD_CITE' "$FILE_PATH" >/dev/null 2>&1; then
    echo "=== Citation Validation Warning ===" >&2
    grep -nE 'TODO_CITATION|FAKE_CITATION|\[CITATION\]|TBD_CITE' "$FILE_PATH" >&2
    echo "===================================" >&2
  fi
fi

exit 0
