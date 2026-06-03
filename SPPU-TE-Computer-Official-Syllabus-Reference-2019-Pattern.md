# SPPU Third Year Computer Engineering — Official Syllabus Reference (2019 Pattern)

> Extracted from official SPPU syllabus documents.
>
> This document provides exact unit-wise syllabus, course outcomes, examination structure,
> laboratory work, practical guidelines and curriculum information.
>
> Use this as the authoritative source for:
>
> - Exam preparation
> - PYQ analysis
> - Note generation
> - Unit planning
> - AI tutoring
> - Important topic extraction
> - Curriculum mapping
>
> No syllabus topic has been intentionally omitted or condensed.

---

# TE (Third Year) Computer Engineering — Semester V

## Semester V — Course Structure

| Course Code | Course Name | TH | PR | TUT | Mid-Sem | End-Sem | TW | PR | OR | Total | Credits |
|-------------|-------------|:--:|:--:|:---:|:-------:|:-------:|:--:|:--:|:--:|:-----:|:-------:|
| 310241 | Database Management Systems | 03 | -- | -- | 30 | 70 | -- | -- | -- | 100 | 03 |
| 310242 | Theory of Computation | 03 | -- | -- | 30 | 70 | -- | -- | -- | 100 | 03 |
| 310243 | Systems Programming and Operating System | 03 | -- | -- | 30 | 70 | -- | -- | -- | 100 | 03 |
| 310244 | Computer Networks and Security | 03 | -- | -- | 30 | 70 | -- | -- | -- | 100 | 03 |
| 310245 | Elective I | 03 | -- | -- | 30 | 70 | -- | -- | -- | 100 | 03 |
| 310246 | Database Management Systems Laboratory | -- | 04 | -- | -- | -- | 25 | 25 | -- | 50 | 02 |
| 310247 | Computer Networks and Security Laboratory | -- | 02 | -- | -- | -- | 25 | -- | 25 | 50 | 01 |
| 310248 | Laboratory Practice I | -- | 04 | -- | -- | -- | 25 | 25 | -- | 50 | 02 |
| 310249 | Seminar and Technical Communication | -- | -- | 01 | -- | -- | 50 | -- | -- | 50 | 01 |
| 310250 | Audit Course 5 | -- | -- | -- | -- | -- | -- | -- | -- | Grade | -- |
| **Total** | | **15** | **10** | **01** | **150** | **350** | **125** | **50** | **25** | **700** | **21** |

**Elective I Options:**
- 310245(A): Internet of Things and Embedded Systems
- 310245(B): Human Computer Interface
- 310245(C): Distributed Systems
- 310245(D): Software Project Management

**Audit Course 5 Options:**
- 310250(A): Cyber Security
- 310250(B): Professional Ethics and Etiquettes
- 310250(C): Learn New Skills
- 310250(D): Engineering Economics
- 310250(E): Foreign Language

**Laboratory Practice I:** Assignments from Systems Programming and Operating System and Elective I

---

## 310241: Database Management Systems

**Prerequisites Courses:** Discrete Mathematics (210241), Data Structures and Algorithms (210252)

**Companion Course:** Database Management Systems Laboratory (310246)

**Teaching Scheme:** Theory: 03 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the fundamental concepts of Database Management Systems
- To acquire the knowledge of database query languages and transaction processing
- To understand systematic database design approaches
- To acquire the skills to use a powerful, flexible, and scalable general-purpose databases to handle Big Data
- To be familiar with advances in databases and applications

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Analyze and design Database Management System using ER model |
| CO2 | Implement database queries using database languages |
| CO3 | Normalize the database design using normal forms |
| CO4 | Apply Transaction Management concepts in real-time situations |
| CO5 | Use NoSQL databases for processing unstructured data |
| CO6 | Differentiate between Complex Data Types and analyze the use of appropriate data types |

### Course Contents

#### Unit I: Introduction to Database Management Systems and ER Model (06 Hours) → CO1

- Introduction, Purpose of Database Systems, Database-System Applications
- View of Data, Database Languages, Database System Structure, Data Models
- Database Design and ER Model: Entity, Attributes, Relationships, Constraints, Keys, Design Process
- Entity-Relationship Model, ER Diagram, Design Issues, Extended E-R Features
- Converting ER and EER diagram into tables

#### Unit II: SQL and PL/SQL (07 Hours) → CO1, CO2

- SQL: Characteristics and Advantages, SQL Data Types and Literals
- DDL, DML, DCL, TCL, SQL Operators
- Tables: Creating, Modifying, Deleting, Updating
- SQL DML Queries: SELECT Query and clauses, Index and Sequence in SQL
- Views: Creating, Dropping, Updating using Indexes
- Set Operations, Predicates and Joins, Set membership, Tuple Variables
- Set comparison, Ordering of Tuples, Aggregate Functions, SQL Functions, Nested Queries
- PL/SQL: Concept of Stored Procedures and Functions, Cursors, Triggers, Assertions, Roles and Privileges

#### Unit III: Relational Database Design (06 Hours) → CO1, CO3

- Relational Model: Basic concepts, Attributes and Domains, CODD's Rules
- Relational Integrity: Domain, Referential Integrities, Enterprise Constraints
- Database Design: Features of Good Relational Designs, Normalization
- Atomic Domains and First Normal Form
- Decomposition using Functional Dependencies, Algorithms for Decomposition
- 2NF, 3NF, BCNF

#### Unit IV: Database Transaction Management (07 Hours) → CO3, CO4

- Introduction to Database Transaction, Transaction states, ACID properties
- Concept of Schedule, Serial Schedule
- Serializability: Conflict and View, Cascaded Aborts
- Recoverable and Non-recoverable Schedules
- Concurrency Control: Lock-based, Time-stamp based, Deadlock handling
- Recovery methods: Shadow-Paging and Log-Based Recovery, Checkpoints
- Log-Based Recovery: Deferred Database Modifications and Immediate Database Modifications

#### Unit V: NoSQL Databases (07 Hours) → CO5, CO6

- Introduction to Distributed Database System, Advantages, Disadvantages, CAP Theorem
- Types of Data: Structured, Unstructured Data and Semi-Structured Data
- NoSQL Database: Introduction, Need, Features
- Types of NoSQL Databases: Key-value store, document store, graph, wide column stores
- BASE Properties, Data Consistency model, ACID Vs BASE
- Comparative study of RDBMS and NoSQL
- MongoDB (with syntax and usage): CRUD Operations, Indexing, Aggregation, MapReduce, Replication, Sharding

#### Unit VI: Advances in Databases (07 Hours) → CO5, CO6

- Emerging Databases: Active and Deductive Databases, Main Memory Databases, Semantic Databases
- Complex Data Types: Semi-Structured Data, Features of Semi-Structured Data Models
- Nested Data Types: JSON, XML
- Object Orientation: Object-Relational Database System, Table Inheritance, Object-Relational Mapping
- Spatial Data: Geographic Data, Geometric Data

### Learning Resources

#### Text Books

1. Silberschatz A., Korth H., Sudarshan S., "Database System Concepts", McGraw Hill Publishers, ISBN 0-07-120413-X, 6th edition
2. Connally T, Begg C., "Database Systems", Pearson Education, ISBN 81-7808-861-4
3. Pramod J. Sadalage and Martin Fowler, "NoSQL Distilled", Addison Wesley, ISBN-10: 0321826620, ISBN-13: 978-0321826626

#### Reference Books

1. C J Date, "An Introduction to Database Systems", Addison-Wesley, ISBN: 0201144719
2. S.K.Singh, "Database Systems: Concepts, Design and Application", Pearson Education, ISBN 978-81-317-6092-5
3. Kristina Chodorow, Michael Dierolf, "MongoDB: The Definitive Guide", O'Reilly Publications, ISBN: 978-1-449-34468-9
4. Adam Fowler, "NoSQL For Dummies", John Wiley & Sons, ISBN-1118905628
5. Joy A. Kreibich, "Using SQLite", O'REILLY, ISBN: 13:978-93-5110-934-1
6. Ivan Bayross, "SQL, PL/SQL the Programming Language of Oracle", BPB Publications ISBN: 9788176569644
7. Seema Acharya, "Demystifying NoSQL", Wiley Publications, ISBN: 9788126579969

---

## 310242: Theory of Computation

**Prerequisites Courses:** Discrete Mathematics (210241)

**Teaching Scheme:** Theory: 03 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To introduce the students to basics of Theory of Computation
- To study abstract computing models to provide a formal connection between algorithmic problem solving and the theory of languages
- To understand Grammar, Pushdown Automata and Turing Machine for language processing and algorithm design
- To learn about the theory of computability and complexity for algorithm design

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Understand formal language, translation logic, essentials of translation, alphabets, language representation and apply it to design Finite Automata and its variants |
| CO2 | Construct regular expression to present regular language and understand pumping lemma for RE |
| CO3 | Design Context Free Grammars and learn to simplify the grammar |
| CO4 | Construct Pushdown Automaton model for the Context Free Language |
| CO5 | Devise Turing Machine for the different requirements outlined by theoretical computer science |
| CO6 | Analyze different classes of problems, and study concepts of NP completeness |

### Course Contents

#### Unit I: Formal Language Theory and Finite Automata (07 Hours) → CO1

- Finite Automata (FA): An informal picture of FA, Finite State Machine (FSM), Language accepted by FA, Definition of Regular Language
- FA without output: Deterministic and Nondeterministic FA (DFA and NFA)
- epsilon-NFA and inter-conversion
- Minimization of DFAs
- FA with output: Moore and Mealy machines — Definition, models, inter-conversion

**Exemplar/Case Study:** FSM for vending machine, spell checker.

#### Unit II: Regular Expressions (RE) (07 Hours) → CO2

- Introduction, Operators of RE, Precedence of operators
- Algebraic laws for RE, Language to Regular Expressions
- Equivalence of two REs
- Conversions: RE to NFA, DFA, DFA to RE using Arden's theorem
- Pumping Lemma for Regular languages
- Closure and Decision properties of Regular languages
- Myhill-Nerode theorem

**Exemplar/Case Study:** RE in text search and replace.

#### Unit III: Context Free Grammar (CFG) and Context Free Language (CFL) (07 Hours) → CO3

- Basic Elements of Grammar, Formal Definition of Context Free Grammar
- Sentential form, Derivation and Derivation Tree/Parse Tree
- Context Free Language (CFL), Ambiguous Grammar
- Writing grammar for language
- Simplification of CFG: Eliminating ε-productions, unit productions, useless production, and useless symbols
- Normal Forms: Chomsky Normal Form, Greibach Normal Form
- Pumping Lemma for CFG, Closure properties of CFL, Decision properties of CFL
- Chomsky Hierarchy, Cock-Younger-Kasami Algorithm

**Exemplar/Case Study:** Parser, CFG for Palindromes, Parenthesis Match.

#### Unit IV: Pushdown Automata (PDA) (07 Hours) → CO4

- Introduction, Formal definition of PDA
- Equivalence of Acceptance by Final State and Empty stack
- Non-deterministic PDA (NPDA)
- PDA and Context Free Language
- Equivalence of PDA and CFG
- PDA vs CFLs
- Deterministic CFLs

**Exemplar/Case Study:** Parsing and PDA: Top-Down Parsing, Bottom-up Parsing simulation showing use of PDA.

#### Unit V: Turing Machines (TM) (07 Hours) → CO5

- Turing Machine Model, Formal definition of Turing Machines
- Language Acceptability by Turing Machines
- Design of TM, Description of TM, Techniques for TM Construction
- Computing function with Turing Machine
- Variants of Turing Machines
- Halting Problem of TM, Halting vs Looping
- A Turing-unrecognizable language, Reducibility, Recursion Theorem
- The Model of Linear Bounded Automata

**Exemplar/Case Study:** Algorithms using Turing Machine.

#### Unit VI: Computability and Complexity Theory (07 Hours) → CO6

- Computability Theory: Decidable Problems and Un-decidable Problems, Church-Turing Thesis
- Reducibility: Undecidable Problems that is recursively enumerable
- A Simple Un-decidable problem
- Complexity Classes: Time and Space Measures
- The Class P, Examples of problems in P
- The Class NP, Examples of problems in NP
- P Problem Versus NP Problem
- NP-completeness and NP-hard Problems

**Exemplar/Case Study:** Traveling salesman problem, Post Correspondence Problem (PCP).

### Learning Resources

#### Text Books

1. John E. Hopcroft, Rajeev Motwani, Jeffrey D.Ullman, "Introduction to Automata Theory Languages and Computation", Addison-Wesley, ISBN 0-201-44124-1
2. Daniel Cohen, "Introduction to Computer Theory", Wiley & Sons, ISBN 97881265133454

#### Reference Books

1. Sanjeev Arora and Boaz Barak, "Computational Complexity: A Modern Approach", Cambridge University Press, ISBN: 0521424267 97805214242643
2. John Martin, "Introduction to Languages and The Theory of Computation", 2nd Edition, McGrawHill Education, ISBN-13: 978-1-25-900558-9
3. Michael Sipser, "Introduction to the Theory of Computation", Cengage Learning, ISBN-13: 97811331878137
4. Vivek Kulkarni, "Theory of Computation", Oxford University Press, ISBN 0-19-808458
5. Kavi Mahesh, "Theory of Computation: A Problem-Solving Approach", Wiley India, ISBN 1081265331106

---

## 310243: Systems Programming and Operating System

**Prerequisites Courses:** Programming and Problem Solving (110005), Data Structures and Algorithms (210252), Principles of Programming Languages (210255), Microprocessor (210254)

**Companion Course:** Laboratory Practice I (310248)

**Teaching Scheme:** Theory: 03 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To get acquainted with the basics of System Programming
- To acquire knowledge of data structures used in the design of System Software
- To be familiar with the format of object modules, the functions of linking, relocation, and loading
- To comprehend the structures and functions of Operating Systems and process management
- To deal with concurrency and deadlock in the Operating System
- To learn and understand memory management of Operating System

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Analyze and synthesize basic System Software and its functionality. |
| CO2 | Identify suitable data structures and Design & Implement various System Software |
| CO3 | Compare different loading schemes and analyze the performance of linker and loader |
| CO4 | Implement and Analyze the performance of process scheduling algorithms |
| CO5 | Identify the mechanism to deal with deadlock and concurrency issues |
| CO6 | Demonstrate memory organization and memory management policies |

### Course Contents

#### Unit I: Introduction (08 Hours) → CO1, CO2, CO3

- Introduction to Systems Programming, Need of Systems Programming
- Software Hierarchy, Types of software: system software and application software
- Machine structure
- Evolution of components of Systems Programming: Text Editors, Assembler, Macros, Compiler, Interpreter, Loader, Linker, Debugger, Device Drivers, Operating System
- Elements of Assembly Language Programming: Assembly Language statements, Benefits of Assembly Language, A simple Assembly scheme, Pass Structure of Assembler
- Design of two pass Assembler: Processing of declaration statements, Assembler Directives and imperative statements, Advanced Assembler Directives, Intermediate code forms, Pass I and Pass II of two pass Assembler

**Exemplar/Case Study:** Debugging tools like GDB.

#### Unit II: Macro Processor and Compilers (06 Hours) → CO1, CO2, CO3

- Introduction, Features of a Macro facility: Macro instruction arguments, Conditional Macro expansion, Macro calls within Macros, Macro instructions, Defining Macro
- Design of two pass Macro processor, Concept of single pass Macro processor
- Introduction to Compilers: Phases of Compiler with one example
- Comparison of Compiler and Interpreter

**Exemplar/Case Study:** GNU M4 Macro Processor.

#### Unit III: Linkers and Loaders (07 Hours) → CO1, CO2, CO3

- Introduction, Loader schemes: Compile and Go, General Loader Scheme, Absolute Loaders, Subroutine Linkages
- Relocating Loaders, Direct linking Loaders, Overlay structure
- Design of an Absolute Loader, Design of Direct linking Loader
- Self-relocating programs
- Static and Dynamic linking

**Exemplar/Case Study:** Class loading in Java.

#### Unit IV: Operating System (OS) (07 Hours) → CO4

- Introduction: Evolution of OS, Operating System Services, Functions of Operating System
- Process Management: Process, Process States: 5 and 7 state model, Process control block
- Threads, Thread lifecycle, Multithreading Model, Process control system calls
- Process Scheduling: Uni-processor Scheduling, Scheduling: Preemptive, Non-preemptive, Long-term, Medium-term, Short term scheduling
- Scheduling Algorithms: FCFS, SJF, RR, and Priority

**Exemplar/Case Study:** Process management in Linux/Windows/Android; Readers-Writers problem.

#### Unit V: Synchronization and Concurrency Control (07 Hours) → CO5

- Concurrency: Principle and issues with Concurrency
- Mutual Exclusion: Hardware approach, Software approach
- Semaphore, Mutex and monitor
- Reader writer problem, Producer Consumer problem, Dining Philosopher problem
- Deadlocks: Principle of Deadlock, Deadlock prevention, Deadlock avoidance, Deadlock detection, Deadlock recovery

**Exemplar/Case Study:** Concurrency Mechanism in Unix/Linux/Windows.

#### Unit VI: Memory Management (07 Hours) → CO6

- Introduction: Memory Management concepts, Memory Management requirements
- Memory Partitioning: Fixed Partitioning, Dynamic Partitioning, Buddy Systems, Fragmentation
- Paging, Segmentation, Address translation
- Placement Strategies: First Fit, Best Fit, Next Fit and Worst Fit
- Virtual Memory (VM): Concepts, Swapping, VM with Paging, Page Table Structure, Inverted Page Table, Translation Look aside Buffer, Page Size
- VM with Segmentation, VM with Combined paging and segmentation
- Page Replacement Policies: First In First Out (FIFO), Last Recently Used (LRU), Optimal, Thrashing

**Exemplar/Case Study:** Memory management in Linux/Windows/Android.

### Learning Resources

#### Text Books

1. John Donovan, "Systems Programming", McGraw Hill, ISBN 978-0-07-460482-3
2. Dhamdhere D., "Systems Programming and Operating Systems", McGraw Hill, ISBN 0 07-463579-4
3. Silberschatz, Galvin, Gagne, "Operating System Principles", 9th Edition, Wiley, ISBN 978-1-118-06333-0

#### Reference Books

1. Leland Beck, "System Software: An Introduction to Systems Programming", Pearson
2. John R. Levine, Tony Mason, Doug Brown, "Lex & Yacc", 1st Edition, O'REILLY, ISBN 81-7366-062-X
3. Alfred V. Aho, Ravi Sethi, Jeffrey D. Ullman, "Compilers Principles, Techniques, and Tools", Addison Wesley, ISBN 981-235-885-4

---

## 310244: Computer Networks and Security

**Prerequisites Courses:** Discrete Mathematics (210241)

**Companion Course:** Computer Networks and Security Laboratory (310247)

**Teaching Scheme:** Theory: 03 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the fundamental concepts of networking standards, protocols and technologies
- To learn different techniques for framing, error control, flow control and routing
- To learn different layer protocols in the protocol stacks
- To understand modern network architectures with respect to design and performance
- To learn the fundamental concepts of Network Security

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Summarize fundamental concepts of Computer Networks, architectures, protocols and technologies |
| CO2 | Illustrate the working and functions of data link layer |
| CO3 | Analyze the working of different routing protocols and mechanisms |
| CO4 | Implement client-server applications using sockets |
| CO5 | Illustrate role of application layer with its protocols, client-server architectures |
| CO6 | Comprehend the basics of Network Security |

### Course Contents

#### Unit I: Introduction to Computer Networks (06 Hours) → CO1

- Definition, Types of Networks: LAN, MAN, WAN, Wireless networks
- Networks Software, Protocol, Design issues for the Network layers
- Network Models: The OSI Reference Model, TCP/IP Model
- Network Topologies, Types of Transmission Medium
- Network Architectures: Client-Server, Peer To Peer, Hybrid
- Network Devices: Bridge, Switch, Router, Gateway, Access Point
- Line Coding Schemes: Manchester and Differential Manchester Encodings
- Frequency Hopping (FHSS) and Direct Sequence Spread Spectrum (DSSS)

**Exemplar/Case Study:** Study of Campus wide networking.

#### Unit II: Data Link Layer (08 Hours) → CO2

- Introduction, functions
- Design Issues: Services to Network Layer, Framing
- ARQ strategies: Error detection and correction, Parity Bits, Hamming Codes (11/12-bits) and CRC
- Flow Control Protocols: Unrestricted Simplex, Stop and Wait, Sliding Window Protocol
- WAN Connectivity: PPP and HDLC
- MAC Sub layer: Multiple Access Protocols: Pure and Slotted ALOHA, CSMA, WDMA, CSMA/CD, CSMA/CA
- Binary Exponential Back-off algorithm
- Introduction to Ethernet IEEE 802.3, IEEE 802.11 a/b/g/n, IEEE 802.15 and IEEE 802.16 Standards

**Exemplar/Case Study:** Demonstration of DLL protocols on Simulator.

#### Unit III: Network Layer (08 Hours) → CO3

- Introduction: Functions of Network layer
- Switching Techniques: Circuit switching, Message Switching, Packet Switching
- IP Protocol: Classes of IP (Network addressing), IPv4, IPv6
- Network Address Translation, Sub-netting, CIDR
- Network layer Protocols: ARP, RARP, ICMP, IGMP
- Network Routing and Algorithms: Static Routing, Dynamic Routing, Distance Vector Routing, Link State Routing, Path Vector
- Routing Protocols: RIP, OSPF, BGP, MPLS
- Routing in MANET: AODV, DSR, Mobile IP

**Exemplar/Case Study:** Demonstration of Routing Protocols on simulator.

#### Unit IV: Transport Layer (07 Hours) → CO4

- Process to Process Delivery, Services, Socket Programming
- Elements of Transport Layer Protocols: Addressing, Connection establishment, Connection release, Flow control and buffering, Multiplexing, Congestion Control
- Transport Layer Protocols: TCP and UDP, SCTP, RTP
- Congestion control and Quality of Service (QoS)
- Differentiated services
- TCP and UDP for Wireless networks

**Exemplar/Case Study:** Demonstration of Transport layer protocols on Simulator.

#### Unit V: Application Layer (06 Hours) → CO5

- Introduction, Web and HTTP, Web Caching
- DNS, Email: SMTP, MIME, POP3, Webmail
- FTP, TELNET, DHCP, SNMP

**Exemplar/Case Study:** Study of Application Layer protocols using network protocol analyzer (e.g. Wireshark).

#### Unit VI: Security (07 Hours) → CO6

- Introduction, Security services, Need of Security
- Key Principles of Security, Threats and Vulnerabilities
- Types of Attacks
- ITU-T X.800 Security Architecture for OSI
- Security Policy and mechanisms, Operational Model of Network Security
- Symmetric and Asymmetric Key Cryptography
- Security in Network, Transport and Application: Introduction of IPSec, SSL, HTTPS, S/MIME
- Overview of IDS and Firewalls

**Exemplar/Case Study:** Study of security protocols in Network, Transport and Application Layer using Wireshark.

### Learning Resources

#### Text Books

1. Fourauzan B., "Data Communications and Networking", 5th Edition, Tata McGraw Hill Publications, ISBN: 0-07-058408-7
2. Andrew S. Tanenbaum, "Computer Networks", 5th Edition, Pearson India, 2012.

#### Reference Books

1. Kurose, Ross, "Computer Networking a Top Down Approach Featuring the Internet", Pearson, ISBN-10: 0132856204
2. L. Peterson and B. Davie, "Computer Networks: A Systems Approach", 5th Edition, Morgan-Kaufmann, 2012.
3. Douglas E. Comer & M.S Narayanan, "Computer Network & Internet", Pearson Education
4. William Stallings, "Cryptography and Network Security: Principles and Practice", 4th Edition
5. Pachghare V. K., "Cryptography and Information Security", 3rd Edition, PHI

---

## 310245(A): Elective I — Internet of Things and Embedded Systems

**Prerequisites Courses:** Digital Electronics and Logic Design (210245)

**Companion Course:** Laboratory Practice I (310248)

**Teaching Scheme:** Theory: 03 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand fundamentals of Internet of Things (IoT) and Embedded Systems
- To learn advances in Embedded Systems and IoT
- To learn methodologies for IoT application development
- To learn the IoT protocols, cloud platforms and security issues in IoT
- To learn real world application scenarios of IoT with case studies

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Understand the fundamentals and need of Embedded Systems for the Internet of Things |
| CO2 | Apply IoT enabling technologies for developing IoT systems |
| CO3 | Apply design methodology for designing and implementing IoT applications |
| CO4 | Analyze IoT protocols for making IoT devices communication |
| CO5 | Design cloud based IoT systems |
| CO6 | Design and Develop secured IoT applications |

### Course Contents

#### Unit I: Introduction to Embedded Systems (07 Hours) → CO1, CO2

- Definition, Characteristics of Embedded System, Real time systems, Real time tasks
- Processor basics: General Processors vs Embedded Processors, Microcontrollers, Microcontroller Properties, Components of Microcontrollers
- System-On-Chip and its examples
- Components of Embedded Systems, Introduction to embedded processor

#### Unit II: Internet of Things: Concepts (07 Hours) → CO1, CO2

- Introduction to IoT: Definition, Characteristics, Vision, Trends
- IoT Devices, IoT Devices Vs Computers
- Societal Benefits of IoT, Technical Building Blocks
- Physical Design of IoT: Things in IoT, Interoperability of IoT Devices, Sensors and Actuators
- Logical Design of IoT: IoT functional blocks, IoT enabling technologies, IoT levels and deployment templates

#### Unit III: IoT: Design Methodology (07 Hours) → CO3, CO4

- IoT Design Methodology: Steps
- Basics of IoT Networking, Networking Components
- Internet Structure, Connectivity Technologies
- IoT Communication Models and IoT Communication APIs
- Sensor Networks
- Four pillars of IoT: M2M, SCADA, WSN, RFID

#### Unit IV: IoT Protocols (07 Hours) → CO4, CO5

- Protocol Standardization for IoT
- M2M and WSN Protocols
- RFID Protocol, Modbus Protocol, Zigbee Architecture
- IP based Protocols: MQTT (Secure), 6LoWPAN, LoRa

#### Unit V: Cloud Platforms for IoT (07 Hours) → CO4, CO5

- Software Defined Networking
- Introduction to Cloud Storage Models, Communication API
- WAMP: Auto Bahn for IoT, Xively Cloud for IoT
- Python Web Application Framework: Django Architecture
- Amazon Web Services for IoT
- RESTful Web Service, GRPC, SOAP

#### Unit VI: Security in IoT (07 Hours) → CO2, CO6

- Introduction, Vulnerabilities of IoT
- Security Requirements, Challenges for Secure IoT
- Threat Modeling
- Key elements of IoT Security: Identity establishment, Access control, Data and message security
- Security model for IoT
- Challenges in designing IoT applications
- Lightweight cryptography

### Learning Resources

#### Text Books

1. Arshdeep Bahga, Vijay Madisetti, "Internet of Things – A hands-on Approach", Universities Press, ISBN: 0: 0996025510, 13: 978-0996025515
2. Olivier Hersent, David Boswarthick, Omar Elloumi, "The Internet of Things: Key Applications and Protocols", 2nd Edition, Wiley Publication

---

## 310245(B): Elective I — Human Computer Interface

**Prerequisites Courses:** Computer Graphics (210244), Software Engineering (210253)

**Companion Course:** Laboratory Practice I (310248)

**Teaching Scheme:** Theory: 03 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the importance of HCI design process in software development
- To learn fundamental aspects of designing and implementing user interfaces
- To study HCI with technical, cognitive and functional perspectives
- To acquire knowledge about variety of effective human-computer-interactions
- To co-evaluate the technology with respect to adapting changing user requirements in interacting with computer

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Design effective Human-Computer-Interfaces for all kinds of users |
| CO2 | Apply and analyze the user-interface with respect to golden rules of interface |
| CO3 | Analyze and evaluate the effectiveness of a user-interface design |
| CO4 | Implement the interactive designs for feasible data search and retrieval |
| CO5 | Analyze the scope of HCI in various paradigms like ubiquitous computing, virtual reality, multi-media, World wide web related environments |
| CO6 | Analyze and identify user models, user support, and stakeholder requirements of HCI systems |

### Course Contents

#### Unit I: Introduction and Foundation of HCI (07 Hours) → CO1, CO6

- Foundation: Human Memory, Thinking: Reasoning and Problem Solving, Emotion, Individual Difference
- Psychology and design of Interactive systems
- The Computer: Text Entry Device, Positioning, Pointing, Display devices
- Devices for virtual reality and 3D Interaction
- The Interactions: Models of Interaction, Frameworks and HCI
- Ergonomics, Interaction styles, Elements of WIMP Interface
- Importance of User Interface, Measurable Human Factors
- Good and Poor Design, Brief History of Screen Design

**Exemplar/Case Study:** Paper prototype — Design elements of GUI.

#### Unit II: Human Perspective in Interaction Design Process (07 Hours) → CO1, CO2

- Know your user/client: Characteristics, Business systems
- Understanding how people interact with computers
- Important human characteristics in Design, Human Interaction speeds
- Miller's Law
- Design Guidelines: Navigating the interface, Organizing the display, Getting user's attention, Data entry
- Design Principles: Skill level, Task identification, Interaction style, Natural Language
- Eight Golden rules of Interface design
- Theories: Design-by-level, Stages of action, Consistency, Contextual/Dynamic theories
- Error prevention, Human control

**Exemplar/Case Study:** Registration form design.

#### Unit III: Interaction Styles and HCI in Software Process (07 Hours) → CO1, CO3, CO5

- Design, Process of Interaction Design
- Interaction styles: Command line, Menu Selection, Form fill-in, Direct Manipulation
- Graphical User Interface: Popularity, Characteristics, Advantages/Disadvantages
- Web User Interface: Characteristics, Intranet vs. Internet, Web page vs. Application design
- Software life cycle, Usability Engineering
- Iterative design and prototyping, Design Rationale

**Exemplar/Case Study:** Comparison — GUI and Web design.

#### Unit IV: Usability Evaluation and Universal Design (07 Hours) → CO1, CO3

- Designing for People: Seven commandments
- Usability Assessment: Problems, Measures, Formative/Summative evaluation
- Specifications, Analytic methods, Model-based analysis
- GOMS model
- Empirical methods: Lab testing, Field studies
- Heuristic Evaluation, Cognitive Walkthrough
- DECIDE framework (Paradigms, Evaluation framework)
- Universal design principles
- Multi-modal interaction, Diversity

**Exemplar/Case Study:** GOMS model — e-shopping cart.

#### Unit V: HCI Paradigms (07 Hours) → CO1, CO3, CO4

- Paradigms for Interaction: Time sharing, Video display units, Programming toolkits, Personal computing, Metaphor, Hypertext, Cooperative work, Agent based
- Ubiquitous Computing: Sensor-based and context-aware interaction
- Data Integrity/Immunity, Missing data, Auditing vs. Editing, Retrieval
- Natural Language: Five stage search, Dynamic queries
- Social aspects of interaction
- Pattern Recognition in HCI: Machine Learning role, Process

**Exemplar/Case Study:** Interface Design — Pattern gesture recognition.

#### Unit VI: HCI for Mobile and Handheld Devices (07 Hours) → CO3, CO5, CO6

- Mobile apps: Anatomy, Form factors
- Navigation/Toolbars, Drawers, Tap-to-reveal
- Multi-touch gestures, Accessibility
- Other devices: Kiosks, 10-foot interfaces, Automotive interfaces, Audible interfaces

**Exemplar/Case Study:** GUI in Python, Enlist and evaluate handled devices.

### Learning Resources

#### Text Books

1. Alan J, Dix et al., "Human Computer Interaction", Pearson, 3rd Edition, 2004.
2. Jenny Preece et al., "Interaction Design — beyond human-computer interaction", WILEY-INDIA.
3. Ben Shneiderman et al., "Designing the User Interface", 6th Edition, Pearson.

#### Reference Books

1. Alan Cooper et al., "About Face", 4th Edition, WILEY.
2. Mary Beth Rosson and John M. Carroll, "Usability Engineering", Morgan Kaufmann.
3. Wibert O. Galitz, "The Essential Guide to user Interface Design", WILEY India.
4. Jenifer Tidwell, "Designing Interfaces", O'REILLY.
5. Julie A. Jacko (Ed), "The Human-Computer Interaction Handbook", 3rd Edition, CRC Press.

---

## 310245(C): Elective I — Distributed Systems

**Prerequisites Courses:** Computer Networks and Security (310244)

**Companion Course:** Laboratory Practice I (310248)

**Teaching Scheme:** Theory: 03 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To learn the fundamentals of Distributed Systems
- To learn types of communication and synchronization in Distributed Systems
- To acquaint with the Distributed File Systems
- To understand consistency and replication in Distributed Systems
- To understand the fault tolerance based Distributed Systems

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Analyze Distributed Systems types and architectural styles |
| CO2 | Implement communication mechanism in Distributed Systems |
| CO3 | Implement the synchronization algorithms in Distributed System applications |
| CO4 | Develop the components of Distributed File System |
| CO5 | Apply replication techniques and consistency model in Distributed Systems |
| CO6 | Build fault tolerant Distributed Systems |

### Course Contents

#### Unit I: Introduction (07 Hours) → CO1

- Defining Distributed Systems, Characteristics
- Middleware and Distributed Systems
- Design goals: Supporting resource sharing, Making distribution transparent, Open, Scalable, Pitfalls
- Types: High Performance Distributed Computing, Distributed Information Systems, Pervasive Systems
- Architectural styles: Layered architectures, Object based architectures, Publish Subscribe architectures
- Middleware organization: Wrappers, Interceptors, Modifiable middleware
- System architecture: Centralized, Decentralized, Hybrid
- Example architectures: Network File System, Web

**Exemplar/Case Study:** Case Study of Middleware System that includes Design, Architecture and Application.

#### Unit II: Communication (07 Hours) → CO2

- Layered Protocols, Types of Communication
- Remote Procedural Call (RPC): Basic RPC Operation, Parameter Passing, RPC-based application support, Variations on RPC, Example: DCE RPC
- Remote Method Invocation (RMI)
- Message Oriented Communication: Simple Transient Messaging with Sockets, Advanced Transient Messaging, Message Oriented Persistent Communication
- Multicast Communication: Application Level Tree-Based Multicasting, Flooding-Based Multicasting, Gossip-Based Data Dissemination

**Exemplar/Case Study:** Apache Kafka Distributed Event Streaming Platform, gRPC Open Source RPC Framework.

#### Unit III: Synchronization (07 Hours) → CO3

- Clock Synchronization: Physical Clocks, Clock Synchronization Algorithms
- Logical Clocks: Lamport's Logical clocks, Vector Clocks
- Mutual Exclusion: Overview, Centralized Algorithm, Distributed Algorithm, Token-Ring Algorithm, Decentralized Algorithm
- Election Algorithms: Bully Algorithm, Ring Algorithm
- Location Systems: GPS, Logical Positioning of nodes
- Gossip-Based Contribution: Aggregation, A Peer-Sampling Service

**Exemplar/Case Study:** Design Time Synchronization Mechanism in Distributed Gaming.

#### Unit IV: Naming and Distributed File Systems (07 Hours) → CO4

- Names, Identifiers, Addresses, Flat Naming
- Structured Naming, Attributed Based Naming
- Introduction to Distributed File Systems
- File Service Architecture
- Case studies: Sun's Network File System (NFS), Andrew File System (AFS)

**Exemplar/Case Study:** Study of Google File System (GFS).

#### Unit V: Consistency and Replication (07 Hours) → CO5

- Reasons for Replication, Replication as Scaling Technique
- Data-Centric Consistency Models: Continuous Consistency, Consistent Ordering of Operations
- Client-Centric Consistency Models: Eventual Consistency, Monotonic Reads, Monotonic Writes, Read Your Writes, Writes Follow Reads
- Replica Management: Content Replication and Placement, Content Distribution
- Consistency Protocols: Continuous Consistency, Sequential Consistency, Cache Coherence Protocols

**Exemplar/Case Study:** Study of HDFS Architecture for Data Replication.

#### Unit VI: Fault Tolerance (07 Hours) → CO6

- Introduction: Basic Concepts, Failure Models, Failure Masking by Redundancy
- Process Resilience: Resilience by Process Groups, Failure Masking and Replication
- Example: Paxos, Consensus in faulty systems with crash failures
- Failure Detection
- Reliable Client Server Communication: Point to Point Communication, RPC Semantics in the Presence of Failures
- Reliable Group Communication: Atomic multicast, Distributed commit
- Recovery: Check pointing, Message Logging, Recovery Oriented Computing

**Exemplar/Case Study:** Study of any Open Source Tool for Building Fault-Tolerant System such as Circuit Breaker/Nginx/HaProxy/Akka.

### Learning Resources

#### Text Books

1. Maarten van Steen, Andrew S. Tanenbaum, "Distributed Systems", Third edition, version 3.
2. George Coulouris, Jean Dollimore, Tim Kindberg, "Distributed Systems Concepts and Design", Fifth edition.

#### Reference Books

1. Christian Cachin, Rachid Guerraoui, Luís Rodrigues, "Introduction to Reliable and Secure Distributed Programming", Springer, 2nd edition.
2. Vijay K. Garg, "Elements of Distributed Computing", Wiley.
3. Maarten Van Steen and Andrew S. Tanenbaum, "Distributed Systems", Amazon Digital Services, 3rd edition.
4. Martin Kleppmann, "Designing Data-Intensive Applications", O'Reilly.

---

## 310245(D): Elective I — Software Project Management

**Prerequisites Courses:** Software Engineering (210253)

**Companion Course:** Laboratory Practice I (310248)

**Teaching Scheme:** Theory: 03 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the fundamentals of Software Project Management
- To investigate software project planning and management tools
- To learn software project scheduling and tracking
- To discuss about the agile project management
- To know people management in software project

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Comprehend Project Management Concepts |
| CO2 | Use various tools of Software Project Management |
| CO3 | Schedule various activities in software projects |
| CO4 | Track a project and manage changes |
| CO5 | Apply Agile Project Management |
| CO6 | Analyse staffing process for team building and decision making in Software Projects and Management |

### Course Contents

#### Unit I: Introduction to Software Project Management (07 Hours) → CO1

- Project Definition, Project vs Flow type work
- Project Lifecycle, Processes and Knowledge Areas in PM
- Build or Buy decision, Work Breakdown Structure (WBS) and its types
- Introduction to PMBOK
- Program and Portfolio Management

**Exemplar/Case Study:** Analysis of a project using PMBOK concepts.

#### Unit II: Project Planning and Project Management Tools (07 Hours) → CO2

- Steps for Project Planning
- PERT and Gantt Charts
- Gantt Project, Microsoft Project and Primavera
- Objectives of Activity planning, Project Schedules
- Activities, Sequencing and Scheduling
- Network Planning Models, Formulating Network Model

**Exemplar/Case Study:** Create software project plan using any tool.

#### Unit III: Activity based Scheduling (07 Hours) → CO3

- Objectives of Activity Planning
- Activities: Sequencing and Scheduling
- Network Planning Models, Formulating Network Model
- Activity relationships: Finish to Start (FS), Start to Finish (SF), Start to Start (SS), Finish to Finish (FF)
- Forward Pass and Backward Pass techniques
- Critical Path concept and remedies

**Exemplar/Case Study:** Apply the critical path technique to the project.

#### Unit IV: Project Tracking and Control (07 Hours) → CO4

- Collection of Project data, Visualizing progress
- Cost monitoring, Earned Value Analysis
- Project tracking, Change Control
- Software Configuration Management
- Managing contracts, Contract Management

**Exemplar/Case Study:** Analyze the effect of a major requirement change on the schedule.

#### Unit V: Agile Project Management (07 Hours) → CO5

- Predictive vs Empirical Management
- Comparison between Non-Agile and Agile Project
- Three stages of Agile Project: Estimation, Scope Management
- Roles and Responsibilities in Agile
- Scheduling and Tracking in Agile

**Exemplar/Case Study:** Analyse the same project using Agile. Create the three stages of the project.

#### Unit VI: Staffing in Software Projects (07 Hours) → CO6

- Managing People, Organizational behaviour
- Best methods of Staff Selection
- Motivation: Oldham-Hackman job characteristic Model
- Stress, Health and Safety
- Ethical and Professional concerns
- Working in Teams, Decision Making
- Organizational structures, Dispersed and Virtual Teams
- Communications Genres, Communication Plans

**Exemplar/Case Study:** Analyse a case study for a distributed team.

### Learning Resources

#### Text Books

1. Bob Hughes, Mike Cotterell and Rajib Mall, "Software Project Management", 6th Edition, Tata McGraw Hill, 2017.
2. Robert K. Wysocki, "Effective Software Project Management", Wiley, 2011.

#### Reference Books

1. Ken Schwaber, "Agile Project Management", Microsoft Press, 2004.
2. Walker Royce, "Software Project Management", Addison-Wesley, 1998.
3. Jalote Pankaj, "Software Project Management in Practice", Addison-Wesley, 2002.
4. PMBOK Guide.

---

# TE (Third Year) Computer Engineering — Semester VI

## Semester VI — Course Structure

| Course Code | Course Name | TH | PR | TUT | Mid-Sem | End-Sem | TW | PR | OR | Total | Credits |
|-------------|-------------|:--:|:--:|:---:|:-------:|:-------:|:--:|:--:|:--:|:-----:|:-------:|
| 310251 | Data Science and Big Data Analytics | 04 | -- | -- | 30 | 70 | -- | -- | -- | 100 | 03 |
| 310252 | Web Technology | 04 | -- | -- | 30 | 70 | -- | -- | -- | 100 | 03 |
| 310253 | Artificial Intelligence | 04 | -- | -- | 30 | 70 | -- | -- | -- | 100 | 03 |
| 310254 | Elective II | 04 | -- | -- | 30 | 70 | -- | -- | -- | 100 | 03 |
| 310255 | Internship | -- | -- | -- | -- | -- | 100 | -- | -- | 100 | 04 |
| 310256 | Data Science and Big Data Analytics Laboratory | -- | 04 | -- | -- | -- | 50 | 25 | -- | 75 | 02 |
| 310257 | Web Technology Laboratory | -- | 02 | -- | -- | -- | 25 | -- | 25 | 50 | 01 |
| 310258 | Laboratory Practice II | -- | 04 | -- | -- | -- | 50 | 25 | -- | 75 | 02 |
| 310259 | Audit Course 6 | -- | -- | -- | -- | -- | -- | -- | -- | Grade | -- |
| **Total** | | **12** | **10** | **--** | **120** | **280** | **225** | **50** | **25** | **700** | **21** |

**Elective II Options:**
- 310254(A): Information Security
- 310254(B): Augmented and Virtual Reality
- 310254(C): Cloud Computing
- 310254(D): Software Modeling and Architectures

**Audit Course 6 Options:**
- 310259(A): Digital and Social Media Marketing
- 310259(B): Sustainable Energy Systems
- 310259(C): Leadership and Personality Development
- 310259(D): Foreign Language
- 310259(E): Learn New Skills

**Laboratory Practice II:** Assignments from Artificial Intelligence and Elective II.

**Internship:** 4-6 weeks after completion of Semester V and before commencement of Semester VI.

---

## 310251: Data Science and Big Data Analytics

**Prerequisite Courses:** Not specified

**Companion Course:** Data Science and Big Data Analytics Laboratory (310256)

**Teaching Scheme:** Theory: 04 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the need of Data Science and Big Data
- To understand computational statistics in Data Science
- To study and understand the different technologies used for Big Data processing
- To understand and apply data modeling strategies
- To learn Data Analytics using Python programming
- To be conversant with advances in analytics

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Analyze needs and challenges for Data Science Big Data Analytics |
| CO2 | Apply statistics for Big Data Analytics |
| CO3 | Apply the lifecycle of Big Data analytics to real world problems |
| CO4 | Implement Big Data Analytics using Python programming |
| CO5 | Implement data visualization using visualization tools in Python programming |
| CO6 | Design and implement Big Databases using the Hadoop ecosystem |

### Course Contents

#### Unit I: Introduction to Data Science and Big Data (07 Hours) → CO1

- Basics and need of Data Science and Big Data
- Applications of Data Science
- Data explosion, 5 V's of Big Data (Volume, Velocity, Variety, Veracity, Value)
- Relationship between Data Science and Information Science
- Business intelligence vs. Data Science
- Data Science Life Cycle
- Data Types: Structured, Unstructured, Semi-Structured
- Data Collection
- Data wrangling methods: Data Cleaning, Data Integration, Data Reduction, Data Transformation, Data Discretization

**Exemplar/Case Study:** Create academic performance dataset and perform data pre-processing.

#### Unit II: Statistical Inference (07 Hours) → CO2

- Need of statistics in Data Science
- Measures of Central Tendency: Mean, Median, Mode, Mid-range
- Measures of Dispersion: Range, Variance, Mean Deviation, Standard Deviation
- Bayes theorem
- Hypothesis and hypothesis testing
- Pearson Correlation
- Sample Hypothesis testing
- Chi-Square Tests
- t-test

**Exemplar/Case Study:** Create measures of central tendency and dispersion for an employee dataset.

#### Unit III: Big Data Analytics Life Cycle (07 Hours) → CO3

- Introduction to Big Data sources
- Data Analytic Lifecycle phases:
  - Discovery
  - Data Preparation
  - Model Planning
  - Model Building
  - Communication of Results
  - Operationalize

**Exemplar/Case Study:** Global Innovation Social Network and Analysis (GINA).

#### Unit IV: Predictive Big Data Analytics with Python (07 Hours) → CO4

- Essential Python Libraries for Data Analytics
- Data Preprocessing: Removing Duplicates, Data Transformation, Replacing Values, Handling Missing Data
- Analytics Types:
  - Predictive Analytics
  - Descriptive Analytics
  - Prescriptive Analytics
- Association Rules: Apriori Algorithm, FP Growth Algorithm
- Regression Analysis: Linear Regression, Logistic Regression
- Classification: Naive Bayes, Decision Trees
- Scikit-learn introduction: Installation, Datasets, matplotlib, Regression and Classification using Scikit-learn

**Exemplar/Case Study:** Use IRIS dataset for data preprocessing.

#### Unit V: Big Data Analytics and Model Evaluation (07 Hours) → CO5

- Clustering Algorithms: K-Means, Hierarchical Clustering
- Time-series analysis
- Text Analysis: Pre-processing, Bag of Words, TF-IDF
- Social network analysis, Business analysis
- Model Evaluation: Metrics, Holdout Method, Random Sub-sampling, Parameter Tuning
- Confusion matrix, AUC-ROC Curves, Elbow plot

**Exemplar/Case Study:** Use IRIS dataset to apply K-means clustering.

#### Unit VI: Data Visualization and Hadoop (07 Hours) → CO6

- Introduction to Data Visualization, Challenges, Techniques
- Data Visualization Tools
- Hadoop ecosystem: Map Reduce, Pig, Hive
- Analytical techniques in Big Data visualization
- Visualization using Python: Line plot, Scatter plot, Histogram, Density plot, Box-plot

**Exemplar/Case Study:** Use IRIS dataset to plot 2D views.

### Learning Resources

#### Text Books

1. David Dietrich, Barry Hiller, "Data Science and Big Data Analytics", EMC education services, Wiley publication, 2012.
2. Jiawei Han, Micheline Kamber, and Jian Pie, "Data Mining: Concepts and Techniques", Elsevier Publishers, Third Edition.

#### Reference Books

1. EMC Education Services, "Data Science and Big Data Analytics"
2. DT Editorial Services, "Big Data, Black Book"
3. Chirag Shah, "A Hands-On Introduction To Data Science"
4. Wes McKinney, "Python for Data Analysis"
5. Trent Hauk, "Scikit-learn Cookbook"
6. Jenny Kim, Benjamin Bengfort, "Data Analytics with Hadoop"
7. Venkat Ankam, "Big Data Analytics"
8. Seema Acharya, Subhashini Chellappan, "Big Data And Analytics"

---

## 310252: Web Technology

**Companion Course:** Web Technology Laboratory (310257)

**Teaching Scheme:** Theory: 04 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To learn the fundamentals of web essentials and markup languages
- To use the Client side technologies in web development
- To use the Server side technologies in web development
- To understand the web services and frameworks

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Implement and analyze behavior of web pages using HTML and CSS |
| CO2 | Apply the client side technologies for web development |
| CO3 | Analyze the concepts of Servlet and JSP |
| CO4 | Analyze the Web services and frameworks |
| CO5 | Apply the server side technologies for web development |
| CO6 | Create the effective web applications for business functionalities using latest web development platforms |

### Course Contents

#### Unit I: Web Essentials and Mark-up Language — HTML (07 Hours) → CO1

- The Internet, Basic internet protocols, The World Wide Web
- HTTP Request message, HTTP response message
- Web clients, Web servers
- HTML: Introduction, history and versions
- HTML elements: headings, paragraphs, line break, colors and fonts, links, frames, lists, tables, images and forms
- Difference between HTML and HTML5
- CSS: Introduction to Style Sheet, CSS features, CSS core syntax
- Style sheets and HTML, Style rule cascading and inheritance, text properties
- Bootstrap Introduction

**Exemplar/Case Study:** Create a style sheet suitable for blogging application using HTML and CSS.

#### Unit II: Client Side Technologies: JavaScript and DOM (07 Hours) → CO2

- JavaScript: Introduction, JavaScript in perspective
- Basic syntax, variables and data types, statements, operators, literals
- Functions, objects, arrays, built-in objects
- JavaScript debuggers
- DOM: Introduction to Document Object Model
- DOM history and levels
- Intrinsic event handling, modifying element style
- The document tree, DOM event handling
- jQuery overview
- Overview of Angular JS

**Exemplar/Case Study:** Enhancement in created blogging application using JavaScript (Add Entry feature).

#### Unit III: Java Servlets and XML (07 Hours) → CO3

- Servlet architecture overview
- A "Hello World" servlet
- Servlets generating dynamic content
- Servlet life cycle
- Parameter data, sessions, cookies, URL rewriting
- Other Servlet capabilities, data storage
- Servlets concurrency
- Databases (MySQL) and Java Servlets
- XML: XML documents and vocabularies, XML declaration, XML Namespaces
- DOM based XML processing, transforming XML documents
- DTD: Schema, elements, attributes
- AJAX: Introduction, Working of AJAX

**Exemplar/Case Study:** Develop server-side code for blogging application.

#### Unit IV: JSP and Web Services (07 Hours) → CO4

- JSP: Introduction to Java Server Pages
- JSP and Servlets, running JSP applications
- Basic JSP, JavaBeans classes and JSP
- Support for the Model-View-Controller paradigm
- JSP related technologies
- Web Services: Web Service concepts
- Writing a Java Web Service, Writing a Java web service client
- Describing Web Services: WSDL
- Communicating Object data: SOAP
- Struts: Overview, architecture, configuration, actions, interceptors, result types, validations, localization, exception handling, annotations

**Exemplar/Case Study:** Transform the blogging application from a loose collection of various resources to an integrated web application that follows the MVC paradigm.

#### Unit V: Server Side Scripting Languages (07 Hours) → CO5

- PHP: Introduction to PHP, uses of PHP
- General syntactic characteristics, Primitives, operations and expressions
- Output, control statements, arrays, functions, pattern matching
- Form handling, files, cookies, session tracking
- Using MySQL with PHP
- WAP and WML
- Introduction to ASP.NET: Overview of the .NET Framework, Overview of C#
- Introduction to ASP.NET, ASP.NET Controls, Web Services
- Overview of Node JS

**Exemplar/Case Study:** Use of PHP in developing blogging application.

#### Unit VI: Ruby and Rails (07 Hours) → CO6

- Introduction to Ruby: Origins and uses of Ruby
- Scalar types and their operations, simple input and output
- Control statements, fundamentals of arrays, hashes, methods
- Classes, code blocks and iterators, pattern matching
- Introduction to Rails: Overview of Rails
- Document Requests, Processing Forms
- Rails Applications and Databases, Layouts
- Rails with Ajax
- Introduction to EJB

**Exemplar/Case Study:** Study of dynamic web product development using Ruby and Rails.

---

## 310253: Artificial Intelligence

**Prerequisites Courses:** Database Management Systems (310241), Data Structures and Algorithms (210252)

**Companion Course:** Laboratory Practice II (310258)

**Teaching Scheme:** Theory: 04 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the concept of Artificial Intelligence (AI) in the form of various Intellectual tasks
- To understand Problem Solving using various peculiar search strategies for AI
- To understand multi-agent environment in competitive environment
- To acquaint with the fundamentals of knowledge and reasoning
- To devise plan of action to achieve goals as a critical part of AI
- To develop a mind to solve real world problems unconventionally with optimality

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Identify and apply suitable Intelligent agents for various AI applications |
| CO2 | Build smart system using different informed search / uninformed search or heuristic approaches |
| CO3 | Identify knowledge associated and represent it by ontological engineering to plan a strategy to solve given problem |
| CO4 | Apply the suitable algorithms to solve AI problems |
| CO5 | Implement ideas underlying modern logical inference systems |
| CO6 | Represent complex problems with expressive yet carefully constrained language of representation |

### Course Contents

#### Unit I: Introduction (07 Hours) → CO1

- Introduction to AI, Foundations and History of AI
- State of the Art, Risks and Benefits of AI
- Intelligent Agents: Agents and Environments
- Concept of Rationality, Nature of Environments
- Structure of Agents

**Exemplar/Case Study:** Kroger: How This U.S. Retail Giant Is Using AI And Robots To Prepare For The 4th Industrial Revolution.

#### Unit II: Problem-solving (07 Hours) → CO2

- Solving Problems by Searching
- Problem-Solving Agents, Example Problems
- Search Algorithms: Uninformed Search Strategies
- Informed (Heuristic) Search Strategies, Heuristic Functions
- Search in Complex Environments
- Local Search and Optimization Problems

**Exemplar/Case Study:** 4th Industrial Revolution Using AI, Big Data And Robotics.

#### Unit III: Adversarial Search and Games (07 Hours) → CO2, CO4

- Game Theory, Optimal Decisions in Games
- Heuristic Alpha–Beta Tree Search
- Monte Carlo Tree Search
- Stochastic Games, Partially Observable Games
- Limitations of Game Search Algorithms
- Constraint Satisfaction Problems (CSP)
- Constraint Propagation
- Backtracking Search for CSPs

**Exemplar/Case Study:** Machine Learning At Google: The Amazing Use Case Of Becoming A Fully Sustainable Business.

#### Unit IV: Knowledge (07 Hours) → CO3

- Logical Agents, Knowledge-Based Agents
- The Wumpus World, Logic, Propositional Logic
- Propositional Theorem Proving
- Effective Propositional Model Checking
- Agents Based on Propositional Logic
- First-Order Logic: Representation Revisited
- Syntax and Semantics of First-Order Logic
- Using First-Order Logic
- Knowledge Engineering in First-Order Logic

**Exemplar/Case Study:** BBC To Launch AI - Enabled Interactive Radio Show For Amazon Echo And Google Home Chatbots.

#### Unit V: Reasoning (07 Hours) → CO4, CO5

- Inference in First-Order Logic
- Propositional vs. First-Order Inference
- Unification and First-Order Inference
- Forward Chaining, Backward Chaining
- Resolution
- Knowledge Representation, Ontological Engineering
- Categories and Objects, Events
- Mental Objects and Modal Logic
- Reasoning Systems for Categories
- Reasoning with Default Information

**Exemplar/Case Study:** The Amazing Ways How Wikipedia Uses Artificial Intelligence.

#### Unit VI: Planning (07 Hours) → CO6

- Automated Planning, Classical Planning
- Algorithms for Classical Planning
- Heuristics for Planning, Hierarchical Planning
- Planning and Acting in Nondeterministic Domains
- Time, Schedules, and Resources
- Analysis of Planning Approaches
- Limits of AI, Ethics of AI, Future of AI
- AI Components, AI Architectures

**Exemplar/Case Study:** The Amazing Ways Samsung Is Using Big Data, Artificial Intelligence And Robots To Drive Performance.

### Learning Resources

#### Text Books

1. Stuart Russell and Peter Norvig, "Artificial Intelligence: A Modern Approach", 3rd edition, Pearson, 2003.
2. Deepak Khemani, "A First Course in Artificial Intelligence", McGraw Hill Education, 2013.
3. Elaine Rich, Kevin Knight and Nair, "Artificial Intelligence", TMH.

#### Reference Books

1. Nilsson Nils J, "Artificial Intelligence: A New Synthesis", Morgan Kaufmann
2. Patrick Henry Winston, "Artificial Intelligence", Addison-Wesley
3. Andries P. Engelbrecht, "Computational Intelligence: An Introduction", Wiley
4. Dr. Lavika Goel, "Artificial Intelligence: Concepts and Applications", Wiley
5. Dr. Nilakshi Jain, "Artificial Intelligence: Making Machines Capable of Performing Human Tasks", Wiley

---

## 310254(A): Elective II — Information Security

**Companion Course:** Laboratory Practice II (310258)

**Teaching Scheme:** Theory: 04 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the basics of Information Security
- To understand the mathematical background behind cryptography
- To learn various standard algorithms and protocols for cryptography
- To understand the various techniques for web security
- To learn about various security tools and cyber laws

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Analyze the various threats and attacks in Information Security and Model the cyber threats |
| CO2 | Apply the various cryptographic techniques to secure data communication |
| CO3 | Design and develop secure web or network communication solutions |
| CO4 | Identify vulnerabilities in existing systems and apply proper security measures |
| CO5 | Use the standard cryptographic algorithms and protocols for ensuring security |

### Course Contents

#### Unit I: Introduction to Information Security (07 Hours) → CO1

- OSI Security Architecture
- Security Attacks: Passive Attacks, Active Attacks
- Security Services: Authentication, Access Control, Data Confidentiality, Data Integrity, Non-Repudiation, Availability
- Security Mechanisms
- Model for Network Security
- Classical Encryption Techniques: Caesar Cipher, Monoalphabetic Cipher, Playfair Cipher, Hill Cipher, Polyalphabetic Cipher

#### Unit II: Symmetric Key Cryptography (07 Hours) → CO2, CO3

- Block Cipher Principles
- Data Encryption Standard (DES): Structure, Design, Strength
- Multiple DES: Double DES, Triple DES
- Advanced Encryption Standard (AES): Structure, Transformations, Key Expansion
- Block Cipher Modes of Operation: ECB, CBC, CFB, OFB, CTR
- Stream Ciphers

#### Unit III: Asymmetric Key Cryptography (07 Hours) → CO2, CO3

- Number Theory: Prime Numbers, Fermat's Theorem, Euler's Theorem
- RSA Algorithm
- Diffie-Hellman Key Exchange
- El Gamal Cryptography
- Elliptic Curve Cryptography

#### Unit IV: Data Integrity Algorithms and Web Security (07 Hours) → CO4, CO5

- Cryptographic Hash Functions: SHA-512, MD5
- Message Authentication Codes (MAC)
- Digital Signatures
- Public Key Infrastructure (PKI)
- Web Security: HTTPS, SSH, PGP, IP Security (IPSec)

#### Unit V: Network and System Security (07 Hours) → CO4, CO5

- Access Control Mechanisms
- Denial of Service / Distributed Denial of Service Attacks
- Intrusion Detection Systems (IDS) and Intrusion Prevention Systems (IPS)
- Firewalls: Types, Packet Filtering, Proxy Firewalls
- Operating System Security
- Trusted Computing

#### Unit VI: Cyber Security and Tools (07 Hours) → CO1, CO5

- Cyber Crime: Classification, Types
- Indian IT Act
- Cyber Stalking, Cyber Bullying
- Phishing, Identity Theft
- Password Cracking, Password Security
- Network Scanners: Nmap, Metasploit, Wireshark, OpenSSL

### Learning Resources

#### Text Books

1. William Stallings, "Cryptography and Network Security: Principles and Practice", 6th Edition, Pearson, ISBN: 978-93-325-4262-0
2. William Stallings, "Network Security Essentials: Applications and Standards", 4th Edition, Pearson, ISBN: 978-0-13-706792-3
3. Nina Godbole, "Information Systems Security", Wiley, ISBN: 978-81-265-1692-6

#### Reference Books

1. Atul Kahate, "Cryptography and Network Security", 2nd Edition, McGraw Hill
2. V. K. Pachghare, "Cryptography and Information Security", 2nd Edition, PHI
3. Bernard Menezes, "Network Security and Cryptography", Cengage Learning
4. Bruice Schneiner, "Applied Cryptography", Wiley

---

## 310254(B): Elective II — Augmented and Virtual Reality

**Companion Course:** Laboratory Practice II (310258)

**Teaching Scheme:** Theory: 04 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the fundamentals of Augmented and Virtual Reality
- To learn the hardware and software components of AR/VR systems
- To understand the 3D world representation and rendering
- To learn to create interactive applications in AR/VR

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Understand the basics and applications of Virtual and Augmented Reality |
| CO2 | Describe the various interface devices used in Virtual Reality |
| CO3 | Explain the representation and rendering systems in Virtual Reality |
| CO4 | Analyze the interaction and experience techniques in Virtual Reality |
| CO5 | Summarize the concepts of Augmented Reality and its hardware |
| CO6 | Create the mobile based Augmented Reality applications |

### Course Contents

#### Unit I: Introduction to Virtual and Augmented Reality (07 Hours) → CO1

- Definition and Introduction to VR
- History of VR
- Key Elements of VR Experience
- Introduction to AR, Difference between AR, VR and MR
- Applications of VR and AR
- The Five Classic Components of a VR System

#### Unit II: Interface to the Virtual World (07 Hours) → CO2

- Input Devices: Position Trackers, Navigation and Manipulation Interfaces, Gesture Interfaces, Speech Interfaces
- Output Devices: Visual Displays, Aural Displays, Haptic Displays

#### Unit III: Representing and Rendering the Virtual World (07 Hours) → CO3

- Visual Representation and Rendering: Geometric Representation, Modeling Techniques
- Aural Representation and Rendering
- Haptic Representation and Rendering

#### Unit IV: Interaction and Experience in VR (07 Hours) → CO4

- User Interface Metaphors in VR
- Manipulation and Navigation in VR
- Immersion and Presence
- VR Sickness: Causes and Mitigation

#### Unit V: Augmented Reality (07 Hours) → CO5

- Introduction to AR: Concepts, Depth Cues
- Registration and Latency in AR
- AR Hardware: Sensors, Processors, Displays
- AR Tracking Technologies

#### Unit VI: AR Software and Mobile AR (07 Hours) → CO6

- Software Components and Tools for AR
- Tracker Types: Marker-based AR, Markerless AR
- Mobile AR: Platforms and Frameworks
- Creating Mobile AR Applications

### Learning Resources

#### Text Books

1. William R. Sherman, Alan B. Craig, "Understanding Virtual Reality: Interface, Application and Design", 2nd Edition, Morgan Kaufmann, ISBN: 978-0-12-800965-9
2. Alan B. Craig, "Understanding Augmented Reality: Concepts and Applications", Morgan Kaufmann, ISBN: 978-0-24-082408-6

#### Reference Books

1. Steven M. LaValle, "Virtual Reality", Cambridge University Press, 2016
2. Dieter Schmalstieg, Tobias Hollerer, "Augmented Reality: Principles and Practice", Pearson
3. Grigore C. Burdea, Philippe Coiffet, "Virtual Reality Technology", 2nd Edition, Wiley
4. John Vince, "Introduction to Virtual Reality", Springer

---

## 310254(C): Elective II — Cloud Computing

**Companion Course:** Laboratory Practice II (310258)

**Teaching Scheme:** Theory: 04 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the concepts of Cloud Computing
- To understand the data storage concepts in Cloud Computing
- To learn the concepts of virtualization
- To understand various Cloud platforms and their applications
- To understand security and risk management in Cloud
- To understand advanced Cloud technologies

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Analyze various Cloud Computing environments |
| CO2 | Apply data storage techniques in Cloud environment |
| CO3 | Perform Virtualization in Cloud environment |
| CO4 | Deploy applications over a Cloud environment |
| CO5 | Apply security mechanisms in Cloud environment |
| CO6 | Use various advanced techniques in Cloud Computing |

### Course Contents

#### Unit I: Introduction to Cloud Computing (07 Hours) → CO1

- Introduction to Cloud Computing
- Cloud Computing vs. Traditional Computing
- Cloud Migration Considerations
- Service Models: Software as a Service (SaaS), Platform as a Service (PaaS), Infrastructure as a Service (IaaS)
- Deployment Models: Public Cloud, Private Cloud, Hybrid Cloud, Community Cloud
- Benefits and Challenges of Cloud Computing

#### Unit II: Data Storage in Cloud (07 Hours) → CO2

- Direct Attached Storage (DAS)
- Storage Area Network (SAN)
- Network Attached Storage (NAS)
- Cloud Storage Models
- Distributed Data Storage
- Data Management in Cloud

#### Unit III: Virtualization (07 Hours) → CO3

- Introduction to Virtualization
- Types of Virtualization: Hardware, Software, Memory, Storage, Data, Network
- Virtualization Architecture
- Grid Computing vs. Cloud Computing
- CPU Virtualization, Network Virtualization, Storage Virtualization

#### Unit IV: Cloud Platforms and Applications (07 Hours) → CO4

- Amazon Web Services (AWS): EC2, S3, Lambda
- Microsoft Azure: Virtual Machines, App Services
- Google App Engine
- Industry-specific Cloud Applications: Healthcare, Business, Education

#### Unit V: Cloud Security (07 Hours) → CO5

- Risk Management in Cloud
- Data Security in Cloud: Encryption, Key Management
- Security Challenges in Cloud
- Identity and Access Management (IAM)
- Cloud Security Services
- Compliance and Governance

#### Unit VI: Advanced Cloud Techniques (07 Hours) → CO6

- Mobile Cloud Computing
- Multimedia Cloud Computing
- Edge Computing
- Containers: Docker, Kubernetes
- Internet of Things (IoT) and Cloud Convergence
- DevOps in Cloud

### Learning Resources

#### Text Books

1. Srinivasan, Suresh, "Cloud Computing: A Practical Approach", Pearson, ISBN: 978-81-317-7651-3
2. Rajkumar Buyya, James Broberg, Andrzej Goscinski, "Cloud Computing: Principles and Paradigms", Wiley, ISBN: 978-0-470-88799-8

#### Reference Books

1. James Bond, "The Enterprise Cloud", O'Reilly
2. Kris Jamsa, "Cloud Computing: SaaS, PaaS, IaaS, Virtualization and more", Wiley
3. Barrie Sosinsky, "Cloud Computing Bible", Wiley
4. Tim Mather, Subra Kumaraswamy, "Cloud Security and Privacy", O'Reilly
5. Rajkumar Buyya, "Mastering Cloud Computing", McGraw Hill

---

## 310254(D): Elective II — Software Modeling and Architectures

**Companion Course:** Laboratory Practice II (310258)

**Teaching Scheme:** Theory: 04 Hours/Week

**Examination:** Mid-Sem (TH): 30 Marks, End-Sem (TH): 70 Marks

**Credits:** 03

### Course Objectives

- To understand the concepts of Object-Oriented Modeling
- To learn to transform requirements into detailed design
- To learn the concepts of quality in software architecture
- To understand various architectural patterns and styles
- To learn to model applications using design patterns

### Course Outcomes

| CO | Description |
|----|-------------|
| CO1 | Analyze the SRS and identify the use cases |
| CO2 | Use UML for static modeling of software systems |
| CO3 | Use UML for dynamic modeling of software systems |
| CO4 | Evaluate the software architecture for the system |
| CO5 | Apply architectural styles and patterns for software systems |
| CO6 | Apply modern modeling tools for modeling software systems |

### Course Contents

#### Unit I: Concepts of Software Modeling (07 Hours) → CO1

- Evolution of Software Design Methods
- Model Driven Architecture (MDA)
- 4+1 View Architecture of UML
- UML Building Blocks: Things, Relationships, Diagrams
- Use Case Modeling: Actors, Use Cases, Relationships

#### Unit II: Static Modeling (07 Hours) → CO2

- Class Identification: RUP, CRC Cards
- Class Diagrams: Classes, Attributes, Operations, Relationships
- Object Diagrams
- Package Diagrams
- Component Diagrams
- Deployment Diagrams

#### Unit III: Dynamic Modeling (07 Hours) → CO3

- Activity Diagrams: Flow, Decisions, Fork/Join
- Interaction Diagrams: Sequence Diagrams, Communication Diagrams
- State Machine Diagrams: States, Transitions, Events

#### Unit IV: Software Architecture and Quality Attributes (07 Hours) → CO4

- Introduction to Software Architecture
- Architectural Patterns: Module Patterns, Component-and-Connector Patterns, Allocation Patterns
- Quality Attributes: Performance, Security, Modifiability, Availability

#### Unit V: Architectural Design and Documentation (07 Hours) → CO5

- Architecture in Agile Projects
- Documenting Software Architecture: Views, Styles
- Documenting Behavior
- Documenting Interfaces and Packages

#### Unit VI: Design Patterns (07 Hours) → CO6

- Introduction to Design Patterns
- Creational Patterns: Singleton, Factory Method, Abstract Factory
- Structural Patterns: Adapter, Proxy, Decorator, Facade
- Behavioral Patterns: Iterator, Observer, Strategy, Template Method

### Learning Resources

#### Text Books

1. Jim Arlow, Ila Neustadt, "UML 2 and Unified Process: Practical Object-Oriented Analysis and Design", 2nd Edition, Pearson, ISBN: 978-81-317-2643-3
2. Len Bass, Paul Clements, Rick Kazman, "Software Architecture in Practice", 3rd Edition, Pearson, ISBN: 978-93-325-3955-2
3. Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides, "Design Patterns: Elements of Reusable Object-Oriented Software", Pearson, ISBN: 978-93-325-4324-5

#### Reference Books

1. Hassan Gomaa, "Software Modeling and Design", Cambridge University Press
2. Grady Booch, James Rumbaugh, Ivar Jacobson, "Unified Modeling Language User Guide", 2nd Edition, Pearson
3. Martin Fowler, "UML Distilled", 3rd Edition, Pearson
4. Frank Buschmann, Regine Meunier, "Pattern Oriented Software Architecture", Wiley

---

## Laboratory Courses

### 310246: Database Management Systems Laboratory

**Practical:** 04 Hours/Week | **Credits:** 02 | **TW:** 25 Marks | **PR:** 25 Marks

**Group A (SQL and PL/SQL):** ER Modeling, SQL Queries (DDL, DML, Joins, Sub-Queries, Views), PL/SQL blocks, Stored Procedures/Functions, Cursors, Database Triggers, Database Connectivity

**Group B (NoSQL):** MongoDB CRUD Operations, Aggregation and Indexing, MapReduce, MongoDB Connectivity

**Group C (Mini Project):** Application development using database concepts with front-end (Java/PHP/Python/Ruby/.NET) and backend (MongoDB/MySQL/Oracle)

---

### 310247: Computer Networks and Security Laboratory

**Practical:** 02 Hours/Week | **Credits:** 01 | **TW:** 25 Marks | **OR:** 25 Marks

**Group A:** Wired LAN setup, Topologies and transmission media, WAN setup, Error detection/correction (Hamming/CRC), Sliding Window Protocol

**Group B:** Sub-netting, Link state/Distance vector routing, Router configuration (RIP/OSPF/BGP), TCP/UDP Socket programming

**Group C:** DNS lookup, DHCP server, Wireshark packet analysis, HTTP/HTTPS/FTP analysis, SSL/IPSEC study

---

### 310248: Laboratory Practice I

**Practical:** 04 Hours/Week | **Credits:** 02 | **TW:** 25 Marks | **PR:** 25 Marks

**Part A — Systems Programming and Operating System:**
- Assembler design (Pass I and II)
- Macro processor design
- Linker/Loader design
- Process scheduling algorithms
- Page replacement algorithms
- Memory allocation strategies

**Part B — Elective I Assignments (as per chosen elective)**

---

### 310249: Seminar and Technical Communication

**Tutorial:** 01 Hour/Week | **Credits:** 01 | **TW:** 50 Marks

---

### 310255: Internship

**Credits:** 04 | **TW:** 100 Marks

Internship of 4-6 weeks after Semester V and before Semester VI. Industrial training to provide students with an opportunity to apply conceptual knowledge from academics to the realities of the field work/training.

---

### 310256: Data Science and Big Data Analytics Laboratory

**Practical:** 04 Hours/Week | **Credits:** 02 | **TW:** 50 Marks | **PR:** 25 Marks

**Group A (Data Science):** Data Wrangling (I & II), Descriptive Statistics, Data Analytics (I, II & III), Text Analytics, Data Visualization (I, II & III)

**Group B (Big Data Analytics):** Word Count using Hadoop MapReduce, Log file processing, Weather data analysis using Apache Spark

**Group C (Mini Projects):** Case studies/projects (e.g., Global Innovation Network Analysis, Tweet classification, Movie recommendation, COVID-19 analytics)

---

### 310257: Web Technology Laboratory

**Practical:** 02 Hours/Week | **Credits:** 01 | **TW:** 25 Marks | **OR:** 25 Marks

---

### 310258: Laboratory Practice II

**Practical:** 04 Hours/Week | **Credits:** 02 | **TW:** 50 Marks | **PR:** 25 Marks

Assignments from Artificial Intelligence and Elective II.

---

# General Guidelines

1. Every undergraduate program has its own objectives and educational outcomes. These Program Outcomes (POs) are categorically mentioned at the beginning of the curriculum.
2. @: CO and PO Mapping Matrix indicates correlation levels of 3 (high), 2 (medium), 1 (low) and '-' (no correlation).
3. #: Elaborated examples/Case Studies are included at the end of each unit. May be assigned as self-study, excluded from theory examinations.
4. For laboratory courses, set of suggested assignments is provided for reference. Beyond curriculum assignments and mini-project may be included.
5. For each laboratory assignment, students must draw/write/generate flowchart, algorithm, test cases, mathematical model, Test data set and comparative/complexity analysis.
6. Term Work is continuous assessment that evaluates a student's progress throughout the semester.
7. Laboratory Journal — Program codes with sample output submitted as softcopy. Use of DVD is encouraged.
8. Audit Course — Students registered shall be awarded grade AP/PP. No grade points associated.
9. **Internship:** Engineering internships provide students with an opportunity to apply conceptual knowledge from academics to the realities of the field work/training.

**Abbreviations:**
- TH: Theory
- TUT: Tutorial
- PR: Practical
- TW: Term Work
- OR: Oral
- Sem: Semester
