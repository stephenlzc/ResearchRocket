#!/bin/bash
set +e
TMP_BUILD_DIR=""
LOG_FILE=""

cleanup() {
  if [ -n "$TMP_BUILD_DIR" ] && [ -d "$TMP_BUILD_DIR" ]; then
    rm -rf "$TMP_BUILD_DIR"
  fi
  if [ -n "$LOG_FILE" ] && [ -f "$LOG_FILE" ]; then
    rm -f "$LOG_FILE"
  fi
}
trap cleanup EXIT

if [ -t 0 ]; then
  INPUT=""
else
  INPUT=$(cat)
fi

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

if grep -nE 'TODO_LATEX|TBD_LATEX|\\cite\{TBD\}' "$FILE_PATH" >/dev/null 2>&1; then
  echo "ERROR: LaTeX placeholder found in $FILE_PATH" >&2
  grep -nE 'TODO_LATEX|TBD_LATEX|\\cite\{TBD\}' "$FILE_PATH" >&2
  exit 1
fi

BEGIN_DOC=$(grep -c '\\begin{document}' "$FILE_PATH")
END_DOC=$(grep -c '\\end{document}' "$FILE_PATH")
if [ "$BEGIN_DOC" -ne "$END_DOC" ]; then
  echo "ERROR: unmatched \\begin{document}/\\end{document} in $FILE_PATH" >&2
  exit 1
fi

LOG_FILE=$(mktemp /tmp/researchrocket-latex-compile-XXXXXX.log 2>/dev/null)
if [ -z "$LOG_FILE" ]; then
  LOG_FILE="/tmp/researchrocket-latex-compile-$$.log"
fi

if command -v latexmk >/dev/null 2>&1; then
  ROOT_DIR=$(dirname "$FILE_PATH")
  ENTRY_TEX="$ROOT_DIR/main.tex"
  if [ ! -f "$ENTRY_TEX" ]; then
    ENTRY_TEX="$FILE_PATH"
  fi

  TMP_BUILD_DIR=$(mktemp -d /tmp/researchrocket-latex-XXXXXX 2>/dev/null)
  if [ -z "$TMP_BUILD_DIR" ] || [ ! -d "$TMP_BUILD_DIR" ]; then
    TMP_BUILD_DIR=$(mktemp -d)
  fi

  ENTRY_BASENAME=$(basename "$ENTRY_TEX")
  if command -v timeout >/dev/null 2>&1; then
    (cd "$ROOT_DIR" && timeout 60 latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir="$TMP_BUILD_DIR" "$ENTRY_BASENAME") >"$LOG_FILE" 2>&1
    RC=$?
  else
    (cd "$ROOT_DIR" && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir="$TMP_BUILD_DIR" "$ENTRY_BASENAME") >"$LOG_FILE" 2>&1
    RC=$?
  fi
  if [ $RC -ne 0 ]; then
    echo "ERROR: latex compile check failed for $ENTRY_TEX" >&2
    tail -n 20 "$LOG_FILE" >&2
    exit 1
  fi
else
  echo "WARNING: latexmk not available; compile check skipped for $FILE_PATH" >&2
fi

if [ -f "$LOG_FILE" ] && grep -nE 'Overfull|Underfull' "$LOG_FILE" >/dev/null 2>&1; then
  echo "WARNING: potential formatting overflow markers found during LaTeX compile for $FILE_PATH" >&2
fi

exit 0
