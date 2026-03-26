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

if ! echo "$FILE_PATH" | grep -qE '(^|/)research/(papers|results|hypotheses)/|(^|/)deliverables/'; then
  exit 0
fi

if [ -f "$FILE_PATH" ]; then
  if grep -nE 'EVIDENCE_TBD|UNVERIFIED_CLAIM|NEEDS_EVIDENCE|CLAIM_WITHOUT_SUPPORT' "$FILE_PATH" >/dev/null 2>&1; then
    echo "ERROR: claim-evidence placeholder found in $FILE_PATH" >&2
    grep -nE 'EVIDENCE_TBD|UNVERIFIED_CLAIM|NEEDS_EVIDENCE|CLAIM_WITHOUT_SUPPORT' "$FILE_PATH" >&2
    exit 1
  fi
  if grep -niE 'prove|guarantee|always|never' "$FILE_PATH" >/dev/null 2>&1; then
    echo "WARNING: absolute claim language detected in $FILE_PATH; verify evidence strength" >&2
  fi
fi

exit 0
