#!/bin/bash
set +e

INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
  FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
else
  FILE_PATH=$(echo "$INPUT" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*: *"//;s/"$//')
fi

FILE_PATH=$(echo "$FILE_PATH" | sed 's|\\|/|g')

if ! echo "$FILE_PATH" | grep -qE '(^|/)research/data/|(^|/)research/datasets/|(^|/)research/experiments/|(^|/)artifacts/'; then
  exit 0
fi

if [ -f "$FILE_PATH" ]; then
  if grep -nE 'TODO_SOURCE|UNKNOWN_SOURCE|TBD_SOURCE|UNTRACKED_TRANSFORM' "$FILE_PATH" >/dev/null 2>&1; then
    echo "WARNING: unresolved lineage markers found in $FILE_PATH" >&2
    grep -nE 'TODO_SOURCE|UNKNOWN_SOURCE|TBD_SOURCE|UNTRACKED_TRANSFORM' "$FILE_PATH" >&2
  fi
fi

if [ ! -f "research/datasets/lineage-manifest.md" ] && [ ! -f "research/datasets/lineage-manifest.json" ] && [ ! -f "research/datasets/lineage/manifest.md" ] && [ ! -f "research/datasets/lineage/manifest.json" ]; then
  echo "WARNING: lineage manifest missing under research/datasets/" >&2
fi

exit 0
