---
name: sppu-exam-skill-hub
description: >
  Master entry point for all SPPU engineering exam preparation skills. Routes to specialized sub-skills for answer writing, notes generation, PYQ analysis, IMP topics, assignment writing, and exam paper generation.
  Trigger on any SPPU engineering exam-related query. The AGENTS.md file in this repo contains a complete skill loading system.
---

# SPPU Exam Skill Hub

This repository contains a comprehensive set of skills for SPPU Undergraduate Engineering exam preparation (2019 & 2024 Pattern).

## Available Skills

All skills are in the `skills/` directory with `SKILL.md` files. See `AGENTS.md` for the complete skill registry.

| Skill | File | Purpose |
|---|---|---|
| answer-writer | `skills/answer-writer/SKILL.md` | Write exam-ready theory answers |
| notes-generator | `skills/notes-generator/SKILL.md` | Compile syllabus-locked notes |
| pyq-analyzer | `skills/pyq-analyzer/SKILL.md` | Analyze PYQ patterns |
| imp-topics-generator | `skills/imp-topics-generator/SKILL.md` | Generate IMP topics & questions |
| assignment-writer | `skills/assignment-writer/SKILL.md` | Write assignment answers |
| exam-paper-generator | `skills/exam-paper-generator/SKILL.md` | Generate question papers |
| subject-prompt-bank | `skills/subject-prompt-bank/SKILL.md` | Subject-specific sample answers |
| pyq-index | `pyq-index/SKILL.md` | PYQ PDF collection index |

## PYQ Collection

A 270MB+ collection of SPPU PYQ PDFs (2019–2025) is referenced by `pyq-index/SKILL.md`.
Location: `/home/pinak/Documents/SPPU Engineering PYQ Papers/`

## Usage

When the user asks a question, load the relevant skill from the `skills/` directory. Each SKILL.md contains complete instructions for that specific task type.
