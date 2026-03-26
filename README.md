# ResearchRocket

> AI-native SCI research studio template for Claude Code.  
> 10 agents, 16 workflows, one reproducible submission pipeline.

## Slogan

From Idea to Evidence to Publication.

## Project Description

ResearchRocket is a structured research operations template that turns Claude Code into a disciplined SCI production environment. Instead of relying on ad-hoc prompting, it separates work into explicit roles, then connects those roles through auditable workflows. The system covers the full path from topic framing to literature mapping, data intake, cleaning, experimentation, statistical analysis, figure generation, writing, reproducibility audit, and venue-specific submission packaging. Each stage has named agents, slash commands, rules, and hooks, so reviewers can trace every claim back to source evidence and rerunnable artifacts. The design prioritizes integrity before speed: citation placeholders, weak claim-evidence links, missing lineage records, unsupported significance language, and broken LaTeX/BibTeX states are surfaced early through automated gates. For teams that need multilingual collaboration, the README system is synchronized across languages with a mandatory update policy. ResearchRocket does not replace scientific judgment; it protects it. You decide hypotheses, methods, and conclusions, while the framework enforces consistency, reproducibility, and submission readiness across the entire lifecycle. It is suitable for solo researchers, student teams, and labs that want predictable delivery quality, transparent handoffs, and fewer last-minute failures before peer review. In short, it transforms research execution from a fragile chat process into a reliable engineering workflow.

## Languages

**🇺🇸 English** | [🇨🇳 简体中文](README.zh-CN.md) | [🇫🇷 Français](README.fr.md) | [🇰🇷 한국어](README.ko.md) | [🇹🇭 ไทย](README.th.md) | [🇯🇵 日本語](README.ja.md) | [🇪🇸 Español](README.es.md) | [🇧🇷 Português (Brasil)](README.pt-BR.md)

---

## Snapshot

| Area | Value |
|---|---|
| Agent Architecture | 10 roles (`strategy -> execution -> review gate`) |
| Skill Commands | 16 slash commands (`core + extended`) |
| Guardrails | 13 hooks + 11 path-scoped rules |
| Output Goal | Reproducible, venue-ready SCI submission package |

## Why This Template

Most AI research drafting fails on integrity, not speed.  
ResearchRocket enforces structure: role boundaries, evidence gates, reproducibility checks, and submission readiness.

You keep final research decisions.  
The framework adds process discipline and catches failure points early.

## Architecture

Strategy tier:
- `principal-investigator`

Execution tiers:
- `literature-analyst`
- `data-engineer`
- `experiment-engineer`
- `quant-analyst`
- `figure-lead`
- `writing-lead`
- `reproducibility-auditor`
- `submission-manager`

Final gate:
- `peer-reviewer`

## Command Surface

Core:
- `/start`
- `/setup-researchclaw`
- `/research-idea`
- `/research-run`
- `/paper-gate-check`

Extended:
- `/data-intake`
- `/data-clean`
- `/analysis-run`
- `/figure-build`
- `/figure-qc`
- `/citation-audit`
- `/repro-audit`
- `/review-report`
- `/latex-venue-pack`
- `/latex-build-check`
- `/paper-style-sanity` (warn-only)

## Quick Start

```bash
git clone https://github.com/stephenlzc/ResearchRocket.git
cd ResearchRocket
python3 -m venv .venv
source .venv/bin/activate

git clone https://github.com/aiming-lab/AutoResearchClaw.git
cd AutoResearchClaw
pip install -e .
cd ..

claude
```

Run first:
- `/start`
- `/setup-researchclaw`

## Workflow

| Step | Primary Agents | Primary Skills | Main Rules | Main Hooks | Key Outputs | Gate |
|---|---|---|---|---|---|---|
| 1. Idea framing | `principal-investigator`, `literature-analyst` | `/start`, `/research-idea` | `research-docs.md` | `session-start.sh` | idea brief, hypothesis draft | scope and hypothesis locked |
| 2. Literature grounding | `literature-analyst`, `writing-lead` | `/citation-audit` | `citation-integrity.md`, `research-docs.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | novelty map, citation audit | no fake/placeholder citations |
| 3. Data intake and cleaning | `data-engineer` | `/data-intake`, `/data-clean` | `data-lineage.md`, `data-quality.md` | `validate-data-schema.sh`, `validate-data-lineage.sh` | curated dataset, lineage manifest | schema + lineage pass |
| 4. Experiment execution | `experiment-engineer` | `/research-run` | `experiment-code.md`, `reproducibility.md` | `validate-research-artifacts.sh` | run artifacts, config snapshots | rerunnable pipeline |
| 5. Analysis and statistics | `quant-analyst` | `/analysis-run` | `analysis-integrity.md` | `validate-statistics.sh` | metrics, uncertainty report | no unsupported significance claims |
| 6. Figure production | `figure-lead` | `/figure-build`, `/figure-qc` | `figure-standards.md` | `validate-figure-traceability.sh` | figures + traceability file | every figure traceable |
| 7. Writing and integrity check | `writing-lead`, `literature-analyst` | `/paper-style-sanity`, `/citation-audit`, `/paper-gate-check` | `paper-docs.md`, `citation-integrity.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | manuscript draft, claim-evidence map | style is warn-only, integrity required |
| 8. Reproducibility and review | `reproducibility-auditor`, `peer-reviewer` | `/repro-audit`, `/review-report` | `reproducibility.md`, `review-gate.md` | `pre-submit-gate.sh` | reproducibility report, PASS/CONCERNS/FAIL | blockers resolved or documented |
| 9. Venue packaging | `submission-manager`, `peer-reviewer` | `/latex-venue-pack`, `/latex-build-check` | `submission-docs.md` | `validate-latex-compile.sh`, `validate-bibtex.sh`, `validate-venue-format.sh` | submission package | strict pre-submit gate passed |

Reference docs:
- [Workflow Guide](docs/WORKFLOW-GUIDE.md)
- [Collaborative Principle](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md)
- [Skills Reference](.claude/docs/skills-reference.md)
- [Rules Reference](.claude/docs/rules-reference.md)

## Cross-CLI Compatibility Status

Current observations from local validation:
- Claude Code: native slash-style workflow is the baseline.
- Kimi CLI: skills can be loaded and used, but direct `/command` invocation is not yet parity-equivalent.
- OpenCode: workflow intent is executable, but rules/hooks parity is not guaranteed without adapter support.

Tracked migration issues:
- [#1 Cross-CLI slash command compatibility layer](https://github.com/stephenlzc/ResearchRocket/issues/1)
- [#2 Cross-CLI guardrail parity for hooks/rules and submission gates](https://github.com/stephenlzc/ResearchRocket/issues/2)

Call for PRs:
- Contributions are welcome for command adapters, guardrail runners, parity tests, and migration docs.

## Methodology Inspirations

- [stop-slop](https://github.com/hardikpandya/stop-slop): style-governance inspiration, rewritten for academic warn-only checks.
- [pomasa](https://github.com/eXtremeProgramming-cn/pomasa): pattern inspiration for role boundaries and quality gates.

Policy:
- External repositories are reference-only.
- No direct copy/paste of third-party skill text into this template.

## Attribution

This project is based on [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios), created by Donchitos, licensed under MIT.

This project integrates workflow concepts around [AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw), licensed under MIT.

## Contributors

- [stephenlzc](https://github.com/stephenlzc)
- [Donchitos](https://github.com/Donchitos)
- [aiming-lab](https://github.com/aiming-lab)
- [openai/codex](https://github.com/openai/codex)

## I18N Maintenance Policy

Any change to `README.md` must be synchronized to:
- `README.zh-CN.md`
- `README.fr.md`
- `README.ko.md`
- `README.th.md`
- `README.ja.md`
- `README.es.md`
- `README.pt-BR.md`

## License

MIT. Keep upstream attribution in derivative projects.
