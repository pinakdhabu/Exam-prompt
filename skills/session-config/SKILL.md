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
| **OpenCode**           | AGENTS.md + deps/session-profile.json   |

## JSON Schema Validation

All session config files should validate against the following JSON Schema:

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "required": ["session", "university", "subject", "exam"],
  "properties": {
    "session": {
      "type": "object",
      "required": ["id", "created", "last_updated"],
      "properties": {
        "id": { "type": "string", "pattern": "^sess_" },
        "created": { "type": "string", "format": "date-time" },
        "last_updated": { "type": "string", "format": "date-time" },
        "profile_name": { "type": "string" },
        "version": { "type": "string", "pattern": "^\\d+\\.\\d+\\.\\d+$" }
      }
    },
    "university": {
      "type": "object",
      "required": ["name", "short", "region", "department", "pattern", "semester"]
    },
    "subject": {
      "type": "object",
      "required": ["name", "code", "units"]
    },
    "exam": {
      "type": "object",
      "required": ["type", "total_marks", "duration_minutes"]
    }
  }
}
```

Validate every config write against this schema. Reject writes that fail validation with a clear
error message identifying the missing or malformed field.

### Multi-Profile Naming Convention

When storing multiple session profiles, use this naming convention:

| Profile                | Filename                           |
| ---------------------- | ---------------------------------- |
| Current/active profile | `deps/session-profile.json`        |
| Named profile          | `deps/session-profile.{name}.json` |
| All profiles index     | `deps/session-profiles.json`       |

**Version field semantics:**

| Version | Meaning                                           |
| ------- | ------------------------------------------------- |
| `1.0.0` | Initial schema (session + university + subject)   |
| `1.1.0` | Added exam structure (type, marks, duration)      |
| `1.2.0` | Added user preferences and active_skills array    |
| `2.0.0` | Breaking change (schema incompatibility detected) |

When reading a profile with a higher minor version than the system expects, log a warning but
continue. When reading a profile with a higher major version, refuse to parse and request recreation
via `setup-exam-prompt`.

## Error Handling

| Error                       | Cause                             | Solution                                               |
| --------------------------- | --------------------------------- | ------------------------------------------------------ |
| Profile file not found      | No `deps/session-profile.json`    | Prompt user to run `setup-exam-prompt` first           |
| Schema validation failed    | Missing/incorrect fields          | Show diff of what's missing, prompt to fix             |
| Version mismatch            | Profile schema is outdated        | Run migration or recreate via `setup-exam-prompt`      |
| Multiple profiles ambiguous | Several files in deps/            | Use `profile_name` field or ask user which to load     |
| Concurrent write detected   | Two agents writing simultaneously | Lock file (`deps/.session.lock`), retry after 1 second |
| Corrupt JSON                | Manual edit broke syntax          | Restore from backup or recreate via setup              |

## Quality Gate

Before accepting any config and proceeding to downstream skills, verify:

- [ ] Schema validates (use JSON Schema block above)
- [ ] University short name resolves to known university in the adapter
- [ ] Subject code matches known pattern (regex for university's code format)
- [ ] Exam type is one of: ESE, MSE, Mid-sem, Final, Midterm, Module, Other
- [ ] Total marks are positive integer, duration_minutes is positive integer
- [ ] `profile_name` is set if multiple profiles exist
- [ ] `version` matches expected major version
- [ ] `active_skills` entries all correspond to valid skill names in the project
- [ ] `last_updated` is within 24 hours of current time (warn if stale)

If any check fails, log the issue, do NOT pass config to downstream skills, and prompt the user to
fix before proceeding.

## Integration with Other Skills

All skills in this system read the session config to determine:

- University pattern (for answer formatting)
- Subject syllabus (for content scope)
- Exam type (for depth calibration)
- CO alignment (for rubric matching)
- Bloom's level targets

Without session config, each skill must independently detect context. With session config, detection
happens once and is reused across all skill calls.
