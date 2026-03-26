# ResearchRocket

ResearchRocket is an AI-native research workflow template that helps teams go from idea to reproducible SCI-ready paper deliverables using structured agents, quality gates, and AutoResearchClaw pipeline integration.

Build faster, validate earlier, and ship cleaner research artifacts.

**Hashtags:** #AIResearch #ResearchAutomation #AcademicWriting #ReproducibleScience #AutoResearchClaw #OpenScience #PaperEngineering #MLResearch

## Attribution

This project is based on [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios),
created by Donchitos, licensed under the MIT License.

This project also integrates workflow concepts and CLI usage around
[AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw),
which is licensed under MIT.

中文说明：
本项目基于 [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) 进行二次开发，
原作者为 Donchitos，原项目采用 MIT License。
同时，本项目集成了 [AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw) 的流程与 CLI 能力（MIT License）。

## What This Template Does

- Provides a research-team agent architecture (PI, literature, experiment, stats, writing, review).
- Provides MVP slash-skill workflows from idea to runnable research pipeline.
- Adds rules and hooks for citation checks, artifact checks, and pre-paper quality gates.
- Integrates `researchclaw` CLI as the execution backend for autonomous pipeline runs.

## MVP Skills (5)

- `/start` - onboarding and stage detection for research projects
- `/setup-researchclaw` - install/init/config guidance for `researchclaw`
- `/research-idea` - structured ideation and hypothesis shaping
- `/research-run` - run/resume/report workflow for `researchclaw`
- `/paper-gate-check` - pre-submission gate check

## Quick Start

```bash
# 1) Create and activate Python env
python3 -m venv .venv
source .venv/bin/activate

# 2) Install AutoResearchClaw (example)
git clone https://github.com/aiming-lab/AutoResearchClaw.git
cd AutoResearchClaw
pip install -e .
cd ..

# 3) Use this template in Claude Code
claude
# then run:
# /start
# /setup-researchclaw
# /research-idea
# /research-run
# /paper-gate-check
```

## Suggested Directory Layout

See [docs/WORKFLOW-GUIDE.md](docs/WORKFLOW-GUIDE.md) and [.claude/docs/directory-structure.md](.claude/docs/directory-structure.md).

## License

MIT. Keep upstream attribution when making further derivatives.
