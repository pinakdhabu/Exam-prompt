---
name: universal-last-minute-crammer
description:
  Emergency exam preparation system for ANY university worldwide. Generates ultra-compressed study
  plans for 12-hour, 6-hour, 3-hour, and 1-hour timeframes. Uses rapid memory encoding techniques
  (memory palace, chunking, peg system, acronym chains) for maximum retention in minimum time.
  Covers ALL subjects, ALL exam types.
---

# Universal Last-Minute Crammer

## Overview

When time is critically short, this skill provides the highest-yield study path. Uses cognitive
urgency principles and memory encoding techniques to maximize what can be retained and recalled
under time pressure. Not a substitute for proper study -- a rescue system for emergencies.

## How This Skill Works

1. **User provides**: Exam time remaining (1h / 3h / 6h / 12h), subject, topics, exam format,
   current knowledge level
2. **System selects**: Ultra-high-yield topics only (based on PYQ frequency and weightage)
3. **System designs**: Minute-by-minute plan with memory encoding techniques
4. **System generates**: Condensed reference sheet and rapid-review materials
5. **System provides**: Exam-time strategies (time management, question selection, answer structure)

## 1. Timeframe Plans

### 12-Hour Plan (e.g., night before morning exam)

| Phase                  | Duration | Activity                                         | Technique                      |
| ---------------------- | -------- | ------------------------------------------------ | ------------------------------ |
| Scan & Prioritize      | 30 min   | Identify 5-8 high-yield topics from syllabus/PYQ | Pareto principle (80/20)       |
| Rapid Learning Block 1 | 2 hr     | Deep-dive into 2 highest-weightage topics        | Feynman + Cornell notes        |
| Break                  | 15 min   | Walk, hydrate, eyes-closed rest                  | Diffuse mode activation        |
| Rapid Learning Block 2 | 2 hr     | Next 2-3 high-weightage topics                   | Chunking + visualization       |
| Break                  | 15 min   | Snack, stretch                                   | Glucose + blood flow           |
| Rapid Learning Block 3 | 2 hr     | Remaining topics, cross-connections              | Memory palace + story chains   |
| Sleep                  | 4 hr     | Critical for memory consolidation                | Sleep consolidates hippocampus |
| Wake & Review          | 1 hr     | Scan all condensed notes, do active recall       | Rapid cycling                  |
| Exam Prep              | 30 min   | Travel, setup, calm breathing                    | Priming + centering            |

### 6-Hour Plan

| Phase           | Duration | Activity                                               |
| --------------- | -------- | ------------------------------------------------------ |
| Topic Selection | 15 min   | Pick 4-5 absolute highest-yield topics                 |
| Sprint 1        | 1.5 hr   | Learn topics 1-2 (read + summarize to 1 page each)     |
| Break           | 10 min   | Walk, water                                            |
| Sprint 2        | 1.5 hr   | Learn topics 3-4                                       |
| Break           | 10 min   | Stretch, eyes closed                                   |
| Sprint 3        | 1 hr     | Quick-scan topic 5, create master cheat sheet          |
| Active Recall   | 45 min   | Close notes, write everything you remember, check gaps |

### 3-Hour Plan

| Phase           | Duration | Activity                                                       |
| --------------- | -------- | -------------------------------------------------------------- |
| Extraction      | 30 min   | Pull 3 most important topics from syllabus/PYQs                |
| Core Learning   | 1.5 hr   | One page per topic: definitions, key points, formulas, example |
| Memory Encoding | 30 min   | Create acronym chains and memory palace for each topic         |
| Active Recall   | 30 min   | Write everything from memory; fill gaps by checking notes      |

### 1-Hour Plan

| Phase           | Duration | Activity                                                         |
| --------------- | -------- | ---------------------------------------------------------------- |
| Topic Selection | 5 min    | Identify 1-2 most important topics                               |
| Speed Read      | 20 min   | Read condensed notes/textbook summaries                          |
| Memory Encoding | 15 min   | Create 1-page cheat sheet with key formulas/definitions (mental) |
| Active Recall   | 20 min   | Close everything; recite/write key points from memory            |

## 2. Rapid Memory Encoding Techniques

| Technique                | How It Works                                                                 | Best For                                   | Example                                                                                                                           |
| ------------------------ | ---------------------------------------------------------------------------- | ------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| **Acronym Chain**        | First letter of each item forms a word                                       | Lists, sequences, ordered steps            | OSI Model: "Please Do Not Throw Sausage Pizza Away" (Physical, Data Link, Network, Transport, Session, Presentation, Application) |
| **Memory Palace**        | Visualize walking through a familiar location; place items at specific spots | Structured collections of facts            | Place networking concepts in rooms of your house: living room = Physical layer, kitchen = Data Link...                            |
| **Chunking**             | Group information into meaningful 3-5 item chunks                            | Large amounts of structured data           | Group sorting algorithms by complexity: O(n^2): Bubble, Selection, Insertion; O(n log n): Merge, Quick, Heap                      |
| **Story Chain**          | Create a narrative connecting facts                                          | Unrelated items, sequences                 | "The process (Ready) went for a run (Running) but got tired and waited (Blocked) for a bus, then was ready again (Ready)"         |
| **Visual Peg System**    | Associate each item with a numbered visual peg (1=gun, 2=shoe, 3=tree...)    | Ordered lists, numbered items              | 1=gun (process creation needs a "bang"), 2=shoe (IPC needs a "pair")...                                                           |
| **Spaced Micro-Reviews** | Review at 10-30-60 minute intervals                                          | Preventing decay in ultra-short timeframes | After learning a topic, test yourself at 10 min, then 30 min, then 1 hour                                                         |

## 3. High-Yield Topic Identification

### Selection Criteria (weighted)

| Criterion               | Weight | Description                                                     |
| ----------------------- | ------ | --------------------------------------------------------------- |
| **PYQ Frequency**       | 40%    | How often has this topic appeared in past exams?                |
| **Marks Weightage**     | 25%    | How many marks does this topic carry?                           |
| **Prerequisite Status** | 20%    | Is this foundational for other topics?                          |
| **Difficulty**          | 15%    | How quickly can it be learned? (easier = higher yield for cram) |

### Decision Matrix

| PYQ Frequency | Marks Weightage | Easy to Learn? | Verdict                          |
| ------------- | --------------- | -------------- | -------------------------------- |
| High          | High            | Any            | MUST LEARN (highest priority)    |
| High          | Low             | Yes            | LEARN (quick win)                |
| Low           | High            | Yes            | LEARN (high marks per hour)      |
| High          | Low             | No             | SKIP (low marks for high effort) |
| Low           | Low             | Any            | SKIP (not worth it)              |

## 4. Condensed Reference Sheet Format

Generated automatically for any subject in this format:

```
=== SUBJECT: OPERATING SYSTEMS ===

UNIT 1: PROCESS MANAGEMENT [HIGH YIELD - 40% weightage]

Process States: New -> Ready -> Running -> Waiting -> Ready -> Terminated
  KEY: Ready Queue holds processes waiting for CPU
  KEY: Context Switch = saving/restoring state on CPU switch

CPU Scheduling:
  FCFS: First come first served (convoy effect)
  SJF: Shortest job first (optimal avg wait, starvation risk)
  Round Robin: Time quantum q (q too small = context switch overhead)
  Priority: Preemptive/non-preemptive (starvation for low priority)

KEY FORMULA: Avg Waiting Time = sum(WT_i) / n

Synchronization:
  Critical Section Problem: Mutual Exclusion, Progress, Bounded Waiting
  Semaphore: S = resource count; wait(S) decrements, signal(S) increments
  Deadlock: Mutual Exclusion + Hold & Wait + No Preemption + Circular Wait
    -> Prevention: Break any one of the four conditions
```

## 5. Exam-Time Strategy (for the exam hall)

| Situation                             | Strategy                                                                          |
| ------------------------------------- | --------------------------------------------------------------------------------- |
| **Blank mind reading question**       | Start writing anything related; recall triggers from memory palace                |
| **Don't know first few questions**    | Skip them; answer what you know to build momentum                                 |
| **Running out of time**               | Write bullet points instead of full sentences; examiners award marks for keywords |
| **Essay question, limited knowledge** | Structure: Introduction + 2-3 points you do know + Conclusion. Never leave blank. |
| **Numerical problem**                 | Write the formula first (gets partial marks), then attempt the calculation        |
| **Recall a formula**                  | Trace memory palace path in your mind                                             |
| **Excess time remaining**             | Review and expand your answers; add examples, diagrams, and cross-references      |

## 6. Cram-Friendly Output Formats

| Format                         | Use                                | Time to Read |
| ------------------------------ | ---------------------------------- | ------------ |
| **Single-Page Cheat Sheet**    | Mental key points + formulas       | 2 min        |
| **Rapid Revision Notes**       | 3-5 page condensed subject summary | 10 min       |
| **Audio Summary**              | Listen during travel/breaks        | 5-15 min     |
| **Flashcard Deck (Cram Mode)** | 20-50 high-yield cards only        | 5 min        |

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

## 7. Integration with Other Skills

- **universal-imp-topics-generator**: Provides the high-yield topic list that drives cram
  prioritization
- **universal-pyq-analyzer**: Supplies frequency data for topic selection
- **universal-flashcard-generator**: Creates the cram-mode flashcard deck
- **universal-study-planner**: Falls back to cram plan when time runs short
- **universal-notes-generator**: Produces the rapid revision note format
