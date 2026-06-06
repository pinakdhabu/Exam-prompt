# Principles of Programming Languages — Sample Paper 1 — Ideal Solution

---

## Q1) Object-Oriented Programming

### a) Java features

i) **Security**: Java provides a secure execution environment through bytecode verification, sandbox model, and absence of explicit pointers. The **SecurityManager** controls access to system resources. Class files are verified before execution to prevent memory corruption.

ii) **Platform independence**: Java source code is compiled to **bytecode** (`.class` files) which runs on the **JVM (Java Virtual Machine)**. The JVM abstracts the underlying hardware and OS, enabling "Write Once, Run Anywhere" (WORA) capability.

iii) **Object-oriented**: Java implements core OOP principles — **encapsulation** (access modifiers), **inheritance** (extends), **polymorphism** (overloading/overriding), and **abstraction** (abstract classes, interfaces). All code exists within classes.

Thus, these features make Java suitable for secure, portable, and maintainable enterprise applications.

### b) Short notes

i) **Garbage collector**: The JVM's garbage collector automatically deallocates memory occupied by objects that are no longer reachable. The `System.gc()` method requests garbage collection but execution is not guaranteed. Java uses generational collection (Young, Old, Permanent generations) for efficiency.

ii) **this keyword**: The `this` keyword refers to the current object instance. It is used to: differentiate instance variables from parameters (`this.x = x`), call another constructor (`this(parameter)`), and pass the current object as a parameter.

### c) Constructors in Java

**Constructor** is a special method that initializes objects when they are created. It has the same name as the class and no return type.

Types:
1. **Default constructor**: Provided by compiler if no constructor is defined. Initializes instance variables to default values (0, null, false).
2. **Parameterized constructor**: Accepts parameters to initialize object state with specific values.
3. **Copy constructor**: Creates a new object by copying another object's state (not built-in — implemented manually).

```java
class Student {
    int id; String name;
    Student() { } // Default
    Student(int i, String n) { id = i; name = n; } // Parameterized
    Student(Student s) { id = s.id; name = s.name; } // Copy
}
```

Thus, constructors ensure objects are properly initialized before use.

---

## Q3) Inheritance and Packages

### a) Types of inheritance in Java

**Inheritance** is a mechanism where one class acquires the properties and behaviors of another class using the `extends` keyword.

Types supported in Java:
1. **Single inheritance**: Class B extends class A (one parent, one child)
2. **Multilevel inheritance**: Class C extends B, B extends A (chain of inheritance)
3. **Hierarchical inheritance**: Class B extends A, Class C extends A (one parent, multiple children)

Java does NOT support multiple inheritance of classes (to avoid the diamond problem). However, multiple inheritance of type is achieved through **interfaces**.

### b) try, catch, finally keywords

i) **try**: Encloses code that may throw an exception. Must be followed by at least one catch or finally block. Monitored code segment.

ii) **catch**: Handles exceptions thrown by the try block. Can have multiple catch blocks for different exception types. The most specific exception must be caught first.

iii) **finally**: Executes regardless of whether an exception occurs. Used for cleanup operations (closing files, releasing resources). Even if a return statement exists in try, finally executes before returning.

### c) Packages in Java

**Package** is a namespace that organizes related classes and interfaces.

Syntax: `package com.example.myapp;`
- Use: Prevents naming conflicts, controls access, groups related code
- CLASSPATH: Environment variable telling JVM where to find user-defined classes and packages
- Hierarchy: `java.lang` → `java.util` → `java.io` → `java.net` (standard)
- Custom hierarchy: `com.company.project.module`

Thus, packages provide modular organization and access control for Java applications.

---

## Q5) Threads and Concurrency

### a) Implementing threads in Java

Two ways to create threads:

1. **Extending Thread class**:
```java
class MyThread extends Thread {
    public void run() { System.out.println("Thread running"); }
}
new MyThread().start();
```

2. **Implementing Runnable interface**:
```java
class MyRunnable implements Runnable {
    public void run() { System.out.println("Thread running"); }
}
new Thread(new MyRunnable()).start();
```

The `Runnable` approach is preferred because it allows the class to extend another class.

### b) Thread methods

i) **isAlive()**: Returns true if the thread has been started and has not yet terminated. Used to check thread status before joining.

ii) **notify()**: Wakes up a single thread waiting on this object's monitor. Used in inter-thread communication within synchronized blocks. Part of the **wait-notify** mechanism.

iii) **getPriority()**: Returns the thread's priority value (1 to 10). Default priority is NORM_PRIORITY (5). Higher priority threads get more CPU time.

### c) Vue.js features

**Vue.js** is a progressive JavaScript framework for building user interfaces.

Features: Reactive data binding, component-based architecture, virtual DOM, directives (v-bind, v-if, v-for), computed properties, watchers.

Advantages: Lightweight, easy learning curve, excellent documentation, flexible integration, excellent performance.

Limitations: Smaller ecosystem than React/Angular, limited plugin maturity, community fragmentation between Vue 2 and Vue 3.

---

## Q7) LISP Programming

### a) Features of LISP

**LISP (LISt Processing)** is a functional programming language known for:
1. **Symbolic computation**: Native support for symbols and symbolic expressions
2. **Code as data**: Programs are themselves lists — homoiconicity enables powerful macros
3. **Automatic memory management**: Garbage collection built-in (pioneered by LISP)
4. **Recursion**: Primary control structure; loops are secondary
5. **First-class functions**: Functions can be passed as arguments, returned as values
6. **Dynamic typing**: Type checking at runtime, not compile time

Thus, LISP is particularly suited for AI research, symbolic mathematics, and metaprogramming.

### b) Equality predicates

i) **EQUAL**: Compares structural equality for lists, strings, and numbers. `(EQUAL '(A B) '(A B))` → T.

ii) **EQ**: Compares object identity (same memory location). `(EQ 'A 'A)` → T (same symbol).

iii) **EQL**: Combines EQ for objects and = for numbers. `(EQL 3 3)` → T.

iv) **=**: Numeric equality only. `(= 5 5.0)` → T. Does not work on non-numeric types.

### c) Number predicates

i) **NUMBERP**: Returns T if the argument is a number. `(NUMBERP 42)` → T, `(NUMBERP 'A)` → NIL.

ii) **ZEROP**: Returns T if the numeric argument is zero. `(ZEROP 0)` → T, `(ZEROP 5)` → NIL.

iii) **PLUSP**: Returns T if the numeric argument is positive (>0). `(PLUSP 3)` → T.

iv) **EVENP**: Returns T if the integer argument is even. `(EVENP 4)` → T.

v) **ODDP**: Returns T if the integer argument is odd. `(ODDP 3)` → T.

Thus, these predicates enable type checking and conditional logic in LISP programs.

---

═══════════════════════════════════════════════════════
EXAMINER COMMENTARY

Why this scores full marks:
- Java features explained with concrete mechanisms (bytecode, SecurityManager, JVM)
- Constructor types shown with code examples
- Inheritance coverage clarifies what Java supports vs does not support
- Thread implementation shows both approaches with preference guidance
- LISP predicates differentiated with return values for specific inputs
- Vue.js coverage provides balanced assessment (not just advantages)

Common Deductions:
- Claiming Java supports multiple inheritance of classes
- Not distinguishing between == (reference) and .equals() (value) for strings
- Confusing final, finally, and finalize()
- Omitting the start() call in thread examples
- Mixing up EQ vs EQUAL vs EQL in LISP
- Not mentioning the Runnable interface preference over Thread class

Time Budget:
- Q1 (18 marks): 42 min → Q1a: 14 min, Q1b: 14 min, Q1c: 14 min
- Q3 (17 marks): 40 min → Q3a: 14 min, Q3b: 14 min, Q3c: 12 min
- Q5 (18 marks): 42 min → Q5a: 14 min, Q5b: 14 min, Q5c: 14 min
- Q7 (17 marks): 40 min → Q7a: 14 min, Q7b: 14 min, Q7c: 12 min

═══════════════════════════════════════════════════════
