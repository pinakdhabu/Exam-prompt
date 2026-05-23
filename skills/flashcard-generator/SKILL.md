---
name: universal-flashcard-generator
description: Converts any study material (notes, textbooks, syllabus topics, PYQs) into optimized flashcards for ANY university worldwide. Supports 6 flashcard types across 3 difficulty tiers with built-in Spaced Repetition System (SRS) metadata. Exports to Anki, Quizlet, CSV, and text formats. Works for ALL subjects, ALL departments.
---

# Universal Flashcard Generator

## Overview
Transforms any study material into exam-optimized flashcards. Uses cognitive science principles (active recall, spaced repetition, elaboration, interleaving) to maximize retention. Generates SRS-ready decks with proper scheduling metadata for long-term memory consolidation.

## How This Skill Works

1. **User provides**: Source material (notes, textbook chapters, syllabus topics, question papers, or any text)
2. **System analyzes**: Content structure, subject type, Bloom's level distribution, exam patterns
3. **System selects**: Optimal flashcard types based on content characteristics and learning goals
4. **System generates**: Formatted flashcard deck with SRS scheduling metadata
5. **System exports**: In requested format (Anki APKG, Quizlet CSV, plain text, or markdown)

## 1. Flashcard Types

### Type A — Basic Fact (Recall)
| Element | Description |
|---|---|
| **Front** | Direct question or prompt |
| **Back** | Concise answer (1-3 sentences) |
| **Best for** | Definitions, dates, formulas, terminology, lists |
| **Bloom's Level** | Remember |
| **Example Front** | What is the time complexity of binary search? |
| **Example Back** | O(log n) in the average and worst case |

### Type B — Cloze Deletion
| Element | Description |
|---|---|
| **Front** | Sentence with key term blanked: `The capital of France is {{c1::Paris}}` |
| **Back** | Full sentence with revealed term |
| **Best for** | Fill-in-the-blank style recall, language learning, definitions |
| **Bloom's Level** | Remember, Understand |
| **Example Front** | The three pillars of {{c1::sustainable development}} are economic, social, and environmental. |

### Type C — Concept Association
| Element | Description |
|---|---|
| **Front** | Concept, term, or scenario |
| **Back** | Related concept, application, or counter-example |
| **Best for** | Linking related ideas, compare/contrast, "why" questions |
| **Bloom's Level** | Understand, Apply |
| **Example Front** | How does DHCP differ from DNS? |
| **Example Back** | DHCP assigns IP addresses dynamically; DNS resolves domain names to IP addresses. |

### Type D — Multi-Step Problem
| Element | Description |
|---|---|
| **Front** | Problem or calculation |
| **Back** | Step-by-step solution with reasoning |
| **Best for** | Numerical problems, derivations, proofs, algorithms |
| **Bloom's Level** | Apply, Analyze |
| **Example Front** | Solve: Find the determinant of [[2,3],[1,4]] |
| **Example Back** | det = (2*4) - (3*1) = 8 - 3 = 5 |

### Type E — Application Scenario
| Element | Description |
|---|---|
| **Front** | Real-world scenario or case snippet |
| **Back** | Diagnosis, solution, or analysis |
| **Best for** | Case studies, clinical scenarios, engineering design, business cases |
| **Bloom's Level** | Analyze, Evaluate |
| **Example Front** | A user reports "Connection refused" when accessing port 443 on a server. What is likely? |
| **Example Back** | The service on port 443 (likely HTTPS) is not running or a firewall is blocking the port. |

### Type F — Compare & Contrast
| Element | Description |
|---|---|
| **Front** | Two related concepts |
| **Back** | Structured comparison (similarities / differences table) |
| **Best for** | Comparative questions, distinguishing confusable concepts |
| **Bloom's Level** | Analyze |
| **Example Front** | Compare TCP vs UDP |
| **Example Back** | TCP: connection-oriented, reliable, ordered, slower | UDP: connectionless, unreliable, unordered, faster |

## 2. Difficulty Tiers

| Tier | Question Style | Cognitive Load | Use Case |
|---|---|---|---|
| **Tier 1 — Recognition** | Multiple choice, true/false, "which of the following" | Low | Initial learning, building confidence |
| **Tier 2 — Recall** | Direct question, cloze deletion, fill-in-the-blank | Medium | Active recall practice, memory consolidation |
| **Tier 3 — Application** | Scenario-based, problem-solving, "why/how" questions | High | Deep understanding, exam readiness |

Each deck includes a progression path: Tier 1 -> Tier 2 -> Tier 3.

## 3. SRS Scheduling Metadata

Every generated flashcard includes these scheduling fields for SRS system import:

| Field | Example | Description |
|---|---|---|
| `Deck` | Computer Networks | Subject or chapter name |
| `Tag` | cn_3_transport | Hierarchical topic tag |
| `Due` | 2026-05-24 | Next review date |
| `Interval` | 1 | Days until next review (starts at 1) |
| `Ease` | 250 | Starting ease factor (default 250%) |
| `Difficulty` | 3 | Card difficulty (1=Easy, 5=Hard) |
| `LastReviewed` | 2026-05-23 | Last review timestamp |

## 4. Export Formats

| Format | Extension | Compatible With | Notes |
|---|---|---|---|
| **Anki** | .apkg | Anki desktop, AnkiDroid, AnkiMobile | Full SRS metadata preserved |
| **CSV** | .csv | Anki import, Quizlet, Excel, custom tools | Tab-separated by default |
| **Markdown** | .md | Any markdown renderer, Obsidian, Notion | Readable, version-controllable |
| **Plain Text** | .txt | Any text editor | Minimal formatting |
| **JSON** | .json | Programmatic processing | Structured data export |

## 5. Generation Modes

### Mode 1 — From Lecture Notes
- Input: Raw notes or textbook chapters
- Output: Comprehensive deck covering all key concepts
- Algorithm: Extract definitions, named concepts, lists, important figures, and causal relationships

### Mode 2 — From Syllabus
- Input: Syllabus topics and subtopics
- Output: Coverage-optimized deck ensuring every syllabus point has at least one card
- Algorithm: Map syllabus items to question templates

### Mode 3 — From PYQs
- Input: Previous year question papers
- Output: Exam-focused deck targeting historically tested concepts
- Algorithm: Frequency-weight topics and generate cards proportional to historical importance

### Mode 4 — Exam Cram
- Input: High-priority topics (from imp topics analysis)
- Output: Condensed deck covering only high-probability questions
- Algorithm: Selects Tier 1 and Tier 2 cards for fastest coverage

## 6. Deck Organization

```
Subject Name/
  Unit 1 - Topic Name/
    Section 1.1 - Subtopic/
      [F] Definition of concept X
      [C] Cloze: The three types of Y are ___
      [P] Problem: Calculate Z given W
    Section 1.2 - Subtopic/
      ...
  Unit 2 - Topic Name/
    ...
  Cross-Unit Connections/
    [A] How does concept A from Unit 1 relate to concept B from Unit 3?
```

Prefix legend: `[F]` = Fact, `[C]` = Cloze, `[P]` = Problem, `[A]` = Association, `[S]` = Scenario

## 7. Active Recall Triggers

For each card, the system adds memory-triggering cues:
- **Visual cues**: Parent diagram references "(see Fig 3.2 in textbook)"
- **Mnemonic triggers**: Acronym hints (e.g., "PEMDAS: Parentheses, Exponents...")
- **Association chains**: "This concept is related to X which you studied in Unit 2"
- **Contrast prompts**: "Not to be confused with Y (see card #42)"

## 8. Common Use Cases

| Scenario | Mode | Card Types | Deck Size (approx) |
|---|---|---|---|
| Learning a new subject | From Lecture Notes | A, B, C | 200-500 cards |
| Exam revision (1 week) | From PYQs + Syllabus | A, B, D | 100-300 cards |
| Last-night cramming | Exam Cram | A, B | 50-100 cards |
| Language vocabulary | From Lecture Notes | A, B | 500-1000 cards |
| Medical/legal memorization | From Syllabus | A, B, C, E | 500-2000 cards |
| Formula revision | From Syllabus | D | 30-100 cards |

## 9. Example

**User**: Generate flashcards for Computer Networks Unit 3 (Transport Layer) for SPPU TE Comp. Include TCP, UDP, congestion control.

**System generates**:
```
Deck: SPPU_TE_CN_Unit3

Card 1 [F]: What does TCP stand for?
Back: Transmission Control Protocol

Card 2 [C]: {{c1::TCP}} is connection-oriented, while {{c2::UDP}} is connectionless.

Card 3 [D]: A sender uses AIMD with cwnd=16 MSS. After packet loss, what is the new cwnd in TCP Reno?
Back: cwnd = 16/2 = 8 MSS (multiplicative decrease)

Card 4 [E]: A video streaming app uses UDP. Why?
Back: Streaming tolerates minor packet loss but requires low latency. UDP provides faster delivery without retransmission delays.

... (full deck generated)
```

## 10. Export Command (for Anki)

```
# The generated .apkg file can be imported via:
# Anki Desktop: File > Import > Select .apkg
# AnkiDroid: Tap + > Import .apkg
# AnkiMobile: Share > Open in Anki

# CSV format follows Anki's preferred tab-separated schema:
# Front\tBack\tTags\tDeck
```

## 11. Integration with Other Skills

- **universal-notes-generator**: Takes generated notes as input and converts them to flashcards
- **universal-pyq-analyzer**: Uses PYQ frequency analysis to weight card importance
- **universal-imp-topics-generator**: Generates cram-mode decks from imp topics output
- **universal-mcq-practice-generator**: Creates exam-simulated MCQ practice from same material
