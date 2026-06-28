---
name: universal-mcq-practice-generator
description:
  Generates exam-style multiple choice questions for ANY university worldwide. Covers ALL question
  patterns (single correct, multiple correct, assertion-reason, match-the-following, true/false,
  fill-in-the-blank). Adapts difficulty by Bloom's level and provides detailed answer explanations.
  Works for ALL subjects and ALL exam patterns.
---

# Universal MCQ Practice Generator

## Overview

Creates unlimited practice MCQs from any syllabus, topic, or study material. Each MCQ is calibrated
to match the target university's exam pattern, marking scheme, and difficulty distribution. Includes
fully explained answer keys.

## How This Skill Works

1. **User provides**: Subject/topic, syllabus or notes, university exam pattern, number of
   questions, difficulty level
2. **System analyzes**: Content structure, typical question patterns for the university, Bloom's
   level distribution
3. **System generates**: MCQs with distractors, answer keys, and explanations
4. **System formats**: In the target university's exam format with proper marking scheme

## 1. MCQ Types Supported

| Type                    | Description                         | Example University Patterns            |
| ----------------------- | ----------------------------------- | -------------------------------------- |
| **Single Correct**      | One correct answer, 3-4 distractors | SPPU, VTU, JNTU, Mumbai, AKTU, IIT/JEE |
| **Multiple Correct**    | Two or more correct answers         | GATE, IIT, UK universities             |
| **Assertion-Reason**    | Assertion (A) and Reason (R) pair   | NEET, JEE, AIIMS, UPSC                 |
| **Match the Following** | Column A vs Column B mapping        | SPPU, Mumbai, VTU                      |
| **True / False**        | Statement evaluation                | Many universities                      |
| **Fill in the Blank**   | Complete the statement              | Language tests, general exams          |
| **Case-Based**          | Multiple MCQs from a common stem    | CBSE, IB, North American               |
| **Ordering / Sequence** | Arrange in correct order            | GATE, programming exams                |
| **Diagram-Based**       | MCQ referencing a diagram           | Medical, Engineering, Biology          |
| **NAT / Integer Answer** | Single integer value (-9999 to +9999) | GATE, IIT, competitive exams           |

### NAT (Numerical Answer Type) Format

Rules for GATE-style NAT questions:

- Answer must be an integer between -9999 and +9999
- No decimal points or fractional values
- No units in the answer field
- No sign for non-negative values (positive values are unsigned)
- Blank or out-of-range answers receive zero marks
- Negative marking may apply (per university pattern)

**Example:**

```
Q: How many vertices does a complete binary tree of height h have at most? [NAT]
Answer: 2^(h+1) - 1
```

## 2. Difficulty Calibration

| Bloom's Level  | Difficulty  | Distractor Design                            | Example                                                               |
| -------------- | ----------- | -------------------------------------------- | --------------------------------------------------------------------- |
| **Remember**   | Easy        | 1 near-miss + 2 clearly wrong                | What is the capital of France? a) London b) Paris c) Berlin d) Madrid |
| **Understand** | Easy-Medium | 2 plausible + 1 clearly wrong                | Which best explains why TCP uses three-way handshake?                 |
| **Apply**      | Medium      | 3 plausible with common errors               | Given IP 192.168.1.10/24, what is the network address?                |
| **Analyze**    | Medium-Hard | All distractors based on real misconceptions | Which of these diagrams correctly represents the OSI model layers?    |
| **Evaluate**   | Hard        | Distractors based on subtle differences      | Which algorithm is most appropriate for this specific scenario?       |
| **Create**     | Hardest     | Open-ended MCQs with best-answer format      | Which design pattern best solves this architectural problem?          |

## 3. Distractor Generation Strategy

| Strategy                 | Description                           | Example Wrong Answer                             |
| ------------------------ | ------------------------------------- | ------------------------------------------------ |
| **Off-by-one**           | Slightly wrong value                  | O(n) instead of O(log n)                         |
| **Common misconception** | Typical student error                 | Confusing TCP and UDP port ranges                |
| **Reversal**             | Opposite of correct                   | Confusing encryption and decryption              |
| **Partial knowledge**    | Almost but not quite right            | Correct concept, wrong application               |
| **Confusable term**      | Similar-sounding or related term      | Confusing liability and liquidity in accounting  |
| **Calculation error**    | Result of a common arithmetic mistake | 14 instead of 18 in a sum                        |
| **Out-of-scope**         | True but not answering this question  | A correct statement that doesn't fit the context |

## 4. Generation Modes

### Mode 1 — Syllabus Coverage

- Input: Syllabus topics with weightage
- Output: N questions distributed proportionally across units
- Algorithm: Proportional allocation by marks/weightage

### Mode 2 — Topic Deep Dive

- Input: Single topic or subtopic
- Output: 10-50 questions on that specific topic
- Algorithm: Progressive difficulty (Remember -> Create)

### Mode 3 — Exam Simulation

- Input: University exam pattern (e.g., 30 MCQ, 45 min, no negative marking)
- Output: Full-length mock test matching exam format exactly
- Algorithm: Mirror the exact pattern, timing, and marking scheme

### Mode 4 — Weak Spot Targeting

- Input: Topics where user performed poorly in previous tests
- Output: Targeted questions on those weak topics
- Algorithm: Higher density and multiple question types on each weak concept

### Mode 5 — PYQ Replication

- Input: Previous year question papers
- Output: New variant questions testing same concepts but with different distractors and values
- Algorithm: Question template parameterization (change numbers, scenarios, phrasing)

## 5. Answer Key Format

Each generated MCQ set includes:

```
Answer Key
----------
Q1: B (Remember, Easy)
Q2: A, C (Understand, Medium)
Q3: D (Apply, Medium-Hard)
Q4: B (Analyze, Hard)

Explanations:
Q1: Why B is correct... Why A, C, D are wrong...
Q2: A is correct because... C is correct because... B and D are wrong because...
```

### Explanation Depth Levels

| Level        | Detail                                                  | Use Case      |
| ------------ | ------------------------------------------------------- | ------------- |
| **Brief**    | Correct answer + 1 sentence why                         | Quick review  |
| **Standard** | Correct answer + why each distractor is wrong           | Exam prep     |
| **Detailed** | Full concept explanation + references + common pitfalls | Learning mode |

## 6. University Pattern Templates

| University           | Typical MCQ Pattern                     | Negative Marking                       | Time per Q |
| -------------------- | --------------------------------------- | -------------------------------------- | ---------- |
| **SPPU (2019/2024)** | 20 MCQ per subject, 1 mark each         | No (mostly)                            | 2.25 min   |
| **VTU**              | 20-30 MCQ, 1 mark each                  | No                                     | 2 min      |
| **JNTU**             | 20 MCQ, 1 mark each                     | No                                     | 2 min      |
| **GATE**             | 55 Q (25 MCQ + 30 numerical), 1-2 marks | Yes (-1/3 for 1-mark, -2/3 for 2-mark) | 3 min      |
| **NEET**             | 200 MCQ (180 to attempt), 4 marks each  | Yes (-1)                               | ~1 min     |
| **UPSC**             | 100 MCQ, 2 marks each                   | Yes (-1/3)                             | 2 min      |
| **IIT/JEE**          | 30 MCQ + numerical                      | Yes (variable)                         | 3 min      |
| **UK University**    | Varies, often essay + MCQ mix           | Typically no                           | Varies     |
| **North American**   | 50-100 MCQ per exam                     | Typically no                           | ~1 min     |

## 7. Sample MCQ Generation

**User**: Generate 5 MCQs on OS Process States for VTU CSE, 1 mark each, Remember-Understand level.

```
VTU CSE - Operating Systems - Process States

1. Which of the following is NOT a valid process state?
   A) Running
   B) Ready
   C) Suspended
   D) Waiting
   Answer: C (Suspended is not a fundamental Unix/Linux process state)

2. When a process is waiting for I/O completion, it is in which state?
   A) Ready
   B) Running
   C) Blocked/Waiting
   D) Terminated
   Answer: C

3. A process transitions from Running to Ready when:
   A) It completes execution
   B) The CPU scheduler preempts it
   C) It requests I/O
   D) It creates a child process
   Answer: B

4. The only state transitions that can occur without OS intervention:
   A) Ready -> Running
   B) Running -> Ready
   C) Running -> Waiting
   D) Waiting -> Ready
   Answer: D (I/O completion generates interrupt, but OS handles it)

5. In a 5-state model, which state is added to handle virtual memory?
   A) New
   B) Ready Suspend
   C) Terminated
   D) Waiting
   Answer: B
```

## Session Config

This skill integrates with the session config system (`deps/session-profile.json`). Before
executing, check for an existing session profile:

- If `deps/session-profile.json` exists, read `university`, `subject`, `pattern`, and `exam_type`
  fields to auto-configure the skill.
- If the file does not exist, fall back to user-provided context or prompt the user to run
  `setup-exam-prompt` (or `npm run init`) first.
- Session config eliminates redundant context detection — detection happens once and is reused
  across all skill calls.

---

## Error Handling

| Situation | Action |
|---|---|
| Subject/topic not specified | Respond: "Please specify subject and topics for MCQ generation." |
| Insufficient syllabus detail | Flag: "Syllabus detail is sparse. MCQ coverage may be incomplete. Provide detailed subtopics if possible." |
| University pattern not recognized | Default to Standard MCQ format (single correct, no negative marking) and note the assumption |
| NAT question answer out of range | Validate: NAT answers must be integers between -9999 and +9999. Flag violations before final output. |
| Distractor generation failure | Fall back to 3-distractor model if 4 plausible distractors cannot be generated |

## Quality Gate — Check Before Output

- [ ] Each MCQ has exactly one correct answer clearly identified
- [ ] Distractors are plausible and based on common misconceptions
- [ ] Bloom's level tag included for each question
- [ ] Answer key with explanations is provided
- [ ] Question count matches user's requested number
- [ ] No duplicate questions (same or rephrased)
- [ ] For NAT questions: answer validated as integer within [-9999, 9999]

## 8. Integration with Other Skills

| Skill | Integration |
|---|---|
| **universal-session-config** | Reads university/subject/pattern from session profile |
| **universal-notes-generator** | Feeds notes as source material for MCQ content |
| **universal-pyq-analyzer** | Uses historical question distribution to guide topic focus |
| **universal-imp-topics-generator** | Generates targeted MCQs for high-probability topics |
| **universal-flashcard-generator** | Creates complementary flashcards from missed MCQs |
| **universal-essay-grader** | Evaluates performance patterns across MCQ attempts |
