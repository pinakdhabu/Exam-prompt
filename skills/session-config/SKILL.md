---
name: universal-session-config
description:
  Persistent session configuration for the Exam Prompt system. Stores university, subject, exam
  pattern, and user profile across skill calls. Eliminates redundant context detection by providing
  a single JSON profile that every other skill reads. Works for ANY university worldwide.
---

# Universal Session Configuration

## Overview

Provides a single persistent configuration profile that all skills read. Set once, use everywhere.
Eliminates the need for each skill to independently detect university, subject, and exam parameters.

## How This Skill Works

1. **User provides** (once per session): University, department, subject, exam pattern, semester
2. **System stores**: Configuration as a JSON profile
3. **Every skill reads**: Configuration from this profile instead of re-detecting
4. **User can switch**: Change university/subject mid-session with a single command

## Session Configuration Profile

```json
{
  "session": {
    "id": "sess_abc123",
    "created": "2026-05-23T10:00:00Z",
    "last_updated": "2026-05-23T10:30:00Z"
  },
  "university": {
    "name": "Savitribai Phule Pune University",
    "short": "SPPU",
    "region": "India",
    "department": "Computer Engineering",
    "pattern": "2019",
    "semester": 6
  },
  "subject": {
    "name": "Database Management Systems",
    "code": "410243",
    "units": [
      { "id": 1, "name": "Introduction to DBMS" },
      { "id": 2, "name": "Relational Model & SQL" },
      { "id": 3, "name": "Normalization" },
      { "id": 4, "name": "Transaction Management" },
      { "id": 5, "name": "File Organization & Indexing" },
      { "id": 6, "name": "NoSQL & Advanced Topics" }
    ],
    "cos": ["CO1", "CO2", "CO3", "CO4", "CO5", "CO6"]
  },
  "exam": {
    "type": "ESE",
    "total_marks": 70,
    "duration_minutes": 150,
    "pattern": {
      "q1_type": "compulsory",
      "q2_to_q7": "OR pairs",
      "units_covered": "Unit 3-6"
    }
  },
  "user": {
    "preferred_formats": ["Cornell Notes", "Rapid Revision"],
    "target_gpa": 10,
    "weak_topics": []
  },
  "active_skills": ["answer-writer", "notes-generator", "pyq-analyzer", "imp-topics-generator"]
}
```

## Commands

### Set University

```
Set university to VTU, CSE, 5th semester, 2022 scheme
```

### Set Subject

```
Set subject to Operating Systems, code 21CS52
```

### Set Exam

```
Set exam to Mid-sem, 40 marks, 1 hour
```

### View Current Config

```
Show my session config
```

### Switch University

```
Switch to Mumbai University, IT department, 2024 pattern
```

## Configuration Persistence

| Agent                  | Persistence Method                      |
| ---------------------- | --------------------------------------- |
| **Claude Code**        | Session memory (AGENTS.md loaded skill) |
| **Claude Project**     | Project instructions + knowledge base   |
| **ChatGPT/Custom GPT** | GPT instructions + conversation memory  |
| **Cursor/Windsurf**    | .cursorrules + session variables        |
| **Gemini Gems**        | Gem instructions                        |

## Integration with Other Skills

All skills in this system read the session config to determine:

- University pattern (for answer formatting)
- Subject syllabus (for content scope)
- Exam type (for depth calibration)
- CO alignment (for rubric matching)
- Bloom's level targets

Without session config, each skill must independently detect context. With session config, detection
happens once and is reused across all skill calls.
