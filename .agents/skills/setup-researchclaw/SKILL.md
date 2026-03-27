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
4. After template creation, inspect `config.arc.yaml` if present and explicitly guide the user to confirm or provide:
   - `provider`
   - `base_url`
   - `api_key_env`
   - `primary_model`
5. Do not assume GPT-only configuration. Mention that users may configure OpenAI-compatible endpoints or other supported providers such as OpenRouter, DeepSeek, MiniMax, or ACP depending on their environment.
6. If the user does not provide LLM settings yet, clearly state the default initialization values used by `researchclaw init`:
   - `provider: openai-compatible`
   - `base_url: https://api.openai.com/v1`
   - `api_key_env: OPENAI_API_KEY`
   - `primary_model: gpt-4o`
   - `fallback_models: [gpt-4.1, gpt-4o-mini]`
7. After the user provides or confirms LLM settings, generate and run a minimal test before proposing any next step.
8. The minimal test should be the smallest safe verification available, such as `researchclaw doctor`, `researchclaw validate`, or an equivalent lightweight model preflight that confirms the configured provider, endpoint, key env var, and model can be resolved.
9. Standard minimal test command order:
   - If `config.arc.yaml` does not exist yet: `researchclaw init`
   - Export or confirm the API key environment variable required by `llm.api_key_env`
   - Run `researchclaw doctor`
   - Run `researchclaw validate`
   - Only after both checks pass, recommend the next workflow command
10. If the minimal test fails, stop and report what must be fixed. Do not move on to `run` or broader workflow guidance until the test passes.
11. Summarize runnable command set: `setup`, `init`, `run`, `report`, `--resume` only after the minimal test passes, or clearly state that configuration must be fixed first.
