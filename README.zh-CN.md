# ResearchRocket

> 面向 Claude Code 的 AI 原生 SCI 科研工作室模板。  
> 10 个 Agent，16 条工作流，一条可复现实验到投稿的闭环流水线。

## Slogan

从想法到证据，再到发表。

## 项目简介

ResearchRocket 是一个面向科研交付的流程框架，不是单次提示词工具。  
它把选题、文献、数据、实验、统计、作图、写作、复现审计和投稿打包拆成可追踪阶段，并为每阶段绑定明确的 agents、skills、rules 与 hooks。  
核心目标是先保证研究完整性，再追求写作速度：让“证据链断裂、引用占位、实验不可复现、投稿包不完整”等问题在早期被发现。  
完整英文描述见 [README.md#project-description](README.md#project-description)。

## 语言导航

[🇺🇸 English](README.md) | **🇨🇳 简体中文** | [🇫🇷 Français](README.fr.md) | [🇰🇷 한국어](README.ko.md) | [🇹🇭 ไทย](README.th.md) | [🇯🇵 日本語](README.ja.md) | [🇪🇸 Español](README.es.md) | [🇧🇷 Português (Brasil)](README.pt-BR.md)

---

## 项目速览

| 模块 | 内容 |
|---|---|
| Agent 架构 | 10 个角色（`策略 -> 执行 -> 终审`） |
| Skill 命令 | 16 个斜杠命令（核心 + 扩展） |
| 质量防线 | 13 个 hooks + 11 个路径规则 |
| 目标产出 | 可复现、可审计、可投稿的 SCI 交付包 |

## 为什么需要它

AI 写得快，但科研问题通常出在“完整性”而不是“速度”：  
证据链断裂、引用占位、实验不可复现、投稿包不完整。

ResearchRocket 把这些高风险点前移到流程中，用规则和门禁提前拦截。  
你保留研究决策权，系统负责流程纪律。

## 架构层级

策略层：
- `principal-investigator`

执行层：
- `literature-analyst`
- `data-engineer`
- `experiment-engineer`
- `quant-analyst`
- `figure-lead`
- `writing-lead`
- `reproducibility-auditor`
- `submission-manager`

终审层：
- `peer-reviewer`

## 命令面（Command Surface）

核心命令：
- `/start`
- `/setup-researchclaw`
- `/research-idea`
- `/research-run`
- `/paper-gate-check`

扩展命令：
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
- `/paper-style-sanity`（仅告警，不阻断）

## 快速开始

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

建议先执行：
- `/start`
- `/setup-researchclaw`

## 端到端流程

| 阶段 | 主要 Agents | 主要 Skills | 关键 Rules | 关键 Hooks | 产出物 | 门禁判定 |
|---|---|---|---|---|---|---|
| 1. 选题与研究定义 | `principal-investigator`, `literature-analyst` | `/start`, `/research-idea` | `research-docs.md` | `session-start.sh` | 选题简报、假设草案 | 范围和假设锁定 |
| 2. 文献定位与证据盘点 | `literature-analyst`, `writing-lead` | `/citation-audit` | `citation-integrity.md`, `research-docs.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | novelty map、引用审计报告 | 无伪造/占位引用 |
| 3. 数据采集与清洗 | `data-engineer` | `/data-intake`, `/data-clean` | `data-lineage.md`, `data-quality.md` | `validate-data-schema.sh`, `validate-data-lineage.sh` | 清洗数据集、血缘清单 | schema 与血缘通过 |
| 4. 实验执行 | `experiment-engineer` | `/research-run` | `experiment-code.md`, `reproducibility.md` | `validate-research-artifacts.sh` | 实验产物、配置快照 | 可复跑、可追溯 |
| 5. 分析与统计 | `quant-analyst` | `/analysis-run` | `analysis-integrity.md` | `validate-statistics.sh` | 指标与不确定性报告 | 无证据不足的显著性结论 |
| 6. 图表生产 | `figure-lead` | `/figure-build`, `/figure-qc` | `figure-standards.md` | `validate-figure-traceability.sh` | 图表与可追溯文件 | 每张图都可回溯 |
| 7. 写作与完整性检查 | `writing-lead`, `literature-analyst` | `/paper-style-sanity`, `/citation-audit`, `/paper-gate-check` | `paper-docs.md`, `citation-integrity.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | 论文草稿、claim-evidence 映射 | 文风仅告警，完整性必须通过 |
| 8. 复现审计与评审 | `reproducibility-auditor`, `peer-reviewer` | `/repro-audit`, `/review-report` | `reproducibility.md`, `review-gate.md` | `pre-submit-gate.sh` | 复现报告、PASS/CONCERNS/FAIL | 阻断项清零或留痕 |
| 9. 投稿打包 | `submission-manager`, `peer-reviewer` | `/latex-venue-pack`, `/latex-build-check` | `submission-docs.md` | `validate-latex-compile.sh`, `validate-bibtex.sh`, `validate-venue-format.sh` | 投稿包 | 严格 pre-submit gate 通过 |

配套文档：
- [Workflow Guide](docs/WORKFLOW-GUIDE.md)
- [Collaborative Principle](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md)
- [Skills Reference](.claude/docs/skills-reference.md)
- [Rules Reference](.claude/docs/rules-reference.md)

## 跨 CLI 兼容现状

当前实测结论：
- Claude Code：原生 slash 工作流体验最完整。
- Kimi CLI：可加载技能，但 `/command` 直调用还未完全等价。
- OpenCode：可执行工作流意图，但 rules/hooks 还未做到完全一致。

迁移 issue：
- [#1 跨 CLI slash 命令兼容层](https://github.com/stephenlzc/ResearchRocket/issues/1)
- [#2 跨 CLI 规则/门禁一致性](https://github.com/stephenlzc/ResearchRocket/issues/2)

欢迎 PR：
- 欢迎提交命令适配器、门禁执行器、一致性测试与迁移文档。

## 方法论启发

- [stop-slop](https://github.com/hardikpandya/stop-slop)：借鉴其写作质量治理思想，已改造成学术场景的 warn-only 检查。
- [pomasa](https://github.com/eXtremeProgramming-cn/pomasa)：借鉴其角色边界与质量门禁模式。

策略说明：
- 外部仓库仅作参考引用。
- 不直接复制第三方 skill 文本。

## 项目来源与致谢

本项目基于 [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) 二次开发，原作者 Donchitos，MIT License。  
同时集成 [AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw) 的流程能力（MIT License）。

## 贡献者

- [stephenlzc](https://github.com/stephenlzc)
- [Donchitos](https://github.com/Donchitos)
- [aiming-lab](https://github.com/aiming-lab)
- [openai/codex](https://github.com/openai/codex)

## README 多语言维护策略

只要 `README.md` 发生变更，必须同步更新：
- `README.zh-CN.md`
- `README.fr.md`
- `README.ko.md`
- `README.th.md`
- `README.ja.md`
- `README.es.md`
- `README.pt-BR.md`

## 许可证

MIT。二次开发请保留上游来源说明与致谢。
