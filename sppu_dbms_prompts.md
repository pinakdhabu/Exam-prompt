# SPPU DBMS (Database Management Systems) Optimized Prompts
## Based on 2019 Pattern Syllabus (Subject: 310241)

### 2 Mark Questions

**Define Database Management System [2 marks]**
Time Budget (2 min):
  Definition/Intro   ~1.5 min
  Conclusion         ~0.5 min

A **Database Management System (DBMS)** is software that enables users to define, create, maintain, and control access to databases.
It provides an interface between applications and data while ensuring data integrity, security, and concurrent access.

**[Atomicity]**: Ensures transactions are all-or-nothing operations.
**[Consistency]**: Maintains database validity before and after transactions.
[Isolation]: Prevents interference between concurrent transactions.
[Durability]: Guarantees committed transactions persist despite failures.

Thus, ACID properties ensure reliable transaction processing in DBMS.
Hence it is widely used in enterprise banking systems.
================================================================
MARKING SCHEME  Q.No.                         [6 Marks]
  Definition / Introduction      : 1 mark
  Main Points (4 x 1 mark each)  : 4 marks
  Example                        : 1 mark
  Conclusion                     : 1 mark
                                    -------
  Total                          : 6 marks
================================================================

**Explain ER Model with suitable example [6 marks]**
Time Budget (6 min):
  Definition/Intro   ~1 min
  Main points        ~3 min
  Example            ~1 min
  Conclusion         ~1 min

**Entity-Relationship (ER) Model** is a conceptual data model that represents real-world entities and their relationships in a database.
It provides a high-level view of data structure before implementation.

**Entity**: A real-world object distinguishable from other objects (e.g., Student, Course).
**Attribute**: Properties describing an entity (e.g., Student has roll_no, name, age).
**Relationship**: Association among two or more entities (e.g., Student enrolls in Course).
**Cardinality**: Specifies number of instances of one entity that can be associated with another (e.g., one-to-many).

Example: University database where Student entity (roll_no, name) has enrolls relationship with Course entity (code, title).

Thus, ER model provides a clear blueprint for database design.
Hence it is widely used in the initial phase of database development.
================================================================
MARKING SCHEME  Q.No.                         [6 Marks]
  Definition / Introduction      : 1 mark
  Main Points (4 x 1 mark each)  : 4 marks
  Example                        : 1 mark
  Conclusion                     : 1 mark
                                    -------
  Total                          : 6 marks
================================================================

**Explain 3NF with example [6 marks]**
Time Budget (6 min):
  Definition/Intro   ~1 min
  Main points        ~3 min
  Example            ~1 min
  Conclusion         ~1 min

**Third Normal Form (3NF)** is a database normalization technique where a table is in 2NF and no non-prime attribute is transitively dependent on the primary key.
It eliminates transitive dependencies to reduce data redundancy and update anomalies.

**Conditions for 3NF**:
1. Table must be in Second Normal Form (2NF)
2. No non-prime attribute should depend on another non-prime attribute
3. Every determinant must be a candidate key

Example: Consider Student_Course table with (student_id, course_id, instructor_name, dept). Here dept depends on instructor_name (transitive dependency via course_id). To normalize: split into Course table (course_id, instructor_name, dept) and Enrollment table (student_id, course_id).

Thus, 3NF eliminates transitive dependencies ensuring data integrity.
Hence it is widely used in relational database design for minimizing redundancy.
================================================================
MARKING SCHEME  Q.No.                         [6 Marks]
  Definition / Introduction      : 1 mark
  Main Points (3 x 1 mark each)  : 3 marks
  Example                        : 1 mark
  Conclusion                     : 1 mark
                                    -------
  Total                          : 6 marks
================================================================

**Compare File System vs DBMS [6 marks]**
Time Budget (6 min):
  Definition/Intro   ~1 min
  Main points        ~3 min
  Conclusion         ~1 min

**File System** and **DBMS** differ in the following ways:

| File System                    | DBMS                            |
|--------------------------------|---------------------------------|
| Data stored in flat files      | Data stored in structured tables|
| No built-in security mechanisms| Provides authentication, authorization|
| Data redundancy is high        | Minimizes redundancy through normalization|
| Concurrent access leads to inconsistency| Ensures consistency via locking|
| Backup and recovery complex    | Built-in backup and recovery mechanisms|

Thus, File System is suitable for simple applications while DBMS is preferred for enterprise applications requiring data integrity.
================================================================
MARKING SCHEME  Q.No.                         [6 Marks]
  Definition / Introduction      : 1 mark
  Main Points (5 x 1 mark each)  : 5 marks
  Conclusion                     : 1 mark
                                    -------
  Total                          : 6 marks
================================================================