---
name: universal-exam-skill-hub
description: >
  Master entry point for ALL SPPU exam preparation skills. Routes to specialized universal sub-skills for answer writing, notes generation, PYQ analysis, IMP topics, assignment writing, exam paper generation, and university detection.
  Trigger on any exam-related query. The AGENTS.md file in this repo contains a complete skill loading system. Works for ANY university worldwide.
---

# Universal Exam Skill Hub

This repository contains a comprehensive set of universal exam preparation skills for **any university worldwide** (pre-configured for SPPU Computer Engineering).

## Available Skills

All skills are in the `skills/` directory with `SKILL.md` files. See `AGENTS.md` for the complete skill registry.

**For complete agent instructions** — including skill discovery, conversation starters, multi-step workflows, and configuration guides for all major AI coding platforms (Cursor, Windsurf, Aider, Cline, Copilot, Continue.dev) — see [`AGENT-GUIDE.md`](AGENT-GUIDE.md).

| Skill | File | Purpose |
|---|---|---|
| universal-a-plus-answer-writer | `skills/answer-writer/SKILL.md` | 10/10 GPA answers — all conditions |
| universal-notes-generator | `skills/notes-generator/SKILL.md` | 12+ note formats for any subject |
| universal-pyq-analyzer | `skills/pyq-analyzer/SKILL.md` | 13 analysis types with stats |
| universal-imp-topics-generator | `skills/imp-topics-generator/SKILL.md` | 5 probability levels, 7 time plans |
| universal-assignment-writer | `skills/assignment-writer/SKILL.md` | 12 assignment types with marking |
| universal-exam-paper-generator | `skills/exam-paper-generator/SKILL.md` | 11+ university paper patterns |
| universal-sppu-exam-simulator | `skills/sppu-exam-simulator/SKILL.md` | Physical exam constraints, page/time budgeting, moderator checks |
| universal-subject-prompt-bank | `skills/subject-prompt-bank/SKILL.md` | 8 discipline templates, 16 samples |
| universal-document-reader | `skills/universal-document-reader/SKILL.md` | PDF/DOCX/image to clean text |
| universal-document-generator | `skills/document-generator/SKILL.md` | Markdown to print-ready PDF |
| universal-university-adapter | `skills/universal-university-adapter/SKILL.md` | University detection & routing |
| pyq-index | `pyq-index/SKILL.md` | PYQ PDF collection index |

## PYQ Collection

A collection of SPPU PYQ PDFs (2019–2025) is referenced by `pyq-index/SKILL.md`.

## Usage

Load the relevant skill from the `skills/` directory. For non-SPPU universities, first load the `universal-university-adapter` skill which scans/accepts your PYQ and syllabus PDFs, detects your university pattern, and routes to the correct skill.

## Official Syllabus Reference (SPPU)

For accurate unit-wise content, Course Outcomes (CO), and CO-PO mapping:
- See [`SYLLABUS.md`](SYLLABUS.md) — extracted from official SPPU PDFs
- See [`SYLLABUS.md`](SYLLABUS.md) for the complete reference
