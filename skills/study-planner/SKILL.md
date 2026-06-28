---
name: universal-study-planner
description:
  Generates personalized study schedules for ANY university worldwide. Accepts exam dates, syllabus
  scope, difficulty ratings, available hours, and learning preferences. Outputs day-by-day
  timetables with built-in spaced repetition, active recall sessions, and break scheduling. Covers
  ALL subjects, ALL exam types.
---

# Universal Study Planner

## Overview

Creates optimized study schedules that maximize retention and coverage within available time. Uses
principles from spaced repetition, interleaving, active recall, and time-blocking. Adapts to any
exam schedule, syllabus complexity, and study pace.

## How This Skill Works

1. **User provides**: Exam date(s), subjects/topics to cover, difficulty ratings, available study
   hours per day, learning preferences
2. **System calculates**: Total available time, per-topic time allocation based on difficulty and
   weightage
3. **System designs**: Day-by-day schedule with topic blocks, revision gaps, and active recall
   sessions
4. **System outputs**: Calendar-ready plan in table, markdown, or xlsx format

## 1. Input Dimensions

### Required Inputs

| Input                   | Example                                          | Purpose                             |
| ----------------------- | ------------------------------------------------ | ----------------------------------- |
| **Exam Date(s)**        | 2026-06-15                                       | Calculate total available days      |
| **Subjects / Topics**   | Unit 1: Data Structures (Trees), Unit 2: Sorting | Define scope                        |
| **Difficulty Rating**   | Trees: Hard (4/5), Sorting: Medium (3/5)         | Allocate more time to harder topics |
| **Available Hours/Day** | 6 hours on weekdays, 8 on weekends               | Realistic scheduling                |

### Optional Inputs

| Input                    | Example                  | Purpose                          |
| ------------------------ | ------------------------ | -------------------------------- |
| **Topic Weightage**      | Unit 1: 40%, Unit 2: 30% | Prioritize high-weightage topics |
| **Existing Proficiency** | Trees: 50% confident     | Reduce time for known material   |
| **Learning Style**       | Visual, reading/writing  | Match study methods              |
| **Break Preferences**    | Pomodoro 25/5            | Structure focus sessions         |
| **PYQ Importance**       | From imp-topics analysis | Focus on high-probability topics |

## 2. Time Allocation Algorithm

Total available hours = Days remaining x Available hours per day

Per-topic allocation:

```
Topic Hours = Total Hours x (Weightage Factor x Difficulty Factor) / Sum of all factors

Weightage Factor = Topic marks % / 100
Difficulty Factor = Topic difficulty rating / Max difficulty (5)
```

### Adjustment Rules

| Condition                                 | Adjustment               |
| ----------------------------------------- | ------------------------ |
| Topic has high PYQ frequency              | Multiply factor by 1.2   |
| Topic is foundational (prereq for others) | Schedule earlier         |
| Topic is standalone                       | Can be scheduled anytime |
| User has 50%+ proficiency                 | Reduce factor by 0.3     |

## 3. Schedule Types

### Type 1 — Marathon Plan (30+ days)

- Pace: 4-6 hours/day
- Structure: 2 new topics + 1 revision session daily
- Revision: Weekly reviews, spaced at 1-7-14 day intervals
- Best for: Full semester coverage

### Type 2 — Sprint Plan (7-14 days)

- Pace: 6-8 hours/day
- Structure: 3 topics/day, alternate new/revision
- Revision: Every topic revisited at least 3 times
- Best for: Pre-exam revision when basics are known

### Type 3 — Cram Plan (1-3 days)

- Pace: 8-12 hours/day
- Structure: High-impact topics only, rapid cycling
- Revision: Mini-reviews every 2 hours
- Best for: Emergency last-minute preparation

### Type 4 — Balanced Plan (15-30 days)

- Pace: 4-5 hours/day
- Structure: 2 new + 1 revision, rest days every 7th day
- Revision: Spaced at 1-3-7-14 day intervals
- Best for: Working professionals, part-time students

## 4. Daily Session Structure

Each study day is structured into focused blocks:

```
Session 1: Active Recall (30 min)   — Review yesterday's material
Session 2: Deep Work Block 1 (50 min) — New topic learning
Break (10 min)
Session 3: Deep Work Block 2 (50 min) — Continued new topic
Break (10 min)
Session 4: Practice / Problems (40 min) — Apply what was learned
Lunch Break (30-60 min)
Session 5: Deep Work Block 3 (50 min) — Second new topic
Break (10 min)
Session 6: Revision / Flashcards (30 min) — Previous topics
Break (10 min)
Session 7: Wrap-up & Review (20 min) — Summarize, plan next day
```

### Pomodoro Variant

Blocks can be replaced with Pomodoro sprints (25 min work + 5 min break).

## 5. Spaced Repetition Schedule

| Review # | Gap               | What to Review                       |
| -------- | ----------------- | ------------------------------------ |
| R1       | End of same day   | Same day's material (10 min summary) |
| R2       | 1 day later       | Previous day's material              |
| R3       | 3 days later      | All material from past 3 days        |
| R4       | 7 days later      | All material from past week          |
| R5       | 14 days later     | Full subject review                  |
| R6       | 1 day before exam | Selected high-yield topics           |

## 6. Sample Schedule Output

**User**: JNTU CSE, 3 subjects, 30 days until exams, 6 hours/day on weekdays, 8 on weekends

**Week 1 Sample**: | Day | Session 1 (30m) | Session 2 (50m) | Session 3 (50m) | Session 4 (40m) |
Session 5 (50m) | Session 6 (30m) | Session 7 (20m) | |---|---|---|---|---|---|---|---| | Mon | R:
Prev | DS: Trees (new) | DS: Trees (cont) | DS: Tree problems | OS: Processes (new) | Flashcards: DS
| Review + Plan | | Tue | R: DS Trees | OS: Processes (cont) | OS: CPU Scheduling | OS: Scheduling
sums | DB: ER Model (new) | Flashcards: OS | Review + Plan | | Wed | R: OS | DB: ER Model (cont) |
DB: Normalization | DB: Normalization ex | DS: BST (new) | Flashcards: DB | Review + Plan | | Thu |
R: DB | DS: BST (cont) | DS: BST operations | DS: BST problems | OS: Memory Mgmt (new) | Flashcards:
DS | Review + Plan | | Fri | R: DS | OS: Memory Mgmt (cont) | OS: Paging/Seg | OS: Numerical probs |
DB: SQL (new) | Mixed flashcards | Weekly review | | Sat | R: All Week | Deep work weak area |
Practice tests | Practice tests | Weak area cont | All flashcards | Full review | | Sun | REST |
REST | REST | REST | REST | REST | REST |

## 7. Study Methods Integration

| Block Type    | Method                                           | When to Use                |
| ------------- | ------------------------------------------------ | -------------------------- |
| **New Topic** | Feynman Technique, Cornell Notes, Mind Mapping   | First exposure             |
| **Practice**  | Active Recall, Worked Examples, Problem Sets     | After understanding basics |
| **Revision**  | Flashcards, Blurting, Self-Testing               | Reinforcing memory         |
| **Review**    | Spaced Repetition, Interleaving, Summary Writing | Consolidating knowledge    |
| **Deep Work** | Pomodoro, Time Blocking, Deep Focus              | Complex topics             |

### Overlapping-Exam Scheduling

When two or more exams fall on the same day or consecutive days:

| Scenario                                        | Strategy                                                                                       |
| ----------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| Exam A on June 15, Exam B on June 15 (same day) | Allocate 60% time to higher-weightage subject on the day before; use interleaved review blocks |
| Exam A on June 15, Exam B on June 16            | Study Exam A until 6pm on June 14; 2-hour review of Exam B on evening of June 14               |
| Exam A on June 15, Exam B on June 17            | Full focus on A until June 14; 1 day gap day for B on June 15 afternoon + June 16              |
| Exam A on June 15, Exam B on June 14            | Inverted gap — prioritize B first; A review on morning of June 15                              |
| 3+ exams in 5 days                              | Treat as "exam cluster": high-yield topics only, 1-hour review blocks per subject              |

### Recovery-Day Rules

- Mandatory 1 rest day for every 6 consecutive study days
- After a missed day: do NOT double the next day's load — redistribute over 3 days instead
- After an exam day: the remainder of that day is a recovery half-day (light review only)
- Recovery day activities: 30-min passive review (reading summaries), walks, sleep catch-up
- If 2+ days are missed, regenerate the plan rather than compressing remaining days

## 8. Adaptive Re-scheduling

The planner can adapt mid-course:

- **User reports**: "Topic X took longer than expected" -> Shift remaining schedule, squeeze
  lower-priority topics
- **User reports**: "I already know Topic Y well" -> Reduce allocated time, redistribute to weak
  areas
- **Missed day**: Carry forward planned topics, compress revision sessions
- **Extra time available**: Add practice tests, cross-subject integration sessions

## 9. Output Formats

| Format                  | Use Case                                            |
| ----------------------- | --------------------------------------------------- |
| **Markdown Table**      | Readable in any markdown renderer, GitHub, Obsidian |
| **CSV / Excel (.xlsx)** | Calendar import, further manipulation               |
| **Calendar (.ics)**     | Direct Google Calendar / Outlook import             |
| **Text**                | Quick reference, printing                           |

### Calendar Export Snippets

**.ics format for Google Calendar / Outlook import:**

```
BEGIN:VCALENDAR
VERSION:2.0
BEGIN:VEVENT
DTSTART:20260601T090000
DTEND:20260601T110000
SUMMARY:Study: DS - Trees (Deep Work Block)
DESCRIPTION:Unit 1 - Data Structures. Focus: Tree traversals, BST operations.
RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR
END:VEVENT
END:VCALENDAR
```

**CSV format for spreadsheet import:**

```csv
Date,Start,End,Subject,Topic,Block Type,Notes
2026-06-01,09:00,10:30,Data Structures,Tree Traversals,Deep Work,Focus on inorder/preorder/postorder
2026-06-01,10:30,11:00,,,Break,
2026-06-01,11:00,12:30,Data Structures,BST Operations,Practice,Solve 5 BST problems
2026-06-01,14:00,15:30,Operating Systems,CPU Scheduling,New Topic,FCFS SJB Round Robin
2026-06-01,15:30,16:00,,,Break,
2026-06-01,16:00,17:00,Operating Systems,Scheduling Numericals,Practice,Solve 3 problems
2026-06-01,17:00,17:30,All,Flashcard Review,Revision,Spaced repetition review
```

To export a plan as a calendar file, pipe the output to `plan-to-ics.py` or `plan-to-csv.py` from
the `scripts/` directory.

---

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

## 10. Integration with Other Skills

- **universal-pyq-analyzer**: Provides topic weightage and frequency data for optimal prioritization
- **universal-imp-topics-generator**: Identifies high-probability topics for cram schedules
- **universal-flashcard-generator**: Populates flashcard review sessions with actual generated cards
- **universal-last-minute-crammer**: Emergency sub-plans for schedule shortfalls

## Error Handling

| Error                              | Cause                                  | Solution                                                  |
| ---------------------------------- | -------------------------------------- | --------------------------------------------------------- |
| No exam dates provided             | Required input missing                 | Prompt user for at least one exam date                    |
| Impossible schedule (time < needs) | Available hours insufficient for scope | Reduce scope, increase daily hours, or extend timeline    |
| Negative time remaining            | Exam date has already passed           | Switch to cram plan (Type 3) or imp-topics only           |
| Subject/topic list empty           | No scope defined                       | Prompt for subject list or syllabus PDF                   |
| Overlapping exams not handled      | Multiple exams same day/cluster        | Apply overlapping-exam scheduling rules                   |
| Calendar export fails              | Missing conversion script              | Run `npm run init` to install scripts; fall back to table |
| Difficulty ratings inconsistent    | All topics same rating (unlikely)      | Ask user to differentiate (Hard/Medium/Easy)              |
| Abnormally high daily hours        | >14 hours/day requested                | Warn user; cap at 12 with mandatory breaks                |

## Quality Gate

Before presenting the schedule to the user, verify:

- [ ] Exam dates are in the future and chronologically ordered
- [ ] Total study hours fit within available days (no over-commit)
- [ ] Each subject has at least one study block before its exam
- [ ] Spaced repetition schedule (R1-R6) is embedded in the timeline
- [ ] At least one rest/recovery day exists if plan exceeds 6 days
- [ ] Overlapping-exam rule is applied if multiple exams within 3 days
- [ ] Daily hours do not exceed 12 (or 14 for cram plans, with warning)
- [ ] Output format is available (markdown, CSV, ICS, or text)
- [ ] Calendar export file is valid if requested (.ics or .csv format)
- [ ] User can start immediately with the plan as presented

If any check fails, adjust the schedule or report the limitation to the user.
