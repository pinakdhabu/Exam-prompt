**Q. 1)** Explain the concept of Normalization in DBMS.

Normalization is the process of organizing data in a database to reduce redundancy and eliminate
update anomalies. It involves decomposing tables into smaller, well-structured relations.

**1NF** — A relation is in 1NF if every attribute contains only atomic values and there are no
repeating groups. Each cell must hold a single value.

**2NF** — A relation is in 2NF if it is in 1NF and every non-key attribute is fully functionally
dependent on the entire primary key. Partial dependencies are removed.

**3NF** — A relation is in 3NF if it is in 2NF and no transitive dependency exists. Every non-key
attribute must depend directly on the primary key.

**BCNF** — A relation is in BCNF if for every functional dependency X -> Y, X must be a super key.
BCNF is stricter than 3NF.

---

**Q. 2)** What are ACID properties in transaction management?

ACID is an acronym that defines four essential properties of database transactions.

**Atomicity** — Either all operations of a transaction execute successfully or none are applied. If
a transaction fails midway, all changes are rolled back.

**Consistency** — A transaction brings the database from one valid state to another. All integrity
constraints and rules must be satisfied before and after the transaction.

**Isolation** — Concurrent execution of multiple transactions produces the same result as if they
were executed serially. Intermediate states of a transaction are invisible to others.

**Durability** — Once a transaction commits, its changes persist permanently in the database even in
the event of a system failure.

---

**Q. 3)** Write a note on Functional Dependencies.

A functional dependency X -> Y means that whenever two tuples have the same value for attribute set
X, they must also have identical values for attribute set Y.

**Armstrong's Axioms**

1. **Reflexivity** — If Y is a subset of X, then X -> Y
2. **Augmentation** — If X -> Y, then XZ -> YZ
3. **Transitivity** — If X -> Y and Y -> Z, then X -> Z

These axioms are sound and complete for deriving all functional dependencies implied by a given set.
