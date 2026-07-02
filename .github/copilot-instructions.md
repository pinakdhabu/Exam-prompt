# GitHub Copilot Instructions — Exam-Prompt

## Project Purpose

This is a universal skill hub for AI-powered exam preparation. It contains **30 reusable skills** in `skills/<name>/SKILL.md` format that guide AI agents to generate exam answers, notes, analysis, assignments, flashcards, study plans, and more for **ANY university worldwide**.

## Key Architecture

- `skills/` — 30 SKILL.md files, each a complete instruction set for one exam task
- `AGENTS.md` — XML registry of all skills (auto-discovered by agents)
- `llms.txt` — Concise project map for quick LLM orientation
- `AGENT-GUIDE.md` — Full agent onboarding with multi-step workflows
- `examples/` — Sample papers + solutions for 48 subjects
- `USE-CASES.md` — 33 documented workflow examples
- `universities/` — Configs for 10 universities (SPPU, VTU, Mumbai, AKTU, IIT, etc.)

## For Exam Answers

When asked to write an exam answer, load `skills/answer-writer/SKILL.md` and follow:

1. Direct answer, no preamble (never "Here is your answer")
2. Bold technical terms on first use
3. Numbered points for body, tables for comparisons
4. Mermaid diagrams for architecture/flowcharts
5. Definition + points + diagram + example + closing (for 4+ marks)
6. 2 marks = 5-6 lines, ~3 lines per additional mark

## Key Skills

| Skill | File | When to use |
|-------|------|-------------|
| Answer Writer | `skills/answer-writer/SKILL.md` | Exam answers, numericals, derivations |
| Notes Generator | `skills/notes-generator/SKILL.md` | Study notes in 12+ formats |
| PYQ Analyzer | `skills/pyq-analyzer/SKILL.md` | Past paper analysis with stats |
| IMP Topics | `skills/imp-topics-generator/SKILL.md` | "What's important?" questions |
| Study Planner | `skills/study-planner/SKILL.md` | Study schedules & timetables |
| Flashcard Gen | `skills/flashcard-generator/SKILL.md` | Anki/Quizlet flashcards |
| MCQ Generator | `skills/mcq-practice-generator/SKILL.md` | Practice questions |
| Exam Simulator | `skills/sppu-exam-simulator/SKILL.md` | Full exam hall simulation |
| University Adapter | `skills/universal-university-adapter/SKILL.md` | Non-SPPU universities |

## University Patterns Supported

SPPU 2019/2024, VTU, JNTU, Mumbai Univ, Anna Univ, AKTU, DU, IIT Bombay, Oxford, Harvard. Generic fallback: 5 units, 100 marks, 3 hours.

## Rules

- Always read the relevant SKILL.md before responding
- Never make up university patterns — use `universal-university-adapter` skill
- Default: SPPU 2019 Pattern if no university specified
- This repo is 100% free and open source — no paid features
