#!/bin/bash
set -e

if ! command -v researchclaw >/dev/null 2>&1; then
  echo "researchclaw not found on PATH."
  echo "Install in AutoResearchClaw repo: pip install -e ."
  exit 1
fi

echo "researchclaw found: $(command -v researchclaw)"
echo "Try: researchclaw setup"
echo "Then: researchclaw init"
