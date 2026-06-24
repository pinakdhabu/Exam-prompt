# JNTUA Third & Fourth Year B.Tech CSE — Official Syllabus Reference (R23 Regulation)

> Compiled from official JNTUA syllabus documents for reference purposes.
>
> This document provides exact unit-wise syllabus, course outcomes, examination structure, for
> B.Tech in Computer Science and Engineering under the R23 Regulation.

---

# Semester V — Course Structure

| S.No | Course Code | Course Name                 | L:T:P | Credits  | CIE | SEE | Total |
| ---- | ----------- | --------------------------- | :---: | :------: | :-: | :-: | :---: |
| 1    | 23A54501    | Computer Networks           | 3:0:0 |    3     | 30  | 70  |  100  |
| 2    | 23A54502    | Data Analytics Using Python | 3:0:0 |    3     | 30  | 70  |  100  |
| 3    | 23A54503    | Artificial Intelligence     | 3:0:0 |    3     | 30  | 70  |  100  |
| 4    | 23A54504a/b | Professional Elective I     | 3:0:0 |    3     | 30  | 70  |  100  |
| 5    | 23A54505a/b | Professional Elective II    | 3:0:0 |    3     | 30  | 70  |  100  |
| 6    | 23A54506    | Computer Networks Lab       | 0:0:3 |   1.5    | 30  | 20  |  50   |
| 7    | 23A54507    | Python Programming Lab      | 0:0:3 |   1.5    | 30  | 20  |  50   |
| 8    | 23A54508    | AI with Python Lab          | 0:0:3 |   1.5    | 30  | 20  |  50   |
| 9    | 23A54509    | Skill Course: DevOps        | 1:0:2 |    2     | 30  | 20  |  50   |
|      | **Total**   |                             |       | **21.5** |     |     |       |

---

## 23A54501: Computer Networks

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Computer Organization & Architecture (23A54305), Operating Systems (23A54403)

### Course Objectives

- To understand the principles of computer networking and layered architectures
- To study data link layer protocols, error detection, and medium access control
- To learn network layer addressing, routing algorithms, and IP protocols
- To understand transport layer services, TCP, and UDP
- To explore application layer protocols and network security basics

### Course Outcomes

| CO  | Description                                                           |
| --- | --------------------------------------------------------------------- |
| CO1 | Explain the OSI and TCP/IP reference models and their layers          |
| CO2 | Apply error detection and correction techniques at data link layer    |
| CO3 | Implement routing algorithms and analyze IP addressing schemes        |
| CO4 | Design reliable data transfer using TCP and UDP protocols             |
| CO5 | Analyze application layer protocols (HTTP, DNS, SMTP, FTP)            |
| CO6 | Identify network security threats and apply basic security mechanisms |

### Course Contents

#### Unit I: Introduction to Computer Networks and Physical Layer (10 Hours) → CO1

- Computer Networks: Definition, Applications, Topologies (Bus, Star, Ring, Mesh, Tree, Hybrid)
- Network Types: LAN, MAN, WAN, PAN, VPN
- Network Models: OSI Reference Model (7 Layers), TCP/IP Protocol Suite (4 Layers)
- Comparison of OSI and TCP/IP Models
- Physical Layer: Analog and Digital Signals, Transmission Impairments (Attenuation, Distortion,
  Noise)
- Data Rate Limits: Nyquist Bit Rate, Shannon Capacity
- Transmission Media: Guided (Twisted Pair, Coaxial, Fiber Optic), Unguided (Radio, Microwave,
  Infrared)
- Switching Techniques: Circuit Switching, Packet Switching (Datagram, Virtual Circuit), Message
  Switching

#### Unit II: Data Link Layer (10 Hours) → CO2

- Data Link Layer: Design Issues (Framing, Error Control, Flow Control)
- Framing: Character Count, Character Stuffing, Bit Stuffing
- Error Detection: Parity Check (Simple, Two-dimensional), CRC (Cyclic Redundancy Check), Checksum
- Error Correction: Hamming Code (Single-bit, Burst)
- Flow Control: Stop-and-Wait, Sliding Window Protocol (Go-Back-N, Selective Repeat)
- Medium Access Control (MAC): ALOHA (Pure, Slotted), CSMA (1-persistent, Non-persistent,
  p-persistent), CSMA/CD, CSMA/CA
- Controlled Access: Reservation, Polling, Token Passing
- IEEE 802 Standards: Ethernet (802.3), Token Ring (802.5), Wireless LAN (802.11)

#### Unit III: Network Layer (10 Hours) → CO3

- Network Layer: Design Issues (Store-and-Forward, Routing, Congestion Control)
- IPv4 Addressing: Classful (A, B, C, D, E), Classless (CIDR), Subnetting, Supernetting
- NAT (Network Address Translation), DHCP
- IPv6 Addressing: Format, Address Types (Unicast, Multicast, Anycast), Transition from IPv4 (Dual
  Stack, Tunneling, Header Translation)
- Routing Algorithms:
  - Distance Vector Routing: Bellman-Ford Algorithm, Count-to-Infinity Problem
  - Link State Routing: Dijkstra's Algorithm, OSPF
  - Hierarchical Routing
  - Routing Protocols: RIP, OSPF, BGP
- Internet Control Protocols: ICMP, ARP, RARP
- Network Devices: Routers, Switches, Bridges, Hubs, Gateways

#### Unit IV: Transport Layer (10 Hours) → CO4

- Transport Layer: Services (Connection-oriented, Connectionless), Ports and Sockets
- User Datagram Protocol (UDP): Segment Format, Checksum, Applications
- Transmission Control Protocol (TCP): Segment Format, Connection Establishment (Three-way
  Handshake), Connection Termination
- TCP Flow Control: Sliding Window, Flow Control vs Congestion Control
- TCP Congestion Control: Slow Start, Congestion Avoidance, Fast Retransmit, Fast Recovery
- TCP Timers: Retransmission Timer (RTT Estimation, Karn's Algorithm), Persistence Timer, Keepalive
  Timer
- QoS Parameters: Delay, Jitter, Bandwidth, Throughput
- QoS Techniques: Leaky Bucket, Token Bucket, Traffic Shaping

#### Unit V: Application Layer and Network Security (10 Hours) → CO5, CO6

- Application Layer Protocols:
  - HTTP/HTTPS: Request/Response, Methods (GET, POST, PUT, DELETE), Status Codes, Persistent
    Connections
  - DNS: Domain Hierarchy, Name Resolution (Iterative, Recursive), DNS Records, Caching
  - SMTP, POP3, IMAP: Email Architecture, MIME
  - FTP: Control and Data Connections, Active vs Passive Mode
  - DHCP: DORA Process (Discover, Offer, Request, Acknowledge)
- Network Security: Principles (Confidentiality, Integrity, Availability, Authentication,
  Non-repudiation)
- Cryptography: Symmetric (DES, AES), Asymmetric (RSA)
- Firewalls: Packet Filter, Stateful Inspection, Application-level Gateway, Proxy
- VPNs, TLS/SSL

### Learning Resources

#### Textbooks

1. James F. Kurose, Keith W. Ross, "Computer Networking: A Top-Down Approach", 8th Edition, Pearson,
   2020
2. Andrew S. Tanenbaum, Nick Feamster, David J. Wetherall, "Computer Networks", 6th Edition,
   Pearson, 2021

#### Reference Books

1. Behrouz A. Forouzan, "Data Communications and Networking", 5th Edition, McGraw Hill, 2012
2. William Stallings, "Data and Computer Communications", 10th Edition, Pearson, 2013
3. Larry L. Peterson, Bruce S. Davie, "Computer Networks: A Systems Approach", 6th Edition, Morgan
   Kaufmann, 2021
4. Douglas E. Comer, "Internetworking with TCP/IP: Principles, Protocols, and Architecture", 6th
   Edition, Pearson, 2013

---

## 23A54502: Data Analytics Using Python

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Probability & Statistics for Engineers (23AHSBS19), Programming in C (23AHSBS04)

### Course Objectives

- To understand the data analytics lifecycle and Python ecosystem for data analysis
- To learn data wrangling, manipulation, and cleaning using Pandas
- To master data visualization techniques for exploratory data analysis
- To apply statistical analysis and hypothesis testing on real-world data
- To implement machine learning models for predictive analytics

### Course Outcomes

| CO  | Description                                                                |
| --- | -------------------------------------------------------------------------- |
| CO1 | Use Python libraries (NumPy, Pandas, Matplotlib) for data manipulation     |
| CO2 | Perform data wrangling and cleaning on real-world datasets                 |
| CO3 | Create insightful visualizations for exploratory data analysis             |
| CO4 | Apply statistical methods and hypothesis testing for data-driven decisions |
| CO5 | Implement regression and classification models for predictive analytics    |
| CO6 | Build and evaluate data analytics pipelines and present findings           |

### Course Contents

#### Unit I: Python for Data Analytics (10 Hours) → CO1

- Introduction to Data Analytics: Types (Descriptive, Diagnostic, Predictive, Prescriptive)
- Data Analytics Lifecycle: CRISP-DM Framework (Business Understanding, Data Understanding, Data
  Preparation, Modeling, Evaluation, Deployment)
- Python Environment Setup: Anaconda, Jupyter Notebook, Google Colab
- NumPy: Arrays (Creation, Indexing, Slicing, Broadcasting), Mathematical Operations, Linear
  Algebra, Random Number Generation
- Pandas: Series and DataFrame, Importing Data (CSV, Excel, JSON, SQL), Data Inspection (head(),
  info(), describe())
- DataFrame Operations: Selection, Filtering, Sorting, Grouping, Merging, Joining, Concatenation
- Handling Missing Data: isnull(), dropna(), fillna(), interpolate()
- Working with Dates and Times: datetime, Timedelta, date_range

#### Unit II: Data Wrangling and Transformation (10 Hours) → CO2

- Data Cleaning Techniques: Removing Duplicates, Handling Outliers (Z-score, IQR), Data Type
  Conversion
- String Operations in Pandas: split(), strip(), replace(), extract(), regular expressions
- Apply Functions: apply(), map(), applymap() — Lambda Functions
- Reshaping Data: pivot(), melt(), stack(), unstack()
- Data Aggregation: groupby(), aggregate(), transform(), filter()
- Multi-level Indexing: Creating, Indexing, Slicing MultiIndex
- Working with Categorical Data: category type, value_counts(), cut(), qcut()
- Data Integration: Merging DataFrames (inner, outer, left, right joins), Handling Conflicts

#### Unit III: Data Visualization (10 Hours) → CO3

- Matplotlib: Figure and Axes, Subplots, Customizing Plots (Colors, Markers, Line Styles, Labels,
  Legends, Titles)
- Basic Plots: Line, Bar, Horizontal Bar, Stacked Bar, Histogram, Pie Chart, Scatter Plot
- Seaborn: Statistical Visualizations, Themes and Color Palettes
- Distribution Plots: distplot(), kdeplot(), rugplot(), jointplot()
- Categorical Plots: boxplot(), violinplot(), stripplot(), swarmplot(), barplot(), countplot()
- Relationship Plots: scatterplot(), regplot(), lmplot(), pairplot()
- Matrix Plots: heatmap(), clustermap()
- Time Series Visualization: plot_date(), acf(), pacf()
- Interactive Visualizations: Plotly, Bokeh (Basic Usage)

#### Unit IV: Statistical Analysis and Hypothesis Testing (10 Hours) → CO4

- Descriptive Statistics: Measures of Central Tendency (Mean, Median, Mode), Measures of Dispersion
  (Range, Variance, Standard Deviation, IQR), Skewness, Kurtosis
- Correlation Analysis: Pearson, Spearman, Kendall — Correlation Matrix, Heatmap
- Probability Distributions: Normal, Binomial, Poisson, Uniform, Exponential (Scipy.stats)
- Central Limit Theorem: Sampling Distribution, Standard Error
- Hypothesis Testing: Null and Alternative Hypotheses, Type I and Type II Errors, p-value,
  Significance Level
- Parametric Tests: t-test (One-sample, Independent, Paired), ANOVA (One-way, Two-way), F-test
- Non-parametric Tests: Chi-Square Test (Goodness of Fit, Independence), Mann-Whitney U Test,
  Wilcoxon Signed-Rank Test, Kruskal-Wallis Test
- Confidence Intervals: For Mean, Proportion, Difference of Means

#### Unit V: Predictive Analytics and Machine Learning (10 Hours) → CO5, CO6

- Introduction to scikit-learn: API Design, Estimators, Transformers, Predictors
- Train-Test Split: holdout(), train_test_split(), Stratification
- Regression Models: Linear Regression, Polynomial Regression, Regularization (Ridge, Lasso)
- Classification Models: Logistic Regression, Decision Trees, Random Forest, SVM, k-NN
- Model Evaluation:
  - Regression: MSE, RMSE, MAE, R², Adjusted R²
  - Classification: Accuracy, Precision, Recall, F1-Score, Confusion Matrix, ROC-AUC
- Cross-Validation: k-Fold, Stratified k-Fold, Leave-One-Out
- Feature Engineering: Feature Selection (SelectKBest, RFE), Feature Extraction (PCA)
- Hyperparameter Tuning: GridSearchCV, RandomizedSearchCV
- Introduction to Time Series: Stationarity, Trend, Seasonality, Residuals, ARIMA models

### Learning Resources

#### Textbooks

1. Wes McKinney, "Python for Data Analysis: Data Wrangling with Pandas, NumPy, and Jupyter", 3rd
   Edition, O'Reilly, 2022
2. Jake VanderPlas, "Python Data Science Handbook: Essential Tools for Working with Data", 2nd
   Edition, O'Reilly, 2023

#### Reference Books

1. Joel Grus, "Data Science from Scratch: First Principles with Python", 2nd Edition, O'Reilly, 2019
2. Aurélien Géron, "Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow", 3rd
   Edition, O'Reilly, 2022
3. Gareth James, Daniela Witten, Trevor Hastie, Robert Tibshirani, "An Introduction to Statistical
   Learning with Applications in Python", Springer, 2023
4. McKinney & O'Connell, "Python for Data Analysis", 3rd Edition, O'Reilly, 2022

---

## 23A54503: Artificial Intelligence

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Discrete Mathematics (23A53101), Data Structures (23A53102)

### Course Objectives

- To understand AI fundamentals, history, and problem-solving approaches
- To study search algorithms: uninformed, informed, and adversarial search
- To learn knowledge representation and reasoning in AI systems
- To explore probabilistic reasoning and decision-making under uncertainty
- To understand AI applications in NLP, computer vision, and robotics

### Course Outcomes

| CO  | Description                                                            |
| --- | ---------------------------------------------------------------------- |
| CO1 | Apply problem-solving strategies using state space search              |
| CO2 | Implement uninformed and informed search algorithms                    |
| CO3 | Design game-playing agents using adversarial search techniques         |
| CO4 | Represent knowledge using logic and probabilistic frameworks           |
| CO5 | Apply Bayesian networks for reasoning under uncertainty                |
| CO6 | Understand AI applications in NLP, computer vision, and expert systems |

### Course Contents

#### Unit I: Introduction to AI and Problem Solving (10 Hours) → CO1

- AI: Definition, History (Turing Test, Dartmouth Conference), Goals
- Foundations: Philosophy, Mathematics, Economics, Neuroscience, Psychology, Computer Engineering
- Intelligent Agents: Agents and Environments (PEAS), Agent Types (Simple Reflex, Model-based,
  Goal-based, Utility-based, Learning)
- Problem Solving: State Space Representation, Initial State, Goal State, Actions, Transition Model,
  Path Cost
- Search Strategies: Uninformed vs Informed, Complete vs Incomplete, Optimal vs Suboptimal
- Problem Formulation: Examples (8-Puzzle, Water Jug, Missionaries and Cannibals, Traveling
  Salesman)

#### Unit II: Uninformed and Informed Search (10 Hours) → CO2

**Uninformed Search:**

- Breadth-First Search (BFS): Algorithm, Completeness, Optimality, Time/Space Complexity
- Depth-First Search (DFS): Algorithm, Completeness, Optimality, Time/Space Complexity
- Depth-Limited Search: Iterative Deepening DFS (IDDFS)
- Uniform Cost Search: Algorithm, Optimality (Positive Costs)
- Bidirectional Search: Concept, Complexity

**Informed Search:**

- Heuristic Functions: Admissibility, Consistency (Monotonicity), Dominance, Relaxed Problems
- Greedy Best-First Search: Algorithm, Completeness, Optimality
- A\* Search: Algorithm, Optimality Conditions, Admissible Heuristics
- Memory-Bounded Heuristic Search: IDA*, SMA*
- Metaheuristics: Hill Climbing (Simple, Steepest Ascent), Simulated Annealing, Genetic Algorithms

#### Unit III: Adversarial Search and Game Playing (10 Hours) → CO3

- Game Theory: Perfect vs Imperfect Information, Zero-Sum Games, Turn-Based Games
- Minimax Algorithm: Decision Making, Optimal Strategy, Limitations
- Alpha-Beta Pruning: Algorithm, Move Ordering, Effectiveness (Best-case, Worst-case Complexity)
- Games with Chance: Expectiminimax Algorithm, Evaluation Functions
- Constraint Satisfaction Problems (CSPs): Definition, Variables, Domains, Constraints (Unary,
  Binary, Global)
- CSP Solving: Backtracking Search, Forward Checking, Constraint Propagation (Arc Consistency, AC-3)
- Heuristics for CSPs: MRV (Minimum Remaining Values), LCV (Least Constraining Value), Forward
  Checking

#### Unit IV: Knowledge Representation and Reasoning (10 Hours) → CO4

- Knowledge-Based Agents: Knowledge Base (KB), Inference, Declarative vs Procedural
- Propositional Logic: Syntax, Semantics, Entailment, Inference (Modus Ponens, Resolution)
- First-Order Logic (FOL): Syntax (Constants, Variables, Predicates, Functions, Quantifiers),
  Semantics
- Inference in FOL: Unification, Forward Chaining, Backward Chaining, Resolution
- Knowledge Engineering: Ontologies, Semantic Networks, Frames
- Planning: STRIPS, Partial-Order Planning, Hierarchical Planning

#### Unit V: Probabilistic Reasoning and AI Applications (10 Hours) → CO5, CO6

- Uncertainty in AI: Sources, Probabilistic Approaches
- Probability Review: Conditional Probability, Chain Rule, Bayes' Theorem
- Bayesian Networks: Directed Acyclic Graphs (DAGs), Conditional Probability Tables (CPTs)
- Inference in Bayesian Networks: Exact (Variable Elimination), Approximate (Monte Carlo, Rejection
  Sampling, Likelihood Weighting)
- Hidden Markov Models (HMMs): Markov Chains, Forward-Backward Algorithm, Viterbi Algorithm
- AI Applications:
  - Natural Language Processing: Tokenization, POS Tagging, NER, Sentiment Analysis
  - Computer Vision: Image Classification, Object Detection
  - Expert Systems: Architecture, Inference Engine, Rule-based Systems
  - Robotics: Configuration Space, Path Planning, Sensors and Actuators

### Learning Resources

#### Textbooks

1. Stuart Russell, Peter Norvig, "Artificial Intelligence: A Modern Approach", 4th Edition, Pearson,
   2020
2. Nils J. Nilsson, "Artificial Intelligence: A New Synthesis", Morgan Kaufmann, 1998

#### Reference Books

1. Elaine Rich, Kevin Knight, Shivashankar B. Nair, "Artificial Intelligence", 3rd Edition, McGraw
   Hill, 2008
2. George F. Luger, "Artificial Intelligence: Structures and Strategies for Complex Problem
   Solving", 6th Edition, Pearson, 2009
3. Patrick H. Winston, "Artificial Intelligence", 3rd Edition, Addison-Wesley, 1992
4. S. Russell, P. Norvig, "AI: A Modern Approach", 3rd Edition, Pearson, 2015
5. Deepak Khemani, "A First Course in Artificial Intelligence", McGraw Hill, 2017

---

## Professional Electives (Semester V)

### 23A54504a: Full Stack Development

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

#### Course Contents

**Unit I: Web Fundamentals:** HTML5 (semantic elements, forms, multimedia), CSS3 (flexbox, grid,
responsive design), JavaScript (ES6+, DOM manipulation, events, promises, async/await)

**Unit II: Frontend Frameworks:** React.js (components, props, state, hooks, context API, routing),
Angular or Vue.js basics

**Unit III: Backend Development:** Node.js (modules, express.js, RESTful APIs, middleware, error
handling), Authentication (JWT, OAuth, sessions)

**Unit IV: Database and ORM:** SQL databases (PostgreSQL), MongoDB (document model, aggregation),
ORM/ODM (Sequelize, Mongoose)

**Unit V: DevOps and Deployment:** Git/GitHub, Docker (containers, Dockerfile, docker-compose),
CI/CD (GitHub Actions), Cloud deployment (AWS, Vercel, Netlify)

### 23A54504b: Mobile Application Development

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

#### Course Contents

**Unit I:** Mobile platforms overview (Android, iOS), App architecture, Development environment
setup (Android Studio, Flutter SDK)

**Unit II:** Android development: Activities, Intents, Fragments, Layouts, UI components,
RecyclerView

**Unit III:** Flutter/Dart: Widgets, State management (Provider, Bloc), Navigation, Platform
channels

**Unit IV:** Persistent storage (SQLite, Room, SharedPreferences), REST APIs, Firebase integration

**Unit V:** App testing (unit, widget, integration), App deployment (Play Store, App Store)

### 23A54505a: Cryptography & Network Security

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

#### Course Contents

**Unit I:** Security concepts (CIA triad, threats, attacks, services), Classical encryption
techniques (Caesar, Playfair, Hill cipher, Vigenère, transposition)

**Unit II:** Symmetric key cryptography: DES (Feistel structure, rounds, S-boxes), AES (SubBytes,
ShiftRows, MixColumns, AddRoundKey), Modes of operation (ECB, CBC, CFB, OFB, CTR)

**Unit III:** Asymmetric key cryptography: RSA algorithm (key generation, encryption, decryption),
Diffie-Hellman key exchange, Elliptic Curve Cryptography

**Unit IV:** Hash functions (SHA-256, MD5), Digital signatures (DSA, RSA signatures), Certificate
authorities, PKI, SSL/TLS

**Unit V:** Network security: IPsec, Firewalls, IDS/IPS, VPN, Wireless security (WPA2, WPA3), Email
security (PGP, S/MIME)

### 23A54505b: Cloud Computing

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

#### Course Contents

**Unit I:** Cloud computing fundamentals: Definition, characteristics (on-demand, broad network
access, resource pooling, rapid elasticity, measured service), Service models (IaaS, PaaS, SaaS),
Deployment models (Public, Private, Hybrid, Community)

**Unit II:** Virtualization: Hypervisors (Type 1/Type 2), Virtual machines, Containers (Docker,
Kubernetes), Comparison of VMs and containers

**Unit III:** AWS services: EC2, S3, Lambda, RDS, DynamoDB, IAM, VPC. Basic cloud architecture
design patterns

**Unit IV:** Cloud storage: Object storage (S3), Block storage (EBS), File storage (EFS), CDN
(CloudFront), Database services

**Unit V:** Cloud security: Shared responsibility model, Identity and access management, Encryption,
Compliance. Cloud economics: CAPEX vs OPEX, TCO, Pay-as-you-go

---

## Laboratory Courses

### 23A54506: Computer Networks Lab

**Practical:** 3 Hours/Week | **Credits:** 1.5 | **CIE:** 30 Marks | **SEE:** 20 Marks

Assignments: Network commands (ping, traceroute, ipconfig, netstat), IPv4 subnetting, Socket
programming (TCP/UDP), Simulation using NS2/NS3/Cisco Packet Tracer, HTTP client/server, DNS
resolution, ARP/RARP

### 23A54507: Python Programming Lab

**Practical:** 3 Hours/Week | **Credits:** 1.5 | **CIE:** 30 Marks | **SEE:** 20 Marks

Assignments: NumPy array operations, Pandas data manipulation, Data cleaning and preprocessing,
Statistical analysis with SciPy, Data visualization with Matplotlib/Seaborn, Web scraping with
BeautifulSoup

### 23A54508: AI with Python Lab

**Practical:** 3 Hours/Week | **Credits:** 1.5 | **CIE:** 30 Marks | **SEE:** 20 Marks

Assignments: DFS/BFS for problem solving, A\* algorithm for 8-puzzle, Minimax for Tic-Tac-Toe, CSP
solver (Sudoku), Bayesian network inference, K-means clustering, Basic NLP with NLTK/spaCy, Chatbot
implementation

### 23A54509: Skill Course — DevOps

**Practical:** 1:0:2 | **Credits:** 2 | **CIE:** 30 Marks | **SEE:** 20 Marks

**Contents:** Version control with Git, Build tools (Maven, Gradle), CI/CD with Jenkins/GitHub
Actions, Docker (images, containers, Dockerfile, docker-compose), Kubernetes (pods, services,
deployments), Infrastructure as Code with Terraform, Monitoring (Prometheus, Grafana)

---

# Semester VI — Course Structure

| S.No | Course Code | Course Name                | L:T:P | Credits | CIE | SEE | Total |
| ---- | ----------- | -------------------------- | :---: | :-----: | :-: | :-: | :---: |
| 1    | 23A54601    | Compiler Design            | 3:0:0 |    3    | 30  | 70  |  100  |
| 2    | 23A54602    | Deep Learning              | 3:0:0 |    3    | 30  | 70  |  100  |
| 3    | 23A54603a/b | Professional Elective III  | 3:0:0 |    3    | 30  | 70  |  100  |
| 4    | 23A54604a/b | Professional Elective IV   | 3:0:0 |    3    | 30  | 70  |  100  |
| 5    | 23A54605    | Compiler Design Lab        | 0:0:3 |   1.5   | 30  | 20  |  50   |
| 6    | 23A54606    | Deep Learning Lab          | 0:0:3 |   1.5   | 30  | 20  |  50   |
| 7    | 23A54607    | Skill Course: UI/UX Design | 1:0:2 |    2    | 30  | 20  |  50   |
| 8    | 23A54608    | Summer Internship          | 0:0:0 |    2    | 50  |  —  |  50   |
|      | **Total**   |                            |       | **19**  |     |     |       |

---

## 23A54601: Compiler Design

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Formal Languages & Automata Theory (23A54401), Data Structures (23A53102)

### Course Objectives

- To understand the various phases of a compiler and their interactions
- To study lexical analysis and parsing techniques
- To learn syntax-directed translation and intermediate code generation
- To understand code optimization and code generation
- To explore runtime environments and symbol table management

### Course Outcomes

| CO  | Description                                                            |
| --- | ---------------------------------------------------------------------- |
| CO1 | Design lexical analyzers using regular expressions and finite automata |
| CO2 | Implement top-down and bottom-up parsing techniques                    |
| CO3 | Apply syntax-directed translation to generate intermediate code        |
| CO4 | Manage symbol tables and runtime storage organization                  |
| CO5 | Apply code optimization techniques to improve performance              |
| CO6 | Design and implement a code generator for a target machine             |

### Course Contents

**Unit I: Introduction to Compilers and Lexical Analysis (10 Hours):** Language processors
(compiler, interpreter, assembler), Phases of a compiler (lexical, syntax, semantic, intermediate
code, optimization, code generation), Compiler construction tools. Lexical analysis: Role, tokens,
patterns, lexemes, attributes. Regular expressions and finite automata (NFA, DFA, minimization). Lex
tool/flex

**Unit II: Syntax Analysis — Parsing (10 Hours):** Role of parser, Context-free grammars,
Derivations (leftmost, rightmost), Parse trees. Top-down parsing: Recursive descent, Predictive
parsers, LL(1) parsers (FIRST and FOLLOW). Bottom-up parsing: Shift-reduce, LR parsers (SLR, CLR,
LALR). Handling ambiguous grammars. YACC/Bison tool

**Unit III: Syntax-Directed Translation and Intermediate Code Generation (10 Hours):**
Syntax-directed definitions (SDD), Dependency graphs, Evaluation order, S-attributed and
L-attributed definitions. Syntax-directed translation schemes (SDT). Intermediate representations:
Abstract syntax trees, Three-address code (quadruples, triples, indirect triples). Translation:
Expressions, control flow, arrays, function calls

**Unit IV: Symbol Tables, Runtime Environments (10 Hours):** Symbol table organization (linear,
hash, tree), Scope management (static, dynamic), Runtime storage management (static, stack, heap
allocation), Activation records, Calling sequences, Parameter passing (by value, by reference, by
name)

**Unit V: Code Optimization and Code Generation (10 Hours):** Principal sources of optimization,
Basic blocks and flow graphs, Local optimization (constant folding, algebraic simplification),
Global optimization (data-flow analysis, reaching definitions). Loop optimization (loop unrolling,
loop invariant code motion). Peephole optimization. Code generation: Target machine architecture,
Instruction selection, Register allocation (graph coloring), Simple code generator algorithm

### Learning Resources

**Textbooks:**

1. Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman, "Compilers: Principles, Techniques,
   and Tools", 2nd Edition, Pearson, 2007
2. Kenneth C. Louden, "Compiler Construction: Principles and Practice", Cengage, 1997

**Reference Books:**

1. Andrew W. Appel, "Modern Compiler Implementation in C", Cambridge University Press, 2004
2. Steven S. Muchnick, "Advanced Compiler Design and Implementation", Morgan Kaufmann, 1997
3. John R. Levine, Tony Mason, Doug Brown, "Lex & Yacc", 2nd Edition, O'Reilly, 1992

---

## 23A54602: Deep Learning

**Credits:** 3 | **CIE:** 30 Marks | **SEE:** 70 Marks

**Prerequisites:** Machine Learning (23A54404), Data Analytics Using Python (23A54502)

### Course Objectives

- To understand the foundations of neural networks and deep learning
- To study CNNs for image processing and computer vision
- To learn RNNs and LSTMs for sequential data
- To explore generative models including GANs
- To understand deep reinforcement learning

### Course Outcomes

| CO  | Description                                                            |
| --- | ---------------------------------------------------------------------- |
| CO1 | Build deep neural networks using frameworks like TensorFlow/PyTorch    |
| CO2 | Design and train CNNs for image classification and object detection    |
| CO3 | Implement RNNs and LSTMs for sequence modeling                         |
| CO4 | Apply autoencoders for feature learning and anomaly detection          |
| CO5 | Implement GANs for generating realistic synthetic data                 |
| CO6 | Apply deep reinforcement learning algorithms for decision-making tasks |

### Course Contents

**Unit I: Foundations of Deep Learning (10 Hours):** Biological vs artificial neurons, Perceptron,
MLP architecture. Activation functions (sigmoid, tanh, ReLU, Leaky ReLU, ELU, Swish). Loss functions
(MSE, cross-entropy, hinge). Backpropagation (chain rule, gradient descent, SGD with momentum, Adam,
RMSprop). Regularization (L1/L2, dropout, batch normalization, early stopping, data augmentation).
Hyperparameter tuning. Deep learning frameworks: TensorFlow, Keras, PyTorch

**Unit II: Convolutional Neural Networks (10 Hours):** CNN architecture: Convolution (filters,
stride, padding), Pooling (max, average, global), Fully connected layers. LeNet-5, AlexNet, VGGNet,
GoogLeNet (Inception), ResNet (skip connections). Transfer learning and fine-tuning. Object
detection: R-CNN, YOLO (concept). Image segmentation: U-Net (concept). Applications: Image
classification, face recognition, medical imaging

**Unit III: Recurrent Neural Networks (10 Hours):** Sequence modeling: Vanilla RNN, BPTT
(backpropagation through time), Vanishing/exploding gradients. LSTM (forget gate, input gate, output
gate, cell state). GRU (reset gate, update gate). Bidirectional RNNs. Sequence-to-sequence models,
Attention mechanism. Applications: Text classification, sentiment analysis, machine translation,
speech recognition

**Unit IV: Autoencoders and Generative Models (10 Hours):** Autoencoders: Undercomplete, denoising,
sparse, variational autoencoders (VAE). Generative Adversarial Networks (GANs): Generator,
discriminator, adversarial training. GAN variants: DCGAN, CycleGAN, StyleGAN. Evaluation: Inception
Score, FID. Applications: Image generation, style transfer, super-resolution, anomaly detection

**Unit V: Deep Reinforcement Learning and Advanced Topics (10 Hours):** Reinforcement learning
review: MDP, Bellman equation, Q-learning. Deep Q-Networks (DQN): Experience replay, target network.
Policy gradient methods: REINFORCE, Actor-Critic. Advanced DRL: A3C, PPO, DDPG. Transformers:
Self-attention, multi-head attention, BERT, GPT (concepts). Applications: Game playing (AlphaGo),
autonomous driving, robotics, NLP

### Learning Resources

**Textbooks:**

1. Ian Goodfellow, Yoshua Bengio, Aaron Courville, "Deep Learning", MIT Press, 2016
2. Francois Chollet, "Deep Learning with Python", 2nd Edition, Manning, 2021

**Reference Books:**

1. Josh Patterson, Adam Gibson, "Deep Learning: A Practitioner's Approach", O'Reilly, 2017
2. Aston Zhang, Zachary C. Lipton, et al., "Dive into Deep Learning", Cambridge University Press,
   2023
3. Charu C. Aggarwal, "Neural Networks and Deep Learning: A Textbook", Springer, 2018
4. Nikhil Buduma, "Fundamentals of Deep Learning", O'Reilly, 2017

---

## Professional Electives (Semester VI)

### 23A54603a: Big Data Analytics

**Contents:** Big data fundamentals (3Vs, 5Vs), Hadoop ecosystem (HDFS, MapReduce, YARN), NoSQL
databases (HBase, Cassandra, MongoDB), Apache Spark (RDDs, DataFrames, Spark SQL), Stream processing
(Kafka, Flink), Data warehouse and OLAP, Pig and Hive

### 23A54603b: Image Processing

**Contents:** Digital image fundamentals (sampling, quantization, color models), Image enhancement
(histogram processing, spatial filtering, frequency domain filtering), Image restoration (noise
models, Wiener filter), Image segmentation (thresholding, edge detection, Hough transform,
region-based), Feature extraction (SIFT, HOG, LBP), Image compression (JPEG, lossless/lossy), OpenCV
implementation

### 23A54604a: Internet of Things

**Contents:** IoT fundamentals (architecture, protocols, M2M communication), IoT devices (sensors,
actuators, Arduino, Raspberry Pi, ESP8266/ESP32), Communication protocols (MQTT, CoAP, HTTP, ZigBee,
LoRaWAN, BLE), IoT networking (6LoWPAN, RPL), Cloud platforms (AWS IoT, Azure IoT, ThingSpeak), Data
analytics for IoT, Security challenges in IoT

### 23A54604b: Cyber Security

**Contents:** Cyber threats and vulnerabilities, Network security (firewalls, IDS/IPS), Web security
(OWASP Top 10, SQL injection, XSS, CSRF), Malware analysis, Digital forensics (evidence collection,
analysis, chain of custody), Penetration testing methodologies, Cryptography applications, Security
policies and compliance (ISO 27001, GDPR)

---

## Laboratory Courses (Semester VI)

### 23A54605: Compiler Design Lab

**Practical:** 3 Hours/Week | Assignments: Lex program for token recognition, Implementation of
lexical analyzer using LEX/FLEX, Recursive descent parser for expression grammar, Shift-reduce
parser, YACC program for calculator, Three-address code generation, Symbol table implementation

### 23A54606: Deep Learning Lab

**Practical:** 3 Hours/Week | Assignments: MLP for MNIST classification, CNN for CIFAR-10 image
classification, Transfer learning with pre-trained models (VGG16, ResNet50), LSTM for text
classification/sentiment analysis, Autoencoder for anomaly detection, DCGAN for image generation,
Image captioning using CNN+LSTM

### 23A54607: Skill Course — UI/UX Design

**Contents:** Design thinking process (empathy, define, ideate, prototype, test), User research
methods (interviews, surveys, usability testing), Information architecture, Wireframing
(low-fidelity, high-fidelity), Prototyping tools (Figma, Adobe XD, Sketch), Visual design principles
(color theory, typography, layout, accessibility), Interaction design, Design systems, Portfolio
development

---

# Semester VII — Course Structure

| S.No | Course Code | Course Name              | L:T:P | Credits | CIE | SEE | Total |
| ---- | ----------- | ------------------------ | :---: | :-----: | :-: | :-: | :---: |
| 1    | 23A54701a/b | Professional Elective V  | 3:0:0 |    3    | 30  | 70  |  100  |
| 2    | 23A54702a/b | Professional Elective VI | 3:0:0 |    3    | 30  | 70  |  100  |
| 3    | 23A54703a/b | Open Elective I          | 3:0:0 |    3    | 30  | 70  |  100  |
| 4    | 23A54704    | Major Project Phase I    | 0:0:6 |    3    | 50  |  –  |  50   |
| 5    | 23A54705    | Technical Seminar        | 0:0:3 |    2    | 50  |  –  |  50   |
|      | **Total**   |                          |       | **14**  |     |     |       |

## Professional Electives (Semester VII)

### 23A54701a: Natural Language Processing

**Contents:** NLP fundamentals (tokenization, stemming, lemmatization, POS tagging, NER), Language
models (n-grams, smoothing), Syntax and parsing (CFG, dependency parsing), Semantics (word senses,
WordNet, word embeddings — Word2Vec, GloVe, FastText), Sequence labeling (HMM, MEMM, CRF),
Transformers (attention, BERT, GPT, T5), Applications: machine translation, sentiment analysis,
question answering, text summarization, chatbots

### 23A54701b: Blockchain Technology

**Contents:** Blockchain fundamentals (decentralization, distributed ledger, consensus),
Cryptography (hash functions, digital signatures, Merkle trees), Bitcoin architecture (transactions,
blocks, mining, proof-of-work), Ethereum (smart contracts, EVM, Solidity, DApps), Hyperledger
(Fabric, Composer), Consensus algorithms (PoW, PoS, PBFT, Raft), Wallets, tokens, and ICOs,
Blockchain applications (supply chain, healthcare, finance), Scalability and security issues

### 23A54702a: Distributed Systems

**Contents:** Distributed systems fundamentals (characteristics, goals, types), Communication (RPC,
RMI, message passing, REST), Synchronization (logical clocks, vector clocks, Lamport's algorithm,
election algorithms, mutual exclusion), Consistency models (eventual, sequential, causal, strong),
Replication (primary-backup, multi-master, quorum-based), Fault tolerance (failure detection,
Byzantine fault tolerance), Distributed file systems (GFS, HDFS), Distributed databases (DynamoDB,
Cassandra), MapReduce, Microservices

### 23A54702b: Computer Vision

**Contents:** Image formation (camera model, perspective projection, lighting, color), Features and
matching (SIFT, SURF, ORB, feature matching, RANSAC), Object recognition (bag-of-words, deformable
parts model, R-CNN, YOLO), Motion analysis (optical flow, KLT tracker), 3D vision (stereo vision,
structure from motion, SLAM), Face recognition, Applications (autonomous vehicles, medical imaging,
augmented reality)

### 23A54703a: Entrepreneurship

**Contents:** Entrepreneurial mindset, Opportunity recognition, Business model canvas, Lean startup
methodology, Market research and validation, Financial planning (revenue models, break-even
analysis, fundraising), Legal aspects (IPR, patents, trademarks, contracts), Team building and
leadership, Pitching and presentation, Case studies of successful startups

### 23A54703b: Disaster Management

**Contents:** Disasters: natural (earthquakes, floods, cyclones, tsunamis, landslides) and man-made
(industrial accidents, fires, terrorism), Disaster management cycle (prevention, mitigation,
preparedness, response, recovery), Risk assessment and vulnerability analysis, Early warning
systems, Emergency response planning, Disaster recovery and rehabilitation, Role of technology (GIS,
remote sensing, IoT) in disaster management

---

# Semester VIII — Course Structure

| S.No | Course Code | Course Name             | L:T:P  | Credits | CIE | SEE | Total |
| ---- | ----------- | ----------------------- | :----: | :-----: | :-: | :-: | :---: |
| 1    | 23A54801    | Major Project Phase II  | 0:0:16 |    8    | 100 | 100 |  200  |
| 2    | 23A54802    | Comprehensive Viva Voce | 0:0:0  |    2    |  –  | 50  |  50   |
|      | **Total**   |                         |        | **10**  |     |     |       |

---

> **Official Source:** https://www.jntua.ac.in/syllabus | JNTUA, Ananthapuramu
