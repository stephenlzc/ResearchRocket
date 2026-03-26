---
name: setup-researchclaw
description: "Setup and validate AutoResearchClaw CLI integration"
argument-hint: "[path-to-autoresearchclaw]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
---

When invoked:
1. Verify `researchclaw` command availability.
2. If missing, guide install (`pip install -e .`) from AutoResearchClaw repo.
3. Create local config template from `templates/config.arc.research-studio.example.yaml`.
4. Validate with `researchclaw validate` if available.
5. Summarize runnable command set: `setup`, `init`, `run`, `report`, `--resume`.
