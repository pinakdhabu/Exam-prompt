# Programming and Problem Solving — Sample Paper 1: Ideal Solution

---

## Unit III — Functions and Modules

### Q1) [15]

**a) Function:** A **function** is a reusable block of code that performs a specific task. It is defined using the `def` keyword.

**Need for functions:**
1. **Code reusability** — write once, call multiple times
2. **Modularity** — break complex problems into smaller parts
3. **Readability** — organized, easy-to-understand code
4. **Maintainability** — easier debugging and updating

**Example:**
```python
def greet(name):
    return f"Hello, {name}!"
```

**b) Local vs Global variables:**

| Basis | Local Variable | Global Variable |
|---|---|---|
| **Scope** | Inside a function only | Throughout the program |
| **Declaration** | Defined inside function | Defined outside all functions |
| **Modification** | Can't modify global directly | Accessible everywhere |
| **Lifetime** | During function execution | Until program ends |

**Example:**
```python
x = 10          # global
def func():
    y = 5       # local
    print(x, y) # accessing both
```

**c) Program to find largest of 3 numbers:**
```python
def largest(a, b, c):
    if a >= b and a >= c:
        return a
    elif b >= a and b >= c:
        return b
    else:
        return c

# Test
num1, num2, num3 = 45, 78, 23
print("Largest:", largest(num1, num2, num3))
```
**Output:** `Largest: 78`

---

### Q2) [15]

**a) Function argument types:**

**Default arguments:** Parameters with predefined values
```python
def greet(name, msg="Hello"):
    print(f"{msg}, {name}!")
greet("Alice")           # Hello, Alice!
greet("Bob", "Hi")       # Hi, Bob!
```

**Variable length arguments:** Using `*args` (tuple) and `**kwargs` (dictionary)
```python
def sum_all(*nums):
    return sum(nums)
print(sum_all(1, 2, 3, 4))  # 10

def show_info(**info):
    for key, val in info.items():
        print(f"{key}: {val}")
```

**b) Lambda function for square:**
```python
square = lambda x: x**2
n = float(input("Enter number: "))
print(f"Square: {square(n)}")
```

**c) Modules and packages:**
- **Module:** A file containing Python definitions and statements (e.g., `math`, `random`)
- **Package:** A collection of modules in directories

**User-defined module** (`mymodule.py`):
```python
# mymodule.py
def add(a, b):
    return a + b

PI = 3.14159
```

Using it: `import mymodule` then `mymodule.add(5, 3)` or `from mymodule import add`

---

## Unit IV — Strings

### Q3) [15]

**a) String formatting methods:**
1. **f-strings** (Python 3.6+): `f"Value: {x}"`
2. **`format()` method:** `"Value: {}".format(x)`
3. **`%` operator:** `"Value: %d" % x`

**b) Iterating a string:**
```python
s = "Hello"
# Method 1
for ch in s:
    print(ch)
# Method 2
for i in range(len(s)):
    print(s[i], s[i])
```

**c) Output for `S = "Learning Python is fun"`:**
i) `S[:10]` → `"Learning P"` (first 10 characters)
ii) `S[::-1]` → `"nuf si nohtyP gninraeL"` (reversed string)
iii) `"Is" not in S` → `True` ("Is" not present; note case-sensitivity)
iv) `S[4]` → `"n"` (5th character, index 4)
v) `S[0:10]` → `"Learning P"` (characters from index 0 to 9)

---

## Unit V — Object Oriented Programming

### Q5) [15]

**a) Programming paradigms:**
1. **Monolithic Programming:** Entire program in one block. No modularity. Difficult to debug and maintain.
2. **Procedural Programming:** Program divided into functions/procedures. Uses global data. Example: C language.
3. **Object Oriented Programming:** Program organized around objects containing data and methods. Features: encapsulation, inheritance, polymorphism. Example: Python, Java, C++.

**b) OOP concepts:**
- **Class variable:** Shared by all objects of a class. Defined at class level.
- **Object variable (instance variable):** Unique to each object. Defined in `__init__`.

**Example:**
```python
class Student:
    school = "ABC School"    # class variable
    def __init__(self, name):
        self.name = name     # object variable
```

**c) Employee class:**
```python
class Employee:
    def __init__(self, name, emp_id, salary):
        self.name = name
        self.emp_id = emp_id
        self.salary = salary

    def display(self):
        print(f"ID: {self.emp_id}, Name: {self.name}, Salary: ₹{self.salary}")

# Create and display
e1 = Employee("Amit", 101, 50000)
e2 = Employee("Priya", 102, 60000)
e3 = Employee("Rahul", 103, 45000)
e4 = Employee("Sneha", 104, 55000)

for emp in [e1, e2, e3, e4]:
    emp.display()
```

---

## Unit VI — File Handling

### Q7) [15]

**a) File:** A named location on disk for storing data permanently.

**File paths:**
- **Absolute path:** Complete path from root: `/home/user/data/file.txt`
- **Relative path:** Path relative to current directory: `data/file.txt`

**b) File methods:**
- `read(n)`: Read `n` characters. Without `n`, reads entire file.
- `readlines()`: Reads all lines into a list. Each line is a list element.
- `close()`: Closes the file — always call after operations.

**c) Access modes:**
| Mode | Description |
|---|---|
| `r` | Read only (default). File must exist |
| `w+` | Write + read. Creates/overwrites file |
| `a+` | Append + read. Creates if not exists |
| `rb` | Read binary |
| `ab+` | Append + read in binary mode |

**Example:**
```python
with open("data.txt", "w+") as f:
    f.write("Hello, World!")
    f.seek(0)
    print(f.read())
```

═══════════════════════════════════════════════════════
EXAMINER COMMENTARY
Why this scores full marks: Code examples are runnable and correct. OOP concepts explained with practical examples. Tables for comparison (local vs global, access modes). String methods and file operations demonstrated with proper syntax. Key terms bolded.

Common Deductions:
- Syntax errors in code examples (missing colons, indentation)
- Confusing class variable vs instance variable
- Not explaining file path concept clearly
- Missing output for string slicing questions
- Vague module/package distinction

Time Budget:
Q1/Q2: 22 min | Q3/Q4: 22 min | Q5/Q6: 22 min | Q7/Q8: 22 min | Review: 12 min
═══════════════════════════════════════════════════════
