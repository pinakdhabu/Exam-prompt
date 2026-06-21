# Contributing to Exam Prompt

First off, thank you for considering contributing! 🎉

This is a student-built, student-run open-source project. Every contribution — whether it's a new
sample paper, a bug fix, a skill improvement, or a translation — makes this better for thousands of
students worldwide.

> **Core principle**: This repo must remain **100% free and open source forever**. No paid features,
> no pro tiers, no "unlock premium." Every contribution you make stays free for every student.

---

## 📋 Table of Contents

- [Code of Conduct](#-code-of-conduct)
- [Ways to Contribute](#-ways-to-contribute)
- [Getting Started](#-getting-started)
- [Adding a Sample Paper](#-adding-a-sample-paper)
- [Adding or Improving a Skill](#-adding-or-improving-a-skill)
- [Adding PYQ References](#-adding-pyq-references)
- [Style Guide](#-style-guide)
- [Pull Request Process](#-pull-request-process)
- [Getting Help](#-getting-help)

---

## 📜 Code of Conduct

By participating, you agree to:

- **Be respectful** — Everyone's learning journey is valid
- **Be constructive** — If you critique, also suggest
- **No plagiarism** — Attribute sources when using external content
- **No spam** — Quality over quantity

---

## 🧭 Ways to Contribute

| Area                                                                 | Skill Level  | Impact |
| -------------------------------------------------------------------- | ------------ | ------ |
| **Sample papers** — Add exam papers + solutions for missing subjects | Beginner     | ★★★★★  |
| **Subject expertise** — Review/fix existing sample paper solutions   | Intermediate | ★★★★   |
| **Skill improvement** — Improve SKILL.md files for better AI answers | Advanced     | ★★★★★  |
| **Code/scripts** — Improve setup, CI/CD, conversion tools            | Advanced     | ★★★★   |
| **Docs website** — Improve docs/ HTML/CSS/JS                         | Intermediate | ★★★    |
| **Bug reports** — Found something broken? Open an issue              | All levels   | ★★★★   |
| **Feature requests** — Have an idea? Tell us!                        | All levels   | ★★★    |
| **Translations** — Translate sample papers to Marathi/Hindi/other    | Intermediate | ★★★    |

---

## 🚀 Getting Started

### 1. Fork & Clone

```bash
git clone https://github.com/<your-username>/Exam-prompt.git
cd Exam-prompt
```

### 2. Set Up Dependencies

See [`DEPENDENCIES.md`](DEPENDENCIES.md) for full details. Quick start:

```bash
# Node.js (required for MD→PDF pipeline)
npm install
npx playwright install chromium

# Python (optional — PDF extraction only)
pip install -r requirements.txt
```

### 3. Pick a Task

Check [open issues](https://github.com/pinakdhabu/Exam-prompt/issues) labeled `good-first-issue` or
`help-wanted`.

### 4. Create a Branch

```bash
git checkout -b feat/my-contribution
```

---

## 📝 Adding a Sample Paper

Sample papers go in `examples/` following this structure:

```
examples/
  <year-level>/                              # fe, se, te, be
    <semester>/                               # sem-3, sem-4, etc.
      <subject-name>/                         # kebab-case
        README.md                             # Syllabus overview
        sample-paper-1.md                     # Question paper
        sample-paper-1-solution.md            # Ideal solutions
```

### File Requirements

#### `sample-paper-1.md`

- Must follow the **SPPU 2019 or 2024 pattern** (or specify the pattern)
- Include exact **instruction set** as per university pattern
- 4 OR pairs (8 questions) for 2019 pattern, 5 OR pairs (10 questions) for 2024
- Include **CO-Bloom compliance matrix** at the bottom
- Figures to the right indicate full marks
- Neat diagrams must be drawn wherever necessary

#### `sample-paper-1-solution.md`

- Follow the [answer-writer skill](skills/answer-writer/SKILL.md) format
- **Bold every technical term** on first use
- Numbered points for body content
- Tables for comparisons
- Boxed answers for numericals
- **Mermaid diagrams** where applicable
- Include time budgets and examiner commentary
- Add a **mnemonic** section for memory aids

#### `README.md`

- Subject code, credits, semester, elective/compulsory info
- Syllabus overview table (Unit | Title | Hours)
- Key topics list

### Template

Use the existing papers as reference. Example:

- `examples/te/sem-5/database-management-systems/sample-paper-1.md`
- `examples/te/sem-5/database-management-systems/sample-paper-1-solution.md`

---

## 🛠️ Adding or Improving a Skill

Skills are in `skills/<skill-name>/SKILL.md`.

### Creating a New Skill

```bash
# Using the auto-script
bash scripts/create-skill.sh <skill-name> "<Display Name>" "<Short description>"

# Or manually:
# 1. Create skills/<skill-name>/SKILL.md
# 2. Add YAML frontmatter (name, description)
# 3. Write complete instructions
# 4. Register in AGENTS.md (or run: bash scripts/generate-agents-md.sh)
```

### Skill Format Requirements

```yaml
---
name: universal-<skill-name>
description: |
  One-paragraph description of what the skill does and when to trigger it.
  Must end with: "Works for ANY university worldwide."
---
```

### Validating Your Skill

```bash
# Validate all skills
bash scripts/validate-skills.sh

# Validate one skill
bash scripts/validate-skills.sh my-skill
```

### Best Practices

- Every skill must be **university-agnostic** — mention "any university worldwide" not just SPPU
- Use clear **PHASE headers** for multi-step processes
- Include **tables** for reference data
- Reference **integration** with other skills
- Test your skill prompt with an AI agent before submitting

---

## 📄 Adding PYQ References

PYQ index entries go in `pyq-index/SKILL.md`.

The actual PYQ PDFs are **not stored in this repo** (they're too large). Instead, add references to
the local filesystem:

- **Path**: `~/Downloads/<collection>/...`
- **Format**: `Subject | Year | Month | Link`
- Follow the existing table format in `pyq-index/SKILL.md`

---

## 🎨 Style Guide

### Markdown

- Use ATX headings (`## H2`, `### H3`)
- Tables with pipes and dashes
- Fenced code blocks with language tags
- Bold terms on first use only
- No HTML unless necessary (use Markdown)

### Sample Paper Solutions

- Start with a header block showing subject, pattern, exam type
- Use `**bold**` for technical terms (first use only)
- Use numbered lists for points
- Use `| table |` for comparisons
- Use ```mermaid for diagrams
- End with `--- MNEMONIC ---` section
- Include time budgets: `**Time Budget:** 15 min`
- Include Bloom's level: `**Bloom's:** L2 (Understand)`

### Code

- Shell scripts: `set -euo pipefail`, error checking
- JavaScript: `const`/`let`, async/await, JSDoc comments
- Python: f-strings, type hints where clear

---

## 🔄 Pull Request Process

1. **Create an issue** first (unless it's a tiny fix) — describe what you're changing and why
2. **Keep PRs focused** — One feature/paper/skill per PR
3. **Follow the template** — Fill in the PR description
4. **Validate** — Run `bash scripts/validate-skills.sh` if you changed skills
5. **Wait for review** — A maintainer will review within a few days

### PR Title Convention

```
feat: add sample paper for Information Security (TE elective)
fix: correct normalization example in DBMS solution
docs: update README with new skill count
chore: update GitHub Actions workflow
```

### What Gets Merged Fast

- ✅ Sample papers for missing subjects
- ✅ Bug fixes in scripts
- ✅ Skill improvements (more complete instructions)
- ✅ Documentation improvements
- ✅ CI/CD improvements

### What Takes Longer

- ⏳ Major architectural changes (discuss in issue first)
- ⏳ New features without tests
- ⏳ Changes that break existing functionality

---

## ❓ Getting Help

- **Open an issue** — Tag with `question` label
- **GitHub Discussions** — Start a discussion in the relevant category
- **Existing examples** — Look at how other sample papers or skills are structured

### Good First Issues

Look for issues labeled:

- `good-first-issue` — Beginner-friendly
- `help-wanted` — Needs someone to pick it up
- `sample-paper` — Missing sample paper
- `skill-improvement` — Improve a SKILL.md

---

## 🏆 Recognition

All contributors get:

- Listed in the repo's README (contributors section)
- A GitHub badge on their profile
- Eternal gratitude from thousands of students 📚

**Top contributors** may be invited as maintainers.

---

> **Built for students, by students. Free forever.**
