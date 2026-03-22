# SPPU Operating Systems Optimized Prompts
## Based on 2019 Pattern Syllabus (Subject: 310243)

### 2 Mark Questions

**Define Operating System [2 marks]**
Time Budget (2 min):
  Definition/Intro   ~1.5 min
  Conclusion         ~0.5 min

An **Operating System (OS)** is system software that manages computer hardware and software resources, providing common services for computer programs.
It acts as an intermediary between users and computer hardware.

**Explain Process States with diagram [4 marks]**
Time Budget (4 min):
  Definition/Intro   ~0.5 min
  Diagram            ~1.5 min
  Main points        ~1 min
  Conclusion         ~0.5 min

A **process** is a program in execution, and it transitions through various states during its lifetime.

**[New]**: Process is being created.
**[Ready]**: Process is waiting to be assigned to a processor.
**[Running]**: Instructions are being executed.
**[Waiting]**: Process is waiting for an event (e.g., I/O completion).
**[Terminated]**: Process has finished execution.

Thus, process state transitions enable efficient CPU utilization.
Hence it is fundamental to multiprogramming operating systems.
================================================================
MARKING SCHEME  Q.No.                         [4 Marks]
  Definition / Introduction      : 0.5 mark
  Diagram (with labels)          : 1 mark
  Main Points (3 x 0.5 mark each): 1.5 marks
  Conclusion                     : 0.5 mark
                                    -------
  Total                          : 4 marks
================================================================

**Explain Round Robin Scheduling Algorithm [4 marks]**
Time Budget (4 min):
  Definition/Intro   ~0.5 min
  Main points        ~2.5 min
  Conclusion         ~0.5 min

**Round Robin (RR)** is a preemptive CPU scheduling algorithm where each process gets a fixed time slice (quantum) to execute.
It is designed specifically for time-sharing systems.

**[Time Quantum]**: Fixed time slice assigned to each process in the ready queue.
**[Preemption]**: Process is interrupted after time quantum expires and moved to end of queue.
**[Fairness]**: All processes receive equal CPU time allocation.
**[Context Switching]**: Overhead increases with smaller time quantum values.

Thus, Round Robin provides good response time for interactive systems.
Hence it is widely used in time-sharing operating systems.
================================================================
MARKING SCHEME  Q.No.                         [4 Marks]
  Definition / Introduction      : 0.5 mark
  Main Points (4 x 0.5 mark each): 2 marks
  Conclusion                     : 0.5 mark
                                    -------
  Total                          : 4 marks
================================================================

**Explain Banker's Algorithm for Deadlock Avoidance [6 marks]**
Time Budget (6 min):
  Definition/Intro   ~0.5 min
  Main points        ~3.5 min
  Example            ~1 min
  Conclusion         ~0.5 min

**Banker's Algorithm** is a deadlock avoidance algorithm that tests for safety by simulating resource allocation before granting requests.
It ensures the system never enters an unsafe state where deadlock could occur.

**[Safety Check]**: Algorithm verifies if granting a request leaves system in safe state.
**[Resource Allocation Matrix]**: Tracks currently allocated resources to each process.
**[Need Matrix]**: Calculates remaining resource needs of each process.
**[Available Vector]**: Tracks currently available resources in system.

Example: System with 3 processes (P0, P1, P2) and 2 resource types (A, B with 10, 5 instances). When P1 requests (1,0,2), algorithm checks if resulting state is safe before allocation.

Thus, Banker's Algorithm prevents deadlock by ensuring safe state maintenance.
Hence it is used in systems where deadlock avoidance is critical.
================================================================
MARKING SCHEME  Q.No.                         [6 Marks]
  Definition / Introduction      : 1 mark
  Main Points (3 x 1 mark each)  : 3 marks
  Example                        : 1 mark
  Conclusion                     : 1 mark
                                    -------
  Total                          : 6 marks
================================================================