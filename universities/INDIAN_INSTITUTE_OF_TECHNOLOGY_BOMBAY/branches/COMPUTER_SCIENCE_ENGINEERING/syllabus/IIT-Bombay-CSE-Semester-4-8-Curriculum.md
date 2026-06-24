# IIT Bombay B.Tech Computer Science and Engineering — Official Curriculum Reference

> Compiled from IIT Bombay CSE Department curriculum documents for reference purposes.
>
> This document provides exact course-wise syllabus, learning outcomes, and examination structure for
> B.Tech in Computer Science and Engineering.
>
> Use this as the authoritative source for exam preparation, PYQ analysis, note generation, and
> unit planning. No syllabus topic has been intentionally omitted or condensed.

---

# Semester IV — Course Structure

| Code   | Course                               | L-T-P | Credits |
| ------ | ------------------------------------ | :---: | :-----: |
| MA 205 | Complex Analysis                     | 3-1-0 |    6    |
| CS 218 | Design and Analysis of Algorithms    | 3-0-2 |    6    |
| CS 224 | Computer Networks                    | 3-0-2 |    6    |
| CS 228 | Logic in Computer Science            | 3-0-2 |    6    |
| CS 242 | Automata Theory                      | 3-0-2 |    6    |
| HS 2xx | Humanities/Social Sciences Elective  | 3-0-0 |    6    |
|        | **Total**                            |       | **36**  |

---

## MA 205: Complex Analysis

**Credits:** 6 | **L-T-P:** 3-1-0

### Course Objectives
- To understand complex numbers, analytic functions, and conformal mappings
- To study complex integration, Cauchy theory, and residue calculus
- To apply power series expansions and singularities
- To understand applications in signal processing and control theory

### Course Outcomes
| CO | Description                                                                 |
|----|-----------------------------------------------------------------------------|
| CO1| Analyze complex functions for analyticity and harmonic properties          |
| CO2| Evaluate complex integrals using Cauchy's theorem and integral formula     |
| CO3| Expand functions as Taylor and Laurent series                              |
| CO4| Compute residues and evaluate real integrals using residue theorem         |
| CO5| Apply conformal mapping to solve boundary value problems                   |

### Course Contents

**Unit I: Complex Numbers and Functions (10 Hours):** Complex plane, Polar representation, De Moivre's theorem, Roots of complex numbers. Functions: Exponential, trigonometric, hyperbolic, logarithmic, power functions. Branch cuts, Riemann surfaces

**Unit II: Analytic Functions and Cauchy-Riemann Equations (10 Hours):** Limits, continuity, differentiability. Cauchy-Riemann equations (Cartesian and polar forms). Analytic functions, harmonic functions, conjugate harmonics. Construction of analytic functions (Milne-Thomson method). Mobius (bilinear) transformations

**Unit III: Complex Integration (10 Hours):** Contour integrals, Parameterization. Cauchy's integral theorem (statement and applications). Cauchy's integral formula for derivatives. Morera's theorem, Liouville's theorem

**Unit IV: Power Series and Singularities (10 Hours):** Taylor series expansion, Laurent series. Classification of singularities (removable, pole, essential). Residues, Residue theorem. Evaluation of real integrals using residues (trigonometric integrals, improper integrals)

**Unit V: Conformal Mapping and Applications (10 Hours):** Conformal mapping definition, Preservation of angles. Elementary mappings (z², eᶻ, sin z, 1/z). Schwarz-Christoffel transformation. Applications in electrostatics, fluid flow, and heat conduction

### Learning Resources

**Textbooks:**
1. R.V. Churchill, J.W. Brown, "Complex Variables and Applications", 9th Edition, McGraw Hill
2. E. Kreyszig, "Advanced Engineering Mathematics", 10th Edition, Wiley

**Reference Books:**
1. L.V. Ahlfors, "Complex Analysis", 3rd Edition, McGraw Hill
2. J.B. Conway, "Functions of One Complex Variable", Springer

---

## CS 218: Design and Analysis of Algorithms

**Credits:** 6 | **L-T-P:** 3-0-2

**Prerequisites:** CS 102: Data Structures and Algorithms or equivalent

### Course Objectives
- To study advanced algorithmic techniques: greedy, DP, and randomized algorithms
- To analyze algorithms for graphs, networks, and combinatorial problems
- To understand NP-completeness and approximation algorithms
- To develop skills in algorithm design for real-world problems

### Course Outcomes
| CO | Description                                                              |
|----|--------------------------------------------------------------------------|
| CO1| Design efficient algorithms using greedy and dynamic programming         |
| CO2| Apply network flow algorithms for maximum flow and matching problems     |
| CO3| Analyze NP-complete problems and design approximation algorithms         |
| CO4| Implement randomized and online algorithms                              |
| CO5| Analyze algorithm complexity using amortized analysis                    |

### Course Contents

**Unit I: Advanced Greedy and Dynamic Programming (10 Hours):** Greedy: Proof techniques (exchange argument), Matroids and greedy algorithms, Huffman coding optimality. Dynamic Programming: Advanced problems (edit distance, optimal triangulation, TSP DP)

**Unit II: Network Flow and Matching (10 Hours):** Maximum flow: Ford-Fulkerson, Edmonds-Karp, Dinic's algorithm. Min-cut max-flow theorem. Bipartite matching (Hopcroft-Karp). Assignment problem (Hungarian algorithm). Push-relabel algorithm

**Unit III: Linear Programming and Reductions (10 Hours):** Linear programming formulation, Simplex algorithm (overview), Duality, Complementary slackness. Reduction to LP: Max flow, Min-cost flow, Multicommodity flow

**Unit IV: NP-Completeness and Approximation (10 Hours):** Advanced reductions, Cook-Levin theorem, NP-complete problems (SAT, Clique, Vertex cover, Hamiltonian cycle, TSP). Approximation algorithms: Vertex cover (2-approx), Set cover (log n-approx), MAX-3SAT, TSP (2-approx), Bin packing (FF, FF, BF, 1.7-approx). PTAS, FPTAS

**Unit V: Randomized and Online Algorithms (10 Hours):** Randomized algorithms: Monte Carlo vs Las Vegas. Randomized quicksort, Randomized min-cut, Hashing (universal, perfect), Randomized rounding. Online algorithms: Paging (LRU, FIFO, marking), Ski rental, Competitive analysis

### Learning Resources

**Textbooks:**
1. T.H. Cormen, C.E. Leiserson, R.L. Rivest, C. Stein, "Introduction to Algorithms", 4th Edition, MIT Press
2. J. Kleinberg, E. Tardos, "Algorithm Design", Pearson

**Reference Books:**
1. R. Motwani, P. Raghavan, "Randomized Algorithms", Cambridge University Press
2. V.V. Vazirani, "Approximation Algorithms", Springer
3. A. Borodin, R. El-Yaniv, "Online Computation and Competitive Analysis", Cambridge

---

## CS 224: Computer Networks

**Credits:** 6 | **L-T-P:** 3-0-2

**Prerequisites:** None (basic computer organization required)

### Course Objectives
- To understand layered network architectures and protocols
- To study design principles of reliable data transfer, routing, and congestion control
- To learn about the Internet architecture (TCP/IP) in depth
- To explore wireless networks and network security

### Course Outcomes
| CO | Description                                                               |
|----|---------------------------------------------------------------------------|
| CO1| Explain OSI and TCP/IP layered architecture                               |
| CO2| Analyze reliable data transfer and flow control mechanisms               |
| CO3| Design IP addressing schemes and routing protocols                       |
| CO4| Analyze TCP congestion control and transport layer protocols              |
| CO5| Apply cryptographic primitives for network security                      |

### Course Contents

**Unit I: Physical and Data Link Layers (10 Hours):** Layered architecture, OSI model, TCP/IP suite. Physical layer: Transmission media, switching (circuit, packet, virtual circuit). Data link layer: Framing, Error detection (CRC), Reliable transmission (Stop-and-Wait, GBN, SR). Medium access: ALOHA, CSMA/CD, Ethernet (802.3), Wireless (802.11). Bridges and switches

**Unit II: Network Layer and IP (10 Hours):** Network layer services (virtual circuit vs datagram). IP protocol: IPv4 header, fragmentation, addressing (classful, CIDR, subnetting). Routing algorithms: Distance vector (RIP), Link state (OSPF), Inter-domain routing (BGP). IPv6: Header format, address types, transition

**Unit III: Transport Layer (10 Hours):** UDP: Header, checksum, applications. TCP: Header, connection management (3-way handshake, FIN), flow control (sliding window), congestion control (slow start, congestion avoidance, fast retransmit, fast recovery, Reno, Tahoe, Cubic), SACK. TCP performance modeling

**Unit IV: Application Layer (10 Hours):** DNS: Name space, resolution (recursive, iterative), resource records. HTTP: Persistent/non-persistent, HTTP/2, HTTP/3. Email: SMTP, POP3, IMAP, MIME. Peer-to-peer applications. Content distribution networks (CDN). Socket programming

**Unit V: Network Security (10 Hours):** Principles: Confidentiality, integrity, availability, authentication. Cryptography: Symmetric (AES), Asymmetric (RSA). Message integrity: Hash functions (SHA-256), MACs, Digital signatures. Security protocols: TLS (handshake, record protocol), IPsec (AH, ESP, IKE), Wireless security (WPA2, WPA3). Firewalls, IDS

### Learning Resources

**Textbooks:**
1. J.F. Kurose, K.W. Ross, "Computer Networking: A Top-Down Approach", 8th Edition, Pearson
2. L.L. Peterson, B.S. Davie, "Computer Networks: A Systems Approach", 6th Edition, MK

**Reference Books:**
1. A.S. Tanenbaum, D.J. Wetherall, "Computer Networks", 5th Edition, Pearson
2. W.R. Stevens, "TCP/IP Illustrated, Vol. 1", Addison-Wesley

---

## CS 228: Logic in Computer Science

**Credits:** 6 | **L-T-P:** 3-0-2

**Prerequisites:** Basic discrete mathematics

### Course Objectives
- To understand propositional and first-order logic and their proof systems
- To study automated theorem proving and SAT solving
- To learn model checking and temporal logic
- To understand logic programming and its applications

### Course Outcomes
| CO | Description                                                              |
|----|--------------------------------------------------------------------------|
| CO1| Express computational problems in propositional and first-order logic    |
| CO2| Apply resolution and tableau methods for automated reasoning             |
| CO3| Use SAT solvers and understand their algorithms (DPLL, CDCL)            |
| CO4| Model and verify systems using temporal logic and model checking         |
| CO5| Write logic programs using Prolog                                      |

### Course Contents

**Unit I: Propositional Logic (10 Hours):** Syntax, semantics, truth tables, logical equivalence, normal forms (CNF, DNF). Satisfiability, validity, entailment. Deduction theorem. Natural deduction, sequent calculus. Resolution: Clausal form, resolution principle, completeness

**Unit II: First-Order Logic (10 Hours):** Syntax: Terms, formulas, quantifiers. Semantics: Structures, interpretations, satisfaction. Prenex normal form, Skolemization. Unification. Resolution in FOL. Herbrand's theorem

**Unit III: SAT Solving and DPLL (10 Hours):** SAT problem, CNF representation. DPLL algorithm: Unit propagation, pure literal elimination, splitting rule. Conflict-driven clause learning (CDCL): Implication graphs, conflict analysis, clause learning, backjumping. Applications: Circuit verification, planning, scheduling

**Unit IV: Temporal Logic and Model Checking (10 Hours):** Linear Temporal Logic (LTL): always, eventually, next, until operators. Computation Tree Logic (CTL): Quantified paths. Model checking: Clarke-Emerson algorithm. Symbolic model checking (BDDs). SPIN model checker

**Unit V: Logic Programming and Applications (10 Hours):** Prolog: Facts, rules, queries, resolution (SLD resolution), unification, backtracking, cut. Datalog. Applications: Expert systems, natural language parsing, constraint solving. Introduction to Description Logic and Ontologies

### Learning Resources

**Textbooks:**
1. M. Huth, M. Ryan, "Logic in Computer Science: Modelling and Reasoning about Systems", 2nd Edition, Cambridge
2. A.R. Bradley, Z. Manna, "The Calculus of Computation: Decision Procedures with Applications to Verification", Springer

**Reference Books:**
1. E.M. Clarke, T.A. Henzinger, H. Veith, "Handbook of Model Checking", Springer
2. L. Sterling, E. Shapiro, "The Art of Prolog", MIT Press
3. D. Kroening, O. Strichman, "Decision Procedures", 2nd Edition, Springer

---

## CS 242: Automata Theory

**Credits:** 6 | **L-T-P:** 3-0-2

**Prerequisites:** CS 228: Logic in Computer Science (co-requisite)

### Course Objectives
- To understand formal languages and automata as computational models
- To study regular, context-free, and context-sensitive languages
- To explore Turing machines and the limits of computation
- To understand the Chomsky hierarchy and complexity classes

### Course Outcomes
| CO | Description                                                              |
|----|--------------------------------------------------------------------------|
| CO1| Design finite automata and characterize regular languages                |
| CO2| Design pushdown automata and characterize context-free languages         |
| CO3| Design Turing machines and understand the Church-Turing thesis           |
| CO4| Analyze undecidable problems and use reductions to prove undecidability |
| CO5| Classify problems within the Chomsky hierarchy and complexity classes   |

### Course Contents

**Unit I: Regular Languages and Finite Automata (10 Hours):** DFA, NFA (with ε), equivalence, minimization (Myhill-Nerode). Regular expressions: Algebraic laws, Arden's lemma. Kleene's theorem. Pumping lemma. Closure properties. Decision algorithms for regular languages

**Unit II: Context-Free Languages (10 Hours):** CFG: Derivation trees, ambiguity, inherent ambiguity. Normal forms: CNF, GNF. Pumping lemma for CFLs. Closure properties. Pushdown automata: Deterministic (DPDA), nondeterministic, acceptance modes. CFG ↔ PDA equivalence

**Unit III: Turing Machines (10 Hours):** Standard TM definition and examples. Variants: Multi-tape, non-deterministic, multi-dimensional, enumerator. Universal Turing Machine. Recursive vs recursively enumerable languages. Church-Turing thesis. Linear Bounded Automata and CSL

**Unit IV: Undecidability (10 Hours):** Decidable vs undecidable. Halting problem (proof by diagonalization). Reducibility: Mapping reduction, Turing reduction. Post's Correspondence Problem (PCP). Rice's theorem. Gödel's incompleteness theorem overview. Oracles and the arithmetic hierarchy

**Unit V: Complexity Theory (10 Hours):** Time complexity, P vs NP, NP-completeness. Cook-Levin theorem. Polynomial-time reductions: SAT, 3-SAT, Clique, Vertex cover, Hamiltonian path, TSP. Space complexity, PSPACE, PSPACE-complete. Oracle machines, Polynomial hierarchy

### Learning Resources

**Textbooks:**
1. M. Sipser, "Introduction to the Theory of Computation", 3rd Edition, Cengage
2. J.E. Hopcroft, R. Motwani, J.D. Ullman, "Introduction to Automata Theory, Languages, and Computation", 3rd Edition, Pearson

**Reference Books:**
1. D. Kozen, "Automata and Computability", Springer
2. S. Arora, B. Barak, "Computational Complexity: A Modern Approach", Cambridge
3. C. Papadimitriou, "Computational Complexity", Addison-Wesley

---

# Semester V — Course Structure

| Code   | Course                              | L-T-P | Credits |
| ------ | ----------------------------------- | :---: | :-----: |
| CS 317 | Database and Information Systems    | 3-0-2 |    6    |
| CS 330 | Operating Systems                   | 3-0-2 |    6    |
| CS 341 | Compiler Design                     | 3-0-2 |    6    |
| CS 347 | Software Engineering                | 3-0-0 |    6    |
| CS 3xx | Department Elective I               | 3-0-0 |    6    |
| CS 3xx | Department Elective II              | 3-0-0 |    6    |
|        | **Total**                           |       | **36**  |

---

## CS 317: Database and Information Systems

**Contents:** Database architecture, ER modeling, Relational model, SQL (advanced queries, triggers, views, stored procedures), Relational algebra, Normalization (BCNF, 4NF). Transaction processing: ACID, serializability, 2PL, MVCC, recovery (logging, ARIES). Query processing/optimization. Storage structures: B+ trees, hashing. NoSQL: Key-value (Redis), Document (MongoDB), Column-family (Cassandra). MapReduce, Spark

## CS 330: Operating Systems

**Contents:** OS structures, Processes and threads, CPU scheduling (MLFQ, CFS), Synchronization (semaphores, locks, condition variables, classical problems), Deadlocks, Memory management (paging, segmentation, TLB), Virtual memory (page replacement, thrashing, working set, MMU), File systems (ext4, FFS, LFS, FAT, NTFS, VFS), I/O management (DMA, interrupt handlers, device drivers), Disk scheduling, Virtualization (hypervisors, containers), Case studies: xv6, Linux, Windows. Synchronization primitives in multicore systems

## CS 341: Compiler Design

**Contents:** Lexical analysis (DFA, regular expressions, Lex), Parsing (LL(k), LR(k), LALR(1), YACC/Bison), Semantic analysis (type checking, symbol tables), Intermediate code generation (three-address code, SSA form), Runtime environments (stack/heap, garbage collection), Code optimization (data-flow analysis, SSA optimizations, loop optimizations, interprocedural analysis), Code generation (register allocation via graph coloring, instruction selection via tree covering), Advanced topics: Just-in-time compilation, vectorization, profile-guided optimization

## CS 347: Software Engineering

**Contents:** Software processes (agile, waterfall, spiral). Requirements engineering (user stories, use cases, SRS). Architecture design (microservices, event-driven, layered). Design patterns (GoF patterns, distributed patterns). Testing (unit, integration, system, A/B testing, property-based testing). Code review, refactoring, technical debt. Development tools (Git, CI/CD, Docker, Kubernetes). Project management (Scrum, Kanban, sprint planning, velocity tracking)

---

# Semester VI — Course Structure

| Code   | Course                              | L-T-P | Credits |
| ------ | ----------------------------------- | :---: | :-----: |
| CS 348 | Computer Graphics                   | 3-0-2 |    6    |
| CS 386 | Artificial Intelligence             | 3-0-2 |    6    |
| CS 384 | Numerical Methods                   | 3-0-2 |    6    |
| CS 3xx | Department Elective III             | 3-0-0 |    6    |
| CS 3xx | Department Elective IV              | 3-0-0 |    6    |
| HS 3xx | Humanities/Social Sciences Elective | 3-0-0 |    6    |
|        | **Total**                           |       | **36**  |

---

## CS 348: Computer Graphics

**Contents:** Rasterization (line/circle algorithms, antialiasing, barycentric coordinates), Transformations (2D/3D affine, homogeneous coordinates, quaternions), Viewing and projection (perspective, orthographic, view frustum, clipping), Hidden surface removal (z-buffer, painters, BSP trees, occlusion culling), Shading (Gouraud, Phong, Blinn-Phong, physically-based), Ray tracing (whitted-style, acceleration: kd-trees, BVH), Texture mapping (bilinear, mipmapping, normal mapping, displacement), Global illumination (radiosity, path tracing, photon mapping), OpenGL/WebGL programming, GPU architecture and shader programming

## CS 386: Artificial Intelligence

**Contents:** Problem solving (BFS, DFS, A*, IDA*, RBFS), CSPs (backtracking, AC-3, SAT encoding), Adversarial search (Minimax, alpha-beta, MCTS), Knowledge representation (propositional/FOL, ontologies), Planning (STRIPS, PDDL, graphplan, hierarchical planning), Probabilistic reasoning (Bayesian networks, exact/approximate inference, HMMs), Markov decision processes (value iteration, policy iteration), Reinforcement learning (Q-learning, SARSA, deep RL), Game theory (Nash equilibrium, extensive form games), AI ethics and safety

## CS 384: Numerical Methods

**Contents:** Floating point arithmetic, Error analysis. Solving linear systems: Gaussian elimination, LU, Cholesky, iterative methods (Jacobi, Gauss-Seidel, CG). Eigenvalue computation (QR, power iteration, Arnoldi). Nonlinear equations: Newton, secant, quasi-Newton. Numerical optimization: Gradient descent, Newton's method, nonlinear least squares (Levenberg-Marquardt). Numerical ODEs: Runge-Kutta, multistep, symplectic integrators. Interpolation: Splines (cubic, B-spline), FFT. Sparse matrices, Krylov subspace methods

---

# Semesters VII-VIII — Course Structure

## Semester VII

| Code   | Course                              | L-T-P | Credits |
| ------ | ----------------------------------- | :---: | :-----: |
| CS 4xx | Department Elective V               | 3-0-0 |    6    |
| CS 4xx | Department Elective VI              | 3-0-0 |    6    |
| CS 494 | B.Tech Project I                    | 0-0-6 |   12    |
| HS 4xx | Humanities/Social Sciences Elective | 3-0-0 |    6    |
|        | **Total**                           |       | **30**  |

## Semester VIII

| Code   | Course                  | L-T-P  | Credits |
| ------ | ----------------------- | :----: | :-----: |
| CS 4xx | Department Elective VII | 3-0-0  |    6    |
| CS 494 | B.Tech Project II       | 0-0-16 |   18    |
| CS 498 | Seminar                 | 0-0-2  |    4    |
|        | **Total**               |        | **28**  |

### B.Tech Project (CS 494)

Two-semester project course (12+18 credits). Students work individually or in groups under a faculty advisor. Includes literature review, problem formulation, design, implementation, testing, validation, and thesis writing. Final presentation and defense.

## Department Elective Areas and Sample Courses

**AI/ML (CS 475+):** Machine Learning (supervised, unsupervised, deep learning, probabilistic graphical models), Reinforcement Learning, Deep Learning (CNNs, RNNs, VAEs, GANs, transformers), Natural Language Processing (word embeddings, sequence models, transformers, BERT/GPT), Computer Vision (CNNs, object detection, segmentation, 3D vision), Speech Processing

**Theory (CS 401+):** Advanced Algorithms (online, randomized, approximation, streaming), Cryptography (symmetric/asymmetric, protocols, quantum-safe), Quantum Computing (qubits, gates, algorithms, QML), Computational Geometry (convex hull, triangulation, range searching), Graph Theory (planarity, coloring, flows, matchings)

**Systems (CS 460+):** Distributed Systems (consensus, replication, fault tolerance, Paxos/Raft), Cloud Computing (virtualization, IaaS, containers, serverless), IoT Systems (sensors, networking, edge computing), Computer Architecture (cache, pipeline, multicore, memory hierarchy), Embedded Systems (RTOS, firmware, hardware-software co-design)

**Security (CS 481+):** Network Security (protocols, firewalls, VPNs, intrusion detection), Blockchain Technology (consensus, smart contracts, scalability, DeFi), Software Security (memory safety, fuzzing, binary analysis), Privacy (differential privacy, secure computation, anonymity)

**Data Science (CS 484+):** Big Data Analytics (Hadoop, Spark, streaming), Data Mining (association, clustering, anomaly detection), Information Retrieval (indexing, ranking, search engines), Bioinformatics (sequence analysis, genomics, ML for biology)

## Humanities/Social Sciences Electives

Students must take 3 HS electives covering economics, philosophy, psychology, sociology, communication, management, etc. Example: HS 101 English, HS 200 Economics, HS 300 Sociology, HS 400 Philosophy of Science

---

> **Official Source:** https://www.cse.iitb.ac.in/academics/programme | IIT Bombay CSE Department
