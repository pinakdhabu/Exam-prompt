# Engineering Mathematics III — Sample Paper 1 — Ideal Solution

---

## Q1) Multiple Choice Questions

### a) Correlation coefficient from regression coefficients

Given bᵧₓ = −8/15, bₓᵧ = −5/6

**Correlation coefficient** r = ±√(bᵧₓ × bₓᵧ) = ±√[(−8/15) × (−5/6)] = ±√(40/90) = ±√(4/9) = ±2/3

Since both regression coefficients are negative, r is negative.

**Answer: i) −2/3**

### b) P(A ∪ B) for independent events

P(A) = 1/2, P(B) = 1/3. For independent events: P(A ∩ B) = P(A)·P(B) = 1/6.

P(A ∪ B) = P(A) + P(B) − P(A ∩ B) = 1/2 + 1/3 − 1/6 = (3 + 2 − 1)/6 = 4/6 = 2/3

**Answer: ii) 2/3**

### c) Gauss elimination solution

System: x + 2y + z = 4, −3y + 2z = −3, −7y − 2z = −6

From equations 2 and 3: Adding: −10y = −9 → y = 9/10

Substituting: −3(9/10) + 2z = −3 → −27/10 + 2z = −3 → 2z = −3 + 27/10 = −3/10 → z = −3/20

From eq 1: x + 2(9/10) + (−3/20) = 4 → x + 18/10 − 3/20 = 4 → x + 36/20 − 3/20 = 4 → x + 33/20 = 4 → x = 80/20 − 33/20 = 47/20

**Answer: ii) x = 47/20, y = 9/10, z = −3/20**

### d) y at x = 1 using forward difference

Points: (0,0), (2,4), (4,8). Using y = y₀ + uΔy₀ where h = 2.
x = 1 → u = (x − x₀)/h = (1 − 0)/2 = 0.5
Δy₀ = y₁ − y₀ = 4 − 0 = 4
y = 0 + 0.5(4) = 2

**Answer: iv) 2**

### e) Range of correlation coefficient

**Answer: iii) −1 ≤ r ≤ 1**

### f) Secant method next approximation

**Answer: i) x₂ = x₁ − (x₁ − x₀)f₁/(f₁ − f₀)**

---

## Q2) Probability

### a) Bayes' theorem

**Bayes' theorem**: P(Aᵢ|B) = P(Aᵢ)·P(B|Aᵢ) / Σⱼ P(Aⱼ)·P(B|Aⱼ)

**Problem**: Bag 1: 4R + 3B. Bag 2: 3R + 5B. One ball transferred from Bag 1 to Bag 2, then ball drawn from Bag 2 is red.

Let A₁ = transferred ball is red, A₂ = transferred ball is black.
P(A₁) = 4/7, P(A₂) = 3/7

Given A₁: Bag 2 has 4R + 5B, P(R|A₁) = 4/9
Given A₂: Bag 2 has 3R + 6B, P(R|A₂) = 3/9 = 1/3

P(R) = P(A₁)·P(R|A₁) + P(A₂)·P(R|A₂) = (4/7)(4/9) + (3/7)(1/3) = 16/63 + 3/21 = 16/63 + 9/63 = 25/63

**Answer: 25/63**

### b) Poisson distribution

For **Poisson distribution**: P(X = k) = e⁻λ · λᵏ / k!

Given P(X = 1) = P(X = 2):
e⁻λ · λ = e⁻λ · λ²/2
λ = λ²/2 → λ(1 − λ/2) = 0 → λ = 0 or λ = 2

Since λ > 0, λ = 2. **Mean** λ = 2.

P(X = 4) = e⁻² · 2⁴ / 4! = e⁻² · 16 / 24 = (2/3)·e⁻² = 0.0902

**Answer: Mean = 2, P(X = 4) = 0.0902**

---

## Q4) Numerical Methods

### a) Newton-Raphson method

Equation: f(x) = x³ − 4x − 9 = 0. f'(x) = 3x² − 4

Initial guess: x₀ = 3 (f(3) = 27 − 12 − 9 = 6, f(2) = 8 − 8 − 9 = −9)

x₁ = x₀ − f(x₀)/f'(x₀) = 3 − 6/(27 − 4) = 3 − 6/23 = 3 − 0.2609 = **2.7391**

x₂ = 2.7391 − f(2.7391)/f'(2.7391): f(2.7391) = 20.553 − 10.956 − 9 = 0.597, f' = 22.519 − 4 = 18.519
x₂ = 2.7391 − 0.597/18.519 = 2.7391 − 0.0322 = **2.7069**

x₃ = 2.7069 − f(2.7069)/f'(2.7069): f(2.7069) = 19.834 − 10.828 − 9 = 0.006, f' = 21.983 − 4 = 17.983
x₃ = 2.7069 − 0.006/17.983 = **2.7066**

**Answer: Root ≈ 2.707 (after 3 iterations)**

### b) Gauss-Seidel method

System: 10x + y + z = 12, 2x + 10y + z = 13, 2x + 2y + 10z = 14

Rearranged: x = (12 − y − z)/10, y = (13 − 2x − z)/10, z = (14 − 2x − 2y)/10

Initial: x₀ = 0, y₀ = 0, z₀ = 0

Iteration 1: x₁ = 1.200, y₁ = (13 − 2.4)/10 = 1.060, z₁ = (14 − 2.4 − 2.12)/10 = 0.948

Iteration 2: x₂ = (12 − 1.060 − 0.948)/10 = 0.999, y₂ = (13 − 1.998 − 0.948)/10 = 1.005, z₂ = (14 − 1.998 − 2.010)/10 = 0.999

Iteration 3: x₃ = (12 − 1.005 − 0.999)/10 = 1.000, y₃ = (13 − 2.000 − 0.999)/10 = 1.000, z₃ = (14 − 2.000 − 2.000)/10 = 1.000

**Answer: x = 1.000, y = 1.000, z = 1.000**

---

## Q6) Interpolation and Integration

### a) Newton's forward difference

| x | f(x) | Δf | Δ²f | Δ³f | Δ⁴f |
|---|------|-----|-----|-----|-----|
| 1.0 | 2.0 | 0.6 | 0.2 | 0.0 | 0.0 |
| 1.2 | 2.6 | 0.8 | 0.2 | 0.0 | |
| 1.4 | 3.4 | 1.0 | 0.2 | | |
| 1.6 | 4.4 | 1.2 | | | |
| 1.8 | 5.6 | | | | |

h = 0.2, u = (1.5 − 1.0)/0.2 = 2.5

f(1.5) = 2.0 + 2.5(0.6) + 2.5(1.5)(0.2)/2! + 2.5(1.5)(0.5)(0)/3! + ...
f(1.5) = 2.0 + 1.5 + 0.375 + 0 = **3.875**

**Answer: f(1.5) = 3.875**

### b) Simpson's 1/3 rule

∫₀¹ eˣ dx, n = 4, h = (1 − 0)/4 = 0.25

| x | 0 | 0.25 | 0.50 | 0.75 | 1.00 |
|---|-----|------|------|------|------|
| eˣ | 1.000 | 1.284 | 1.649 | 2.117 | 2.718 |

Simpson's rule: ∫ ≈ (h/3)[(y₀ + y₄) + 4(y₁ + y₃) + 2(y₂)]

= (0.25/3)[(1 + 2.718) + 4(1.284 + 2.117) + 2(1.649)]
= 0.0833[3.718 + 4(3.401) + 3.298]
= 0.0833[3.718 + 13.604 + 3.298]
= 0.0833 × 20.620 = **1.718**

**Answer: ∫₀¹ eˣ dx ≈ 1.718 (exact: 1.71828)**

---

═══════════════════════════════════════════════════════
EXAMINER COMMENTARY

Why this scores full marks:
- MCQs answered with justification for each option
- Bayes' theorem applied with clear event decomposition
- Newton-Raphson shown with iteration-by-iteration working
- Gauss-Seidel shows convergence across 3 iterations
- Difference table constructed with all orders of differences
- All numerical answers boxed with correct significant figures

Common Deductions:
- Not stating the formula before substituting values
- Premature rounding leading to cascading errors
- Incomplete iteration tables for numerical methods
- Not justifying MCQ answers
- Missing units or incorrect significant figures

Time Budget:
- Q1 (10 marks): 15 min → 2-3 min per MCQ
- Q2 (18 marks): 42 min → Q2a: 22 min, Q2b: 20 min
- Q4 (18 marks): 42 min → Q4a: 22 min, Q4b: 20 min
- Q6 (17 marks): 40 min → Q6a: 22 min, Q6b: 18 min
- Buffer: 11 min for review

═══════════════════════════════════════════════════════
