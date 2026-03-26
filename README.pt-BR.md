# ResearchRocket

> Template de estúdio de pesquisa SCI AI-native para Claude Code.  
> 10 agentes, 16 workflows e um pipeline reproduzível até submissão.

## Slogan

Da ideia à evidência, até a publicação.

## Descrição do projeto

ResearchRocket não é um conjunto de prompts avulsos; é um framework operacional de pesquisa.  
Ele organiza todo o ciclo (tema, literatura, dados, experimentos, estatística, figuras, redação, auditoria de reprodutibilidade e empacotamento de submissão) e vincula cada etapa a agents, skills, rules e hooks explícitos.  
A prioridade é integridade antes de velocidade: identificar cedo citações incompletas, claims sem evidência, falhas de linhagem de dados e riscos de não reprodutibilidade.  
Descrição completa em inglês: [README.md#project-description](README.md#project-description).

## Idiomas

[🇺🇸 English](README.md) | [🇨🇳 简体中文](README.zh-CN.md) | [🇫🇷 Français](README.fr.md) | [🇰🇷 한국어](README.ko.md) | [🇹🇭 ไทย](README.th.md) | [🇯🇵 日本語](README.ja.md) | [🇪🇸 Español](README.es.md) | **🇧🇷 Português (Brasil)**

---

## Visão geral

| Área | Valor |
|---|---|
| Arquitetura de agentes | 10 papéis (`estratégia -> execução -> gate final`) |
| Comandos de skill | 16 comandos slash |
| Guardrails | 13 hooks + 11 regras por caminho |
| Objetivo | Pacote SCI reproduzível e pronto para submissão |

## Por que este template

O gargalo não é velocidade de geração, e sim integridade científica.  
ResearchRocket define fronteiras de papel, quality gates, auditoria de reprodutibilidade e empacotamento para submissão.

## Arquitetura

Estratégia:
- `principal-investigator`

Execução:
- `literature-analyst`
- `data-engineer`
- `experiment-engineer`
- `quant-analyst`
- `figure-lead`
- `writing-lead`
- `reproducibility-auditor`
- `submission-manager`

Gate final:
- `peer-reviewer`

## Comandos

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

## Início rápido

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

## Fluxo de trabalho

| Etapa | Agents principais | Skills principais | Rules principais | Hooks principais | Entregáveis | Gate |
|---|---|---|---|---|---|---|
| 1. Definição do tema | `principal-investigator`, `literature-analyst` | `/start`, `/research-idea` | `research-docs.md` | `session-start.sh` | brief de tema, hipótese | escopo e hipótese travados |
| 2. Literatura e evidências | `literature-analyst`, `writing-lead` | `/citation-audit` | `citation-integrity.md`, `research-docs.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | novelty map, auditoria de citação | sem citação falsa/placeholder |
| 3. Dados | `data-engineer` | `/data-intake`, `/data-clean` | `data-lineage.md`, `data-quality.md` | `validate-data-schema.sh`, `validate-data-lineage.sh` | dataset curado, manifesto de linhagem | schema + linhagem aprovados |
| 4. Experimentos | `experiment-engineer` | `/research-run` | `experiment-code.md`, `reproducibility.md` | `validate-research-artifacts.sh` | artefatos de run, snapshots de config | pipeline reproduzível |
| 5. Análise e estatística | `quant-analyst` | `/analysis-run` | `analysis-integrity.md` | `validate-statistics.sh` | métricas + incerteza | sem significância sem evidência |
| 6. Figuras | `figure-lead` | `/figure-build`, `/figure-qc` | `figure-standards.md` | `validate-figure-traceability.sh` | figuras + rastreabilidade | toda figura rastreável |
| 7. Redação e integridade | `writing-lead`, `literature-analyst` | `/paper-style-sanity`, `/citation-audit`, `/paper-gate-check` | `paper-docs.md`, `citation-integrity.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | draft, mapa claim-evidence | estilo é apenas aviso, integridade é obrigatória |
| 8. Auditoria de reprodutibilidade | `reproducibility-auditor`, `peer-reviewer` | `/repro-audit`, `/review-report` | `reproducibility.md`, `review-gate.md` | `pre-submit-gate.sh` | relatório repro, PASS/CONCERNS/FAIL | blockers resolvidos ou registrados |
| 9. Empacotamento de submissão | `submission-manager`, `peer-reviewer` | `/latex-venue-pack`, `/latex-build-check` | `submission-docs.md` | `validate-latex-compile.sh`, `validate-bibtex.sh`, `validate-venue-format.sh` | pacote de submissão | strict pre-submit gate aprovado |

Referências:
- [Workflow Guide](docs/WORKFLOW-GUIDE.md)
- [Collaborative Principle](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md)
- [Skills Reference](.claude/docs/skills-reference.md)
- [Rules Reference](.claude/docs/rules-reference.md)

## Inspirações metodológicas

- [stop-slop](https://github.com/hardikpandya/stop-slop): inspiração de higiene de estilo, adaptada para aviso acadêmico.
- [pomasa](https://github.com/eXtremeProgramming-cn/pomasa): inspiração para fronteiras de papéis e padrões de gate.

## Política de manutenção i18n

Se `README.md` mudar, atualize também:
- `README.zh-CN.md`
- `README.fr.md`
- `README.ko.md`
- `README.th.md`
- `README.ja.md`
- `README.es.md`
- `README.pt-BR.md`

## Fontes e agradecimentos

Baseado em [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) (MIT).  
Integra conceitos de [AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw) (MIT).

## Contribuidores

- [stephenlzc](https://github.com/stephenlzc)
- [Donchitos](https://github.com/Donchitos)
- [aiming-lab](https://github.com/aiming-lab)
- [openai/codex](https://github.com/openai/codex)

## Licença

MIT.
