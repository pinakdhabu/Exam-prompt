---

**Total No. of Questions : 8**

**SEAT No. :**

**[6262]-37**

**T.E. (Computer Engineering)**

**SYSTEMS PROGRAMMING AND OPERATING SYSTEM**

**(2019 Pattern) (Semester - I) (310243)**

**Time : 2½ Hours]** | **[Max. Marks : 70**

---

**Instructions to the candidates:**

1) Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2) Neat diagrams must be drawn wherever necessary.
3) Figures to the right indicate full marks.
4) Assume suitable data if necessary.

---

### Unit III — Linkers and Loaders

**Q1)**
**a)** Differentiate between static linking and dynamic linking. Explain the advantages and disadvantages of each approach. [9]

**b)** What are the different types of loaders? Explain the design of a direct linking loader with suitable example. [9]

**OR**

**Q2)**
**a)** Explain the design of an absolute loader with a suitable example and flowchart. [9]

**b)** What is an overlay structure? Explain with a suitable example how overlays are used to run programs larger than available memory. [9]

---

### Unit IV — Operating System and Process Scheduling

**Q3)**
**a)** Draw the 5-state and 7-state process model. Explain each state and the transitions between them. [8]

**b)** Consider the following set of processes with arrival time and burst time:

| Process | Arrival Time | Burst Time |
|---------|-------------|------------|
| P1 | 0 | 8 |
| P2 | 1 | 4 |
| P3 | 2 | 9 |
| P4 | 3 | 5 |

Calculate the average waiting time and average turnaround time for:
i) FCFS
ii) SJF (preemptive)
iii) Round Robin (time quantum = 2) [9]

**OR**

**Q4)**
**a)** What is a thread? Explain the thread lifecycle. Differentiate between user-level threads and kernel-level threads. [9]

**b)** What is the purpose of a Process Control Block (PCB)? Explain the major fields stored in a PCB. Describe the context switch mechanism with a diagram. [8]

---

### Unit V — Synchronization and Concurrency Control

**Q5)**
**a)** What is a semaphore? Explain the difference between counting semaphore and binary semaphore. Solve the producer-consumer problem using semaphores. [9]

**b)** Explain the Dining Philosopher problem. Show how it can lead to deadlock and provide a solution to avoid deadlock using semaphores. [9]

**OR**

**Q6)**
**a)** What is a deadlock? State and explain the four necessary conditions for deadlock. Describe the resource allocation graph method for deadlock detection. [9]

**b)** Explain the Banker's algorithm for deadlock avoidance with a suitable example. Consider a system with 5 processes and 3 resource types. Show how the algorithm determines if a state is safe. [9]

---

### Unit VI — Memory Management

**Q7)**
**a)** What is paging? Explain the concept of logical address, physical address, page table, and TLB with a neat diagram. A system has 32-bit logical addresses and a page size of 4 KB. Calculate the number of entries in the page table. [9]

**b)** Consider the following reference string: 7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2, 1, 2, 0, 1, 7, 0, 1

Calculate the number of page faults for:
i) FIFO (3 frames)
ii) LRU (3 frames)
iii) Optimal (3 frames) [9]

**OR**

**Q8)**
**a)** Explain segmentation with a suitable example. Differentiate between paging and segmentation. How is combined paging and segmentation implemented? [9]

**b)** What is virtual memory? Explain the concepts of demand paging, page fault handling, and thrashing. How does the working set model help prevent thrashing? [9]

---

---

## Examiner Commentary
This paper covers all ESE units with a strong numerical component (scheduling, page replacement). Q3(b) requires multi-algorithm computation — a favorite SPPU question type. Q7(b) tests classic page replacement algorithms with a long reference string. Each OR pair balances theory with problem-solving.
