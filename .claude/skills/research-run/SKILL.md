---
name: research-run
description: "Execute AutoResearchClaw run/resume/report workflow"
argument-hint: "[topic or run mode]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

When invoked:
1. Confirm config file path.
2. Run:
   - `researchclaw run --config <config> --topic "..." --auto-approve`
3. For interrupted runs:
   - `researchclaw run --config <config> --resume`
4. Generate report:
   - `researchclaw report --run-dir <artifacts_run_dir>`
5. Summarize artifacts and deliverables paths.
