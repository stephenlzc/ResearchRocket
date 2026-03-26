# ResearchRocket

> Claude Code용 AI 네이티브 SCI 연구 스튜디오 템플릿  
> 10개 에이전트, 16개 워크플로, 재현 가능한 제출 파이프라인.

## Slogan

아이디어에서 근거로, 그리고 게재까지.

## 프로젝트 설명

ResearchRocket은 단발성 프롬프트 모음이 아니라 연구 실행 프레임워크입니다.  
주제 정의부터 문헌, 데이터, 실험, 통계, 그림, 원고, 재현성 감사, 제출 패키징까지를 단계별로 고정하고, 각 단계에 agents/skills/rules/hooks를 연결합니다.  
핵심 목표는 속도보다 무결성입니다. 근거 없는 주장, 인용 누락, 계보 미기록, 재현 불가 상태를 제출 전에 발견하도록 설계되었습니다.  
영문 전체 설명: [README.md#project-description](README.md#project-description).

## 언어

[🇺🇸 English](README.md) | [🇨🇳 简体中文](README.zh-CN.md) | [🇫🇷 Français](README.fr.md) | **🇰🇷 한국어** | [🇹🇭 ไทย](README.th.md) | [🇯🇵 日本語](README.ja.md) | [🇪🇸 Español](README.es.md) | [🇧🇷 Português (Brasil)](README.pt-BR.md)

---

## 개요

| 항목 | 내용 |
|---|---|
| 에이전트 아키텍처 | 10개 역할 (`전략 -> 실행 -> 최종 게이트`) |
| 스킬 명령 | 16개 slash 명령 |
| 품질 장치 | 13개 hooks + 11개 경로 규칙 |
| 목표 | 재현 가능하고 제출 가능한 SCI 패키지 |

## 왜 필요한가

문제는 작성 속도가 아니라 연구 무결성입니다.  
ResearchRocket은 역할 경계, 품질 게이트, 재현성 점검, 제출 패키징을 표준화합니다.

## 아키텍처

전략:
- `principal-investigator`

실행:
- `literature-analyst`
- `data-engineer`
- `experiment-engineer`
- `quant-analyst`
- `figure-lead`
- `writing-lead`
- `reproducibility-auditor`
- `submission-manager`

최종 게이트:
- `peer-reviewer`

## 명령 체계

코어:
- `/start`
- `/setup-researchclaw`
- `/research-idea`
- `/research-run`
- `/paper-gate-check`

확장:
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

## 빠른 시작

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

## 워크플로

| 단계 | 주요 Agents | 주요 Skills | 주요 Rules | 주요 Hooks | 산출물 | 게이트 |
|---|---|---|---|---|---|---|
| 1. 주제 정의 | `principal-investigator`, `literature-analyst` | `/start`, `/research-idea` | `research-docs.md` | `session-start.sh` | 아이디어 브리프, 가설 초안 | 범위/가설 확정 |
| 2. 문헌 정리 | `literature-analyst`, `writing-lead` | `/citation-audit` | `citation-integrity.md`, `research-docs.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | novelty map, 인용 감사 | 가짜/플레이스홀더 인용 없음 |
| 3. 데이터 정비 | `data-engineer` | `/data-intake`, `/data-clean` | `data-lineage.md`, `data-quality.md` | `validate-data-schema.sh`, `validate-data-lineage.sh` | 정제 데이터셋, 계보 문서 | 스키마/계보 통과 |
| 4. 실험 실행 | `experiment-engineer` | `/research-run` | `experiment-code.md`, `reproducibility.md` | `validate-research-artifacts.sh` | 실행 산출물, 설정 스냅샷 | 재실행 가능 |
| 5. 분석/통계 | `quant-analyst` | `/analysis-run` | `analysis-integrity.md` | `validate-statistics.sh` | 지표/불확실성 보고서 | 근거 없는 유의성 주장 금지 |
| 6. 그림 제작 | `figure-lead` | `/figure-build`, `/figure-qc` | `figure-standards.md` | `validate-figure-traceability.sh` | 그림 + 추적 문서 | 모든 그림 추적 가능 |
| 7. 원고/무결성 | `writing-lead`, `literature-analyst` | `/paper-style-sanity`, `/citation-audit`, `/paper-gate-check` | `paper-docs.md`, `citation-integrity.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | 원고, claim-evidence 매핑 | 스타일은 경고만, 무결성 필수 |
| 8. 재현성 감사 | `reproducibility-auditor`, `peer-reviewer` | `/repro-audit`, `/review-report` | `reproducibility.md`, `review-gate.md` | `pre-submit-gate.sh` | 재현성 리포트, PASS/CONCERNS/FAIL | blocker 해결 또는 기록 |
| 9. 제출 패키징 | `submission-manager`, `peer-reviewer` | `/latex-venue-pack`, `/latex-build-check` | `submission-docs.md` | `validate-latex-compile.sh`, `validate-bibtex.sh`, `validate-venue-format.sh` | 제출 패키지 | strict pre-submit 통과 |

참고 문서:
- [Workflow Guide](docs/WORKFLOW-GUIDE.md)
- [Collaborative Principle](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md)
- [Skills Reference](.claude/docs/skills-reference.md)
- [Rules Reference](.claude/docs/rules-reference.md)

## CLI 호환성 현황

현재 확인된 상태:
- Claude Code: slash 기반 워크플로가 가장 완전하게 동작.
- Kimi CLI: 스킬 로드는 가능하지만 `/command` 직접 호출은 완전 동등하지 않음.
- OpenCode: 워크플로 의도 실행은 가능하지만 rules/hooks 동등성은 추가 작업 필요.

마이그레이션 이슈:
- [#1 Cross-CLI slash command compatibility layer](https://github.com/stephenlzc/ResearchRocket/issues/1)
- [#2 Cross-CLI guardrail parity](https://github.com/stephenlzc/ResearchRocket/issues/2)

PR 환영:
- 명령 어댑터, 게이트 실행기, 패리티 테스트, 마이그레이션 문서 기여를 환영합니다.

## 방법론 영감

- [stop-slop](https://github.com/hardikpandya/stop-slop): 학술 문체 경고형 검사로 재해석.
- [pomasa](https://github.com/eXtremeProgramming-cn/pomasa): 역할 경계 및 게이트 패턴 참고.

## i18n 유지보수 정책

`README.md`가 변경되면 아래 파일도 반드시 동기화:
- `README.zh-CN.md`
- `README.fr.md`
- `README.ko.md`
- `README.th.md`
- `README.ja.md`
- `README.es.md`
- `README.pt-BR.md`

## 출처 및 감사

[Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) 기반 2차 개발 (MIT).  
[AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw) 워크플로 개념 통합 (MIT).

## 기여자

- [stephenlzc](https://github.com/stephenlzc)
- [Donchitos](https://github.com/Donchitos)
- [aiming-lab](https://github.com/aiming-lab)
- [openai/codex](https://github.com/openai/codex)

## 라이선스

MIT.
