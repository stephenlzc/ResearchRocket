#!/bin/bash
set +e

if [ -d artifacts ]; then
  LAST_RUN=$(ls -dt artifacts/rc-* 2>/dev/null | head -1)
  if [ -n "$LAST_RUN" ]; then
    if [ ! -d "$LAST_RUN/deliverables" ]; then
      echo "WARNING: latest run has no deliverables directory: $LAST_RUN" >&2
    fi
  fi
fi

exit 0
