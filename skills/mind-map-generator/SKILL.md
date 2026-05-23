---
name: universal-mind-map-generator
description: Generates visual concept maps and mind maps for ANY university worldwide. Connects topics hierarchically with cross-links, color coding by Bloom's level, and priority annotations. Supports Mermaid syntax, text outline, and image description formats. Works for ALL subjects and ALL exam patterns.
---

# Universal Mind Map Generator

## Overview
Transforms any syllabus, textbook chapter, or set of notes into a structured visual mind map. Maps show hierarchical relationships, cross-topic connections, priority levels, and Bloom's taxonomy distribution. Optimized for both quick overview and deep study.

## How This Skill Works

1. **User provides**: Subject, unit/topic, syllabus or notes, desired depth, output format
2. **System analyzes**: Concept hierarchy, relationships, dependencies, and importance
3. **System constructs**: Tree structure with central topic, main branches, sub-branches, and cross-links
4. **System renders**: In chosen format (Mermaid, text outline, or image description)

## 1. Mind Map Structure

```
                    [Central Topic]
              /         |          \
    [Main Branch 1] [Main Branch 2] [Main Branch 3]
      /    |    \       |    \          |
  [Sub] [Sub] [Sub]  [Sub] [Sub]    [Sub]
   |     |            |
 [Det] [Det]        [Det]
```

### Elements
| Element | Visual | Purpose |
|---|---|---|
| **Central Topic** | Center, largest node | The main subject of the map |
| **Main Branch** | Directly from center, thick line | Major subtopics / units |
| **Sub-Branch** | From main branch, thinner line | Individual concepts |
| **Detail Node** | Leaf nodes, smallest | Specific facts, formulas, examples |
| **Cross-Link** | Dashed line between branches | Inter-topic connections |
| **Priority Badge** | Color/icon annotation | High (red) / Medium (yellow) / Low (green) |
| **Bloom's Tag** | Label on node | R=Remember, U=Understand, Ap=Apply, An=Analyze, E=Evaluate, C=Create |

## 2. Output Formats

### Format 1 — Mermaid Mind Map (Recommended)
```mermaid
mindmap
  root((Computer Networks))
    ::id1
    OSI Model
      7 Layers
      Encapsulation
      ::icon(fa fa-star)
    TCP/IP Stack
      ::id2
      Application
      Transport
      Internet
      Network Access
    Protocols
      TCP ::id3
        Connection-oriented
        Flow control
        Congestion control
      UDP
        Connectionless
        Low latency
    Addressing
      MAC
      IP ::id4
      Port
```

### Format 2 — Indented Text Outline
```
Computer Networks
|-- OSI Model (R) [HIGH]
|   |-- 7 Layers (R)
|   |   |-- Physical (R)
|   |   |-- Data Link (R)
|   |   |-- Network (R)
|   |   |-- Transport (R) [HIGH]
|   |   |-- Session (R)
|   |   |-- Presentation (R)
|   |   |-- Application (R)
|   |-- Encapsulation (U) [HIGH]
|   |-- Peer-to-peer communication (U)
|-- TCP/IP Stack (U) [HIGH]
|   |-- ...
|-- Protocols (Ap) [HIGH]
|   |-- TCP (Ap) [HIGH]
|   |   |-- Connection-oriented (U)
|   |   |-- Flow control (U)
|   |   |-- Congestion control (An)
|   |-- UDP (Ap) [MEDIUM]
|       |-- Connectionless (U)
|       |-- Low latency (U)
|-- Addressing (U) [MEDIUM]
    |-- MAC (R)
    |-- IP (U) [HIGH]
    |-- Port (R)
```

### Format 3 — Image Description
For use with image generation or hand drawing:
```
Layout: Center-outward radial tree
Central node: "Computer Networks" in a rounded rectangle
Branch 1 (top-right): "OSI Model" in blue — 7 sub-branches for each layer
Branch 2 (bottom-right): "TCP/IP Stack" in green — 4 sub-branches
Branch 3 (top-left): "Protocols" in orange — TCP (highlighted), UDP
Branch 4 (bottom-left): "Addressing" in purple — MAC, IP, Port nodes
Cross-link: dashed line from OSI Transport to TCP, from TCP to Flow Control concept
Priority: red highlight on TCP, IP, Encapsulation
```

## 3. Color Coding Scheme

| Element | Color | Meaning |
|---|---|---|
| **Central** | Dark (black/blue) | Subject name |
| **Main Branch** | Per-unit color | Unit identity |
| **High Priority** | Red border/shade | Must know (PYQ frequency > 60%) |
| **Medium Priority** | Yellow/amber border | Important (PYQ frequency 30-60%) |
| **Low Priority** | Green border | Supplementary (PYQ frequency < 30%) |
| **Cross-Link** | Purple dashed | Inter-topic relationship |
| **Remember** | Blue tag | Factual recall |
| **Understand** | Teal tag | Conceptual understanding |
| **Apply** | Green tag | Procedure/application |
| **Analyze** | Orange tag | Breaking down/compare |
| **Evaluate** | Red tag | Judgment/justification |
| **Create** | Purple tag | Synthesis/design |

## 4. Generation Strategies

| Strategy | When | Map Style |
|---|---|---|
| **Syllabus-Driven** | Full subject overview | Broad, hierarchical, all units |
| **PYQ-Driven** | Pre-exam focus | Prioritized by question frequency |
| **Deep Dive** | Single complex topic | Narrow, very deep, highly detailed |
| **Compare-Contrast** | Related topics side-by-side | Dual-center with cross-links |
| **Problem-Solution** | Numerical/conceptual problems | Flow-based, decision-path |
| **Revision Map** | Last-minute review | Ultra-condensed, high-yield only |

## 5. Integration with Other Skills

- **universal-notes-generator**: Extracts concepts and structure from generated notes
- **universal-pyq-analyzer**: Colors priority levels based on historical question frequency
- **universal-imp-topics-generator**: Highlights important nodes in the map
- **universal-study-planner**: Mind maps serve as daily review anchors
