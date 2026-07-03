# DBMS Revision Notes

## Unit 1: Introduction to Databases

### What is a DBMS?

A **Database Management System (DBMS)** is software that manages, stores, retrieves, and manipulates
data efficiently.

> "A DBMS serves as an interface between the user and the database."

### Key Characteristics

- **Data Independence** — Separation of data and programs
- **Data Integrity** — Accuracy and consistency of data
- **Security** — Access control mechanisms
- **Concurrency Control** — Multiple users simultaneous access
- **Backup & Recovery** — Crash recovery mechanisms

### Three-Schema Architecture

1. **Physical Level** — How data is stored (blocks, pages)
2. **Conceptual Level** — What data is stored (tables, relationships)
3. **External Level** — How users view data (views)

### Important Terminologies

| Term            | Definition                             |
| --------------- | -------------------------------------- |
| **Tuple**       | A single row in a table                |
| **Attribute**   | A column in a table                    |
| **Domain**      | Set of allowed values for an attribute |
| **Cardinality** | Number of tuples in a relation         |
| **Degree**      | Number of attributes in a relation     |

---

## Unit 2: Relational Model

### Relational Algebra Operations

**Basic Operations:**

1. **Select (σ)** — Filter rows `σsalary > 50000(Employee)`
2. **Project (π)** — Select columns `πname, salary(Employee)`
3. **Union (U)** — Combine two relations
4. **Set Difference (-)** — Tuples in one but not other
5. **Cartesian Product (X)** — Combine all pairs

**Additional Operations:**

- **Join (⨝)** — Combine related tuples
- **Division (÷)** — "All" queries

### SQL Example

```sql
SELECT e.name, d.dept_name
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE e.salary > 50000
ORDER BY e.name;
```

---

## Unit 3: Normalization

### Functional Dependencies

**Definition:** X → Y means "X functionally determines Y"

### Normal Forms

1. **1NF** — Atomic values only
2. **2NF** — 1NF + No partial dependency on candidate key
3. **3NF** — 2NF + No transitive dependency
4. **BCNF** — For every FD X → Y, X must be a super key

> **"The key, the whole key, and nothing but the key"** — 3NF in a nutshell.

---

## Important Exam Tips

- Always draw **ER diagrams** for conceptual questions
- Practice writing **SQL queries** with joins and subqueries
- Know **ACID properties** — Atomicity, Consistency, Isolation, Durability
- Understand **serializability** and **conflict equivalence**
- Remember the difference between **primary key** and **candidate key**

---

**End of Notes — Happy Studying! 🚀**
