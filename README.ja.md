# ResearchRocket

> Claude Code 向けの AI ネイティブ SCI 研究スタジオテンプレート。  
> 10 エージェント、16 ワークフロー、再現可能な投稿パイプライン。

## Slogan

アイデアからエビデンスへ、そして掲載まで。

## プロジェクト説明

ResearchRocket は単発のプロンプト集ではなく、研究実行のための運用フレームワークです。  
テーマ定義、文献、データ、実験、統計、図表、執筆、再現性監査、投稿パッケージまでを段階化し、各段階に agents/skills/rules/hooks を明示的に割り当てます。  
目的は速度より先に整合性を担保することです。証拠不足の主張、引用の欠落、再現不能な状態を投稿前に検出できるよう設計されています。  
英語の完全版説明: [README.md#project-description](README.md#project-description)。

## 言語

[🇺🇸 English](README.md) | [🇨🇳 简体中文](README.zh-CN.md) | [🇫🇷 Français](README.fr.md) | [🇰🇷 한국어](README.ko.md) | [🇹🇭 ไทย](README.th.md) | **🇯🇵 日本語** | [🇪🇸 Español](README.es.md) | [🇧🇷 Português (Brasil)](README.pt-BR.md)

---

## 概要

| 項目 | 内容 |
|---|---|
| エージェント構成 | 10 ロール（`戦略 -> 実行 -> 最終ゲート`） |
| スキルコマンド | 16 個の slash コマンド |
| 品質ガード | 13 hooks + 11 のパススコープ規則 |
| 目標成果 | 再現可能で投稿可能な SCI パッケージ |

## なぜ必要か

AI 研究で問題になるのは生成速度より整合性です。  
ResearchRocket は役割境界、品質ゲート、再現性監査、投稿パッケージ化を標準化します。

## アーキテクチャ

戦略層:
- `principal-investigator`

実行層:
- `literature-analyst`
- `data-engineer`
- `experiment-engineer`
- `quant-analyst`
- `figure-lead`
- `writing-lead`
- `reproducibility-auditor`
- `submission-manager`

最終ゲート:
- `peer-reviewer`

## コマンド

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
- `/paper-style-sanity`（warn-only）

## クイックスタート

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

## ワークフロー

| ステップ | 主担当 Agents | 主担当 Skills | 主要 Rules | 主要 Hooks | 主要成果物 | ゲート |
|---|---|---|---|---|---|---|
| 1. テーマ定義 | `principal-investigator`, `literature-analyst` | `/start`, `/research-idea` | `research-docs.md` | `session-start.sh` | 企画メモ、仮説草案 | スコープ確定 |
| 2. 文献・根拠整理 | `literature-analyst`, `writing-lead` | `/citation-audit` | `citation-integrity.md`, `research-docs.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | novelty map、引用監査 | 擬似引用なし |
| 3. データ整備 | `data-engineer` | `/data-intake`, `/data-clean` | `data-lineage.md`, `data-quality.md` | `validate-data-schema.sh`, `validate-data-lineage.sh` | 整備済みデータ、lineage | スキーマ/系譜通過 |
| 4. 実験実行 | `experiment-engineer` | `/research-run` | `experiment-code.md`, `reproducibility.md` | `validate-research-artifacts.sh` | 実験成果物、設定スナップショット | 再実行可能 |
| 5. 分析・統計 | `quant-analyst` | `/analysis-run` | `analysis-integrity.md` | `validate-statistics.sh` | 指標・不確実性レポート | 根拠なき有意差主張なし |
| 6. 図表作成 | `figure-lead` | `/figure-build`, `/figure-qc` | `figure-standards.md` | `validate-figure-traceability.sh` | 図表 + トレーサビリティ | 全図表が追跡可能 |
| 7. 執筆・整合性確認 | `writing-lead`, `literature-analyst` | `/paper-style-sanity`, `/citation-audit`, `/paper-gate-check` | `paper-docs.md`, `citation-integrity.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | 原稿、claim-evidence 対応表 | 文体は警告のみ、整合性は必須 |
| 8. 再現性監査 | `reproducibility-auditor`, `peer-reviewer` | `/repro-audit`, `/review-report` | `reproducibility.md`, `review-gate.md` | `pre-submit-gate.sh` | 再現性報告、PASS/CONCERNS/FAIL | blocker 解消または明示 |
| 9. 投稿パッケージ | `submission-manager`, `peer-reviewer` | `/latex-venue-pack`, `/latex-build-check` | `submission-docs.md` | `validate-latex-compile.sh`, `validate-bibtex.sh`, `validate-venue-format.sh` | 投稿パッケージ | strict gate 通過 |

参照:
- [Workflow Guide](docs/WORKFLOW-GUIDE.md)
- [Collaborative Principle](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md)
- [Skills Reference](.claude/docs/skills-reference.md)
- [Rules Reference](.claude/docs/rules-reference.md)

## CLI 互換性の現状

ローカル検証で確認した内容:
- Claude Code: slash コマンドを含むネイティブ運用が最も安定。
- Kimi CLI: スキル読み込みは可能だが、`/command` 直接実行の互換性は未完。
- OpenCode: ワークフロー意図は実行できるが、rules/hooks の同等性は追加実装が必要。

移行トラッキング Issue:
- [#1 Cross-CLI slash command compatibility layer](https://github.com/stephenlzc/ResearchRocket/issues/1)
- [#2 Cross-CLI guardrail parity for hooks/rules and submission gates](https://github.com/stephenlzc/ResearchRocket/issues/2)

PR 募集:
- コマンドアダプタ、ゲート実行基盤、互換性テスト、移行ドキュメントの貢献を歓迎します。

## 方法論の参照元

- [stop-slop](https://github.com/hardikpandya/stop-slop): 学術向け warn-only スタイルチェックとして再解釈。
- [pomasa](https://github.com/eXtremeProgramming-cn/pomasa): ロール境界とゲート設計の着想源。

## README 多言語運用ポリシー

`README.md` を変更した場合、以下を同時更新:
- `README.zh-CN.md`
- `README.fr.md`
- `README.ko.md`
- `README.th.md`
- `README.ja.md`
- `README.es.md`
- `README.pt-BR.md`

## 出典と謝辞

[Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) を基に二次開発（MIT）。  
[AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw) のワークフロー概念を統合（MIT）。

## コントリビューター

- [stephenlzc](https://github.com/stephenlzc)
- [Donchitos](https://github.com/Donchitos)
- [aiming-lab](https://github.com/aiming-lab)
- [openai/codex](https://github.com/openai/codex)

## ライセンス

MIT.
