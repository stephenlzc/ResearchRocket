#!/bin/bash
set +e

echo "=== Research Studio Session Context ==="
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
[ -n "$BRANCH" ] && echo "Branch: $BRANCH"

if [ -f production/stage.txt ]; then
  echo "Stage: $(cat production/stage.txt)"
fi

if [ -d artifacts ]; then
  LAST_RUN=$(ls -dt artifacts/rc-* 2>/dev/null | head -1)
  [ -n "$LAST_RUN" ] && echo "Last run: $LAST_RUN"
fi

echo "======================================"
exit 0
