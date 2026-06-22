# Database Management Systems (PCC-251-COM) — IMP Topics 2024 Pattern

> **SPPU SE Computer Engineering | Semester IV | ESE: 70 Marks, CCE: 30 Marks**
> **⚠️ Note:** 2024 Pattern subject. Predictions based on official syllabus + cross-reference with TE-level DBMS PYQs (which share ~60% content overlap).

---

## Section A — Must-Prepare IMP Topics (Unit-wise)

### Unit I: Introduction to Database Management System (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **DBMS — definition, purpose, advantages over file system** | >70% | 5M | Foundation question |
| **Database System Architecture (3-level schema)** | >70% | 5M Diagram + explain | Very high frequency |
| **ER Model — Entity, Attributes, Relationships** | >70% | 5-10M Draw ER diagram | **Extremely important** |
| **Keys — Candidate, Primary, Foreign, Super, Composite** | >70% | 2-5M | Every exam |
| **ER Diagram design for given problem** | >70% | 10M | **Guaranteed — draw ERD for Library/Student/Hospital** |
| **Extended EER Features** — Generalization, Specialization, Aggregation | >70% | 5M | Important |
| **Converting ER/EER to tables (relational model)** | >70% | 5M | Very important |
| Design Issues in ER Model | 50-70% | 2M | Quick question |
| Enterprise Constraints | 50-70% | 2M | Secondary |
| Database Languages (DDL, DML, DCL, TCL) | >70% | 2M | Quick but important |

### Unit II: SQL and PL/SQL (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **SQL DDL Commands — CREATE, ALTER, DROP, RENAME** | >70% | 5M Write queries | Very important |
| **SQL DML — SELECT, INSERT, UPDATE, DELETE** | >70% | 5-10M Write queries | **Core of this unit** |
| **Aggregate Functions — GROUP BY, HAVING** | >70% | 5M Write query | Very important |
| **Joins — Inner, Outer, Cross, Natural** | >70% | 5-10M Write queries | **HIGHEST PRIORITY** |
| **Subqueries / Nested Queries** | >70% | 5M Write query | Frequently asked |
| **Views and Indexes** | >70% | 2-5M | Important |
| **PL/SQL Architecture and Advantages** | >70% | 5M | Important |
| **PL/SQL Blocks, Variables, Constants** | >70% | 5M Write code | Important |
| **Cursors in PL/SQL** | >70% | 5M Write code | Very important |
| **Procedures and Functions** | >70% | 5M Write code | Very important |
| **Packages in PL/SQL** | >70% | 5M Write code | Important |
| **Triggers** | >70% | 5M Write code | Very important |
| UNION, INTERSECT, MINUS | 50-70% | 2M | Quick query |

### Unit III: Relational Database Design (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Relational Model concepts** | >70% | 2-5M | Foundation |
| **Codd's Rules** | >70% | 5M List and explain | Classic question |
| **Relational Integrity — Domain, Entity, Referential** | >70% | 5M Explain | Very important |
| **Relational Algebra — Select, Project, Join, Cross Product** | >70% | 5-10M | Very important |
| **Functional Dependencies** | >70% | 5M Find FDs | Important |
| **Inference Rules (Armstrong's)** | >70% | 5M Apply | Important |
| **Minimal Cover / Minimal Sets** | 50-70% | 5M Find minimal cover | Moderate |
| **Normalization — 1NF, 2NF, 3NF** | >70% | 5-10M Normalize relation | **HIGHEST PRIORITY** |
| **BCNF** | >70% | 5M Check BCNF | Very important |
| 4NF, 5NF | 50-70% | 2-5M | Secondary |

### Unit IV: Transaction Management and Concurrency Control (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **Transaction Concept — ACID Properties** | >70% | 5M Explain | **Guaranteed question** |
| **Transaction States — diagram** | >70% | 5M Draw state diagram | Very important |
| **Serializability — Conflict and View** | >70% | 5-10M Check serializability | Important |
| **Lock-based Protocols** | >70% | 5M Explain | Very important |
| **Timestamp-based Protocols** | >70% | 5M Explain | Important |
| Validation-based Protocols | 50-70% | 5M | Secondary |
| **Deadlock — Detection, Prevention, Recovery** | >70% | 5M | Important |
| **Log-based Recovery** | >70% | 5M Explain | Very important |
| Shadow Paging | 50-70% | 5M | Moderate |
| Checkpoints | >70% | 2M | Quick question |

### Unit V: NoSQL Databases (9 hrs)

| Topic | Prob. % | Question Type | Why Important |
|-------|---------|---------------|---------------|
| **NoSQL — Need, Characteristics** | >70% | 5M Explain | New in syllabus, likely asked |
| **CAP Theorem** | >70% | 5M Explain with diagram | Extremely important |
| **BASE Properties** | >70% | 2-5M | Important |
| **Types of NoSQL — Document, Key-Value, Column-family, Graph** | >70% | 5-10M Compare | Very important |
| **SQL vs NoSQL comparison** | >70% | 5M Compare table | Classic question |
| **MongoDB — Data Model** | >70% | 5M Explain | Important |
| **MongoDB CRUD Operations** | >70% | 5M Write queries | Very important |
| **MongoDB Aggregation** | 50-70% | 5M Write pipeline | Moderate |
| **MongoDB Indexing** | 50-70% | 5M Explain | Moderate |

---

## Section B — High-Yield Numerical Topics

| Unit | Numerical Topic | Frequency |
|------|----------------|-----------|
| I | **ER Diagram to Relational Schema conversion** | Very High |
| II | **SQL Query writing** (aggregation, joins, subqueries) | Very High |
| II | **PL/SQL code writing** (triggers, procedures, cursors) | Very High |
| III | **Normalization — convert to 1NF/2NF/3NF/BCNF** | Very High |
| III | **Relational Algebra expressions** | High |
| IV | **Conflict Serializability check (precedence graph)** | High |
| IV | **ACID property identification** | High |

---

## Section C — High-Yield Diagram Topics

| Unit | Diagram Topic | Key Labels |
|------|---------------|------------|
| I | **ER Diagram** (Library/Student/Hospital Management) | Entities, Attributes, Relationships, Cardinality |
| I | 3-Level Schema Architecture | External, Conceptual, Internal |
| I | EER — Generalization/Specialization | IS-A hierarchy |
| IV | Transaction State Diagram | Active, Partially Committed, Failed, Aborted, Committed |
| IV | Precedence Graph (for serializability) | Transactions, edges |
| V | CAP Theorem triangle | Consistency, Availability, Partition tolerance |

---

## Section D — IMP Questions by Marks

### 2-Mark Questions
1. What is ACID property?
2. Define candidate key and foreign key.
3. What is a view in SQL?
4. What is CAP theorem?
5. Difference between SQL and NoSQL.
6. What is a trigger in PL/SQL?
7. What is 1NF, 2NF, 3NF?
8. What is a cursor?
9. What is a deadlock in transaction management?
10. Define functional dependency.

### 5-Mark Questions
1. Explain 3-level DBMS architecture with diagram.
2. Write SQL queries for a given Student table (GROUP BY, HAVING, subquery).
3. Explain PL/SQL cursor with a program.
4. Find all functional dependencies and normalize to 3NF.
5. Explain ACID properties with examples.
6. Compare Document-based and Key-Value NoSQL databases.
7. Write a PL/SQL trigger for auditing table changes.
8. Explain conflict serializability with a precedence graph.
9. Convert ER diagram to relational schema.
10. Explain MongoDB CRUD operations with examples.

### 10-Mark Questions
1. Design an ER diagram for a Library Management System. Convert it to relational schema with all keys identified.
2. Write a PL/SQL block using cursor to fetch and display employee details from a table.
3. Given a relation R(A,B,C,D) with FDs, find the minimal cover and normalize up to BCNF.
4. Check whether the following schedule is conflict serializable: (provide schedule). Draw precedence graph.
5. Write SQL queries using joins, subqueries, aggregate functions for a Banking database.
6. Compare SQL and NoSQL databases. Explain CAP theorem and BASE properties.
7. Write a PL/SQL procedure to calculate bonus for employees based on salary.
8. Explain all normalization forms (1NF through BCNF) with a single example relation at each step.

---

## Section E — Cross-Unit Question Prediction

| Units | Combined Topic | Likely Format |
|-------|----------------|---------------|
| I + III | ER Diagram design + Normalization of resulting schema | 10M |
| II + III | SQL queries on normalized tables | 5-10M |
| III + IV | Transaction management on normalized database | 5M |
| I + V | SQL vs NoSQL for different application types | 5M Compare |

---

## Section F — Emergency Plan (1 Night Before)

**Absolute Bare Minimum:**
1. ER Diagram design — practice 2 diagrams (Library + Student management)
2. SQL queries — practice JOINs, GROUP BY, subqueries
3. Normalization — 1NF to BCNF with one example
4. ACID properties — definition + 1 example each
5. CAP Theorem — diagram + explanation

**Quick Memory Tricks:**
- **ACID:** **"ACID"** = Atomicity, Consistency, Isolation, Durability
- **CAP:** **"CAP"** = Consistency, Availability, Partition tolerance (pick 2)
- **Normalization forms:** **"1-2-3-B"** = 1NF (atomic), 2NF (no partial), 3NF (no transitive), BCNF (determinant = candidate key)
- **NoSQL types:** **"DKCG"** = Document, Key-value, Column-family, Graph
