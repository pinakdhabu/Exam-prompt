# SPPU Computer Engineering — Official Syllabus Reference (2019 Pattern)

> Extracted from official SPPU syllabus PDFs located at `/home/pinak/Documents/SPPU Engineering PYQ Papers/Computer Engineering/1 SYLLABUS/2019 PATTERN/`
>
> This document provides exact unit-wise content, Course Outcomes (CO), and CO-PO mapping for every subject. Use this as the authoritative source when generating exam answers.

---

## TE (Third Year) — Sem V

### 310241: Database Management Systems

**Prerequisites:** Discrete Mathematics, Data Structures and Algorithms
**Examination:** Mid-Sem 30 Marks, End-Sem 70 Marks

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Analyze and design DBMS using ER model |
| CO2 | Implement database queries using database languages |
| CO3 | Normalize the database design using normal forms |
| CO4 | Apply Transaction Management concepts in real-time situations |
| CO5 | Use NoSQL databases for processing unstructured data |
| CO6 | Differentiate between Complex Data Types and analyze use of appropriate data types |

**Unit I: Introduction to DBMS and ER Model** (06 Hours) → CO1
Introduction, Purpose of Database Systems, Database-System Applications, View of Data, Database Languages, Database System Structure, Data Models. Database Design and ER Model: Entity, Attributes, Relationships, Constraints, Keys, Design Process, Entity-Relationship Model, ER Diagram, Design Issues, Extended E-R Features, converting ER and EER diagram into tables.

**Unit II: SQL and PL/SQL** (07 Hours) → CO1, CO2
SQL: Characteristics and Advantages, SQL Data Types and Literals, DDL, DML, DCL, TCL, SQL Operators. Tables: Creating, Modifying, Deleting, Updating. SQL DML Queries: SELECT Query and clauses, Index and Sequence in SQL. Views: Creating, Dropping, Updating using Indexes, Set Operations, Predicates and Joins, Set membership, Tuple Variables, Set comparison, Ordering of Tuples, Aggregate Functions, SQL Functions, Nested Queries. PL/SQL: Concept of Stored Procedures and Functions, Cursors, Triggers, Assertions, Roles and Privileges.

**Unit III: Relational Database Design** (06 Hours) → CO1, CO3
Relational Model: Basic concepts, Attributes and Domains, CODD's Rules. Relational Integrity: Domain, Referential Integrities, Enterprise Constraints. Database Design: Features of Good Relational Designs, Normalization, Atomic Domains and First Normal Form, Decomposition using Functional Dependencies, Algorithms for Decomposition, 2NF, 3NF, BCNF.

**Unit IV: Database Transaction Management** (07 Hours) → CO3, CO4
Introduction to Database Transaction, Transaction states, ACID properties, Concept of Schedule, Serial Schedule. Serializability: Conflict and View, Cascaded Aborts, Recoverable and Non-recoverable Schedules. Concurrency Control: Lock-based, Time-stamp based. Deadlock handling. Recovery methods: Shadow-Paging and Log-Based Recovery, Checkpoints. Log-Based Recovery: Deferred and Immediate Database Modifications.

**Unit V: NoSQL Databases** (07 Hours) → CO5, CO6
Introduction to Distributed Database System, Advantages, Disadvantages, CAP Theorem. Types of Data: Structured, Unstructured Data and Semi-Structured Data. NoSQL Database: Introduction, Need, Features. Types of NoSQL Databases: Key-value store, document store, graph, wide column stores, BASE Properties, Data Consistency model, ACID vs BASE, Comparative study of RDBMS and NoSQL. MongoDB: CRUD Operations, Indexing, Aggregation, MapReduce, Replication, Sharding.

**Unit VI: Advances in Databases** (07 Hours) → CO5, CO6
Emerging Databases: Active and Deductive Databases, Main Memory Databases, Semantic Databases. Complex Data Types: Semi-Structured Data, Features of Semi-Structured Data Models. Nested Data Types: JSON, XML. Object Orientation: Object-Relational Database System, Table Inheritance, Object-Relational Mapping. Spatial Data: Geographic Data, Geometric Data.

---

### 310242: Theory of Computation

**Prerequisites:** Discrete Mathematics
**Examination:** Mid-Sem 30 Marks, End-Sem 70 Marks

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand formal language, translation logic, design Finite Automata and its variants |
| CO2 | Construct regular expression to present regular language and understand pumping lemma |
| CO3 | Design Context Free Grammars and learn to simplify the grammar |
| CO4 | Construct Pushdown Automaton model for the Context Free Language |
| CO5 | Devise Turing Machine for different requirements |
| CO6 | Analyze different classes of problems and study NP completeness |

**Unit I: Formal Language Theory and Finite Automata** (07 Hours) → CO1
Finite Automata (FA): An informal picture of FA, Finite State Machine (FSM), Language accepted by FA, Definition of Regular Language. FA without output: Deterministic and Nondeterministic FA (DFA and NFA), epsilon-NFA and inter-conversion. Minimization of DFAs. FA with output: Moore and Mealy machines — Definition, models, inter-conversion.

**Unit II: Regular Expressions (RE)** (07 Hours) → CO2
Introduction, Operators of RE, Precedence of operators, Algebraic laws for RE, Language to Regular Expressions, Equivalence of two REs. Conversions: RE to NFA, DFA, DFA to RE using Arden's theorem, Pumping Lemma for Regular languages, Closure and Decision properties of Regular languages. Myhill-Nerode theorem.

**Unit III: Context Free Grammar and Context Free Language** (07 Hours) → CO3
Basic Elements of Grammar, Formal Definition of Context Free Grammar, Sentential form, Derivation and Derivation Tree/Parse Tree, Context Free Language (CFL), Ambiguous Grammar, writing grammar for language. Simplification of CFG: Eliminating epsilon-productions, unit productions, useless production, useless symbols. Normal Forms: Chomsky Normal Form, Greibach Normal Form, Pumping Lemma for CFG, Closure properties of CFL, Decision properties of CFL, Chomsky Hierarchy, CYK Algorithm.

**Unit IV: Pushdown Automata (PDA)** (07 Hours) → CO4
Introduction, Formal definition of PDA, Equivalence of Acceptance by Final State and Empty stack, Non-deterministic PDA (NPDA), PDA and Context Free Language, Equivalence of PDA and CFG, PDA vs CFLs. Deterministic CFLs.

**Unit V: Turing Machines (TM)** (07 Hours) → CO5
Turing Machine Model, Formal definition of Turing Machines, Language Acceptability by Turing Machines, Design of TM, Description of TM, Techniques for TM Construction, Computing function with Turing Machine, Variants of Turing Machines, Halting Problem of TM, Halting vs Looping, A Turing-unrecognizable language, Reducibility, Recursion Theorem. The Model of Linear Bounded Automata.

**Unit VI: Computability and Complexity Theory** (07 Hours) → CO6
Computability Theory: Decidable Problems and Undecidable Problems, Church-Turing Thesis. Reducibility: Undecidable Problems that are recursively enumerable, A Simple Undecidable problem. Complexity Classes: Time and Space Measures, The Class P, Examples of problems in P, The Class NP, Examples of problems in NP, P Problem vs NP Problem, NP-completeness and NP-hard Problems.

---

### 310243: Systems Programming and Operating System

**Prerequisites:** PPS, Data Structures and Algorithms, PPL, Microprocessor
**Examination:** Mid-Sem 30 Marks, End-Sem 70 Marks

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Analyze and synthesize basic System Software and its functionality |
| CO2 | Identify suitable data structures and design/implement various System Software |
| CO3 | Compare different loading schemes and analyze performance of linker and loader |
| CO4 | Implement and analyze the performance of process scheduling algorithms |
| CO5 | Identify the mechanism to deal with deadlock and concurrency issues |
| CO6 | Demonstrate memory organization and memory management policies |

**Unit I: Introduction** (08 Hours) → CO1, CO2, CO3
Introduction to Systems Programming, Need of Systems Programming, Software Hierarchy, Types of software: system software and application software, Machine structure. Evolution of components of Systems Programming: Text Editors, Assembler, Macros, Compiler, Interpreter, Loader, Linker, Debugger, Device Drivers, Operating System. Elements of Assembly Language Programming: Assembly Language statements, Benefits of Assembly Language, A simple Assembly scheme, Pass Structure of Assembler. Design of two pass Assembler.

**Unit II: Macro Processor and Compilers** (06 Hours) → CO1, CO2, CO3
Introduction, Features of a Macro facility: Macro instruction arguments, Conditional Macro expansion, Macro calls within Macros, Macro instructions, Defining Macro, Design of two pass Macro processor, Concept of single pass Macro processor. Introduction to Compilers: Phases of Compiler with one example, Comparison of Compiler and Interpreter.

**Unit III: Linkers and Loaders** (07 Hours) → CO1, CO2, CO3
Introduction, Loader schemes: Compile and Go, General Loader Scheme, Absolute Loaders, Subroutine Linkages, Relocating Loaders, Direct linking Loaders, Overlay structure, Design of an Absolute Loader, Design of Direct linking Loader, Self-relocating programs, Static and Dynamic linking.

**Unit IV: Operating System and Process Management** (07 Hours) → CO4
Introduction: Evolution of OS, Operating System Services, Functions of Operating System. Process Management: Process, Process States (5 and 7 state model), Process control block, Threads, Thread lifecycle, Multithreading Model, Process control system calls. Process Scheduling: Uni-processor Scheduling, Scheduling types (Preemptive, Non-preemptive, Long-term, Medium-term, Short term). Scheduling Algorithms: FCFS, SJF, RR, and Priority.

**Unit V: Synchronization and Concurrency Control** (07 Hours) → CO5
Concurrency: Principle and issues with Concurrency, Mutual Exclusion, Hardware approach, Software approach, Semaphore, Mutex and monitor, Reader writer problem, Producer Consumer problem, Dining Philosopher problem. Deadlocks: Principle of Deadlock, Deadlock prevention, Deadlock avoidance (Banker's Algorithm), Deadlock detection, Deadlock recovery.

**Unit VI: Memory Management** (07 Hours) → CO6
Memory Management concepts, Memory Management requirements. Memory Partitioning: Fixed Partitioning, Dynamic Partitioning, Buddy Systems, Fragmentation, Paging, Segmentation, Address translation. Placement Strategies: First Fit, Best Fit, Next Fit and Worst Fit. Virtual Memory: Concepts, Swapping, VM with Paging, Page Table Structure, Inverted Page Table, TLB, Page Size, VM with Segmentation, VM with Combined paging and segmentation. Page Replacement Policies: FIFO, LRU, Optimal, Thrashing.

---

### 310244: Computer Networks and Security

**Prerequisites:** Fundamentals of Data Structures
**Examination:** Mid-Sem 30 Marks, End-Sem 70 Marks

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand and classify network architectures, standards and protocols |
| CO2 | Demonstrate data link layer protocols and error detection/correction techniques |
| CO3 | Analyze IP addressing, subnetting and routing algorithms |
| CO4 | Understand transport layer protocols and congestion control mechanisms |
| CO5 | Explain application layer protocols and network security principles |
| CO6 | Design and implement network applications using sockets |

**Unit I: Introduction and Physical Layer** (07 Hours) → CO1
Introduction to Computer Network, Uses of Computer Networks, Network Hardware: LAN, MAN, WAN (PAN), Network Software: Protocol Hierarchies, Design issues for layers, Connection oriented and Connectionless services, Service Primitives. Reference Models: OSI Model, TCP/IP Model, Comparison of OSI and TCP/IP. Physical Layer: Transmission Media (Guided and Unguided).

**Unit II: Data Link Layer** (07 Hours) → CO2
Data Link Layer Design Issues, Error Detection and Correction: Single-bit error, Burst error, Block coding, Hamming distance, CRC, Checksum. Data Link Control Protocols: Stop and Wait, Sliding Window Protocol (Go Back N, Selective Repeat). Multiple Access Protocols: ALOHA, CSMA, CSMA/CD, CSMA/CA. IEEE 802.3 Ethernet, IEEE 802.11 Wireless LAN.

**Unit III: Network Layer** (07 Hours) → CO3
Network Layer Design Issues, IPv4 Addressing: Classful, Classless addressing, Subnetting, Supernetting. Routing Algorithms: Shortest Path (Dijkstra), Distance Vector Routing (RIP), Link State Routing (OSPF), Hierarchical Routing, Broadcast and Multicast Routing. Internetworking: IPv4, IPv6, ICMP, ARP, RARP, BOOTP, DHCP.

**Unit IV: Transport Layer** (07 Hours) → CO4
Transport Layer Services, UDP: Segment format, Applications. TCP: Segment format, 3-Way Handshaking, Flow Control (Sliding Window), Congestion Control (Slow Start, Congestion Avoidance, Fast Retransmit, Fast Recovery), TCP Timer Management. Socket Programming.

**Unit V: Application Layer** (07 Hours) → CO5
Application Layer Protocols: DNS, Email (SMTP, MIME, POP3, IMAP), FTP, HTTP/HTTPS, WWW, DHCP. Network Security: Cryptography (Symmetric and Asymmetric), DES, AES, RSA, Digital Signatures, Firewalls, VPN.

**Unit VI: Advanced Network Security** (07 Hours) → CO5, CO6
Network Security Concepts: Authentication, Authorization, Access Control. IP Security (IPSec), SSL/TLS, PGP, S/MIME. Intrusion Detection Systems (IDS), Intrusion Prevention Systems (IPS). Malware, Phishing, SQL Injection, XSS, CSRF. Wireless Network Security: WEP, WPA, WPA2.

---

### Elective I (Sem V) — Options

**310245A: Internet of Things and Embedded Systems**
**310245B: Human Computer Interface**
**310245C: Distributed Systems**
**310245D: Software Project Management**

---

## TE (Third Year) — Sem VI

### 310251: Data Science and Big Data Analytics

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand the data science process and explore data using statistical methods |
| CO2 | Apply machine learning algorithms for regression and classification |
| CO3 | Analyze data using clustering and dimensionality reduction techniques |
| CO4 | Understand Big Data concepts and Hadoop ecosystem |
| CO5 | Implement MapReduce programming model |
| CO6 | Use data visualization tools for effective data communication |

### 310252: Web Technology

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand web fundamentals and markup languages |
| CO2 | Design interactive web pages using JavaScript and DOM |
| CO3 | Develop server-side applications using PHP/Node.js |
| CO4 | Implement web services and RESTful APIs |
| CO5 | Design and develop full-stack web applications using MVC architecture |
| CO6 | Apply responsive design principles |

### 310253: Artificial Intelligence

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand AI problem solving through search algorithms |
| CO2 | Represent knowledge using logical and structured representations |
| CO3 | Apply reasoning mechanisms in expert systems |
| CO4 | Understand NLP concepts and applications |
| CO5 | Design and implement game playing agents |
| CO6 | Understand neural networks and machine learning fundamentals |

---

## SE (Second Year) — Sem III

### 210241: Discrete Mathematics

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Formulate problems precisely and apply formal proof techniques |
| CO2 | Apply mathematical concepts to solve problems in real-life contexts |
| CO3 | Design and analyze problems using set theory and propositional logic |
| CO4 | Specify, manipulate and apply equivalence relations and functions |
| CO5 | Calculate outcomes using permutations and combinations |
| CO6 | Model problems using tree and graph with appropriate algorithms |
| CO7 | Analyze binary operations and apply abstract algebra in coding theory |

**Units:** Set Theory & Logic → Relations & Functions → Counting Principles → Graph Theory → Trees → Algebraic Structures & Coding Theory

### 210242: Fundamentals of Data Structures

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand the concepts of data structures and algorithm analysis |
| CO2 | Implement linear data structures (arrays, linked lists, stacks, queues) |
| CO3 | Implement nonlinear data structures (trees, graphs) |
| CO4 | Apply sorting and searching algorithms |
| CO5 | Analyze time and space complexity of algorithms |
| CO6 | Apply hashing techniques for efficient data retrieval |

### 210243: Object Oriented Programming

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand OOP concepts: encapsulation, inheritance, polymorphism |
| CO2 | Design classes and objects in C++ |
| CO3 | Implement inheritance hierarchies and virtual functions |
| CO4 | Apply operator overloading and templates |
| CO5 | Implement exception handling and file I/O |
| CO6 | Design real-world applications using OOP principles |

### 210244: Computer Graphics

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand graphics primitives and display devices |
| CO2 | Implement line and circle drawing algorithms |
| CO3 | Apply 2D and 3D geometric transformations |
| CO4 | Implement clipping algorithms |
| CO5 | Understand curve representation (Bezier, B-Spline) |
| CO6 | Understand visible surface detection methods |

### 210245: Digital Electronics and Logic Design

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand number systems and Boolean algebra |
| CO2 | Minimize logic functions using K-map and Quine-McCluskey |
| CO3 | Design combinational circuits |
| CO4 | Design sequential circuits using flip-flops |
| CO5 | Implement counters and shift registers |
| CO6 | Understand state machines and programmable logic |

---

## SE (Second Year) — Sem IV

### 207003: Engineering Mathematics III

**Units:** Probability & Statistics → Numerical Methods → Z-Transforms → Fourier Transforms → Linear Differential Equations

### 210252: Data Structures and Algorithms

**Units:** Advanced Trees (AVL, B-Tree, B+Tree) → Graph Algorithms → Dynamic Programming → Greedy Algorithms → Backtracking → Complexity Analysis

### 210253: Software Engineering

**Units:** SDLC Models → Requirements Engineering → Software Design → Testing → Project Management → CASE Tools

### 210254: Microprocessor

**Units:** 8085/8086 Architecture → Instruction Set → Addressing Modes → Interrupts → Memory Interfacing → I/O Interfacing

### 210255: Principles of Programming Languages

**Units:** Language Paradigms → BNF Grammar → Parsing → Scope & Binding → Type Systems → Functional & Logic Programming

---

## BE (Fourth Year) — Sem VII

### 410241: Design and Analysis of Algorithms

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Analyze worst-case running time of algorithms using asymptotic notation |
| CO2 | Apply divide-and-conquer strategy and solve recurrences |
| CO3 | Design optimal solutions using greedy algorithms |
| CO4 | Apply dynamic programming to optimization problems |
| CO5 | Solve problems using backtracking and branch-and-bound |
| CO6 | Classify problems as P, NP, NP-complete and apply reductions |

Units: Complexity Analysis → Divide & Conquer → Greedy → Dynamic Programming → Backtracking → NP-Completeness

### 410242: Machine Learning

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand fundamental ML concepts and learning paradigms |
| CO2 | Implement regression algorithms (linear, logistic, polynomial) |
| CO3 | Implement classification algorithms (decision trees, SVM, k-NN, Naive Bayes) |
| CO4 | Implement clustering algorithms (k-means, hierarchical, DBSCAN) |
| CO5 | Apply dimensionality reduction techniques (PCA) |
| CO6 | Evaluate model performance using appropriate metrics |

### 410243: Blockchain Technology

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand blockchain fundamentals and cryptographic primitives |
| CO2 | Analyze consensus mechanisms (PoW, PoS, PBFT) |
| CO3 | Design and deploy smart contracts |
| CO4 | Develop decentralized applications on Ethereum |
| CO5 | Understand blockchain security and privacy |
| CO6 | Evaluate blockchain applications across domains |

---

## BE (Fourth Year) — Sem VIII

### 410251: Deep Learning

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand neural network fundamentals and activation functions |
| CO2 | Implement backpropagation and gradient descent optimization |
| CO3 | Design CNN architectures for image processing tasks |
| CO4 | Implement RNN/LSTM for sequence modeling |
| CO5 | Understand GANs and autoencoders |
| CO6 | Apply transfer learning and fine-tuning techniques |

### 410250: High Performance Computing

**Course Outcomes:**
| CO | Description |
|---|---|
| CO1 | Understand parallel computing architectures (SIMD, MIMD) |
| CO2 | Apply Amdahl's law for performance analysis |
| CO3 | Implement parallel programs using OpenMP |
| CO4 | Implement parallel programs using MPI |
| CO5 | Understand GPU architecture and CUDA programming |
| CO6 | Analyze cache coherence and memory consistency models |

---

## FE (First Year) — 2019 Pattern

### Sem I
- **Engineering Mathematics-I**: Matrices, Differential Calculus, Partial Derivatives, Complex Numbers, Linear Algebra
- **Engineering Physics/Engineering Chemistry**: Physics (Interference, Diffraction, Lasers, Optical Fibres, Quantum Mechanics) or Chemistry (Electrochemistry, Corrosion, Polymers, Water Treatment)
- **Systems in Mechanical Engineering**: Simple Machines, Thermodynamics, Fluid Mechanics, Manufacturing
- **Basic Electrical Engineering/Basic Electronics Engineering**: BEE (DC/AC Circuits, Transformers, Machines) or BXE (Semiconductors, BJT, FET, Op-Amp)
- **Programming and Problem Solving/Engineering Mechanics**: PPS (C Programming) or Mechanics (Statics, Dynamics, Friction)

### Sem II
- **Engineering Mathematics-II**: Laplace Transforms, Fourier Series, Multiple Integrals, Vector Calculus
- **Engineering Physics/Engineering Chemistry** (alternate to Sem I)
- **Basic Electrical Engineering/Basic Electronics Engineering** (alternate to Sem I)
- **Programming and Problem Solving/Engineering Mechanics** (alternate to Sem I)
- **Engineering Graphics**: Projections, Sections, Isometric Views

---

## Exam Pattern Summary

### 2019 Pattern ESE
- Units 3–6 only (Units 1–2 = ISE)
- 4 OR pairs → 8 questions, 70 marks total
- Unit distribution: U3=18, U4=17, U5=18, U6=17
- Time: 2½ Hours

### 2024 Pattern ESE
- All 5 units covered
- 5 OR pairs → 10 questions
- Each unit ~14 marks
- Time: 2½ Hours

### ISE (2019 Pattern only)
- Units 1–2, 30 marks
- 2 OR pairs → 4 questions

---

## CO-PO Mapping Rules

Per SPPU 2019 Rules and Regulations (R3.4):
- Every question must be framed according to Bloom's/Anderson's Taxonomy
- CO is printed on the question paper
- CO-PO mapping indicates correlation levels: 3=High, 2=Medium, 1=Low, - = No correlation

### Mapping Notation
| Value | Meaning |
|---|---|
| 3 | Substantially (High) |
| 2 | Moderately (Medium) |
| 1 | Slightly (Low) |
| - | No correlation |

---

## Reference

- Official SPPU syllabus PDFs: `/home/pinak/Documents/SPPU Engineering PYQ Papers/Computer Engineering/1 SYLLABUS/2019 PATTERN/`
- Engineering Rules and Regulations 2019 Pattern: `0 Engineering Rules and Regulations SPPU 2019 Pattern.txt`
- PYQ collection: `/home/pinak/Documents/SPPU Engineering PYQ Papers/`
