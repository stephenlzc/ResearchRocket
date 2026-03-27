---
name: start
description: "Research onboarding and stage detection"
argument-hint: "[optional current focus]"
user-invocable: true
allowed-tools: Read, Glob, Grep
---

When invoked:
1. Detect if `research/` structure exists.
2. Detect if topic/hypothesis docs exist.
3. Detect if any `artifacts/` run outputs exist.
4. Check whether `config.arc.yaml` exists in the project root.
5. If `config.arc.yaml` is missing, tell the user it is required before running ResearchClaw and actively ask for:
   - `provider`
   - `base_url`
   - `api_key_env`
   - `primary_model`
6. Do not assume GPT-only configuration. Explicitly say other providers are supported if they use an OpenAI-compatible endpoint or another supported backend.
7. If the user does not provide LLM settings yet, clearly state the current default initialization values used by `researchclaw init`:
   - `provider: openai-compatible`
   - `base_url: https://api.openai.com/v1`
   - `api_key_env: OPENAI_API_KEY`
   - `primary_model: gpt-4o`
   - `fallback_models: [gpt-4.1, gpt-4o-mini]`
8. After the user provides or confirms LLM settings, require a minimal connectivity test before recommending any next pipeline command.
9. The minimal test should be the smallest safe verification available, such as `researchclaw doctor`, `researchclaw validate`, or an equivalent lightweight model preflight that confirms the configured provider, endpoint, key env var, and model can be resolved.
10. Standard minimal test command order:
    - If `config.arc.yaml` does not exist yet: `researchclaw init`
    - Export or confirm the API key environment variable required by `llm.api_key_env`
    - Run `researchclaw doctor`
    - Run `researchclaw validate`
    - Only after both checks pass, recommend the next workflow command
11. If the minimal test fails, stop the workflow progression, show the failure clearly, and tell the user what must be fixed before moving on.
12. If `config.arc.yaml` exists, summarize the current LLM settings and flag missing or obviously default values so the user can confirm or change them.
13. Report current stage: Idea / Setup / Running / Drafting / Gate.
14. Recommend next command from MVP skills only after the minimal test passes, or explicitly state that configuration must be fixed first.
