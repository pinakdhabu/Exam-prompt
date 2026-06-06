# Object Oriented Programming — Sample Paper 1 — Ideal Solution

---

## Q1) Polymorphism

### a) Runtime polymorphism

**Runtime polymorphism** is the ability to call different function implementations based on the
actual object type at runtime, achieved via **virtual functions**.

In C++, runtime polymorphism is achieved through:

1. **Virtual functions**: Declared using the `virtual` keyword in base class
2. **Function overriding**: Derived class redefines the base class virtual function
3. **Base class pointer**: Pointing to derived class objects

```cpp
class Shape {
public:
    virtual void draw() { cout << "Drawing shape"; }
};
class Circle : public Shape {
public:
    void draw() { cout << "Drawing circle"; }
};
// Usage: Shape* s = new Circle(); s->draw(); // Calls Circle::draw()
```

Thus, runtime polymorphism enables dynamic method dispatch based on object type.

### b) Virtual base class and virtual function

**Virtual base class** solves the **diamond problem** in multiple inheritance. When two derived
classes inherit from a common base and a third class inherits from both, virtual inheritance ensures
only one copy of the base class exists.

```cpp
class A { public: int x; };
class B : virtual public A { };
class C : virtual public A { };
class D : public B, public C { }; // Only one copy of A
```

**Virtual function** is a member function declared with `virtual` that can be overridden in derived
classes. The decision of which function to call is made at runtime based on the object type using
the **vtable** (virtual table).

### c) Operator overloading — Unary operator

**Operator overloading** allows user-defined types to work with operators naturally. The `operator`
keyword defines how an operator behaves with class objects.

```cpp
class Counter {
    int count;
public:
    Counter() : count(0) {}
    void operator++() { count++; }  // Prefix increment
    void operator++(int) { count++; } // Postfix increment
    int getCount() { return count; }
};
```

Thus, operator overloading makes user-defined types behave like built-in types.

---

## Q3) Files and Streams

### a) File pointer manipulation functions

C++ provides functions to manipulate **file pointers** (get/put positions):

1. **seekg()**: Moves the get pointer to a specified position (`seekg(offset, direction)`)
2. **seekp()**: Moves the put pointer to a specified position
3. **tellg()**: Returns the current position of the get pointer
4. **tellp()**: Returns the current position of the put pointer

Directions: `ios::beg` (beginning), `ios::cur` (current), `ios::end` (end).

### b) Command-line arguments

**Command-line arguments** are parameters passed to a program when executed from the command line.
The `main` function prototype is:

```cpp
int main(int argc, char* argv[])
```

- `argc`: Argument count (number of arguments)
- `argv`: Argument vector (array of C-strings)

Example: `./program input.txt output.txt` → argc = 3, argv[0] = "program", argv[1] = "input.txt",
argv[2] = "output.txt"

### c) File opening modes

| Mode          | Description            |
| ------------- | ---------------------- |
| `ios::in`     | Open for reading       |
| `ios::out`    | Open for writing       |
| `ios::app`    | Append mode            |
| `ios::ate`    | Seek to end on opening |
| `ios::trunc`  | Truncate existing file |
| `ios::binary` | Open in binary mode    |

Thus, file modes control how data flows between the program and external files.

---

## Q5) Exception Handling and Templates

### a) Power of templates

**Templates** enable **generic programming** — writing code that works with any data type without
duplication. They allow type parameters for functions and classes.

```cpp
template <typename T>
T max(T a, T b) { return (a > b) ? a : b; }
// Works with int, float, string, etc.
```

Benefits: code reusability, type safety, compile-time polymorphism.

### b) Exception handling mechanism

**Exception handling** separates error-handling code from normal code flow using `try`, `catch`, and
`throw`:

```cpp
int divide(int a, int b) {
    if (b == 0) throw "Division by zero!";
    return a / b;
}
int main() {
    try { cout << divide(10, 0); }
    catch (const char* msg) { cerr << msg; }
}
```

Mechanism: Code in `try` block executes normally. If an exception is `throw`n, control transfers to
the matching `catch` block. Stack unwinding occurs — local objects are destroyed.

### c) typename and export keywords

**typename** indicates that a dependent name is a type in template definitions. Required when
accessing nested types in template parameters.

```cpp
template <typename T>
void func() { typename T::iterator it; }
```

**export** (removed in C++11) was used to separate template declaration from definition across
translation units.

---

## Q7) Standard Template Library (STL)

### a) STL and key components

**STL (Standard Template Library)** is a collection of generic classes and functions providing
common data structures and algorithms.

Key components:

1. **Containers**: Data structures (vector, list, map, set)
2. **Algorithms**: Generic functions (sort, find, binary_search)
3. **Iterators**: Generalized pointers for traversing containers
4. **Function objects**: Objects that behave like functions

Thus, STL provides reusable, tested, and efficient implementations of common programming patterns.

### b) Sequence vs Associative containers

| Basis          | Sequence Containers                    | Associative Containers                  |
| -------------- | -------------------------------------- | --------------------------------------- |
| Ordering       | Elements ordered by insertion position | Elements ordered by key                 |
| Access         | Direct by position                     | By key value                            |
| Examples       | vector, list, deque, array             | set, map, multiset, multimap            |
| Implementation | Array or linked list                   | Balanced BST (typically Red-Black tree) |

Thus, sequence containers are suitable for positional access, while associative containers excel at
key-based lookups.

### c) Container adapters

**Container adapters** provide restricted interfaces over standard containers. Examples:

- **stack**: LIFO (wraps deque by default)
- **queue**: FIFO (wraps deque by default)
- **priority_queue**: Highest priority first (wraps vector by default)

Advantages: Interface simplification, code clarity, guaranteed access semantics.

---

═══════════════════════════════════════════════════════ EXAMINER COMMENTARY

Why this scores full marks:

- Code snippets are concise, compilable, and directly relevant
- All OOP concepts defined with precise C++ terminology
- Tables for comparisons (sequence vs associative)
- File operations cover both get/put pointer manipulation
- Exception handling code includes both throw and catch
- Virtual function explanation includes vtable concept

Common Deductions:

- Writing long code without explaining key lines
- Not distinguishing between compile-time and runtime polymorphism
- Confusing seekg() with seekp() or tellg() with tellp()
- Not including proper header files (#include) in code
- Missing noexcept or throw specifications where expected
- Not bolding technical terms like vtable, stack unwinding

Time Budget:

- Q1 (18 marks): 42 min → Q1a: 12 min, Q1b: 15 min, Q1c: 15 min
- Q3 (17 marks): 40 min → Q3a: 15 min, Q3b: 15 min, Q3c: 10 min
- Q5 (18 marks): 42 min → Q5a: 12 min, Q5b: 18 min, Q5c: 12 min
- Q7 (17 marks): 40 min → Q7a: 15 min, Q7b: 15 min, Q7c: 10 min

═══════════════════════════════════════════════════════
