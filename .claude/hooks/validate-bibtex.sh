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

if ! echo "$FILE_PATH" | grep -qE '(^|/)research/papers/|(^|/)deliverables/'; then
  exit 0
fi

if [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

if echo "$FILE_PATH" | grep -qE '\.bib$'; then
  if grep -nE 'TODO_BIB|TBD_BIB|@.+\{TBD,' "$FILE_PATH" >/dev/null 2>&1; then
    echo "ERROR: BibTeX placeholder found in $FILE_PATH" >&2
    grep -nE 'TODO_BIB|TBD_BIB|@.+\{TBD,' "$FILE_PATH" >&2
    exit 1
  fi

  DUP_KEYS=$(grep -oE '^[[:space:]]*@[A-Za-z]+{[^,]+' "$FILE_PATH" | sed 's/^[[:space:]]*@[A-Za-z]\+{//' | sort | uniq -d)
  if [ -n "$DUP_KEYS" ]; then
    echo "ERROR: duplicate BibTeX keys found in $FILE_PATH" >&2
    echo "$DUP_KEYS" >&2
    exit 1
  fi
fi

if echo "$FILE_PATH" | grep -qE '\.tex$'; then
  if grep -nE '\\cite\{(TODO|TBD|)\}' "$FILE_PATH" >/dev/null 2>&1; then
    echo "ERROR: invalid cite key placeholder in $FILE_PATH" >&2
    grep -nE '\\cite\{(TODO|TBD|)\}' "$FILE_PATH" >&2
    exit 1
  fi
fi

exit 0
