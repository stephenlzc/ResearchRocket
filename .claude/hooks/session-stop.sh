#!/bin/bash
set +e
mkdir -p production/session-state 2>/dev/null
{
  echo "Session closed: $(date)"
  git status --short 2>/dev/null
  echo "---"
} >> production/session-state/session-log.md
exit 0
