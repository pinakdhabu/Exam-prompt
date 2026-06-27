---
totalQuestions: 4
totalPages: 2
paperCode: PE-356
paperIdentifier: '[6580]-545'
department: B.E. (Computer Engineering) (Insem.)
subject: DESIGN AND ANALYSIS OF ALGORITHMS
pattern: 2019 Pattern
semester: VII
subjectCode: 410241
time: 1 Hour
maxMarks: 30
instructions:
  - Answer four questions Q1 or Q2, Q3 or Q4.
  - Neat diagrams must be drawn wherever necessary.
  - Assume suitable data if necessary.
---

**Q1) a)** Why correctness of the algorithm is important? Define loop invariant property and prove the correctness of finding summation of $n$ numbers using loop invariant property. [7]

**b)** Explain in detail any 4 problem solving strategies. [8]

**OR**

**Q2) a)** What is iterative algorithm? Explain iterative algorithm design issues using examples. [7]

**b)** How to prove that an algorithm is correct? How to prove the correctness of an algorithm using counter example? Give suitable example. [8]

---

**Q3) a)** Explain P, NP, NP-Hard and NP-Complete problems with example. [7]

**b)** What is best, average and worst case Analysis of algorithms? Analyse the following algorithm Best, Average and worst case: [8]
```c
void sort (int a[], int n)
{
    int i, j, key;
    for (i=0; i<n; i++) {
        j = i - 1;
        key = a[i];
        while (j >= 0 && a[j] > key) {
            a[j+1] = a[j];
            j--;
        }
    }
}
```

**OR**

**Q4) a)** Write an algorithm to find the maximum and minimum elements in a given array using the Divide and Conquer strategy. Analyze its time complexity. [7]

**b)** Explain the concept of recursion tree method. Solve the following recurrence relation using recursion tree method: [8]
$$T(n) = 2T(n/2) + n^2$$

*** End of Paper ***
