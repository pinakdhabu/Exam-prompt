# Harvard University Computer Science — Detailed Course Reference

> Compiled from Harvard SEAS and CS Department course catalog for reference purposes.
>
> This document provides detailed course descriptions, learning outcomes, topics, and assessment
> structure for the Computer Science undergraduate program at Harvard.
>
> No syllabus topic has been intentionally omitted or condensed.

---

# Programme Overview

**Degree:** A.B./S.B. in Computer Science | **Duration:** 4 Years | **Structure:** Semester-based

## Harvard CS Degree Requirements

**Core (12 half-courses/credits):**
1. CS 50: Introduction to Computer Science I
2. CS 51: Introduction to Computer Science II
3. CS 61: Systems Programming and Machine Organization
4. CS 121: Introduction to Theoretical CS
5. CS 124: Data Structures and Algorithms
6. CS 181: Machine Learning
7. Five CS electives (at least three at 100-level)
8. One Theory/Systems breadth requirement
9. Math requirements, including Math 1a, Math 1b, Stat 110/CS 109
10. Thesis / Advanced Study / Research / Teaching Practicum / CS 91r

## Assessment Structure

- **Undergraduate grading:** Letter grades (A-F) with Harvard GPA on 4.0 scale
- **Course format:** 3 hours lecture + 1 hour section + weekly problem sets per course
- **Final exams:** 2-3 hours per course, typically in December (Fall) or May (Spring)
- **Midterms:** Typically 2 per semester course
- **Course load:** 4 half-courses per semester (typically 16 credits)

---

# Core Courses

## CS 50: Introduction to Computer Science I

**Credits:** 4 | **Term:** Fall and Spring | **Prerequisites:** None

### Course Description
An introduction to the intellectual enterprises of computer science and the art of programming for majors and non-majors alike. Teaches students how to think algorithmically and solve problems efficiently.

### Learning Outcomes
| Outcome | Description |
|---------|-------------|
| L01 | Solve problems using computational thinking |
| L02 | Design and implement algorithms in C and Python |
| L03 | Understand memory management, data structures, and algorithms |
| L04 | Build web applications using HTML, CSS, JavaScript, Flask |
| L05 | Work with databases (SQLite) and SQL queries |
| L06 | Understand abstraction, encapsulation, and modularity |

### Course Content

**Problem Sets (10 weeks):**
1. **Scratch:** Getting comfortable with programming concepts via visual blocks
2. **C (Mario/Luhn):** Variables, loops, conditionals, functions in C
3. **Arrays/Cryptography:** Strings, arrays, command-line arguments, cryptographic algorithms
4. **Memory:** Pointers, dynamic memory allocation, file I/O, images (filter, recover)
5. **Data Structures:** Linked lists, hash tables, tries, stacks, queues — speller implementation
6. **Python:** Python basics, libraries, file I/O, sentiment analysis
7. **SQL:** Relational databases, SQL queries, joins — movies database
8. **Web Development:** HTML, CSS, JavaScript, Flask framework — finance web app

**Final Project:** Self-designed project using any language/framework

**Textbooks:**
- Kernighan & Ritchie, "The C Programming Language", 2nd Edition
- Online course materials (lectures, shorts, walkthroughs)

## CS 51: Introduction to Computer Science II

**Credits:** 4 | **Prerequisites:** CS 50 or equivalent

### Course Description
Abstraction and design in computation. Topics include functional programming, object-oriented programming, imperative programming, and the programming language principles that connect them.

### Course Content

**Unit I: Functional Programming (OCaml)**
- Recursion, pattern matching, algebraic data types, higher-order functions (map, fold, filter), type inference, parametric polymorphism
- Modules, functors, first-class modules
- Mutable state in functional languages

**Unit II: Object-Oriented Programming (Java)**
- Classes, inheritance, interfaces, polymorphism, generics
- Design patterns: Singleton, Factory, Strategy, Observer, MVC
- Exception handling, assertions, testing (JUnit)

**Unit III: Language Semantics**
- Operational semantics (big-step, small-step)
- Type safety, progress and preservation
- Implementation of interpreters for simple languages

**Unit IV: Concurrent Programming**
- Threads, race conditions, synchronization (synchronized, locks)
- Communicating sequential processes
- Event-driven programming

**Textbooks:**
- S. Krishnamurthi, "Programming Languages: Application and Interpretation"
- H. Abelson, G.J. Sussman, "Structure and Interpretation of Computer Programs"

## CS 61: Systems Programming and Machine Organization

**Credits:** 4 | **Prerequisites:** CS 50 or equivalent

### Course Description
Introduction to computer systems from a programmer's perspective, covering machine organization, memory hierarchy, concurrency, and systems programming in C.

### Course Content

**Unit I: Bits, Data Types, and Integer Arithmetic**
- Binary representations, two's complement, IEEE 754 floating point
- Bitwise operations, shifting, arithmetic
- Data sizes, alignment, endianness

**Unit II: Machine-Level Programming (x86-64)**
- Assembly language: registers, instructions, addressing modes
- Procedure call stack, calling conventions
- Control flow: condition codes, jumps, loops
- Data structures in assembly: arrays, structs, unions
- Buffer overflow and memory safety

**Unit III: Memory Hierarchy and Caching**
- Locality (temporal, spatial), cache organization (direct, set-associative, fully associative)
- Cache performance, cache-friendly code, blocking techniques

**Unit IV: Memory Management and Virtual Memory**
- Dynamic memory allocation: malloc/free implementation, garbage collection
- Address translation: page tables, TLB, multi-level page tables

**Unit V: Linking and Loading**
- ELF format: .text, .data, .bss sections
- Symbol resolution, relocation, dynamic linking, shared libraries

**Unit VI: Concurrency and Synchronization**
- pthreads, mutexes, condition variables, semaphores
- Deadlock, reader-writer locks, thread safety

**Textbook:**
- R.E. Bryant, D.R. O'Hallaron, "Computer Systems: A Programmer's Perspective", 3rd Edition

## CS 121: Introduction to Theoretical Computer Science

**Credits:** 4 | **Prerequisites:** CS 51, Math 1a/1b

### Course Content

**Unit I: Automata and Languages**
- DFA, NFA, regular expressions, pumping lemma, non-regular languages
- CFG, pushdown automata, non-context-free languages

**Unit II: Computability**
- Turing machines, Church-Turing thesis, universal TM
- Undecidability: halting problem, Rice's theorem, reduction proofs

**Unit III: Computational Complexity**
- Time complexity: P, NP, NP-completeness
- Cook-Levin theorem, reduction techniques
- Space complexity: PSPACE, PSPACE-completeness, L and NL

**Unit IV: Advanced Topics**
- Randomized computation: RP, BPP, ZPP
- Interactive proofs (IP, AM), PCP theorem overview
- Circuit complexity, cryptography foundations

**Textbook:**
- M. Sipser, "Introduction to the Theory of Computation", 3rd Edition, Cengage

## CS 124: Data Structures and Algorithms

**Credits:** 4 | **Prerequisites:** CS 51, CS 121 (co-requisite)

### Course Content

**Unit I: Algorithm Analysis and Data Structures**
- Amortized analysis, overflow (aggregate, accounting, potential)
- Priority queues: binary heaps, binomial heaps, Fibonacci heaps
- Disjoint set union: union-by-rank, path compression

**Unit II: Graph Algorithms**
- BFS, DFS, topological sort, strongly connected components
- MST: Prim's (with binary/Fibonacci heap), Kruskal's, Borůvka's
- Shortest paths: Dijkstra (with heap), Bellman-Ford, Floyd-Warshall
- Maximum flow: Ford-Fulkerson, Dinic, Edmonds-Karp, min-cut

**Unit III: String and Pattern Matching**
- Suffix arrays, suffix trees, longest common substring
- KMP, Boyer-Moore, Rabin-Karp, Z-algorithm

**Unit IV: Geometric Algorithms**
- Convex hull: Graham scan, Andrew's monotone chain
- Line segment intersection (Bentley-Ottmann), closest pair

**Unit V: NP-Completeness and Coping with Intractability**
- Polynomial reductions, SAT, 3-SAT, vertex cover, Hamiltonian cycle
- Approximation algorithms, fixed-parameter tractability

**Textbooks:**
- T.H. Cormen et al., "Introduction to Algorithms", 4th Edition, MIT Press
- J. Kleinberg, E. Tardos, "Algorithm Design", Pearson

## CS 181: Machine Learning

**Credits:** 4 | **Prerequisites:** CS 50, Stat 110 (or equivalent), comfortable with multivariable calculus and linear algebra

### Course Content

**Unit I: Supervised Learning — Regression and Classification**
- Linear regression, least squares, basis functions, regularization (Ridge, Lasso)
- Logistic regression (binary, multinomial), cross-entropy loss
- k-NN, decision trees, random forest

**Unit II: Neural Networks and Deep Learning**
- MLP, backpropagation, activation functions, dropout, batch normalization
- CNNs: convolution, pooling, modern architectures (ResNet)
- RNNs: LSTM, GRU, sequence-to-sequence, attention

**Unit III: Unsupervised Learning**
- K-means, GMMs, EM algorithm
- PCA, autoencoders (undercomplete, denoising, VAE)
- GANs

**Unit IV: Reinforcement Learning**
- MDPs, value iteration, policy iteration
- Q-learning, DQN, policy gradients

**Unit V: Advanced Topics**
- Bayesian ML, Gaussian processes
- Transfer learning, meta-learning, causality
- Fairness, interpretability, adversarial robustness

**Textbooks:**
- C.M. Bishop, "Pattern Recognition and Machine Learning", Springer
- I. Goodfellow, Y. Bengio, A. Courville, "Deep Learning", MIT Press
- R.S. Sutton, A.G. Barto, "Reinforcement Learning", 2nd Edition, MIT Press

---

# Sample Elective Courses

## CS 146: Computer Graphics

**Contents:** Modeling, rendering, animation. Rasterization, ray tracing, global illumination, physically-based rendering. OpenGL, GLSL shaders. Geometric modeling (meshes, subdivision surfaces), animation (skinning, inverse kinematics). GPU architecture, CUDA programming.

## CS 152: Programming Languages

**Contents:** Syntax, semantics, type systems (Hindley-Milner, subtyping, intersection types). Lambda calculus (untyped, simply typed, polymorphic). Operational semantics (big-step, small-step). Program analysis, abstract interpretation. Compiler optimizations for functional languages.

## CS 153: Computer Vision

**Contents:** Image formation, convolution, edge detection. Feature detection (SIFT, SURF, ORB). Structure from motion, stereo. Object recognition (R-CNN, YOLO, Mask R-CNN). Image segmentation (U-Net, Mask R-CNN). Neural rendering, NeRF. Video analysis (optical flow, tracking).

## CS 161: Operating Systems

**Contents:** OS structure, processes, threads, scheduling, synchronization. Memory management (paging, segment), virtual memory, swapping. File systems (ext4, FFS, LFS, VFS, journaling). I/O (device drivers, DMA, interrupts). Security (access control, capabilities, MAC). Case studies: xv6, Linux.

## CS 165: Database Systems

**Contents:** Relational model, SQL, query processing, query optimization. Storage management (B+ trees, LSM trees, column stores). Transaction processing (ACID, concurrency control, recovery, ARIES). Distributed databases (partitioning, replication, consistency). NoSQL systems.

## CS 175: Software Engineering

**Contents:** Agile development (Scrum, XP). Requirements, specifications, design patterns. Testing (unit, integration, system). Code review, refactoring. DevOps (CI/CD, containers, monitoring). Project management (estimation, risk management, retrospectives).

## CS 179: Design of VLSI Circuits and Systems

**Contents:** CMOS technology, transistors, logic gates. Layout design (ASIC, FPGAs). Timing analysis, power optimization. Memory design (SRAM, DRAM, ROM). Design flows (RTL to GDSII). Verification (simulation, formal verification).

## CS 182: Artificial Intelligence

**Contents:** Intelligent agents, search (uninformed, informed, A*, CSPs). Game playing (Minimax, MCTS). Knowledge representation (FOL, ontologies). Planning (STRIPS, PDDL, hierarchical). Probabilistic reasoning (Bayesian networks, inference, HMMs). AI applications: NLP, robotics, ethics.

## CS 183: Cryptography and Security

**Contents:** Private-key encryption (perfect secrecy, AES modes, block ciphers). Public-key encryption (RSA, ElGamal, elliptic curve). Cryptographic hash functions (SHA-2, SHA-3). Digital signatures, certificates, PKI. Authentication, secure channels, TLS. Zero-knowledge proofs, secure multi-party computation.

## CS 187: Computational Linguistics / NLP

**Contents:** Language models (n-grams, neural LM). Sequence labeling (HMM, CRF, LSTM). Parsing (constituency, dependency, transition-based). Word embeddings (Word2Vec, GloVe, ELMo). Transformers (self-attention, multi-head). BERT, GPT, T5. Applications: MT, QA, summarization, dialogue.

---

# Math Requirements

**Mathematics 1a:** Single Variable Calculus (limits, derivatives, integrals, series)
**Mathematics 1b:** Integral Calculus and Differential Equations
**Statistics 110 / CS 109:** Introduction to Probability (probability axioms, random variables, distributions, expectations, limit theorems, Markov chains, Bayesian inference)

**Advanced Math Options:**
- Math 21a: Multivariable Calculus
- Math 21b: Linear Algebra
- Math 22a: Vector Calculus and Linear Algebra (combined honors)
- Math 23a/b: Honors Linear Algebra and Real Analysis

---

> **Official Source:** https://cs.harvard.edu/undergraduate/ | Harvard School of Engineering and Applied Sciences
