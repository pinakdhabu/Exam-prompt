---

**Total No. of Questions : 8**

**SEAT No. :**

**[6262]-64**

**T.E. (Computer Engineering)**

**SOFTWARE MODELING AND ARCHITECTURE**

**(2019 Pattern) (Semester - II) (310254(D))**

**Time : 2½ Hours]** | **[Max. Marks : 70**

---

**Instructions to the candidates:**

1. Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2. Neat diagrams must be drawn wherever necessary.
3. Figures to the right indicate full marks.
4. Assume suitable data, if necessary.

---

### Unit III — Object-Oriented Modeling

**Q1)** **a)** Explain Object-Oriented Modeling and OMT models. [9]

**Object-Oriented Modeling:** A design methodology that views a system as a collection of
interacting objects, each with its own data (attributes) and behavior (operations). OO modeling
captures the static structure, dynamic behavior, and functional requirements of a system.

**OMT (Object Modeling Technique) — Three Models:**

| Model                | Purpose             | Notation                          | What It Captures                                           |
| -------------------- | ------------------- | --------------------------------- | ---------------------------------------------------------- |
| **Object Model**     | Static structure    | Class diagrams                    | Objects, classes, attributes, operations, relationships    |
| **Dynamic Model**    | Temporal behavior   | State diagrams, sequence diagrams | States, events, transitions, object interactions over time |
| **Functional Model** | Data transformation | Data flow diagrams (DFDs)         | Processes, data flows, data stores, external entities      |

**Relationship:** The Object Model provides the context (nouns), the Dynamic Model captures control
flow (verbs/timing), and the Functional Model describes what operations do (transformation). They
are complementary views of the same system.

**b)** UML Class Diagram for Library Management System. [9]

```
┌─────────────────┐     ┌─────────────────────┐
│    Library      │1───▶│      Member          │
├─────────────────┤     ├─────────────────────┤
│ - name: String  │     │ - memberId: String   │
│ - address: Str  │     │ - name: String       │
├─────────────────┤     │ - email: String      │
│ + addMember()   │     │ - maxBooks: int      │
│ + removeMember()│     ├─────────────────────┤
│ + findBook()    │     │ + borrowBook()       │
└────────┬────────┘     │ + returnBook()       │
         │              │ + reserveBook()      │
         │              └─────────────────────┘
         │
┌────────▼────────┐     ┌─────────────────────┐
│      Book       │     │    Librarian         │
├─────────────────┤     ├─────────────────────┤
│ - isbn: String  │     │ - staffId: String    │
│ - title: String │     │ - name: String       │
│ - author: Str   │     │ - role: String       │
│ - available: bool│    ├─────────────────────┤
├─────────────────┤     │ + issueBook()        │
│ + checkOut()    │     │ + receiveBook()      │
│ + checkIn()     │     │ + generateReport()   │
│ + reserve()     │     └─────────────────────┘
└────────┬────────┘
         │           ┌─────────────────────┐
         │           │    Transaction       │
         └──────────▶├─────────────────────┤
                     │ - transId: String    │
                     │ - date: Date         │
                     │ - type: Issue/Return │
                     ├─────────────────────┤
                     │ + record()           │
                     └─────────────────────┘
```

**Relationships:**

- Library 1──\* Member (aggregation)
- Library 1──\* Book (aggregation)
- Library 1──\* Librarian (aggregation)
- Book 1──\* Transaction (association)
- Member 1──\* Transaction (association)
- Member, Librarian → Person (inheritance, if modeled)

---

**OR**

**Q2)** **a)** Explain UML and diagram types. [9]

**UML (Unified Modeling Language):** A standardized general-purpose modeling language for software
engineering. Created by Rational Software (Booch, Rumbaugh, Jacobson). Current version: UML 2.5.

**Structural Diagrams (Static view):**

| Diagram                 | Purpose                | Key Elements                                   |
| ----------------------- | ---------------------- | ---------------------------------------------- |
| **Class**               | System structure       | Classes, attributes, operations, relationships |
| **Component**           | Component organization | Components, interfaces, dependencies           |
| **Deployment**          | Physical architecture  | Nodes, artifacts, communication paths          |
| **Object**              | Instance snapshot      | Objects, links                                 |
| **Package**             | Namespace organization | Packages, dependencies                         |
| **Composite Structure** | Internal structure     | Parts, ports, connectors                       |

**Behavioral Diagrams (Dynamic view):**

| Diagram                  | Purpose                                    | Key Elements                        |
| ------------------------ | ------------------------------------------ | ----------------------------------- |
| **Use Case**             | System functionality from user perspective | Actors, use cases, system boundary  |
| **Sequence**             | Object interaction over time               | Lifelines, messages, execution bars |
| **Activity**             | Workflow and process flow                  | Actions, decisions, forks, joins    |
| **State Machine**        | Object lifecycle                           | States, transitions, events, guards |
| **Communication**        | Object interaction with links              | Objects, links, messages (numbered) |
| **Interaction Overview** | High-level interaction flow                | Interaction frames, decision nodes  |

**b)** Sequence Diagram for "Borrow Book" use case. [9]

```
Member           Librarian        Book            Database
  │                  │               │               │
  │──requestBook()──▶│               │               │
  │                  │──checkIsbn()─▶│               │
  │                  │               │──queryStock()─▶│
  │                  │               │◀──available───│
  │                  │◀──available───│               │
  │                  │               │               │
  │◀──askDetails()───│               │               │
  │──provideInfo()──▶│               │               │
  │                  │──verifyMember─────────────────▶│
  │                  │◀──memberValid──────────────────│
  │                  │               │               │
  │                  │──markBorrowed▶│               │
  │                  │               │──updateStock─▶│
  │                  │               │◀──updated─────│
  │                  │               │               │
  │                  │──createRecord────────────────▶│
  │◀──issueBook()────│               │               │
  │                  │               │               │
  │◀─────[alt: Book not available]────────────────────│
  │                  │──notifyUnavailable()───────────│
  │◀──sorryMessage──│               │               │
```

---

### Unit IV — Design Patterns

**Q3)** **a)** Design patterns and GoF classification. [9]

**Design Pattern:** A general, reusable solution to a commonly occurring problem in software design.
It is a template — not finished code.

**GoF (Gang of Four) — 23 Patterns in 3 Categories:**

| Category            | Focus                             | Examples                                                                                                                        |
| ------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Creational** (5)  | Object creation mechanisms        | **Singleton** (one instance), **Factory Method** (delegate creation to subclasses), Abstract Factory, Builder, Prototype        |
| **Structural** (7)  | Class/object composition          | **Adapter** (match interfaces), **Proxy** (placeholder), Decorator, Facade, Composite, Bridge, Flyweight                        |
| **Behavioral** (11) | Object interaction/responsibility | **Observer** (publish-subscribe), **Strategy** (interchangeable algorithms), Command, Iterator, State, Template Method, Visitor |

**Key Benefits:** Reusability, common vocabulary, design transparency, faster development, proven
solutions.

**b)** Singleton pattern implementation in Java. [8]

```java
public class Singleton {
    // Private static instance (lazy initialization)
    private static volatile Singleton instance;

    // Private constructor prevents instantiation
    private Singleton() {}

    // Thread-safe accessor (double-checked locking)
    public static Singleton getInstance() {
        if (instance == null) {
            synchronized (Singleton.class) {
                if (instance == null) {
                    instance = new Singleton();
                }
            }
        }
        return instance;
    }
}
```

**When to use:** Exactly one instance needed (logger, configuration manager, thread pool, connection
pool).

**Issues:**

- **Thread safety** — Requires synchronization (solved above)
- **Serialization** — Deserialization creates new instance (use `readResolve()`)
- **Testing** — Hard to mock, global state, introduces hidden dependencies

---

**OR**

**Q4)** **a)** Observer pattern with example. [9]

**Observer Pattern:** Defines a one-to-many dependency between objects so that when one object
(Subject) changes state, all its dependents (Observers) are notified automatically.

**Real-world example — Weather Station:**

```
┌──────────────────────┐         ┌──────────────────────┐
│     Subject          │         │     Observer         │
│  (WeatherStation)    │         │  <<interface>>       │
├──────────────────────┤         ├──────────────────────┤
│ - observers: List    │◀────────│ + update(temp, hum)  │
│ + attach(obs)        │         └──────────────────────┘
│ + detach(obs)        │                  ▲
│ + notifyAll()        │                  │
└──────────┬───────────┘                  │
           │                     ┌────────┴────────┐
           │                     │                 │
┌──────────▼───────────┐  ┌─────┴──────┐  ┌───────┴──────┐
│ ConcreteSubject      │  │ PhoneDisplay│  │  WebDisplay  │
│  (WeatherStation)    │  │            │  │              │
├──────────────────────┤  │+ update()  │  │ + update()   │
│ - temperature: float │  └────────────┘  └──────────────┘
│ - humidity: float    │
│ + setMeasurements()  │
└──────────────────────┘
```

**Push vs Pull:**

- **Push** — Subject pushes data to observers (tight coupling, but simpler)
- **Pull** — Observers query subject for needed data (looser coupling, more flexible)

**b)** Compare Strategy and State patterns. [8]

| Aspect              | Strategy                            | State                                         |
| ------------------- | ----------------------------------- | --------------------------------------------- |
| **Intent**          | Select algorithm at runtime         | Change behavior when state changes            |
| **Who controls**    | Client selects strategy             | Context transitions between states            |
| **State knowledge** | Strategies are independent          | States know about other states                |
| **Analogy**         | Payment method (credit, debit, UPI) | Vending machine (idle, selecting, dispensing) |
| **When to use**     | Multiple interchangeable algorithms | Object behavior depends on internal state     |

**Strategy Example:**

```java
interface PaymentStrategy { void pay(int amount); }
class CreditCardPayment implements PaymentStrategy { /* ... */ }
class UpiPayment implements PaymentStrategy { /* ... */ }

class ShoppingCart {
    PaymentStrategy strategy;
    void checkout(int amount) { strategy.pay(amount); }
}
```

**State Example:**

```java
interface VendingState { void insertCoin(); void dispense(); }
class IdleState implements VendingState { /* ... */ }
class DispensingState implements VendingState { /* ... */ }

class VendingMachine {
    VendingState state = new IdleState();
    void insertCoin() { state.insertCoin(); }
}
```

---

### Unit V — Component-Based and Service-Oriented Architecture

**Q5)** **a)** Component-Based Software Engineering (CBSE). [9]

**CBSE:** A software engineering approach that emphasizes the design and construction of systems
using reusable software components.

**Component Design Principles:**

| Principle          | Description                                           |
| ------------------ | ----------------------------------------------------- |
| **Reusability**    | Components designed for multiple contexts             |
| **Replaceability** | One component can be swapped for another              |
| **Independence**   | Minimal coupling with other components                |
| **Encapsulation**  | Internal details hidden behind well-defined interface |
| **Composability**  | Components can be assembled to form larger systems    |

**Component vs Object:**

| Feature         | Component                              | Object                       |
| --------------- | -------------------------------------- | ---------------------------- |
| **Granularity** | Coarse                                 | Fine                         |
| **Deployment**  | Independent binary                     | Part of class hierarchy      |
| **Interface**   | Explicit (provides/requires)           | Implicit (method signatures) |
| **State**       | Can be stateless or stateful           | Typically stateful           |
| **Language**    | Language-independent (CORBA, COM, EJB) | Language-specific            |

**b)** Service-Oriented Architecture (SOA) principles. [9]

**SOA:** An architectural pattern where software components provide services to other components via
a network communication protocol.

**SOA Principles:**

1. **Loose Coupling** — Services minimize dependencies on each other
2. **Service Abstraction** — Services hide internal logic from outside world
3. **Reusability** — Logic divided into services for reuse across applications
4. **Autonomy** — Services control the logic they encapsulate
5. **Statelessness** — Services avoid managing state between requests (defer to databases)
6. **Discoverability** — Services can be discovered via service registry
7. **Composability** — Services can compose into larger services

---

**OR**

**Q6)** **a)** SOA vs Microservices comparison. [9]

| Aspect                  | SOA                                                  | Microservices                            |
| ----------------------- | ---------------------------------------------------- | ---------------------------------------- |
| **Service Granularity** | Coarse-grained (business services)                   | Fine-grained (single capability)         |
| **Communication**       | ESB (Enterprise Service Bus), heavy protocols (SOAP) | Lightweight (HTTP/REST, gRPC, messaging) |
| **Data Management**     | Shared database, global schema                       | Database per service (decentralized)     |
| **Deployment**          | Monolithic deployment (war/ear files)                | Independent deployment (containers)      |
| **Governance**          | Centralized (enterprise standards)                   | Decentralized (team autonomy)            |
| **Scalability**         | Vertical (scale up)                                  | Horizontal (scale individual services)   |
| **Technology**          | Homogeneous (same stack)                             | Polyglot (different stacks per service)  |

**b)** RESTful Web Services. [9]

**REST (Representational State Transfer):** An architectural style for distributed hypermedia
systems, defined by Roy Fielding.

**REST Principles:**

1. **Stateless** — Each request from client contains all necessary information
2. **Uniform Interface** — Consistent resource identification via URIs
3. **Cacheable** — Responses define cacheability (Cache-Control headers)
4. **Layered System** — Client cannot tell if connected directly to end server or intermediary
5. **Code on Demand** (optional) — Server can extend client functionality

**HTTP Methods and Resource Naming:**

| Method     | CRUD           | Collection (e.g., /books) | Item (e.g., /books/123)  |
| ---------- | -------------- | ------------------------- | ------------------------ |
| **GET**    | Read           | List all books            | Get book 123             |
| **POST**   | Create         | Create new book           | — (not used)             |
| **PUT**    | Update/Replace | —                         | Replace book 123         |
| **PATCH**  | Partial Update | —                         | Update book 123's author |
| **DELETE** | Delete         | Delete all books          | Delete book 123          |

**Naming Conventions:** Nouns for resources (`/books`, `/users/5/orders`), plural forms, lowercase,
hyphens for readability (`/order-items`).

---

### Unit VI — Architecture Evaluation and Documentation

**Q7)** **a)** ATAM (Architecture Tradeoff Analysis Method) process. [9]

**ATAM:** A structured method for evaluating software architectures against quality attributes.
Developed by SEI (Software Engineering Institute, Carnegie Mellon).

**ATAM Steps:**

1. **Presentation** — Evaluator presents ATAM to stakeholders
2. **Business Drivers** — Project decision-maker presents business goals (time-to-market, cost,
   performance)
3. **Architecture Presentation** — Architect presents the candidate architecture
4. **Identify Architectural Approaches** — Document key architectural decisions and patterns
5. **Generate Quality Attribute Utility Tree** — Stakeholders create utility tree with scenarios for
   performance, modifiability, security, availability
6. **Analyze Architectural Approaches** — Map scenarios to architecture decisions; identify risks,
   non-risks, sensitivity points, tradeoffs
7. **Brainstorm and Prioritize Scenarios** — Additional stakeholder scenarios generated and
   prioritized by voting
8. **Analyze Scenarios** — Evaluate prioritized scenarios against architecture
9. **Present Results** — Summarize findings: risks, non-risks, sensitivity points, tradeoffs, themes

**Outputs:** Risk themes (systematic risks), tradeoff points, documented architecture decisions.

**b)** 4+1 View Model. [8]

**Proposed by:** Philippe Kruchten (Rational Software, 1995).

```
                    ┌─────────────────────┐
                    │   Logical View      │
                    │  (End-user, struc-  │
                    │   ture, class diag.)│
                    └──────────┬──────────┘
                               │
         ┌─────────────────────┼─────────────────────┐
         │                     │                     │
┌────────▼────────┐  ┌────────▼────────┐  ┌─────────▼────────┐
│  Process View   │  │  Scenarios      │  │  Development View│
│ (System integ-  │  │  (+1 view)      │  │  (Programmers,   │
│  rator, perform-│◀─│  Use cases      │──▶│  components,     │
│  ance, threads) │  │  Sequence diag. │  │  package diag.)  │
└─────────────────┘  └─────────────────┘  └──────────────────┘
                               │
                    ┌──────────▼──────────┐
                    │   Physical View     │
                    │  (System admin,     │
                    │   deployment diag.) │
                    └─────────────────────┘
```

| View              | Stakeholder        | Focus                                         | Diagram Type       |
| ----------------- | ------------------ | --------------------------------------------- | ------------------ |
| **Logical**       | End-user, customer | Functional requirements, what the system does | Class, state       |
| **Process**       | Integrator         | Concurrency, performance, scalability         | Activity, sequence |
| **Development**   | Developer          | Module organization, code structure           | Component, package |
| **Physical**      | System admin       | Deployment, hardware mapping                  | Deployment         |
| **+1: Scenarios** | All                | Unify all views, validation                   | Use case, sequence |

---

**OR**

**Q8)** **a)** IEEE 1471-2000 conceptual framework. [9]

**IEEE 1471-2000:** Recommended Practice for Architectural Description of Software-Intensive Systems
(superseded by ISO/IEC 42010:2011).

**Conceptual Framework:**

| Concept                            | Definition                                                                                          |
| ---------------------------------- | --------------------------------------------------------------------------------------------------- |
| **System**                         | Collection of components organized to accomplish a specific function                                |
| **Architecture**                   | Fundamental concepts/properties of a system embodied in its elements, relationships, and principles |
| **Architectural Description (AD)** | Work product used to express the architecture                                                       |
| **Stakeholder**                    | Individual/group with an interest in the system                                                     |
| **Concern**                        | Interest pertaining to the system (performance, reliability, security, cost)                        |
| **View**                           | Representation of the system from the perspective of related concerns                               |
| **Viewpoint**                      | Specification of conventions for constructing and using a view                                      |
| **Rationale**                      | Explanation of architectural decisions and their justification                                      |
| **Mission**                        | Overall functional objective of the system                                                          |
| **Environment**                    | Context determining the boundaries of the system                                                    |

**Key Innovation:** IEEE 1471 separates **view** (what you see) from **viewpoint** (how you look). A
viewpoint defines the language, notation, and modeling techniques for a view.

**b)** Short notes (any two): [8]

**i) Software Architecture Documentation:**

- Captures architectural decisions, not just diagrams
- Key sections: Overview, Stakeholders, Concerns, Views, Rationale
- Document as lightweight as possible (ARC42 template, ADRs)
- Keep synchronized with implementation (outdated docs = harmful)

**ii) Architecture Decision Records (ADRs):**

- Short documents capturing architectural decisions and their context
- Format: Title, Status (Proposed/Accepted/Deprecated), Context, Decision, Consequences
- Lightweight (1-2 pages per decision)
- Stored in source control alongside code (`docs/adr/NNN-title.md`)

**Example ADR:**

```markdown
# ADR-001: Use PostgreSQL for Primary Database

**Status:** Accepted
**Context:** Need a reliable, ACID-compliant database for financial transactions.
**Decision:** PostgreSQL 16 with pgBouncer for connection pooling.
**Consequences:** +ACID compliance, +JSON support, -Requires DBA expertise.
```

**iii) SAAM (Software Architecture Analysis Method):**

- Earlier architecture evaluation method (precursor to ATAM)
- Focuses on modifiability and functional requirements
- Steps: Develop scenarios, describe architecture, classify scenarios, evaluate interactions
- Simpler than ATAM but less comprehensive

---

---

## Examiner Commentary

This paper covers the complete SMA syllabus: OO modeling with UML (class/sequence diagrams, OMT
models), GoF design patterns (Singleton, Observer, Strategy, State), component-based architecture
(CBSE), service-oriented architecture (SOA, Microservices, REST), and architecture evaluation (ATAM,
4+1 View Model, IEEE 1471, ADRs). The UML diagram exercises test practical modeling skills, pattern
implementation questions assess design competency, and comparison questions (SOA vs Microservices,
Strategy vs State) evaluate analytical thinking.
