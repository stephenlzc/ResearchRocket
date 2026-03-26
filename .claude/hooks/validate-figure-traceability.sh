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

if ! echo "$FILE_PATH" | grep -qE '(^|/)research/(results|papers)/|(^|/)deliverables/'; then
  exit 0
fi

if [ -f "$FILE_PATH" ]; then
  if grep -nE 'FIG_SOURCE_TBD|PLOT_SCRIPT_TBD|NO_DATA_LINK|UNTRACEABLE_FIG' "$FILE_PATH" >/dev/null 2>&1; then
    echo "ERROR: figure traceability placeholder found in $FILE_PATH" >&2
    grep -nE 'FIG_SOURCE_TBD|PLOT_SCRIPT_TBD|NO_DATA_LINK|UNTRACEABLE_FIG' "$FILE_PATH" >&2
    exit 1
  fi
fi

exit 0
