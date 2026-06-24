# AKTU B.Tech CSE — Official Syllabus Reference (2021 Pattern)

> Compiled from official AKTU syllabus documents for reference purposes.
>
> This document provides exact unit-wise syllabus, course outcomes, examination structure, for
> B.Tech in Computer Science and Engineering under the AKTU 2021 Pattern.
>
> No syllabus topic has been intentionally omitted or condensed.

---

# Semester IV — Course Structure

| S.No | Course Code | Course Name                              | L:T:P | Credits | CIE | SEE | Total |
| ---- | ----------- | ---------------------------------------- | :---: | :-----: | :-: | :-: | :---: |
| 1    | KCS401      | Operating Systems                        | 3:1:0 |    4    | 50  | 100 |  150  |
| 2    | KCS402      | Theory of Automata & Formal Languages    | 3:1:0 |    4    | 50  | 100 |  150  |
| 3    | KCS403      | Database Management System               | 3:1:0 |    4    | 50  | 100 |  150  |
| 4    | KCS404      | Analysis & Design of Algorithm           | 3:1:0 |    4    | 50  | 100 |  150  |
| 5    | KCS451      | Operating Systems Lab                    | 0:0:2 |    1    | 50  | 50  |  100  |
| 6    | KCS452      | DBMS Lab                                 | 0:0:2 |    1    | 50  | 50  |  100  |
| 7    | KCS453      | Algorithm Lab                            | 0:0:2 |    1    | 50  | 50  |  100  |
| 8    | KNC402      | Constitution of India, Law & Engineering | 2:0:0 |    0    | 50  |  —  |  50   |
|      | **Total**   |                                          |       | **19**  |     |     |       |

---

## KCS401: Operating Systems

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

### Course Objectives

- To understand OS structure, process management, CPU scheduling, and synchronization
- To study memory management, file systems, and I/O management
- To learn about deadlocks and their handling mechanisms
- To explore case studies of UNIX/Linux and Windows OS

### Course Outcomes

| CO  | Description                                                            |
| --- | ---------------------------------------------------------------------- |
| CO1 | Explain operating system functions, structures, and system calls       |
| CO2 | Apply CPU scheduling, process synchronization, and deadlock handling   |
| CO3 | Implement memory management techniques (paging, segmentation, virtual) |
| CO4 | Analyze file systems, disk scheduling, and I/O management              |
| CO5 | Compare Linux and Windows operating system architectures               |

### Course Contents

**Unit I: Introduction (8 Hours):** OS functions, Types (batch, multiprogramming, time-sharing,
real-time, distributed, parallel). System calls (process, file, device, IPC). OS structures:
Simple/monolithic, layered, microkernel, modular. Booting process. Virtual machines

**Unit II: Process Management and CPU Scheduling (10 Hours):** Process states, PCB, context
switching, operations. Threads: User vs kernel, multithreading models. CPU Scheduling: FCFS, SJF
(preemptive/non-preemptive), Priority, Round Robin, Multilevel Queue, Multilevel Feedback Queue.
Scheduling criteria, evaluation

**Unit III: Process Synchronization and Deadlocks (10 Hours):** Race conditions, critical section,
Peterson's solution. Hardware synchronization (TSL, Swap). Semaphores (binary, counting). Classical
problems: Bounded buffer, Readers-Writers, Dining Philosophers. Monitors. Deadlock characterization,
Prevention, Avoidance (Banker's algorithm), Detection (Wait-for graph), Recovery

**Unit IV: Memory Management (10 Hours):** Memory hierarchy, Address binding (compile/load/execution
time). Swapping, Contiguous allocation (fixed/dynamic partitions, fragmentation). Paging (page
table, TLB, hierarchical/hashed/inverted page tables). Segmentation. Virtual memory: Demand paging,
Page replacement (FIFO, LRU, Optimal, Clock), Thrashing (working set, page fault frequency).
Copy-on-write

**Unit V: File Systems and I/O (10 Hours):** File concepts, Directory structure (single-level,
two-level, tree, acyclic-graph). File allocation methods (contiguous, linked, indexed). Free space
management. Disk scheduling (FCFS, SSTF, SCAN, C-SCAN, LOOK, C-LOOK). RAID levels. I/O hardware, I/O
software, Interrupts, DMA. Case studies: Linux ext4, Windows NTFS

### Learning Resources

**Textbooks:**

1. Abraham Silberschatz, Peter B. Galvin, Greg Gagne, "Operating System Concepts", 10th Edition,
   Wiley
2. William Stallings, "Operating Systems: Internals and Design Principles", 9th Edition, Pearson

**Reference Books:**

1. Andrew S. Tanenbaum, "Modern Operating Systems", 5th Edition, Pearson
2. Maurice J. Bach, "Design of the UNIX Operating System", PHI

---

## KCS402: Theory of Automata & Formal Languages

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

### Course Contents

**Unit I: Introduction and Finite Automata (10 Hours):** Alphabet, strings, languages. Deterministic
Finite Automata (DFA): definition, transition diagrams, transition tables. Nondeterministic Finite
Automata (NFA): definition, epsilon transitions. Equivalence of NFA and DFA (subset construction).
Minimization of DFA (Myhill-Nerode theorem). Moore and Mealy machines

**Unit II: Regular Expressions and Languages (10 Hours):** Regular expressions: Operators,
precedence, algebraic laws. Arden's theorem. Conversion: RE to NFA (Thompson's construction), NFA to
RE. Pumping lemma for regular languages (applications: proving non-regularity). Closure properties
of regular languages. Decision properties (emptiness, finiteness, membership, equivalence).
Applications: Lexical analysis, grep, regex

**Unit III: Context-Free Grammars and Pushdown Automata (10 Hours):** CFG: Definition, derivation
(leftmost, rightmost), parse trees. Ambiguity and removal. Simplification: Removing useless symbols,
ε-productions, unit productions. Normal forms: Chomsky Normal Form (CNF), Greibach Normal Form
(GNF). Pushdown Automata (PDA): Definition, design, acceptance by final state and empty stack.
Equivalence: CFG ↔ PDA. Pumping lemma for CFLs

**Unit IV: Turing Machines (10 Hours):** Turing Machine: Definition, representation, design examples
(aⁿbⁿcⁿ, ww, palindrome). Variants: Multi-tape TM, NTM, Multi-head TM. Universal Turing Machine.
Recursive and recursively enumerable languages. Chomsky hierarchy. Linear Bounded Automata (LBA) and
context-sensitive languages

**Unit V: Undecidability and Complexity (10 Hours):** Decidable vs undecidable problems. Halting
problem (proof of undecidability). Reducibility: Mapping reductions, Post's Correspondence Problem
(PCP). Rice's theorem. Time complexity. Class P and NP. NP-completeness: SAT, 3-SAT, Vertex cover,
Hamiltonian path. Cook-Levin theorem (overview). Introduction to intractability

### Learning Resources

**Textbooks:**

1. John E. Hopcroft, Rajeev Motwani, Jeffrey D. Ullman, "Introduction to Automata Theory, Languages,
   and Computation", 3rd Edition, Pearson
2. Michael Sipser, "Introduction to the Theory of Computation", 3rd Edition, Cengage

**Reference Books:**

1. Peter Linz, "An Introduction to Formal Languages and Automata", 6th Edition, Jones & Bartlett
2. K.L.P. Mishra, N. Chandrasekaran, "Theory of Computer Science", 3rd Edition, PHI

---

## KCS403: Database Management System

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

### Course Contents

**Unit I: Introduction and Data Modeling (8 Hours):** DBMS vs file system, Three-level architecture,
Data independence (logical/physical). Data models: Hierarchical, network, relational, ER. ER model:
Entities, attributes, relationships (1:1, 1:M, M:N), weak entities, ISA hierarchy,
specialization/generalization, aggregation. ER-to-relational mapping

**Unit II: Relational Algebra and SQL (8 Hours):** Relational algebra operations: Select, project,
rename, union, set difference, Cartesian product, joins (theta, equi, natural, outer, semi),
division. SQL: DDL (CREATE, ALTER, DROP), DML (INSERT, UPDATE, DELETE, SELECT). JOINs (INNER, LEFT,
RIGHT, FULL). Subqueries (correlated, nested), Set operations (UNION, INTERSECT, EXCEPT). Views,
indexes, sequences. Aggregate functions, GROUP BY/HAVING. PL/SQL basics

**Unit III: Database Design and Normalization (10 Hours):** Functional dependencies: Armstrong's
axioms, closure, canonical cover. Decomposition: Lossless join, dependency preservation. Normal
forms: 1NF, 2NF, 3NF, BCNF, 4NF, 5NF. Multi-valued dependencies and join dependencies. Database
design process

**Unit IV: Transaction Processing and Concurrency Control (10 Hours):** Transaction concept, ACID
properties. Transaction states. Serializability: Conflict and view, precedence graph. Concurrency
control: Lock-based (2PL, strict 2PL), Timestamp-based (TSO, Thomas's rule), Optimistic concurrency,
MVCC. Deadlock handling (detection/prevention/avoidance). Recovery: Log-based (undo/redo),
checkpoints, ARIES

**Unit V: Storage, Indexing, and Query Processing (10 Hours):** File organization (heap, sequential,
hash, B+tree). Indexing: Primary, secondary, clustered, sparse vs dense. Query processing:
Selection, join (nested-loop, merge, hash), sorting. Query optimization (heuristics, cost-based).
NoSQL concepts: CAP theorem, key-value stores, document stores, column-family stores. Introduction
to MongoDB

### Learning Resources

**Textbooks:**

1. Silberschatz, Korth, Sudarshan, "Database System Concepts", 7th Edition, McGraw Hill
2. R. Elmasri, S. Navathe, "Fundamentals of Database Systems", 7th Edition, Pearson

---

## KCS404: Analysis & Design of Algorithm

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

### Course Contents

**Unit I: Introduction and Complexity Analysis (8 Hours):** Asymptotic notations (O, Ω, Θ, o, ω).
Recurrence: Substitution, recursion tree, Master theorem. Sorting: Heap sort, Quick sort (analysis,
randomized version), Lower bounds for sorting. Order statistics (Quick select, median of medians)

**Unit II: Divide and Conquer and Greedy (10 Hours):** Divide & conquer: Binary search, Merge sort,
Strassen's matrix multiplication. Greedy: Activity selection, Huffman coding, Fractional knapsack,
Job sequencing with deadlines, Minimum spanning tree (Prim's, Kruskal's)

**Unit III: Dynamic Programming (10 Hours):** DP principles (optimal substructure, overlapping
subproblems). 0/1 knapsack, Longest Common Subsequence (LCS), Matrix chain multiplication, Optimal
BST, Floyd-Warshall, Bellman-Ford. Assembly line scheduling, Coin change

**Unit IV: Backtracking and Branch-and-Bound (10 Hours):** Backtracking: N-Queens, Hamiltonian
cycle, Graph coloring, Sum of subsets, Sudoku. Branch-and-bound: TSP, 0/1 knapsack (FIFO, LC), Job
assignment problem

**Unit V: NP-Completeness and Approximation (10 Hours):** P, NP, NP-Complete, NP-Hard.
Polynomial-time reduction. SAT, 3-SAT, Vertex cover, Clique, Hamiltonian cycle (NP-Completeness
proofs overview). Approximation algorithms: Vertex cover (2-approx), TSP (2-approx), Bin packing
(FF, NF, BF). Introduction to randomized algorithms (Monte Carlo, Las Vegas). String matching
(Rabin-Karp, KMP)

### Learning Resources

**Textbooks:**

1. T.H. Cormen, C.E. Leiserson, R.L. Rivest, C. Stein, "Introduction to Algorithms", 4th Edition,
   MIT Press
2. E. Horowitz, S. Sahni, S. Rajasekaran, "Fundamentals of Computer Algorithms", 2nd Edition,
   University Press

---

## Laboratory Courses (Semester IV)

**KCS451: OS Lab:** Linux shell commands, System calls (fork, exec, getpid), CPU scheduling (FCFS,
SJF, Round Robin), Producer-Consumer using semaphores, Reader-Writers, Banker's algorithm, Page
replacement (FIFO, LRU), Disk scheduling (SCAN, C-SCAN)

**KCS452: DBMS Lab:** SQL DDL/DML operations, JOINs, Subqueries, Views, PL/SQL (procedures,
functions, triggers, cursors), Database connectivity (JDBC/PHP), Mini project

**KCS453: Algorithm Lab:** Sort (Merge, Quick, Heap) performance analysis, Huffman coding, 0/1
knapsack (DP), LCS, Floyd-Warshall, N-Queens, Graph coloring, String matching (Rabin-Karp/KMP)

---

# Semester V — Course Structure

| Code   | Subject                                | Credits |
| ------ | -------------------------------------- | :-----: |
| KCS501 | Computer Networks                      |    4    |
| KCS502 | Software Engineering                   |    4    |
| KCS503 | Object Oriented Programming using Java |    4    |
| KCS504 | Web Technology                         |    4    |
| KCS551 | Computer Networks Lab                  |    1    |
| KCS552 | OOP using Java Lab                     |    1    |
| KCS553 | Web Technology Lab                     |    1    |
| KNC501 | Indian Tradition, Culture & Society    |    0    |
|        | **Total**                              | **19**  |

---

## KCS501: Computer Networks

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

**Unit I (8 hrs):** Network models (OSI, TCP/IP), Physical layer (transmission media, switching:
circuit/packet/message), Network topologies. Data link layer: Framing, error detection (VRC, LRC,
CRC, checksum), error correction (Hamming code), flow control (Stop-and-Wait, Sliding Window, GBN,
SR). MAC: Aloha, CSMA, CSMA/CD, CSMA/CA, Ethernet (802.3), Wireless LAN (802.11)

**Unit II (8 hrs):** Network layer: IPv4 (classful, classless, CIDR, subnetting), IPv6 (header,
address types, transition). ARP, RARP, ICMP, IGMP. Routing: Distance vector (Bellman-Ford, RIP),
Link state (Dijkstra, OSPF), Hierarchical (BGP). NAT, DHCP

**Unit III (8 hrs):** Transport layer: UDP (header, checksum), TCP (header, connection management,
3-way handshake, termination), TCP congestion control (slow start, congestion avoidance, fast
retransmit, fast recovery). SCTP basics

**Unit IV (8 hrs):** Application layer: DNS (hierarchy, resolution, records), HTTP/HTTPS
(persistent, methods, status codes, caching), SMTP, POP3, IMAP, FTP, DHCP. Network security basics

**Unit V (8 hrs):** Cryptography: Symmetric (DES, AES), Asymmetric (RSA, Diffie-Hellman). Digital
signatures, certificates, PKI. Network security: Firewalls, IDS/IPS, VPN, TLS/SSL, Wireless security

## KCS502: Software Engineering

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

**Unit I:** Software process, Waterfall, Incremental, Prototyping, Spiral. Agile (Scrum, XP) **Unit
II:** Requirements engineering: Elicitation, SRS (IEEE 830), Use cases, Data flow diagrams **Unit
III:** Design: Cohesion, Coupling, Architectural styles, UML (class, sequence, activity, state
diagrams) **Unit IV:** Testing: White-box (basis path, cyclomatic complexity), Black-box
(equivalence, BVA), Integration, System testing, Acceptance. Selenium basics **Unit V:** Project
management: Estimation (LOC, FP, COCOMO), Scheduling (WBS, PERT/CPM), Risk management. Quality
assurance: ISO 9001, CMM, CMMI

## KCS503: OOP using Java

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

**Unit I:** OOP concepts, Java fundamentals (JVM, bytecode, data types, operators, control
statements), Classes and objects, Constructors, this, static, final, garbage collection **Unit II:**
Inheritance (types, super, method overriding), Abstract classes, Interfaces, Packages, Access
modifiers **Unit III:** Exception handling (try, catch, throw, throws, finally, custom exceptions).
Multithreading (Thread, Runnable, synchronization, inter-thread communication). String handling
(String, StringBuffer, StringBuilder) **Unit IV:** I/O streams (byte/character streams, file I/O,
serialization). Collections framework (List, Set, Map, Queue, Iterator). Generics. Lambda
expressions, Stream API **Unit V:** GUI: AWT (components, containers, layout managers, event
handling), Swing (JFrame, components). JDBC (Driver, Connection, Statement, ResultSet). Applet
lifecycle

## KCS504: Web Technology

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

**Unit I:** HTML5 (semantic elements, forms, input types), CSS3 (selectors, box model, flexbox,
grid, responsive design, animations). JavaScript: ES6 (let/const, arrow functions, promises,
async/await, classes), DOM manipulation, events, AJAX (fetch API) **Unit II:** Server-side:
Node.js/Express (routing, middleware, REST API), Java Servlets (lifecycle, session management), JSP
(expression language, JSTL, custom tags) **Unit III:** PHP: Variables, control structures,
functions, sessions, form handling, file I/O. Python Django/Flask basics (routing, templates, ORM)
**Unit IV:** Database integration: JDBC (prepared statements), MySQL/MariaDB, MongoDB. ORM:
Sequelize (Node.js), Hibernate (Java), Django ORM **Unit V:** Web services: SOAP vs REST, RESTful
APIs (GET, POST, PUT, DELETE, JSON, XML). Authentication (JWT, OAuth, session cookies). Deployment:
Apache/Nginx, HTTPS, Cloud hosting

## Laboratory Courses (Semester V)

**KCS551: CN Lab:** Socket (TCP/UDP), HTTP client/server, Packet Tracer network design, Wireshark
analysis, RIP/OSPF simulation, Network configuration **KCS552: Java Lab:** Class/object hierarchy,
Inheritance/polymorphism, Exception handling, Multithreading, Collections framework, File I/O, JDBC
connectivity, GUI with Swing **KCS553: Web Lab:** Static website (HTML/CSS), JavaScript validation,
AJAX with JSON, Node.js/Express REST API, PHP/MySQL CRUD, Full-stack mini project

---

# Semester VI — Course Structure

| Code   | Subject                     | Credits |
| ------ | --------------------------- | :-----: |
| KCS601 | Compiler Design             |    4    |
| KCS602 | Machine Learning Techniques |    4    |
| KCS603 | Full Stack Development      |    4    |
| KCS6xx | Professional Elective I     |    3    |
| KCS651 | Compiler Design Lab         |    1    |
| KCS652 | Machine Learning Lab        |    1    |
| KCS653 | Full Stack Development Lab  |    1    |
|        | **Total**                   | **18**  |

---

## KCS601: Compiler Design

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

**Unit I:** Phases of compiler, Lexical analysis (tokens, patterns, lexemes, regular expressions,
NFA/DFA, Lex tool) **Unit II:** Parsing: Top-down (LL(1), FIRST/FOLLOW, recursive descent),
Bottom-up (LR(0), SLR, CLR, LALR, YACC/Yacc) **Unit III:** Syntax-directed translation
(S-attributed, L-attributed, dependency graphs). Intermediate code: Three-address code (quadruples,
triples), AST, postfix. Type checking **Unit IV:** Symbol tables (organization, scope management).
Runtime environments (activation records, stack allocation, heap management) **Unit V:** Code
optimization (basic blocks, flow graphs, DAG, data-flow analysis, reaching definitions, live
variables). Code generation (register allocation, instruction selection). Peephole optimization

## KCS602: Machine Learning Techniques

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

**Unit I:** ML fundamentals, Types of learning. Regression: Linear, polynomial, ridge, lasso,
gradient descent. Evaluation (MSE, RMSE, MAE, R²) **Unit II:** Classification: Logistic regression,
Decision trees (ID3, C4.5, CART), k-NN, SVM (kernel trick). Evaluation (accuracy, precision, recall,
F1, ROC-AUC, confusion matrix) **Unit III:** Ensemble: Random Forest, AdaBoost, Gradient Boosting,
XGBoost. Bias-variance tradeoff. Cross-validation (k-fold, LOOCV, stratified). Regularization **Unit
IV:** Unsupervised: K-means, hierarchical, DBSCAN. Dimensionality reduction: PCA. Association rules:
Apriori. Anomaly detection **Unit V:** Neural networks: Perceptron, MLP, backpropagation, activation
functions. Deep Learning intro: CNN (convolution, pooling, LeNet, AlexNet concept), RNN/LSTM
concept. Frameworks: TensorFlow, Keras

## KCS603: Full Stack Development

**Credits:** 4 | **CIE:** 50 Marks | **SEE:** 100 Marks

**Unit I:** Frontend: React.js (components, JSX, props, state, hooks: useState, useEffect, useRef,
useContext, useReducer, custom hooks), React Router, state management (Redux concept), Testing
(Jest, React Testing Library) **Unit II:** Backend with Node.js: Express.js (routing, middleware,
error handling, file upload, authentication), RESTful APIs, WebSockets (Socket.io) **Unit III:**
Databases: SQL (PostgreSQL/MySQL: advanced queries, indexing, transactions), NoSQL (MongoDB:
aggregation pipeline, indexing, replica sets). ORM/ODM: Sequelize, Mongoose, Prisma **Unit IV:**
DevOps: Docker (images, containers, Dockerfile, docker-compose, multi-stage builds), CI/CD (GitHub
Actions, Jenkins), Cloud deployment (AWS EC2, S3, Vercel, Netlify) **Unit V:** System design and
architecture: MVC, Microservices vs Monolith, API gateway, caching (Redis), CDN, load balancing,
message queues (RabbitMQ, Kafka), Monitoring (Prometheus, Grafana, ELK)

## Professional Electives (Semester VI)

**PE I Options:**

- **Data Analytics:** Pandas/NumPy, visualization (Matplotlib/Seaborn), statistical analysis,
  scikit-learn ML, Time series analysis, Tableau
- **Distributed System:** Communication (RPC, RMI), Synchronization (clock, mutual exclusion,
  election), Consistency, Replication, MapReduce, HDFS
- **Computer Graphics:** Graphics primitives, 2D/3D transformations, viewing/projection, clipping,
  hidden surface removal, shading (Gouraud, Phong), OpenGL
- **Microprocessor:** 8086/8085 architecture, ALP, memory/I/O interfacing, 8255/8253/8259, 8051
  microcontroller

## Laboratory Courses (Semester VI)

**KCS651: Compiler Design Lab:** Lex program for token recognition, Recursive descent parser,
Shift-reduce parser (YACC), Calculator using Lex/YACC, Three-address code generation, Symbol table,
Code optimization **KCS652: ML Lab:** Data preprocessing, Linear/Logistic regression, Decision
trees/k-NN/SVM, K-means clustering, PCA, MLP/CNN with TensorFlow/Keras, Model evaluation **KCS653:
Full Stack Dev Lab:** React components & state, Express REST API, MongoDB/Mongoose integration, Full
CRUD application, Docker containerization, CI/CD pipeline, Cloud deployment

---

# Semesters VII-VIII — Course Structure

**Semester VII:** Professional Electives II, III, IV, Open Electives I, II (each 4 credits), Project
I (2 credits) = 22 credits

**Semester VIII:** Professional Elective V (4 credits), Open Elective III (4 credits), Project II (8
credits), Seminar (1 credit) = 17 credits

## Professional Elective Options (Semesters VII-VIII)

**PE II: Cloud Computing:** IaaS/PaaS/SaaS, AWS/Google Cloud, Virtualization, Containers
(Docker/Kubernetes), Cloud storage, Cloud security **PE III: Image Processing:** Image fundamentals,
Enhancement (spatial/frequency), Restoration, Segmentation (edge, thresholding, region), Compression
(JPEG), Feature extraction (SIFT, HOG) **PE IV: Cyber Security:** Threats, Cryptography (AES, RSA),
Network security (firewalls, IDS), Web security (OWASP Top 10), Digital forensics, Penetration
testing **PE V: Blockchain:** Blockchain fundamentals, Bitcoin, Ethereum (smart contracts,
Solidity), Hyperledger, Consensus (PoW, PoS, DPoS, PBFT), Applications (supply chain, healthcare,
finance)

## Open Elective Options

**OE I:** Management & Entrepreneurship Development / Operation Research / E-Commerce **OE II:**
Renewable Energy Resources / Environmental Science / Value Education **OE III:** Machine Learning /
Cyber Law and Ethics / Total Quality Management

### Project Work

**Project I (KCS751):** Literature survey, problem identification, requirement analysis, system
design. **Project II (KCS851):** Implementation, testing, deployment, report writing, presentation

---

> **Official Source:** https://aktu.ac.in/syllabus.html | Dr. A.P.J. Abdul Kalam Technical
> University, Lucknow
