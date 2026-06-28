---
name: setup-exam-prompt
description: >
  First-time project configuration for the Exam Prompt skill system. Scaffolds per-repo config:
  university detection, subject/pattern selection, PYQ path setup, dependency validation, and
  session profile creation. Run ONCE per repo before using any other exam prompt skill. Works for
  any university worldwide. Run when: user says "setup", "configure", "first time", "get started",
  or "onboard".
version: 1.0.0
---

# /setup-exam-prompt — Onboard Your Repository for Exam Prompt

## What This Skill Does

Configures the Exam Prompt system for your university, subjects, and preferences. Run this **once
per repo** before using any other skill (`/answer`, `/notes`, `/pyq-analysis`, `/imp-topics`, etc.).

After setup, your configuration is saved in `deps/session-profile.json` — every other skill reads
this file so you never re-answer the same questions.

---

## Before You Start

### Prerequisites

- [ ] You have cloned this repo (`git clone https://github.com/pinakdhabu/Exam-prompt.git`)
- [ ] An AI coding agent is installed (Claude Code, OpenCode, Cursor, Windsurf, Cline, etc.)
- [ ] Your syllabus PDF(s) and/or PYQ PDF(s) are accessible

### Step 0: Validate Dependencies

```bash
bash deps/resolve.sh --check-only
```

If anything is missing, run:

```bash
bash deps/resolve.sh --install
```

---

## Setup Questions

### Q1 — Which university are you studying under?

| University                                             | Pattern Years            |
| ------------------------------------------------------ | ------------------------ |
| **SPPU** (Savitribai Phule Pune University)            | 2019, 2024               |
| **VTU** (Visvesvaraya Technological University)        | 2018, 2021, 2022         |
| **JNTU** (Jawaharlal Nehru Technological University)   | R19, R20, R22            |
| **Mumbai University**                                  | 2019, 2024               |
| **AKTU** (Dr. A.P.J. Abdul Kalam Technical University) | 2020, 2021               |
| **RGPV** (Rajiv Gandhi Proudyogiki Vishwavidyalaya)    | 2020, 2021               |
| **IIT/NIT**                                            | Semester-based           |
| **US/Canada**                                          | Midterm + Final          |
| **UK (Oxford/Cambridge/etc.)**                         | Written papers           |
| **European (ECTS)**                                    | Module exams             |
| **Australian**                                         | Semester-based           |
| **Other**                                              | I'll describe my pattern |

### Q2 — What is your department/program?

- Computer Engineering / CSE
- Information Technology / IT
- Electronics & Telecommunication / ENTC
- Mechanical Engineering
- Civil Engineering
- Electrical Engineering
- Artificial Intelligence & ML
- Data Science
- Arts (BA, BFA, Performing Arts)
- Commerce (B.Com, M.Com, Accounting & Finance)
- Law (LLB, LLM, Business Law)
- Medicine (MBBS, BDS, Nursing, Pharmacy)
- Other (specify)

### Q3 — Which semester are you in?

| Program           | Semesters |
| ----------------- | --------- |
| BE / B.Tech       | 1–8       |
| ME / M.Tech       | 1–4       |
| B.Sc / B.Com / BA | 1–6       |
| Diploma           | 1–6       |
| Other             | Specify   |

### Q4 — Which subjects are you currently studying?

List the subjects with course codes (if known). Examples:

```
1. Database Management Systems (210241)
2. Operating Systems (210242)
3. Computer Networks (210243)
4. Design & Analysis of Algorithms (210244)
```

Or provide a syllabus PDF and I'll extract them automatically.

### Q5 — Do you have PYQ (Previous Year Question Paper) PDFs?

- **Yes** — Provide the directory path or upload them. I'll index them for analysis.
- **No** — I'll use the built-in SPPU PYQ collection or generate practice papers from the syllabus.

### Q6 — What's your target?

- **Pass the exam** — Focus on Must-Prepare topics, high-probability questions
- **Good score (8+ GPA)** — Must-Prepare + Selective topics, all PYQs practiced
- **Top score (10 GPA)** — Full coverage, every topic, every angle
- **Just get started** — Quick setup, I'll figure out the rest as I go

---

## After Setup

Once you answer these, the system will:

1. **Create** `deps/session-profile.json` with your configuration
2. **Validate** all dependencies (system tools, npm, Python)
3. **Index** any PYQ PDFs you provided
4. **Print** a summary of available skills and how to use them

### What You Can Do Next

| Command          | What It Does                                     |
| ---------------- | ------------------------------------------------ |
| `/answer`        | Write an exam answer for any question            |
| `/notes`         | Generate syllabus-locked study notes             |
| `/pyq-analysis`  | Analyze trends from previous year papers         |
| `/imp-topics`    | Get high-probability topics for the next exam    |
| `/study-plan`    | Generate a personalized study schedule           |
| `/mcq-practice`  | Practice with exam-style MCQs                    |
| `/exam-paper`    | Generate a practice question paper               |
| `/flashcards`    | Create Anki/CSV flashcards from your material    |
| `/formula-sheet` | Build a compact formula reference sheet          |
| `/mind-map`      | Visualize topic hierarchies and connections      |
| `/assignment`    | Write an assignment solution with marking scheme |
| `/viva-prep`     | Prepare for oral exams and viva voce             |

---

## Configuration Persistence

Your profile is stored in `deps/session-profile.json`:

```json
{
  "university": {
    "name": "Savitribai Phule Pune University",
    "pattern": "2019",
    "department": "Computer Engineering",
    "semester": 6
  },
  "subjects": [{ "name": "Database Management Systems", "code": "210241" }],
  "target": "good-score",
  "pyq_path": "/path/to/pyqs",
  "setup_date": "2026-06-06"
}
```

To change any setting, run `/setup` again.

### Post-Setup Verification Checklist

After setup completes, confirm all the following:

- [ ] `deps/session-profile.json` exists and is valid JSON
- [ ] University name, pattern, and department are correct
- [ ] Subject list includes all current-semester subjects with correct codes
- [ ] Exam type (ESE/MSE/Mid-sem/Final) matches your actual exam format
- [ ] PYQ path (if provided) contains valid PDF files
- [ ] All dependencies pass the check (`bash deps/resolve.sh --check-only`)
- [ ] At least one skill loads correctly (e.g., `/answer "Define DBMS"`)

### Repair / Reset Commands

| Command                                          | What It Does                                                 |
| ------------------------------------------------ | ------------------------------------------------------------ |
| `/setup --repair`                                | Validate and fix the session profile without losing settings |
| `/setup --reset`                                 | Delete session profile and start fresh                       |
| `/setup --repair --force`                        | Rebuild profile from answers, preserving only PYQ paths      |
| `npm run init -- --university VTU --pattern 2022`| Non-interactive setup with known parameters                   |
| `bash deps/resolve.sh --force`                   | Reinstall all dependencies from scratch                       |

---

## Troubleshooting

| Problem                              | Solution                                                                         |
| ------------------------------------ | -------------------------------------------------------------------------------- |
| `deps/resolve.sh: command not found` | You're not in the repo root. `cd Exam-prompt`                                    |
| `python3 not found`                  | Install Python 3 — see `deps/resolve.sh` output for per-OS instructions          |
| `pdftotext not found`                | `sudo apt install poppler-utils` (Linux) / `brew install poppler` (macOS)        |
| Skills not loading in agent          | Make sure `CLAUDE.md` and `AGENTS.md` are in the repo root that your agent reads |

---

## Integration with Other Skills

Every skill in this system reads your session profile from `setup-exam-prompt`:

| Skill                  | What It Reads                                   |
| ---------------------- | ----------------------------------------------- |
| `answer-writer`        | University pattern, marks format, command words |
| `notes-generator`      | Subject, unit structure, exam type              |
| `pyq-analyzer`         | PYQ path, university pattern                    |
| `imp-topics-generator` | PYQ path, target GPA                            |
| `study-planner`        | Subjects, available time, target                |
| `exam-paper-generator` | University pattern, CO/Bloom distribution       |
| `session-config`       | Full profile for reconfiguration                |

## Error Handling

| Error                              | Cause                                  | Solution                                              |
| ---------------------------------- | -------------------------------------- | ----------------------------------------------------- |
| `deps/resolve.sh` fails            | Missing system dependencies            | Run `bash deps/resolve.sh --install` for auto-install |
| `session-profile.json` write fails | Permission denied or disk full         | Check write permissions on `deps/` directory          |
| PYQ directory not found            | Wrong path provided                    | Verify path with `ls` / `dir` before providing        |
| Python 3 not installed             | Missing runtime                        | See deps/resolve.sh output for per-OS instructions    |
| pdftotext fails on all PDFs        | No text-based PDFs found (all scanned) | Upload scanned PDFs or use verbal description         |
| Agent cannot find skills           | CLAUDE.md or AGENTS.md missing         | Ensure both files exist in repo root                  |
| University not in detection list   | Unknown or very new university         | Select "Other" and describe pattern manually          |
| npm/node not found (if using npm)  | Node.js not installed                  | Install Node.js from https://nodejs.org               |

## Quality Gate

Before declaring setup complete, verify:

- [ ] `deps/session-profile.json` is valid JSON and can be parsed
- [ ] All required fields: university name, pattern, department, semester, subjects
- [ ] At least one subject is configured with a valid code
- [ ] Target GPA/score is set (pass, good, or top)
- [ ] Dependencies check passes (run `bash deps/resolve.sh --check-only`)
- [ ] PYQ directory (if set) contains at least one `.pdf` file
- [ ] Current working directory is the repo root (contains `deps/`, `scripts/`, `skills/`)
- [ ] Sample skill can be invoked: e.g., run `/answer "test"` and confirm no error

If any check fails, report the specific failure and do not mark setup as complete until resolved.
