#!/bin/bash
set +e

STRICT_MODE=0
if [ "$1" = "--strict" ] || [ "$PRE_SUBMIT_GATE" = "1" ]; then
  STRICT_MODE=1
fi

INPUT=""
if [ $STRICT_MODE -eq 0 ]; then
  if [ -t 0 ]; then
    INPUT=""
  else
    INPUT=$(cat)
  fi
fi

FILE_PATH=""
if [ $STRICT_MODE -eq 0 ]; then
  if command -v jq >/dev/null 2>&1; then
    FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
  else
    FILE_PATH=$(echo "$INPUT" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*: *"//;s/"$//')
  fi
  FILE_PATH=$(echo "$FILE_PATH" | sed 's|\\|/|g')

  if ! echo "$FILE_PATH" | grep -qE '(^|/)deliverables/submission/|(^|/)research/papers/'; then
    exit 0
  fi
fi

FAIL=0
WARN=0

if [ ! -d "deliverables/submission" ]; then
  if [ $STRICT_MODE -eq 1 ]; then
    echo "FAIL: missing deliverables/submission directory" >&2
    FAIL=1
  else
    echo "WARNING: missing deliverables/submission directory (non-strict mode)" >&2
    WARN=1
  fi
fi

if [ ! -f "deliverables/submission/main.tex" ] && [ ! -f "deliverables/submission/paper.md" ]; then
  if [ $STRICT_MODE -eq 1 ]; then
    echo "FAIL: missing main submission manuscript (main.tex or paper.md)" >&2
    FAIL=1
  else
    echo "WARNING: missing main submission manuscript (main.tex or paper.md) in non-strict mode" >&2
    WARN=1
  fi
fi

if [ -d "deliverables/submission" ]; then
  if command -v rg >/dev/null 2>&1; then
    if rg -n 'TODO_CITATION|FAKE_CITATION|\[CITATION\]|TBD_CITE' deliverables/submission >/dev/null 2>&1; then
      if [ $STRICT_MODE -eq 1 ]; then
        echo "FAIL: unresolved citation placeholders in deliverables/submission" >&2
        rg -n 'TODO_CITATION|FAKE_CITATION|\[CITATION\]|TBD_CITE' deliverables/submission >&2
        FAIL=1
      else
        echo "WARNING: unresolved citation placeholders in deliverables/submission (non-strict mode)" >&2
        rg -n 'TODO_CITATION|FAKE_CITATION|\[CITATION\]|TBD_CITE' deliverables/submission >&2
        WARN=1
      fi
    fi
  else
    if grep -R -n -E 'TODO_CITATION|FAKE_CITATION|\[CITATION\]|TBD_CITE' deliverables/submission >/dev/null 2>&1; then
      if [ $STRICT_MODE -eq 1 ]; then
        echo "FAIL: unresolved citation placeholders in deliverables/submission" >&2
        grep -R -n -E 'TODO_CITATION|FAKE_CITATION|\[CITATION\]|TBD_CITE' deliverables/submission >&2
        FAIL=1
      else
        echo "WARNING: unresolved citation placeholders in deliverables/submission (non-strict mode)" >&2
        grep -R -n -E 'TODO_CITATION|FAKE_CITATION|\[CITATION\]|TBD_CITE' deliverables/submission >&2
        WARN=1
      fi
    fi
  fi
fi

if [ ! -f "artifacts/repro-audit-report.md" ]; then
  if [ $STRICT_MODE -eq 1 ]; then
    echo "FAIL: reproducibility audit report not found at artifacts/repro-audit-report.md" >&2
    FAIL=1
  else
    echo "WARNING: reproducibility audit report not found at artifacts/repro-audit-report.md" >&2
  fi
fi

if [ $FAIL -ne 0 ]; then
  exit 1
fi

if [ $WARN -ne 0 ]; then
  exit 0
fi

exit 0
