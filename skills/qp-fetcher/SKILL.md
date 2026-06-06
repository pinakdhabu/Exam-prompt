---
name: universal-qp-fetcher
description: >
  Auto-fetches real SPPU question papers from sppuquestionpapers.com, generates university-style
  question papers with proper SPPU formatting, fonts, and layout. Can generate question papers for
  ANY subject by fetching from the web. Works offline too if PYQs are already downloaded. Covers ALL
  SPPU branches, ALL semesters, ALL patterns (2019, 2024, 2015). Supports auto-download via
  Playwright browser automation.
---

# Universal QP Fetcher & Generator

## Overview

This skill provides two capabilities:

1. **Fetch**: Downloads real SPPU question papers from sppuquestionpapers.com using
   `scripts/fetch-qp.js`
2. **Generate**: Creates university-style question papers with proper SPPU formatting (fonts,
   layout, instructions, OR structure, CO mapping, Bloom's levels)

Works for ANY SPPU branch (Computer, ENTC, Mechanical, Civil, Electrical, IT) and ANY semester
(1-8).

---

## How It Works

### Option A: Fetch Real Question Papers

```bash
# Fetch all available DBMS question papers
node scripts/fetch-qp.js dbms

# Fetch DBMS papers from 2024 only
node scripts/fetch-qp.js dbms --year 2024

# Get the latest paper only
node scripts/fetch-qp.js toc --latest

# List all available years for a subject
node scripts/fetch-qp.js dbms --list

# List all subjects available
node scripts/fetch-qp.js --list-subjects

# Fetch all Semester 5 Computer Engineering papers
node scripts/fetch-qp.js --semester 5

# Fetch from a different branch
node scripts/fetch-qp.js --branch entc dbms
```

### Option B: Generate University-Style Question Paper

When the user says "Generate a question paper for [subject]", the AI generates a properly formatted
question paper using the official SPPU pattern with:

1. **University Header**: SPPU logo placeholder, subject code, subject name, program, semester,
   pattern
2. **Exam Details**: Time, Max Marks, proper instruction set
3. **Question Structure**: OR pairs with (a)+(b) or (a)+(b)+(c) format
4. **Mark Distribution**: Unit-wise as per SPPU pattern
5. **CO/Bloom Mapping**: Each question tagged with CO and Bloom's level
6. **Proper Typography**: Monospace for code, serif for body, bold for headings

---

## Supported Patterns

| Pattern       | Units                   | OR Pairs | Total Marks | Time    |
| ------------- | ----------------------- | -------- | ----------- | ------- |
| **SPPU 2019** | 6 units (U3-U6 for ESE) | 4 pairs  | 70          | 2.5 hrs |
| **SPPU 2024** | 5 units                 | 5 pairs  | 70          | 2.5 hrs |
| **SPPU 2015** | 8 units                 | 4 pairs  | 70          | 3 hrs   |

---

## Website Structure

The QP fetcher scrapes question papers from `sppuquestionpapers.com`:

```
https://sppuquestionpapers.com/
├── /be/                         # Bachelor of Engineering
│   ├── /computer-engineering/
│   │   ├── /semester-3          # SE Sem III papers
│   │   ├── /semester-4          # SE Sem IV papers
│   │   ├── /semester-5          # TE Sem V papers
│   │   ├── /semester-6          # TE Sem VI papers
│   │   ├── /semester-7          # BE Sem VII papers
│   │   └── /semester-8          # BE Sem VIII papers
│   ├── /entc/
│   ├── /mechanical-engineering/
│   ├── /civil-engineering/
│   ├── /electrical-engineering/
│   └── /information-technology/
├── /me/                         # Master of Engineering
├── /mca/                        # MCA
├── /bsc/                        # B.Sc.
└── /bcom/                       # B.Com.
```

Each page lists subjects with Year, Month, and Download buttons.

---

## Subject Aliases

The fetcher supports fuzzy subject matching:

| Alias         | Full Name                                |
| ------------- | ---------------------------------------- |
| dbms, dms     | Database Management Systems              |
| toc, tc       | Theory of Computation                    |
| spos, sp&os   | Systems Programming and Operating System |
| cns, cn       | Computer Network and Security            |
| ai            | Artificial Intelligence                  |
| dsbda, ds&bda | Data Science and Big Data Analytics      |
| wt            | Web Technology                           |
| daa           | Design and Analysis of Algorithms        |
| ml            | Machine Learning                         |
| dl            | Deep Learning                            |
| hpc           | High Performance Computing               |
| blockchain    | Blockchain Technology                    |
| hci           | Human Computer Interface                 |
| iot, es&iot   | Internet of Things and Embedded Systems  |
| cc            | Cloud Computing                          |
| is            | Information Security                     |
| m3            | Engineering Mathematics III              |
| dsa           | Data Structures and Algorithms           |
| se            | Software Engineering                     |
| mp            | Microprocessor                           |
| ppl           | Principles of Programming Languages      |
| cg            | Computer Graphics                        |
| deld          | Digital Electronics and Logic Design     |
| dm            | Discrete Mathematics                     |
| fds           | Fundamentals of Data Structures          |
| oop           | Object Oriented Programming              |

---

## Question Paper Generation Format

When generating a question paper (not fetching), use this format:

```
╔══════════════════════════════════════════════════════════════╗
║              SAVITRIBAI PHULE PUNE UNIVERSITY               ║
║                                                              ║
║     [Subject Code]: [Subject Name]                           ║
║     B.E. ([Branch]) ([Semester]) ([Pattern])                ║
║                                                              ║
║  Time: [X] Hours                    Max. Marks: [XX]        ║
╚══════════════════════════════════════════════════════════════╝

Instructions:
  1) Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
  2) Neat diagrams must be drawn wherever necessary.
  3) Figures to the right indicate full marks.
  4) Assume suitable data, if necessary. (If applicable)
```

Then continue with 8 questions (4 OR pairs) following the SPPU 2019 pattern or 10 questions (5 OR
pairs) for SPPU 2024 pattern.

---

## Integration with Other Skills

| Skill                              | Integration                                               |
| ---------------------------------- | --------------------------------------------------------- |
| **universal-a-plus-answer-writer** | Use fetched QPs as source material for answer generation  |
| **universal-pyq-analyzer**         | Supply downloaded PYQs for analysis                       |
| **universal-exam-paper-generator** | Use fetched papers as reference for generating new papers |
| **universal-imp-topics-generator** | Analyze fetched PYQs to predict important topics          |

---

## Prerequisites

- Node.js 18+ (primary runtime)
- Playwright + Chromium (`npx playwright install chromium`)
- Internet connection (for fetching)
- Run `bash scripts/setup.sh` to install all dependencies automatically
