# University of Oxford Computer Science — Detailed Course Reference

> Compiled from Oxford Computer Science Department documents.
>
> This document provides detailed course descriptions, learning outcomes, and syllabus content for
> the Computer Science undergraduate degree at Oxford University.
>
> No syllabus topic has been intentionally omitted or condensed.

---

# Programme Overview

**Degree:** Computer Science (B.A./M.Eng.) | **Duration:** 3-4 Years | **Structure:** Tutorial-based

## Assessment Structure

- **University examinations (Moderations):** End of Year 1 (3 written papers)
- **Part A Final Honour School:** End of Year 2 (4 written papers)
- **Part B Final Honour School:** End of Year 3 (4-5 papers including thesis option)
- **Part C (M.Eng. only):** End of Year 4 (advanced courses + dissertation)
- **Weekly tutorials:** 1-2 per week, written assignments, oral examination
- **Practical work:** Weekly lab sessions with demonstrators
- **Laboratories:** Design Lab (Years 1-2), Group Design Practical (Year 2), Individual Project (Year 3-4)

---

# Year 1 (Part I / Prelims / Moderations)

## Core Papers

### Paper 1: Mathematics for Computer Science

**Prerequisites:** A-Level Mathematics (or equivalent)

**Course Objectives:** Provide the mathematical foundations essential for all areas of computer science: logic, discrete mathematics, probability, and continuous mathematics.

| Topic | Hours | Key Content |
|-------|-------|-------------|
| Logic | 8 | Propositional logic, natural deduction, predicate logic, quantifiers, formal proof systems |
| Sets & Relations | 6 | Set operations, relations, functions, cardinality, countability, Cantor's diagonal argument |
| Induction & Recursion | 6 | Mathematical induction, strong induction, recursive definitions, structural induction |
| Number Theory | 6 | Modular arithmetic, Euclid's algorithm, primes, Chinese remainder theorem, RSA motivation |
| Combinatorics | 6 | Counting principles, permutations, combinations, binomial theorem, inclusion-exclusion |
| Graph Theory | 6 | Graphs, trees, Eulerian/Hamiltonian paths, graph colouring, bipartite matching |
| Probability | 8 | Probability axioms, conditional probability, Bayes' theorem, random variables, expectation, variance, distributions (binomial, Poisson, normal), Markov chains |
| Calculus & Linear Algebra | 8 | Limits, continuity, differentiation, integration, vectors, matrices, eigenvalues, eigenvectors |

**Assessment:** Written examination (3 hours, closed-book)

**Textbooks:**
- K. Rosen, "Discrete Mathematics and Its Applications", 8th Edition, McGraw Hill
- S. Ross, "A First Course in Probability", 10th Edition, Pearson
- D. Lay, "Linear Algebra and Its Applications", 5th Edition, Pearson

### Paper 2: Imperative Programming

**Note:** This is CS@Oxford's co-teaching paper with the Formal Programming paper (Paper 4). It covers:

- **Fundamentals:** Variables, expressions, assignment, control flow (conditionals, loops), functions/procedures, recursion, parameter passing
- **Data Structures:** Arrays, linked lists, stacks, queues, trees, hash tables, graphs
- **Algorithms:** Searching (linear, binary), sorting (bubble, insertion, merge, quick, heap), graph algorithms (BFS, DFS, Dijkstra, Prim, Kruskal)
- **Programming in C:** Pointers, memory management (malloc/free), strings, structs, file I/O, bit manipulation, the compilation process, Makefiles
- **Representation:** Binary representations, two's complement, IEEE 754, memory layout, stack vs heap

**Laboratory:** Weekly 2-hour practical sessions with demonstrator support

**Assessment:** Written examination + practical examination

**Textbooks:**
- B.W. Kernighan, D.M. Ritchie, "The C Programming Language", 2nd Edition, Prentice Hall
- T.H. Cormen et al., "Introduction to Algorithms", 4th Edition, MIT Press

### Paper 3: Design of Digital Systems

- **Digital Logic:** Boolean algebra, logic gates, combinational circuits, Karnaugh maps, adders, multiplexers, ALU design
- **Sequential Logic:** Flip-flops (SR, D, JK, T), registers, counters, FSMs (Moore, Mealy), state diagrams
- **Computer Architecture:** CPU (datapath, control unit), instruction set design, RISC vs CISC, pipelining (hazards, forwarding, branch prediction)
- **Memory:** Cache (direct, associative, set-associative), virtual memory, TLB
- **Hardware Description Languages:** Introduction to Verilog/VHDL for circuit design and simulation

### Paper 4: Formal Programming

**Note:** Taught concurrently with Paper 2, this paper covers formal verification:

- **Functional Programming:** Introduction to Haskell (lazy evaluation, type inference, pattern matching, list comprehensions, higher-order functions, monads)
- **Specification and Verification:** Hoare logic, pre/post conditions, loop invariants, correctness proofs
- **Discrete Mathematics Applications:** Induction for program correctness, structural induction for recursive programs

---

# Year 2 (Part A — Final Honour School)

## Compulsory Papers

### Paper 5: Algorithms and Data Structures

- **Algorithm Analysis:** Big-O, recurrence relations, master theorem, amortized analysis
- **Advanced Data Structures:** AVL trees, Red-Black trees, B-trees, disjoint set union, Fibonacci heaps, splay trees, tries
- **Graph Algorithms:** Maximum flow (Dinic, Push-relabel), minimum cost flow, bipartite matching, strongly connected components (Tarjan, Kosaraju)
- **String Algorithms:** KMP, Rabin-Karp, suffix trees/arrays, edit distance, LCS
- **NP-Completeness:** SAT, 3-SAT, Clique, Vertex Cover, Hamiltonian cycle, reductions
- **Approximation Algorithms:** Vertex cover (2-approx), TSP, Knapsack (FPTAS)
- **Randomized Algorithms:** Quickselect, randomized min-cut, hash families, Bloom filters

### Paper 6: Compilers and Computer Architecture

- **Compilers:** Lexical analysis (automata theory application, Lex/flex), parsing (LL(1), LR(1), LALR(1), Yacc/bison), semantic analysis (type checking, symbol tables), intermediate code (three-address code, SSA), code optimization (data-flow analysis, loop optimization), code generation (register allocation)
- **Architecture:** Instruction pipelines (control/data hazards, out-of-order execution), memory hierarchy (cache design, prefetching, virtual memory), multi-core processors (cache coherence, MESI), SIMD, vector processors, GPU architecture

### Paper 7: Concurrent Programming and Systems

- **Concurrent Programming:** Threads, synchronization (mutex, semaphore, condition variables), deadlock, lock-free programming, message passing, CSP (Communicating Sequential Processes)
- **Operating Systems:** Processes (IPC, scheduling), memory management (paging, virtual memory), file systems (ext4, FFS, journaling), I/O (DMA, interrupts)
- **Distributed Systems:** RPC, clock synchronization (NTP, Lamport, vector clocks), consensus (Paxos, Raft, ZAB), distributed storage (GFS, Bigtable), CAP theorem, microservices

### Paper 8: Models of Computation

- **Automata Theory:** DFA, NFA, regular expressions, Kleene's theorem, Myhill-Nerode, pumping lemma, DFA minimization
- **Context-Free Languages:** CFG, PDA, Chomsky Normal Form, CYK algorithm, LL(k)/LR(k) parsing theory
- **Turing Machines:** TM variants, universal TM, Church-Turing thesis, undecidability (halting problem, Rice's theorem), reductions, PCP
- **Complexity Theory:** P, NP, PSPACE, EXPTIME, polynomial hierarchy, circuit complexity, interactive proofs, randomized complexity

## Practical Work

- **Group Design Practical (GDP):** Team project (4-5 students) building a substantial software system — full development lifecycle from specification to testing
- **Design Lab:** Weekly sessions with guided programming exercises in various languages

## Options (choose 2 from)

| Option | Key Topics |
|--------|------------|
| **Computational Biology** | Sequence alignment, phylogenetics, gene finding, RNA structure, systems biology, ML in biology |
| **Computer Graphics** | Ray tracing, rasterization, transformations, OpenGL, geometry processing, animation |
| **Databases** | Relational model, SQL, query optimization, transaction processing, NoSQL, distributed databases |
| **Functional Programming** | Advanced Haskell, monads (IO, State, Reader, Writer), applicative functors, lenses, dependent types |
| **Geometric Modelling** | Curves (Bezier, B-spline, NURBS), surfaces, solid modelling, mesh processing, visualization |
| **Information Retrieval** | TF-IDF, vector space model, probabilistic IR, PageRank, web search, evaluation (MAP, NDCG) |
| **Machine Learning** | Supervised/unsupervised, SVMs, neural networks, deep learning, Bayesian methods, reinforcement learning |
| **Quantum Computing** | Qubits, quantum gates, Shor's algorithm, Grover's algorithm, quantum error correction, Qiskit |
| **Security Engineering** | Cryptography, protocols, side channels, trusted computing, biometrics, human factors |

---

# Year 3 (Part B — Final Honour School)

## Compulsory: Individual Project

**Credits:** Equivalent to 4 papers | **Supervision:** Weekly meetings with academic supervisor

**Process:** Project proposal (Michaelmas term), design and implementation (Hilary term), testing and evaluation (Trinity term). Write-up of ~50 pages. Oral presentation and viva.

**Examples:** Compiler optimization for a new language, machine learning model for medical diagnosis, distributed systems performance analysis, cryptography implementation, game AI, web application with novel architecture

## Options (choose 4-5 from)

| Option | Key Topics |
|--------|------------|
| **Advanced Computer Architecture** | Superscalar, VLIW, branch prediction, speculative execution, memory systems, power-aware architecture |
| **Advanced Databases** | Query optimization (cost-based, join ordering), distributed transactions, data replication, stream processing |
| **Advanced Security** | Cryptography (lattice-based, post-quantum), formal verification of protocols, trusted execution (SGX, TEE), differential privacy |
| **Category Theory** | Categories, functors, natural transformations, monads, adjunctions, applications in programming language semantics |
| **Computational Complexity** | Circuit lower bounds, PCP theorem, hardness of approximation, communication complexity, parameterized complexity |
| **Computer Vision** | Image formation, feature detection (SIFT, HOG), structure from motion, object recognition, neural networks for vision |
| **Concurrency** | Process calculi (π-calculus), linearizability, software transactional memory, weak memory models, formal verification |
| **Computational Learning Theory** | PAC learning, VC dimension, bias-complexity tradeoff, boosting, online learning, Bayesian learning theory |
| **Deep Learning** | CNNs (architectures: ResNet, EfficientNet), RNNs/LSTMs, GANs, VAEs, transformers, interpretability, federated learning |
| **Distributed Algorithms** | Consensus (Paxos, Raft, Fab), Byzantine fault tolerance, distributed graph algorithms, distributed hash tables |
| **Formal Verification** | Model checking (SPIN, NuSMV), SAT/SMT solving, theorem proving (Isabelle/HOL, Coq), static analysis, abstract interpretation |
| **Functional Programming** | Advanced type systems (GADTs, type families), algebraic effects, FRP, dependently typed programming in Agda/Idris |
| **Game Theory** | Nash equilibrium, mechanism design, auctions, social choice, algorithmic game theory, price of anarchy |
| **Graph Theory** | Extremal graph theory, Ramsey theory, graph minors, spectral graph theory, random graphs, additive combinatorics |
| **Knowledge Representation & Reasoning** | Description logics, OWL, ontologies, semantic web, non-monotonic reasoning, answer set programming |
| **Lambda Calculus & Types** | Untyped/typed lambda calculus, simply typed, System F, dependent types, type inference (Hindley-Milner), intersection types |
| **Machine Learning** | Advanced topics: deep generative models, meta-learning, few-shot learning, causal inference, probabilistic programming (Stan, Pyro) |
| **Natural Language Processing** | Sequence labeling, parsing (constituency, dependency), semantic role labeling, NMT (attention, transformer), BERT/GPT, text generation |
| **Probabilistic Graphical Models** | Bayesian networks, Markov networks, inference (exact, approximate, MCMC, variational), structure learning, applications |
| **Programming Languages** | Semantics (operational, denotational, axiomatic), type systems, control flow (CPS, continuations), effect systems, gradual typing |
| **Quantum Computing** | Advanced quantum algorithms, quantum error correction, topological quantum computing, quantum information theory |
| **Randomised Algorithms** | Probabilistic method, Markov chain Monte Carlo, random walks, expander graphs, property testing, sublinear algorithms |

---

# Year 4 — M.Eng. (Part C)

## Advanced Options (choose 5-6 from)

Same advanced option list as Part B, with additional advanced research-level courses:
- **Advanced Topics in Machine Learning** — Neural architecture search, generative models, uncertainty quantification
- **Advanced Topics in Verification** — Automated theorem proving, separation logic, program synthesis
- **Advanced Topics in Cryptography** — Secure multi-party computation, fully homomorphic encryption, zero-knowledge proofs
- **Advanced Topics in Systems** — Data center networks, programmable networks (P4), RDMA, persistent memory

## M.Eng. Dissertation

Research-level project under faculty supervision, evaluated through written thesis and viva voce examination. May build upon B.Tech project work.

---

> **Official Source:** https://www.cs.ox.ac.uk/undergraduate/course-structure.html | Oxford University Computer Science Department
