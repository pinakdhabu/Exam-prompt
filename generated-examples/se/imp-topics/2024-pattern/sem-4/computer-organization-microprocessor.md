# Computer Organization and Microprocessor (PCC-253-COM) — IMP Topics 2024 Pattern

> **SPPU SE Computer Engineering | Semester IV | ESE: 70 Marks, CCE: 30 Marks**
> **⚠️ Note:** 2024 Pattern subject. Predictions based on official syllabus + cross-reference with 2019 Pattern Microprocessor PYQs.

---

## Section A — Must-Prepare IMP Topics (Unit-wise)

### Unit I: Computer Evolution and Performance (6 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Von Neumann Architecture** — blocks, features, limitations | >70% | 5M Diagram + explain | **Guaranteed question** |
| **Harvard Architecture** — comparison with Von Neumann | >70% | 5M Compare | Very important |
| **Performance Design metrics** — MIPS, MFLOPS, Clock speed | >70% | 2-5M | Important |
| **Intel Processor Evolution** (4-bit to 64-bit) | 50-70% | 2M | Quick question |
| **Computer Interconnections — Bus architecture** | >70% | 5M Explain with diagram | Important |
| **ALU — basic operations** | >70% | 5M | Foundation |
| **Booth's Algorithm for multiplication** | >70% | 5-10M Trace | **Classic numerical** |
| Binary addition/subtraction using 2's complement | >70% | 5M | Important |
| Carry look-ahead adder concept | 50-70% | 2M | Secondary |

### Unit II: Memory Management (6 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Memory Hierarchy** — Cache, Main, Secondary | >70% | 5M Diagram + explain | Foundation |
| **Cache Memory — Principles** | >70% | 5M Explain | Very important |
| **Cache Design — mapping techniques** (Direct, Associative, Set-Associative) | >70% | 5-10M Compare + numerical | **HIGHEST PRIORITY** |
| **Cache Replacement policies** (LRU, FIFO, Random) | >70% | 5M | Important |
| **Cache Write policies** (Write-through, Write-back) | >70% | 5M Compare | Important |
| **Address Translation in cache** | >70% | 5M | Important |
| **DRAM — types and characteristics** | >70% | 2M | Quick question |
| **RAID levels (1-6)** | >70% | 5M Compare | Very important |
| Cache hit ratio calculation numerical | >70% | 5M | High frequency |

### Unit III: Introduction to 8086 Microprocessor (6 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **8086 Architecture — block diagram** | >70% | 10M Draw + explain | **Guaranteed question** |
| **8086 Pin Diagram** | >70% | 5M Explain important pins | Very important |
| **8086 Register Organization** — General, Segment, Pointer/Index | >70% | 5M List and explain | Very important |
| **Addressing Modes** — all 7 types | >70% | 5-10M Explain with examples | **HIGHEST PRIORITY** |
| **Instruction Set — Data Transfer, Arithmetic, Logical, Branch** | >70% | 5-10M Write programs | Very important |
| **Physical Address Calculation** (Segment:Offset) | >70% | 5M Numerical | **Classic numerical** |
| Minimum and Maximum mode concepts | 50-70% | 5M Compare | Important |

### Unit IV: Memory Organization and Interrupts (6 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Segmentation in 8086** | >70% | 5M Explain with diagram | Very important |
| **Address Translation mechanism** | >70% | 5M | Important |
| **Memory Banks — Interleaved** | >70% | 5M | Important |
| **Timing Diagrams** — Memory Read/Write | >70% | 5-10M Draw | **Important — diagram guaranteed** |
| **I/O Mapping — Memory Mapped vs I/O Mapped** | >70% | 5M Compare | Classic question |
| **Interrupts — types** (Hardware, Software, INTR, NMI) | >70% | 5M | Very important |
| **Interrupt Vector Table (IVT)** | >70% | 5M Explain structure | Important |
| **Interrupt Service Routine (ISR)** | >70% | 5M Explain flow | Important |
| **8259 PIC — architecture and working** | >70% | 5-10M | Important |
| Interrupt sequence of 8086 | >70% | 5M Trace | Important |

### Unit V: Parallel Organization (6 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Flynn's Taxonomy — SISD, SIMD, MISD, MIMD** | >70% | 5M Explain with examples | Very important |
| **Multiprocessor concepts** | >70% | 5M | Important |
| **Clusters** | 50-70% | 2M | Quick question |
| **Coupled Systems — Closely vs Loosely** | >70% | 5M Compare | Important |
| **SMP (Symmetric Multiprocessor)** | >70% | 5M Explain | Important |
| **UMA vs NUMA** | >70% | 5M Compare | Classic comparison |
| **RISC Architecture** — features, pipelining | >70% | 5-10M | Very important |
| **RISC vs CISC** | >70% | 5M Compare | **Classic comparison — guaranteed** |

---

## Section B — High-Yield Numerical Topics

| Unit | Numerical Topic | Frequency |
|------|----------------|-----------|
| I | **Booth's Algorithm — multiply two signed numbers** | Very High |
| I | **Binary addition/subtraction** | High |
| II | **Cache mapping — direct/associative numerical** | Very High |
| II | **Cache hit ratio calculation** | High |
| III | **Physical Address calculation (Segment × 10 + Offset)** | Very High |
| III | **8086 Assembly program writing** | High |
| IV | **Timing diagram drawing** | High |

---

## Section C — High-Yield Diagram Topics

| Unit | Diagram Topic | Key Labels |
|------|---------------|------------|
| I | **Von Neumann Architecture** | CPU, Memory, I/O, Bus |
| I | **Booth's Algorithm flowchart** | AC, Q, Q-1, M |
| II | **Memory Hierarchy** | Cache → RAM → Disk |
| II | **Cache Mapping techniques** | Tag, Index, Offset |
| III | **8086 Architecture block diagram** | BIU, EU, Registers |
| III | **8086 Pin Diagram** (key pins) | AD0-AD15, A16-A19, Control pins |
| IV | **Timing Diagram — Memory Read/Write** | Address, Data, Control signals |
| IV | **Interrupt sequence flowchart** | INT, IVT, ISR |
| V | **Flynn's Taxonomy** | 4 types with examples |
| V | **RISC pipeline stages** | IF, ID, EX, MEM, WB |

---

## Section D — IMP Questions by Marks

### 2-Mark Questions
1. State Von Neumann architecture.
2. Define cache hit and miss.
3. What are the addressing modes of 8086?
4. Difference between RISC and CISC.
5. What is Flynn's Taxonomy?
6. What is an interrupt?
7. Define UMA and NUMA.
8. What is a timing diagram?
9. What is the difference between memory-mapped I/O and I/O-mapped I/O?
10. What is pipelining?

### 5-Mark Questions
1. Compare Von Neumann and Harvard architectures.
2. Explain direct, associative, and set-associative cache mapping.
3. Explain all addressing modes of 8086 with examples.
4. Draw and explain the 8086 architecture block diagram.
5. Compare RAID levels 0, 1, 5, and 6.
6. Explain the interrupt mechanism in 8086 with IVT.
7. Compare RISC and CISC architectures.
8. Explain SMP, UMA, and NUMA architectures.
9. Draw a timing diagram for memory read operation in 8086.
10. Explain 8259 PIC architecture and operation.

### 10-Mark Questions
1. Trace Booth's Algorithm to multiply (-7) × (+3). Show all steps.
2. Explain 8086 architecture in detail. Draw the block diagram and explain BIU and EU.
3. Solve a cache mapping problem: given memory of size X, cache of size Y, block size Z — find number of blocks, tag, index, offset bits for direct and set-associative mapping.
4. Write an 8086 assembly program to add two arrays of 10 elements.
5. Explain all 6 RAID levels with diagrams and comparison.
6. Trace the interrupt sequence in 8086 from INTR signal to ISR execution.
7. Write a note on RISC architecture with features, pipelining, and comparison with CISC.
8. Draw timing diagrams for memory read and memory write operations in 8086 minimum mode.

---

## Section E — Cross-Unit Question Prediction

| Units | Combined Topic | Likely Format |
|-------|----------------|---------------|
| I + III | ALU operations + 8086 instruction set | 5M |
| II + IV | Memory hierarchy + 8086 memory organization | 5M |
| III + IV | 8086 addressing modes + interrupt handling | 10M |
| III + V | 8086 vs RISC architecture comparison | 5M |
| II + V | Multiprocessor memory organization (UMA/NUMA) | 5M |

---

## Section F — Emergency Plan (1 Night Before)

**Absolute Bare Minimum:**
1. Von Neumann Architecture — diagram + features (5M guaranteed)
2. 8086 Architecture — block diagram + register organization (10M guaranteed)
3. Physical Address Calculation — 2 numerical problems
4. Booth's Algorithm — trace 1 multiplication
5. RISC vs CISC — comparison table

**Quick Memory Tricks:**
- **8086 Registers:** **"AX BX CX DX SI DI BP SP"** (General + Pointer/Index)
- **Addressing Modes:** **"IDRIDB"** = Immediate, Direct, Register, Indirect, Indexed, Based, Based-Indexed
- **Flynn's:** **"SSMM"** = SISD, SIMD, MISD, MIMD
- **Cache Mapping:** **"DSA"** = Direct, Set-Associative, Associative
- **RAID levels:** **"0=Striping, 1=Mirror, 5=Parity+Distributed, 6=Double Parity"**
