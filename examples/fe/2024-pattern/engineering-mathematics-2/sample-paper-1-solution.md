# Engineering Mathematics II — Sample Paper 1 — Solution

**Pattern:** SPPU 2024 (NEP) | **Total:** 70 Marks | **Time:** 2½ Hours

---

## Q1) OR Q2

### Q1) a) Solve: y'' - 4y' + 3y = 0 [4]

**Auxiliary equation:** `m² - 4m + 3 = 0`
`(m - 1)(m - 3) = 0`
`m = 1, 3`

**Solution:** `y = C₁e^x + C₂e^{3x}`

---

### Q1) b) Solve: y'' + 2y' + y = e^x [6]

**Auxiliary equation:** `m² + 2m + 1 = 0`
`(m + 1)² = 0`
`m = -1, -1` (repeated roots)

**CF:** `y_c = (C₁ + C₂x)e^{-x}`

**PI:** Try `y_p = Ae^x`. Substituting: A = 1/4
**PI:** `y_p = (1/4)e^x`

**Complete solution:** `y = (C₁ + C₂x)e^{-x} + (1/4)e^x`

---

### Q1) c) Solve: y'' + 9y = sin(2x) [4]

**CF:** `y_c = C₁cos(3x) + C₂sin(3x)`

**PI:** Try `y_p = A sin(2x)`. Substituting: -4A + 9A = 1 → 5A = 1 → A = 1/5

**PI:** `y_p = (1/5)sin(2x)`

**Complete solution:** `y = C₁cos(3x) + C₂sin(3x) + (1/5)sin(2x)`

---

### Q2) a) PI for y'' + 4y = cos(2x) [4]

**Note:** cos(2x) is part of CF (since m = ±2i)

**PI:** Try `y_p = Ax·sin(2x)` (multiply by x for resonance)

Substituting: A = 1/4

**PI:** `y_p = (x/4)sin(2x)`

---

### Q2) b) Cauchy-Euler: x²y'' - 2xy' + 2y = x³ [6]

**Put x = e^t, then using D operator:**
`[D(D-1) - 2D + 2]y = e^{3t}`
`[D² - 3D + 2]y = e^{3t}`

**AE:** m² - 3m + 2 = 0 → m = 1, 2

**CF:** `y_c = C₁e^t + C₂e^{2t} = C₁x + C₂x²`

**PI:** y_p = (1/(D²-3D+2))e^{3t} = e^{3t}/(9-9+2) = e^{3t}/2

**Solution:** `y = C₁x + C₂x² + x³/2`

---

### Q2) c) Solve: y'' - 3y' + 2y = x² + e^x [4]

**CF:** y_c = C₁e^x + C₂e^{2x}

**PI (x²-term):** Try ax² + bx + c → gives: y_p1 = (1/2)x² + (3/2)x + 7/4

**PI (e^x-term):** Since e^x is in CF, try A·x·e^x → y_p2 = -x·e^x

**Complete:** `y = C₁e^x + C₂e^{2x} + x²/2 + 3x/2 + 7/4 - xe^x`

---

## Q3) OR Q4

### Q3) a) ∬(x²+y²)dxdy over y=x² and y=x [6]

**Limits:** x: 0→1, y: x²→x

```
I = ∫₀¹ ∫_{x²}^{x} (x²+y²) dy dx
  = ∫₀¹ [x²y + y³/3]_{x²}^{x} dx
  = ∫₀¹ [x³ + x³/3 - x⁴ - x⁶/3] dx
  = ∫₀¹ (4x³/3 - x⁴ - x⁶/3) dx
  = [x⁴/3 - x⁵/5 - x⁷/21]₀¹
  = 1/3 - 1/5 - 1/21 = (35 - 21 - 5)/105 = 9/105 = 3/35
```

---

### Q4) a) ∭xyzdzdydx where 0≤x≤1, 0≤y≤x, 0≤z≤xy [6]

```
I = ∫₀¹ ∫₀ˣ ∫₀ˣʸ xyz dz dy dx
  = ∫₀¹ ∫₀ˣ [xyz²/2]₀ˣʸ dy dx
  = ∫₀¹ ∫₀ˣ (x·y·x²y²/2) dy dx
  = ∫₀¹ ∫₀ˣ (x³y³/2) dy dx
  = ∫₀¹ [x³y⁴/8]₀ˣ dx
  = ∫₀¹ x⁷/8 dx
  = [x⁸/64]₀¹ = 1/64
```

---

### Q4) b) Area between y²=4x and y=2x-4 [8]

**Intersection:** (2x-4)² = 4x → 4x² - 16x + 16 = 4x → 4x² - 20x + 16 = 0 → x² - 5x + 4 = 0 → x = 1, 4

**Points:** (1,-2), (4,4)

```
Area = ∫₁⁴ [(2x-4) - (-2√x)] dx   (upper function minus lower)
     (split at y=0 if needed for proper integration)
```

**Result:** **Area = 9 square units**

---

## Q5) OR Q6

### Q5) a) Fourier series for f(x)=x in 0<x<π [8]

**a₀:** `(2/π)∫₀^π x dx = (2/π)[x²/2]₀^π = π`

**a_n:** `(2/π)∫₀^π x·cos(nx)dx = (2/π)[(cos(nπ)-1)/n²]`

For n even: a_n = 0; For n odd: a_n = -4/(n²π)

**b_n:** `(2/π)∫₀^π x·sin(nx)dx = 2(-1)^{n+1}/n`

**Fourier series:**
```
f(x) = π/2 + Σ[-4cos((2k-1)x)/(π(2k-1)²) + 2(-1)^{n+1}sin(nx)/n]
     (up to third harmonic: n=1,2,3)
```

---

### Q5) b) Half-range sine series for f(x)=x(π-x) in 0<x<π [6]

**b_n:** `(2/π)∫₀^π x(π-x)·sin(nx)dx`

```
b_n = (4/(n³π))(1 - (-1)^n)
```

For n even: b_n = 0; For n odd: b_n = 8/(n³π)

**Series:** `f(x) = (8/π)[sin(x)/1³ + sin(3x)/3³ + sin(5x)/5³ + ...]`

---

## Q7) OR Q8

### Q7) a) Laplace Transforms [6]

**(i) L[t³ + 2t² - 3t + 1]:**
= 3!/s⁴ + 2·2!/s³ - 3·1/s² + 1/s
= **6/s⁴ + 4/s³ - 3/s² + 1/s**

**(ii) L[e^(-t)·sin(2t)]:**
Using first shifting: L[sin(2t)] = 2/(s²+4), shift s→(s+1)
= **2/((s+1)² + 4) = 2/(s²+2s+5)**

---

### Q7) b) Inverse Laplace: (s+3)/((s+1)(s+2)) [4]

**Partial fractions:**
```
(s+3)/((s+1)(s+2)) = A/(s+1) + B/(s+2)
A = 2, B = -1
```

**Inverse:** `L⁻¹[2/(s+1) - 1/(s+2)] = 2e^{-t} - e^{-2t}`

---

### Q7) c) Solve y''+3y'+2y=0, y(0)=1, y'(0)=0 using LT [4]

Taking LT: `s²Y - s + 3sY - 3 + 2Y = 0`
`(s² + 3s + 2)Y = s + 3`
`Y = (s+3)/((s+1)(s+2)) = 2/(s+1) - 1/(s+2)`

**Inverse:** `y(t) = 2e^{-t} - e^{-2t}`

---

### Q8) b) Convolution theorem: L⁻¹[s/((s²+1)(s²+4))] [4]

**L⁻¹[s/(s²+1)] = cos(t)**
**L⁻¹[1/(s²+4)] = (1/2)sin(2t)**

Using convolution:
```
f(t) = ∫₀ᵗ cos(τ)·(1/2)sin(2(t-τ))dτ
```

**Result:** `f(t) = (cos(t) - cos(2t))/3`

---

## Q9) OR Q10

### Q9) a) Gradient and directional derivative [8]

**φ = x²yz + xy²z + xyz²**

**Gradient:** `∇φ = (∂φ/∂x, ∂φ/∂y, ∂φ/∂z)`

∂φ/∂x = 2xyz + y²z + yz²
∂φ/∂y = x²z + 2xyz + xz²
∂φ/∂z = x²y + xy² + 2xyz

**At (1, -1, 2):**
∇φ = (2×1×(-1)×2 + 1×2 + 1×2², 1²×2 + 2×1×(-1)×2 + 1×2², 1²×(-1) + 1×(-1)² + 2×1×(-1)×2)
= (-4+2+4, 2-4+4, -1+1-4)
= **(2, 2, -4)**

**Directional derivative in direction (1,2,-1):**
Unit vector = (1,2,-1)/√6
D_uφ = (2,2,-4)·(1,2,-1)/√6 = (2+4+4)/√6 = **10/√6**

---

### Q10) a) Greens Theorem verification [8]

**∮(x²-y²)dx + (x²+y²)dy** over triangle (0,0), (1,0), (1,1)

**LHS (line integral):**
C₁: y=0, dy=0, 0→1: ∫x²dx = 1/3
C₂: x=1, dx=0, 0→1: ∫(1+y²)dy = [y+y³/3]₀¹ = 4/3
C₃: y=x, dy=dx, 1→0: ∫[(x²-x²)+(x²+x²)]dx = ∫₂x²dx from 1→0 = -2/3

**LHS = 1/3 + 4/3 - 2/3 = 1**

**RHS (Green's):** ∬(∂Q/∂x - ∂P/∂y)dA where P=x²-y², Q=x²+y²

∂Q/∂x = 2x, ∂P/∂y = -2y
∬(2x + 2y)dA = ∫₀¹∫₀ˣ(2x+2y)dy·dx = ∫₀¹[2xy + y²]₀ˣdx = ∫₀¹3x²dx = 1

**LHS = RHS = 1 ✓** Greens theorem verified.

---

## Mnemonic Summary

| Topic | Mnemonic |
|-------|----------|
| **DE types** | **HLNC** — Homogeneous, Linear, Non-linear, Cauchy |
| **Fourier coefficients** | **A0, AN, BN** — Average, cos Amplitude, sin Amplitude |
| **Laplace shifting** | **1st Shift:** L[e^{at}f(t)] = F(s-a) |
| | **2nd Shift:** L[f(t-a)u(t-a)] = e^{-as}F(s) |
| **Vector operators** | **GDC** — Gradient (scalar→vector), Divergence (vector→scalar), Curl (vector→vector) |
| **Green's theorem** | **Line integral → Double integral:** circulation around boundary = curl inside |
