# Operating Systems (PCC-203-COM) — IMP Topics 2024 Pattern

> **SPPU SE Computer Engineering | Semester III | ESE: 70 Marks, CCE: 30 Marks**
> **⚠️ Note:** Brand new subject for SE in 2024 Pattern (previously TE-level). Predictions based on official syllabus + cross-reference with TE-level SP&OS PYQs.

---

## Section A — Must-Prepare IMP Topics (Unit-wise)

### Unit I: Introduction to Operating System (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Objectives and functions of OS** | >70% | 5M Explain | Foundation question |
| **Evolution of OS** — Batch, Time-sharing, Real-time, Distributed | >70% | 5M Describe stages | Classic SPPU question |
| **Types of OS** — Batch, Multiprogramming, Multitasking, Real-time, Distributed | >70% | 5M Compare | Very high frequency |
| **System Calls — types and examples** | >70% | 5M List & explain | Extremely important |
| **OS Structures — Monolithic, Layered, Microkernel** | >70% | 5-10M Compare | New in syllabus, likely asked |
| **Linux OS — components, basic shell commands** | >70% | 5M | New practical-oriented topic |
| OS Services | 50-70% | 2M | Quick question |

### Unit II: Process and Thread Management (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Process — definition, states, transitions** | >70% | 5-10M Diagram + explain | Core OS concept |
| **Process Control Block (PCB)** | >70% | 5M Explain contents | Very important |
| **Context Switching** | >70% | 5M Explain impact | Important concept |
| **Process Scheduling — Long term, Short term, Middle term** | >70% | 5M Explain | Always asked |
| **FCFS Scheduling** | >70% | 5M Numerical + Gantt chart | Must-know |
| **SJF Scheduling** | >70% | 5M Numerical + Gantt chart | Must-know |
| **Round Robin Scheduling** | >70% | 5-10M Numerical + Gantt chart | Most important |
| **Priority Scheduling** | >70% | 5M Numerical + Gantt chart | Frequently asked |
| Threads — User-level vs Kernel-level | >70% | 5M Compare | Important |
| Multithreading concepts | 50-70% | 2-5M | Quick question |
| **Scheduling in UNIX and Windows** | 50-70% | 5M Compare | New in syllabus |

### Unit III: Interprocess Communication and Deadlock (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Critical Section Problem** | >70% | 5-10M Explain | Foundation of concurrency |
| **Semaphore — binary and counting** | >70% | 5-10M Explain + code | Most tested synchronization tool |
| **Mutex vs Semaphore** | >70% | 5M Compare | Classic comparison |
| **Monitors** | >70% | 5M Explain | Important |
| **Producer-Consumer Problem** | >70% | 10M Solution with semaphore | Classic synchronization problem |
| **Reader-Writer Problem** | >70% | 10M Solution with semaphore | Classic synchronization problem |
| **Dining Philosophers Problem** | >70% | 5-10M Explain | Famous problem |
| IPC — Message passing, Shared memory | 50-70% | 5M Compare | Important concept |
| **Deadlock — 4 conditions** | >70% | 5M List & explain | Fundamental |
| **Deadlock Prevention** | >70% | 5M Explain strategies | Very important |
| **Deadlock Avoidance — Banker's Algorithm** | >70% | 10M Numerical solve | **HIGHEST PRIORITY — numerical guaranteed** |
| **Deadlock Detection** | >70% | 5M Explain | Important |
| Deadlock Recovery | 50-70% | 2-5M | Secondary |

### Unit IV: Memory Management (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Contiguous vs Non-contiguous allocation** | >70% | 5M Compare | Foundation |
| **Fragmentation — Internal vs External** | >70% | 5M Explain with example | Very important |
| **Memory allocation — First Fit, Best Fit, Worst Fit** | >70% | 5-10M Numerical solve | **HIGHEST PRIORITY** |
| **Paging — page table structure** | >70% | 5-10M Explain + diagram | Core concept |
| **Segmentation** | >70% | 5M Explain + diagram | Very important |
| Paging vs Segmentation | >70% | 5M Compare | Classic comparison |
| **Virtual Memory concept** | >70% | 5M Explain | Fundamental |
| **Demand Paging** | >70% | 5M Explain | Very important |
| **Page Replacement — FIFO** | >70% | 5M Numerical solve | **Must-know numerical** |
| **Page Replacement — LRU** | >70% | 5M Numerical solve | **Must-know numerical** |
| **Page Replacement — Optimal** | >70% | 5M Numerical solve | **Must-know numerical** |
| **Thrashing** | >70% | 5M Explain causes & prevention | Important |

### Unit V: File and Disk Management (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **File operations and Directory structure** | >70% | 5M Explain | Foundation |
| **File Organization and Access methods** | >70% | 5M Compare types | Very important |
| **File Allocation Methods — Contiguous, Linked, Indexed** | >70% | 5-10M Compare | Classic question |
| **File Systems — FAT, NTFS, EXT, HFS** | >70% | 5M Compare | New in syllabus |
| **Disk Scheduling — FCFS** | >70% | 5M Numerical + diagram | Must-know |
| **Disk Scheduling — SSTF** | >70% | 5M Numerical | Must-know |
| **Disk Scheduling — SCAN** | >70% | 5M Numerical + diagram | Very important |
| **Disk Scheduling — C-SCAN** | >70% | 5M Numerical | Very important |
| **Disk Scheduling — LOOK, C-LOOK** | >70% | 5M Numerical | Important |
| Disk reliability, formatting, boot-block, bad blocks | 50-70% | 2M | Secondary |

---

## Section B — High-Yield Numerical Topics

| Unit | Numerical Topic | Frequency |
|------|----------------|-----------|
| II | **CPU Scheduling — Gantt chart + avg waiting/turnaround time** | Very High |
| III | **Banker's Algorithm — safety algorithm + resource request** | Very High |
| IV | **Memory Allocation — First/Best/Worst Fit** | Very High |
| IV | **Page Replacement — FIFO/LRU/Optimal page faults** | Very High |
| IV | **Paging — logical to physical address translation** | High |
| V | **Disk Scheduling — seek time calculation** | Very High |

---

## Section C — High-Yield Diagram Topics

| Unit | Diagram Topic | Key Labels |
|------|---------------|------------|
| I | OS Structure comparison (Monolithic vs Microkernel) | Layers, modules |
| II | Process State Transition Diagram | 5 states: New, Ready, Running, Waiting, Terminated |
| II | PCB structure | PID, PC, Registers, Priority |
| III | Semaphore solution for Producer-Consumer | wait(), signal() |
| IV | Page Table structure | Page #, Frame #, Valid/Invalid |
| V | Disk scheduling head movement | Seek distance, direction |

---

## Section D — IMP Questions by Marks

### 2-Mark Questions
1. Define system call. Give 2 examples.
2. What is context switching?
3. What are the four conditions for deadlock?
4. Define thrashing.
5. Difference between internal and external fragmentation.
6. What is a semaphore?
7. Define virtual memory.
8. What is demand paging?
9. What is the difference between a process and a thread?
10. What is the purpose of a PCB?

### 5-Mark Questions
1. Explain types of operating systems with examples.
2. Explain FCFS and SJF scheduling with Gantt charts.
3. Compare monolithic and microkernel OS structures.
4. Explain semaphore-based solution for the Dining Philosophers problem.
5. Explain demand paging with its advantages.
6. Compare First Fit, Best Fit, and Worst Fit allocation strategies.
7. Explain LRU and Optimal page replacement algorithms.
8. Explain SCAN and C-SCAN disk scheduling algorithms.
9. Explain the concept of virtual memory and its benefits.
10. Explain the different types of system calls.

### 10-Mark Questions
1. Explain Round Robin scheduling algorithm. Solve a numerical with 5 processes showing Gantt chart, average waiting time, and turnaround time.
2. Solve a Banker's Algorithm problem for deadlock avoidance with 5 processes and 4 resource types.
3. Solve a memory allocation problem using First Fit, Best Fit, and Worst Fit. Compare results.
4. Solve a page replacement problem using FIFO, LRU, and Optimal. Compare number of page faults.
5. Solve a disk scheduling problem using FCFS, SSTF, SCAN, and C-SCAN. Calculate total seek time.
6. Explain the Producer-Consumer problem solution using semaphores with a complete code solution.
7. Explain all page replacement algorithms with numerical. Which gives minimum page faults and why?
8. Explain deadlock detection and recovery techniques with examples.

---

## Section E — Cross-Unit Question Prediction

| Units | Combined Topic | Likely Format |
|-------|----------------|---------------|
| II + III | Scheduling + Deadlock (Banker's) — resource allocation | 10M |
| III + IV | Memory allocation with process synchronization | 5M |
| II + IV | Process states + Virtual memory page faults | 5-10M |
| IV + V | File system design + memory-mapped files | 5M |

---

## Section F — Emergency Plan (1 Night Before)

**Absolute Bare Minimum:**
1. Banker's Algorithm — solve 1 full numerical (guaranteed 10M)
2. Page Replacement FIFO/LRU — solve 1 numerical each
3. Round Robin Scheduling — 1 Gantt chart numerical
4. Deadlock 4 conditions + prevention strategies
5. Paging vs Segmentation comparison

**Quick Memory Tricks:**
- **Disk Scheduling mnemonic:** **"FCSSLL"** = FCFS, SSTF, SCAN, C-SCAN, LOOK, C-LOOK
- **Deadlock conditions:** **"CMHN"** = Circular wait, Mutual exclusion, Hold & wait, No preemption
- **Memory allocation:** **"FBW"** = First Fit, Best Fit, Worst Fit
- **Process states:** **"NRRWT"** = New, Ready, Running, Waiting, Terminated
