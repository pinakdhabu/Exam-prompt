---

**Total No. of Questions : 8**

**SEAT No. :**

**[6262]-35**

**T.E. (Computer Engineering)**

**DATABASE MANAGEMENT SYSTEMS**

**(2019 Pattern) (Semester - I) (310241)**

**Time : 2½ Hours]** | **[Max. Marks : 70**

---

**Instructions to the candidates:**

1. Answer Q.1 or Q.2, Q.3 or Q.4, Q.5 or Q.6, Q.7 or Q.8.
2. Neat diagrams must be drawn wherever necessary.
3. Figures to the right indicate full marks.
4. Assume suitable data, if necessary.

---

### Unit III — Relational Database Design

**Q1)** **a)** What is functional dependency? Explain Armstrong's Axioms with suitable examples. [9]

**b)** Consider the relation R(A, B, C, D, E) with functional dependencies: FD1: A → BC \
FD2: CD → E \
FD3: B → D \
FD4: E → A

i) Find all candidate keys for R. \
ii) Determine the highest normal form of R. \
iii) Decompose R into 3NF if necessary. [9]

**OR**

**Q2)** **a)** What is database normalization? Explain 1NF, 2NF, 3NF and BCNF with suitable examples
for each. [8]

**b)** Consider the relation R(A, B, C, D, E, F) with functional dependencies: FD1: A → B \
FD2: C → D \
FD3: D → E \
FD4: B → F

Check whether the decomposition of R into R1(A, B, F), R2(C, D, E) and R3(A, C) is lossless. Justify
your answer. [9]

---

### Unit IV — Database Transaction Management

**Q3)** **a)** Explain ACID properties with suitable examples for each property. Draw the state
diagram showing all possible states of a transaction. [9]

**b)** Consider the following schedule:

| T1   | T2   | T3   |
| ---- | ---- | ---- |
| R(A) |      |      |
|      | W(A) |      |
| R(B) |      |      |
|      |      | R(A) |
|      | R(B) |      |
| W(A) |      |      |
|      | W(B) |      |
|      |      | W(A) |

Check whether the schedule is conflict serializable. If yes, give the equivalent serial schedule.
[9]

**OR**

**Q4)** **a)** Explain timestamp-based concurrency control protocol. Discuss how read_TS and
write_TS ensure serializability with an example. [9]

**b)** What is deadlock? Explain deadlock prevention, deadlock detection and deadlock avoidance
techniques in detail. [9]

---

### Unit V — NoSQL Databases

**Q5)** **a)** Explain the CAP theorem. Discuss how different NoSQL databases make trade-offs
between consistency, availability and partition tolerance. [9]

**b)** Compare RDBMS and NoSQL databases on at least 8 parameters. Explain the BASE properties of
NoSQL databases. [9]

**OR**

**Q6)** **a)** Explain the different types of NoSQL data models: key-value store, document store,
column-family store and graph database. Give one real-world example for each. [9]

**b)** Explain MongoDB CRUD operations with syntax and examples for: i) Insert operations
(insertOne, insertMany) ii) Query operations (find with filters) iii) Update operations (updateOne,
updateMany) iv) Delete operations (deleteOne, deleteMany) [8]

---

### Unit VI — Advances in Databases

**Q7)** **a)** What is semi-structured data? Explain the features of semi-structured data models.
Compare JSON and XML as semi-structured data formats. [9]

**b)** Explain Object-Relational Database System. Discuss table inheritance and object-relational
mapping (ORM) with examples. [9]

**OR**

**Q8)** **a)** Write short notes on any three: i) Active databases ii) Deductive databases iii)
Spatial databases iv) Main memory databases [9]

**b)** Explain nested data types with respect to JSON and XML. Write a JSON document representing a
university with departments, courses and students. [8]

---

---

## Examiner Commentary

This paper covers all four end-semester units with balanced weightage. Q1/Q2 test normalization
depth (including candidate key computation), Q3/Q4 test transaction concepts with a real
serializability check, Q5/Q6 cover NoSQL fundamentals with MongoDB syntax, and Q7/Q8 cover advanced
database topics with a JSON writing task.
