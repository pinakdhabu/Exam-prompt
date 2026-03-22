# SPPU Design and Analysis of Algorithms Optimized Prompts
## Based on 2019 Pattern Syllabus (Subject: 410241)

### 2 Mark Questions

**Define Time Complexity [2 marks]**
Time Budget (2 min):
  Definition/Intro   ~1.5 min
  Conclusion         ~0.5 min

**Time Complexity** is the computational complexity that describes the amount of time an algorithm takes to run as a function of the length of the input.
It is typically expressed using Big O notation to analyze worst-case performance.

**Explain Divide and Conquer Strategy [2 marks]**
Time Budget (2 min):
  Definition/Intro   ~1 min
  Main points        ~0.5 min
  Conclusion         ~0.5 min

**Divide and Conquer** is an algorithm design paradigm that solves problems by breaking them into smaller subproblems, solving each recursively, and combining their solutions.
It follows three steps: divide, conquer, and combine.

Thus, Divide and Conquer reduces problem complexity through recursion.
Hence it is used in algorithms like Merge Sort and Quick Sort.
================================================================
MARKING SCHEME  Q.No.                         [2 Marks]
  Definition / Introduction      : 0.5 mark
  Main Points (2 x 0.5 mark each): 1 mark
  Conclusion                     : 0.5 mark
                                    -------
  Total                          : 2 marks
================================================================

**Explain Merge Sort Algorithm [4 marks]**
Time Budget (4 min):
  Definition/Intro   ~0.5 min
  Main points        ~2.5 min
  Conclusion         ~0.5 min

**Merge Sort** is a divide-and-conquer sorting algorithm that divides the array into halves, recursively sorts them, and then merges the sorted halves.
It has a time complexity of O(n log n) in all cases.

**[Divide]**: Split array into two halves recursively until single elements remain.
**[Conquer]**: Each single element is trivially sorted.
**[Combine]**: Merge two sorted arrays by comparing elements and placing smaller one first.
**[Stability]**: Merge Sort is stable as it preserves relative order of equal elements.

Thus, Merge Sort guarantees O(n log n) performance regardless of input distribution.
Hence it is preferred when consistent performance is required.
================================================================
MARKING SCHEME  Q.No.                         [4 Marks]
  Definition / Introduction      : 0.5 mark
  Main Points (4 x 0.5 mark each): 2 marks
  Conclusion                     : 0.5 mark
                                    -------
  Total                          : 4 marks
================================================================

**Explain Dynamic Programming with example [6 marks]**
Time Budget (6 min):
  Definition/Intro   ~0.5 min
  Main points        ~2.5 min
  Example            ~2 min
  Conclusion         ~0.5 min

**Dynamic Programming (DP)** is an optimization technique that solves complex problems by breaking them into overlapping subproblems, solving each once, and storing their solutions.
It avoids recomputation by using memoization or tabulation.

**[Optimal Substructure]**: Optimal solution contains optimal solutions to subproblems.
**[Overlapping Subproblems]**: Same subproblems are solved multiple times in naive recursion.
**[Memoization]**: Top-down approach storing results of subproblems in a table.
**[Tabulation]**: Bottom-up approach filling table iteratively.

Example: Fibonacci sequence where fib(n) = fib(n-1) + fib(n-2). Naive recursion recalculates same values. DP stores fib(0)...fib(n) in array, computing each once.

Thus, Dynamic Programming reduces time complexity from exponential to polynomial.
Hence it is used in optimization problems like Knapsack, LCS, and Matrix Chain Multiplication.
================================================================
MARKING SCHEME  Q.No.                         [6 Marks]
  Definition / Introduction      : 1 mark
  Main Points (3 x 1 mark each)  : 3 marks
  Example                        : 1 mark
  Conclusion                     : 1 mark
                                    -------
  Total                          : 6 marks
================================================================

**Explain Greedy Algorithm with example [6 marks]**
Time Budget (6 min):
  Definition/Intro   ~0.5 min
  Main points        ~2.5 min
  Example            ~2 min
  Conclusion         ~0.5 min

**Greedy Algorithm** is an algorithmic paradigm that builds up a solution piece by piece, always choosing the next piece that offers the most immediate benefit.
It makes locally optimal choices hoping to find a global optimum.

**[Greedy Choice Property]**: Globally optimal solution can be reached by making locally optimal choices.
**[Optimal Substructure]**: Optimal solution contains optimal solutions to subproblems.
**[No Backtracking]**: Once a choice is made, it is never reconsidered.

Example: Activity Selection Problem where activities have start and finish times. Greedy choice: select activity with earliest finish time, then repeat for remaining compatible activities.

Thus, Greedy Algorithms provide efficient solutions for problems with greedy choice property.
Hence it is used in scheduling, Huffman coding, and minimum spanning trees.
================================================================
MARKING SCHEME  Q.No.                         [6 Marks]
  Definition / Introduction      : 1 mark
  Main Points (3 x 1 mark each)  : 3 marks
  Example                        : 1 mark
  Conclusion                     : 1 mark
                                    -------
  Total                          : 6 marks
================================================================