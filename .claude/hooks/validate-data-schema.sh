#!/bin/bash
set +e

INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
  FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
else
  FILE_PATH=$(echo "$INPUT" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*: *"//;s/"$//')
fi

FILE_PATH=$(echo "$FILE_PATH" | sed 's|\\|/|g')

if ! echo "$FILE_PATH" | grep -qE '(^|/)research/data/|(^|/)research/datasets/'; then
  exit 0
fi

if ! echo "$FILE_PATH" | grep -qE '\.(csv|json|parquet)$'; then
  exit 0
fi

BASE="${FILE_PATH%.*}"
if [ ! -f "${BASE}.schema.json" ] && [ ! -f "${BASE}.schema.yaml" ] && [ ! -f "${BASE}.schema.yml" ]; then
  echo "WARNING: schema file missing for dataset: $FILE_PATH" >&2
fi

exit 0
