# ResearchRocket

> เทมเพลตสตูดิโอวิจัย SCI แบบ AI-native สำหรับ Claude Code  
> 10 เอเจนต์, 16 เวิร์กโฟลว์, ไปจนถึงแพ็กเกจส่งบทความที่ตรวจสอบย้อนกลับได้

## Slogan

จากไอเดียสู่หลักฐาน จนพร้อมตีพิมพ์

## คำอธิบายโครงการ

ResearchRocket เป็นเฟรมเวิร์กการทำงานวิจัย ไม่ใช่ชุดพรอมป์ต์แบบใช้ครั้งเดียวจบ  
ระบบนี้จัดลำดับงานตั้งแต่กำหนดหัวข้อ วรรณกรรม ข้อมูล การทดลอง สถิติ รูปประกอบ การเขียน การตรวจ reproducibility ไปจนถึงการแพ็กเกจส่งบทความ โดยผูกแต่ละขั้นกับ agents/skills/rules/hooks อย่างชัดเจน  
เป้าหมายคือให้ความถูกต้องมาก่อนความเร็ว และตรวจพบความเสี่ยงก่อนถึงขั้นส่งบทความ  
คำอธิบายฉบับเต็ม (ภาษาอังกฤษ): [README.md#project-description](README.md#project-description).

## ภาษา

[🇺🇸 English](README.md) | [🇨🇳 简体中文](README.zh-CN.md) | [🇫🇷 Français](README.fr.md) | [🇰🇷 한국어](README.ko.md) | **🇹🇭 ไทย** | [🇯🇵 日本語](README.ja.md) | [🇪🇸 Español](README.es.md) | [🇧🇷 Português (Brasil)](README.pt-BR.md)

---

## ภาพรวม

| หมวด | รายละเอียด |
|---|---|
| โครงสร้างเอเจนต์ | 10 บทบาท (`กลยุทธ์ -> ปฏิบัติ -> ตรวจทานสุดท้าย`) |
| คำสั่งสกิล | 16 คำสั่งแบบ slash |
| มาตรการคุณภาพ | 13 hooks + 11 กฎตามเส้นทางไฟล์ |
| เป้าหมาย | แพ็กเกจ SCI ที่ทำซ้ำได้และพร้อมส่ง |

## ทำไมต้องมีเทมเพลตนี้

ปัญหาใหญ่ของงานวิจัยที่ใช้ AI ไม่ใช่ความเร็ว แต่คือความน่าเชื่อถือของหลักฐาน  
ResearchRocket เพิ่มกรอบงานที่ชัดเจน: ขอบเขตบทบาท, quality gates, การตรวจสอบ reproducibility และการแพ็กเกจส่งบทความ

## สถาปัตยกรรม

ชั้นกลยุทธ์:
- `principal-investigator`

ชั้นปฏิบัติ:
- `literature-analyst`
- `data-engineer`
- `experiment-engineer`
- `quant-analyst`
- `figure-lead`
- `writing-lead`
- `reproducibility-auditor`
- `submission-manager`

ชั้นตรวจทานสุดท้าย:
- `peer-reviewer`

## ชุดคำสั่ง

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

## เริ่มต้นอย่างรวดเร็ว

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

## เวิร์กโฟลว์

| ขั้นตอน | Agents หลัก | Skills หลัก | Rules หลัก | Hooks หลัก | ผลลัพธ์ | Gate |
|---|---|---|---|---|---|---|
| 1. กำหนดโจทย์ | `principal-investigator`, `literature-analyst` | `/start`, `/research-idea` | `research-docs.md` | `session-start.sh` | brief หัวข้อ, สมมติฐาน | ล็อกขอบเขตและสมมติฐาน |
| 2. วรรณกรรมและหลักฐาน | `literature-analyst`, `writing-lead` | `/citation-audit` | `citation-integrity.md`, `research-docs.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | novelty map, รายงาน citation | ไม่มี citation ปลอม/placeholder |
| 3. ข้อมูล | `data-engineer` | `/data-intake`, `/data-clean` | `data-lineage.md`, `data-quality.md` | `validate-data-schema.sh`, `validate-data-lineage.sh` | ชุดข้อมูลสะอาด, lineage manifest | schema + lineage ผ่าน |
| 4. การทดลอง | `experiment-engineer` | `/research-run` | `experiment-code.md`, `reproducibility.md` | `validate-research-artifacts.sh` | artifacts, config snapshot | รันซ้ำได้ |
| 5. วิเคราะห์/สถิติ | `quant-analyst` | `/analysis-run` | `analysis-integrity.md` | `validate-statistics.sh` | metrics + uncertainty report | ไม่กล่าวอ้างเกินหลักฐาน |
| 6. รูปประกอบ | `figure-lead` | `/figure-build`, `/figure-qc` | `figure-standards.md` | `validate-figure-traceability.sh` | figures + traceability file | รูปทุกภาพตรวจย้อนกลับได้ |
| 7. เขียนและตรวจความครบถ้วน | `writing-lead`, `literature-analyst` | `/paper-style-sanity`, `/citation-audit`, `/paper-gate-check` | `paper-docs.md`, `citation-integrity.md` | `validate-citations.sh`, `validate-claim-evidence.sh` | draft บทความ, claim-evidence map | สไตล์เป็นเตือนเท่านั้น, ความครบถ้วนต้องผ่าน |
| 8. ตรวจ reproducibility | `reproducibility-auditor`, `peer-reviewer` | `/repro-audit`, `/review-report` | `reproducibility.md`, `review-gate.md` | `pre-submit-gate.sh` | รายงานตรวจซ้ำ, PASS/CONCERNS/FAIL | blocker ต้องแก้หรือบันทึกชัดเจน |
| 9. แพ็กเกจส่ง | `submission-manager`, `peer-reviewer` | `/latex-venue-pack`, `/latex-build-check` | `submission-docs.md` | `validate-latex-compile.sh`, `validate-bibtex.sh`, `validate-venue-format.sh` | submission package | ผ่าน strict pre-submit gate |

เอกสารอ้างอิง:
- [Workflow Guide](docs/WORKFLOW-GUIDE.md)
- [Collaborative Principle](docs/COLLABORATIVE-DESIGN-PRINCIPLE.md)
- [Skills Reference](.claude/docs/skills-reference.md)
- [Rules Reference](.claude/docs/rules-reference.md)

## แรงบันดาลใจเชิงวิธีวิทยา

- [stop-slop](https://github.com/hardikpandya/stop-slop): นำแนวคิดมากรับใช้กับงานวิชาการแบบเตือนเท่านั้น
- [pomasa](https://github.com/eXtremeProgramming-cn/pomasa): นำแนวคิดเรื่องขอบเขตบทบาทและ quality gate มาใช้

## นโยบายดูแล README หลายภาษา

เมื่อ `README.md` เปลี่ยน ต้องอัปเดตไฟล์เหล่านี้พร้อมกัน:
- `README.zh-CN.md`
- `README.fr.md`
- `README.ko.md`
- `README.th.md`
- `README.ja.md`
- `README.es.md`
- `README.pt-BR.md`

## ที่มาและเครดิต

พัฒนาต่อยอดจาก [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) (MIT)  
และผสานแนวคิดเวิร์กโฟลว์จาก [AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw) (MIT)

## ผู้มีส่วนร่วม

- [stephenlzc](https://github.com/stephenlzc)
- [Donchitos](https://github.com/Donchitos)
- [aiming-lab](https://github.com/aiming-lab)
- [openai/codex](https://github.com/openai/codex)

## สัญญาอนุญาต

MIT.
