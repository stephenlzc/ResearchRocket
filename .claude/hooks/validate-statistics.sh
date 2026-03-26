#!/bin/bash
set +e

INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
  FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
else
  FILE_PATH=$(echo "$INPUT" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*: *"//;s/"$//')
fi

FILE_PATH=$(echo "$FILE_PATH" | sed 's|\\|/|g')

if ! echo "$FILE_PATH" | grep -qE '(^|/)research/results/|(^|/)research/papers/|(^|/)deliverables/'; then
  exit 0
fi

if [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

if grep -nE '\bp-?value\b|p\s*[<=>]\s*0\.[0-9]+' "$FILE_PATH" >/dev/null 2>&1; then
  if ! grep -nE 'CI|confidence interval|uncertainty|std|standard error|SE' "$FILE_PATH" >/dev/null 2>&1; then
    echo "WARNING: statistical claims found without explicit uncertainty language in $FILE_PATH" >&2
  fi
fi

exit 0
