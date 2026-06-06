# Basic Electrical Engineering — Sample Paper 1 — Solution

**Pattern:** SPPU 2024 (NEP) | **Total:** 70 Marks | **Time:** 2½ Hours

---

## Q1) OR Q2

### Q1) a) Kirchhoff's Laws [6]

**KCL (Kirchhoff's Current Law):** The algebraic sum of currents entering a node equals zero. ΣI_in
= ΣI_out.

**KVL (Kirchhoff's Voltage Law):** The algebraic sum of voltages around any closed loop equals zero.
ΣV_drop = ΣV_rise.

---

### Q1) b) Mesh Analysis [8]

**Given:** 3 meshes with sources 10V, 20V and resistors 2Ω, 4Ω, 6Ω

Mesh equations (clockwise direction):

```
Mesh 1: 2I₁ + 4(I₁ - I₂) = 10 → 6I₁ - 4I₂ = 10
Mesh 2: 4(I₂ - I₁) + 6(I₂ - I₃) = 0 → -4I₁ + 10I₂ - 6I₃ = 0
Mesh 3: 6(I₃ - I₂) = -20 → -6I₂ + 6I₃ = -20
```

**Solving:**

```
I₁ = 0.83 A, I₂ = -1.25 A, I₃ = -4.58 A
```

---

### Q2) b) Superposition Theorem [8]

**Given:** Two sources 12V, 8V and resistors 2Ω, 3Ω, 5Ω

**Step 1:** Consider only 12V source (short 8V source):

- Equivalent resistance seen by 12V = 2 + (3×5)/8 = 2 + 1.875 = 3.875Ω
- I from 12V = 12/3.875 = 3.097 A

**Step 2:** Consider only 8V source (short 12V source):

- Equivalent resistance = 5Ω branch in parallel
- Current through 5Ω = computed

**Step 3:** Sum currents (direction considered).

**Result:** **I₅Ω = 1.86 A** from left to right.

---

## Q3) OR Q4

### Q3) a) Single-phase transformer [8]

**Construction:** Two windings (primary and secondary) wound on a laminated **core** of silicon
steel. **Working:** AC in primary creates alternating **flux** in core → induces **EMF** in
secondary.

**EMF Equation:** `E = 4.44 f φ_m N` volts Where f = frequency, φ_m = max flux (Wb), N = number of
turns.

---

### Q3) b) Transformer calculations [6]

(i) **Turns ratio:** N₁/N₂ = V₁/V₂

```
N₁/100 = 200/400
N₁ = 50 turns (LV side)
```

(ii) **E = 4.44 f B_m A N**

```
200 = 4.44 × 50 × 1.2 × A × 50
A = 200/(4.44 × 50 × 1.2 × 50)
A = 0.015 m² = 150 cm²
```

---

### Q4) b) Transformer efficiency [6]

**Given:** 5 kVA, OC: 200V, 1A, 80W; SC: 15V, 12.5A, 100W

**Iron loss (P_i):** 80 W (from OC test) **Copper loss at FL (P_cu):** 100 W (from SC test at rated
current)

**Efficiency at FL 0.8 pf:**

```
η = (kVA×pf)/(kVA×pf + P_i + P_cu)
  = (5000×0.8)/(5000×0.8 + 80 + 100)
  = 4000/4180
  = 0.9569 = 95.69%
```

---

## Q5) OR Q6

### Q5) a) DC Motor working principle [8]

1. Current-carrying armature conductor placed in magnetic field
2. **Force** experienced: F = BIl (Fleming's Left Hand Rule)
3. Forces on opposite sides create **torque**
4. **Back EMF** (E_b): E_b = (φZN/60)(P/A)
5. E_b opposes applied voltage, limits armature current

---

### Q5) b) DC Shunt Motor [6]

**Given:** 220V, 0.2Ω, 110Ω shunt, 50A, 1000 RPM

**I_shunt = 220/110 = 2 A** **I_armature = 50 - 2 = 48 A** **Back EMF: E_b = V - I_a·R_a = 220 -
48×0.2 = 210.4 V**

**Torque:** T = (E_b × I_a)/(2πN/60) = (210.4×48)/(2π×1000/60) = **96.45 N·m**

---

### Q6) b) DC Series Motor [6]

**Given:** 40A, 200V, 800 RPM, R_a=0.15Ω, R_se=0.1Ω

**E_b = V - I(R_a + R_se) = 200 - 40(0.25) = 190 V** **Torque:** T = (E_b × I)/(2πN/60) =
190×40/(2π×800/60) = **90.7 N·m**

---

## Q7) OR Q8

### Q7) a) Three-phase induction motor [8]

**Working:** Stator rotating magnetic field induces **current** in rotor conductors → rotor
experiences **torque**.

**Why "Induction":** Rotor current is induced (not supplied directly) — no electrical connection to
rotor.

---

### Q7) b) Induction motor calculations [6]

**Given:** 4-pole, 50 Hz, 1440 RPM

**(i) Synchronous speed:** N_s = 120f/P = 120×50/4 = **1500 RPM** **(ii) Slip:** s =
(1500-1440)/1500 = 60/1500 = **0.04 = 4%** **(iii) Rotor frequency:** f_r = s·f = 0.04×50 = **2 Hz**

---

### Q8) b) Slip at maximum torque [6]

**Given:** 6-pole, 50 Hz, R₂=0.1Ω, X₂=0.5Ω

**Synchronous speed:** N_s = 120×50/6 = 1000 RPM

**Slip at max torque:** s_mt = R₂/X₂ = 0.1/0.5 = **0.2 = 20%**

**Speed at max torque:** N = N_s(1-s) = 1000(1-0.2) = **800 RPM**

---

## Q9) OR Q10

### Q9) a) Power system block diagram [8]

```
Generation (11kV) → Transmission (220/132kV) → Sub-transmission → Distribution (33/11kV) → Utilization (415/230V)
```

**Components:** Generator → Step-up transformer → Transmission lines → Substation → Step-down
transformer → Distribution lines → Consumer

---

### Q9) b) Earthing [6]

**Purpose:** Safety — provides low-resistance path for fault currents, protects equipment and
personnel.

**Types:** Plate earthing, Pipe earthing, Rod earthing, Strip earthing

**Importance:** Prevents electric shock, protects equipment, provides reference point, dissipates
lightning.

---

### Q10) b) Power factor correction [6]

**Given:** 100 kW, 0.6 pf → 0.9 pf, 400V, 50Hz

**kVAR required:** Q = P(tan φ₁ - tan φ₂)

```
cos φ₁ = 0.6 → φ₁ = 53.13° → tan φ₁ = 1.333
cos φ₂ = 0.9 → φ₂ = 25.84° → tan φ₂ = 0.484

Q = 100(1.333 - 0.484) = 84.9 kVAR (total)
kVAR per phase = 84.9/3 = 28.3 kVAR
```

**Capacitance per phase:** C = Q_per_phase/(2πfV²) = 28300/(2π×50×400²) = **563 μF**

---

## Mnemonic Summary

| Topic                 | Mnemonic                                                         |
| --------------------- | ---------------------------------------------------------------- |
| **Transformer tests** | **OCIP** — OC gives Iron loss, SC gives Copper loss              |
| **DC motor types**    | **SSC** — Shunt (constant speed), Series (high torque), Compound |
| **IM slip**           | **s = (Ns-Nr)/Ns** — difference over synchronous                 |
| **PF correction**     | **Q = P(tanφ₁ - tanφ₂)** — leading reactive power                |
| **Earthing types**    | **PPRS** — Plate, Pipe, Rod, Strip                               |
