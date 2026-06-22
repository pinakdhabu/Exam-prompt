---
name: universal-lab-report-writer
description:
  Generates complete laboratory report structures for ANY university worldwide. Covers engineering,
  science, medical, and research labs. Provides full templates including aim, apparatus, theory,
  procedure, observations, calculations, results, discussion, and conclusions. Adapts to any
  university's lab report format requirements.
---

# Universal Lab Report Writer

## Overview

Generates structured, submission-ready lab reports for any course, any department, any university.
Each report follows the target university's prescribed format and includes all standard sections
with appropriate technical depth, diagrams, tables, and calculations.

## How This Skill Works

1. **User provides**: Subject, experiment name/number, university and course, lab manual or
   experiment description, any specific format requirements
2. **System identifies**: The correct lab report template for the target university
3. **System generates**: Complete report with all sections filled with relevant content
4. **System calibrates**: Technical depth, notation, and format to match university standards

## 1. Lab Report Templates

### Template A — Engineering Lab (Moore Method)

Used by: Most Indian engineering universities (SPPU, VTU, JNTU, Mumbai, AKTU, RGPV)

| Section               | Content                                                    | Length     |
| --------------------- | ---------------------------------------------------------- | ---------- |
| **Experiment No.**    | Sequential number                                          | 1 line     |
| **Title**             | Experiment name as in syllabus                             | 1 line     |
| **Date**              | Date of performance                                        | 1 line     |
| **Aim**               | Concise statement of objective                             | 1-2 lines  |
| **Apparatus**         | Equipment and components list with specifications          | Table      |
| **Theory**            | Brief concept explanation, formulas, circuit/block diagram | 1-2 pages  |
| **Procedure**         | Step-by-step experimental procedure                        | 1 page     |
| **Observation Table** | Tabulated readings with headings and units                 | 1 page     |
| **Calculations**      | Sample calculations for one reading set                    | 1-2 pages  |
| **Result**            | Final output/observation statement                         | 1-2 lines  |
| **Conclusion**        | What was learned, inference from results                   | 5-10 lines |
| **Viva Questions**    | Common viva questions with answers                         | 5-10 Q&A   |

### Template B — Science Lab (Physics/Chemistry/Biology)

| Section                   | Description                                            |
| ------------------------- | ------------------------------------------------------ |
| **Aim**                   | Objective statement                                    |
| **Apparatus / Materials** | Equipment and chemicals list                           |
| **Theory / Principle**    | Underlying scientific principle with relevant formulas |
| **Setup Diagram**         | Labeled experimental setup                             |
| **Procedure**             | Stepwise method                                        |
| **Observations**          | Raw data table                                         |
| **Calculations**          | Formula application with sample calculation            |
| **Result**                | Statement of findings                                  |
| **Precautions**           | Safety and accuracy measures                           |
| **Sources of Error**      | Known error sources                                    |

### Template C — Research Lab / Advanced

| Section               | Description                                                       |
| --------------------- | ----------------------------------------------------------------- |
| **Abstract**          | Concise summary (150-250 words)                                   |
| **Introduction**      | Background, motivation, objectives                                |
| **Methodology**       | Experimental design, materials, methods                           |
| **Setup / Apparatus** | Detailed description with schematics                              |
| **Procedure**         | Step-by-step protocol                                             |
| **Results**           | Data presented in tables and graphs (no interpretation)           |
| **Discussion**        | Interpretation of results, comparison with theory, error analysis |
| **Conclusion**        | Summary of findings and significance                              |
| **References**        | Cited sources in proper format                                    |
| **Appendix**          | Raw data, calculations, additional figures                        |

### Template D — Medical / Clinical Lab

| Section                  | Description                            |
| ------------------------ | -------------------------------------- |
| **Patient/Subject Info** | Anonymized demographics                |
| **Objective**            | Clinical question being investigated   |
| **Sample Description**   | Type, collection method, handling      |
| **Method / Protocol**    | Standard operating procedure followed  |
| **Observations**         | Clinical observations and measurements |
| **Results**              | Test results with normal ranges        |
| **Interpretation**       | Clinical significance of results       |
| **Conclusion**           | Diagnosis or inference                 |

## 2. Diagram Support

The system generates descriptions of diagrams that should be included:

- **Circuit diagrams** (engineering): Component symbols, connections, labels
- **Block diagrams** (systems): Functional blocks with data flow
- **Graphs** (data): Labeled axes with plotted data points
- **Flowcharts** (procedures): Step-by-step process visualization
- **Schematic diagrams** (equipment): Labeled parts and connections

Diagram descriptions are provided in text form suitable for drawing by the student or rendering as
Mermaid.

## 3. Sample Lab Report Output

**User**: Generate lab report for "Full Wave Rectifier" experiment for SPPU SE E&TC.

```
Experiment No: 4
Title: Full Wave Rectifier
Date: [Date of performance]

Aim: To construct a full wave rectifier circuit using center-tapped transformer
     and bridge configuration, and to observe input/output waveforms.

Apparatus:
| Sr. No. | Component | Specification | Quantity |
|---------|-----------|---------------|----------|
| 1 | Step-down transformer | 230V/12V-0-12V, 500mA | 1 |
| 2 | Diodes | 1N4007 | 4 |
| 3 | Resistor | 1k ohm, 1/4W | 1 |
| 4 | Capacitor | 100 microF, 25V | 1 |
| 5 | CRO | Dual trace, 20MHz | 1 |
| 6 | Breadboard | - | 1 |
| 7 | Connecting wires | - | As required |

Theory:
A full wave rectifier converts both halves of the AC input cycle to DC output.
Two configurations are common: center-tapped transformer with 2 diodes and
bridge rectifier with 4 diodes. The bridge configuration does not require
a center-tapped transformer.

Average DC output voltage: Vdc = 2Vm / pi
Ripple factor (without filter): gamma = 0.48
Ripple factor (with capacitor filter): gamma = 1/(4*sqrt(3)*f*R*C)

... (full report continues)
```

## Session Config

This skill integrates with the session config system (`deps/session-profile.json`). Before executing, check for an existing session profile:

- If `deps/session-profile.json` exists, read `university`, `subject`, `pattern`, and `exam_type` fields to auto-configure the skill.
- If the file does not exist, fall back to user-provided context or prompt the user to run `setup-exam-prompt` (or `npm run init`) first.
- Session config eliminates redundant context detection — detection happens once and is reused across all skill calls.

---

## 4. Integration with Other Skills

- **universal-a-plus-answer-writer**: Provides extended theoretical explanations for the theory section
- **universal-viva-oral-exam-prep**: Generates viva questions and answers for the viva section
- **universal-formula-sheet-generator**: Derives and formats formulas for the calculations section
