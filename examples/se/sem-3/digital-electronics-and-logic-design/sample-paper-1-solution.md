# Digital Electronics and Logic Design — Sample Paper 1 — Ideal Solution

---

## Q1) Sequential Logic Design

### a) Combinational vs Sequential circuits

| Basis | Combinational Circuits | Sequential Circuits |
|-------|----------------------|-------------------|
| Memory | No memory — output depends only on current inputs | Has memory — output depends on current inputs + past state |
| Feedback | No feedback path | Feedback path present |
| Clock | No clock required | Requires clock signal |
| Examples | Half adder, MUX, decoder, encoder | Flip-flops, counters, shift registers |

Thus, combinational circuits process present inputs while sequential circuits store state information.

### b) Flip-flop conversion

**i) SR to T flip-flop:**

Truth table for T-FF: T=0 → hold, T=1 → toggle
Using characteristic equation: Q₍ₙ₊₁₎ = S + R̅Qₙ for SR-FF, and Q₍ₙ₊₁₎ = TQ̅ₙ + T̅Qₙ for T-FF.
Equating: S = TQ̅ₙ and R = TQₙ

**ii) JK to D flip-flop:**
Using characteristic equations: Q₍ₙ₊₁₎ = JQ̅ₙ + K̅Qₙ for JK-FF, and Q₍ₙ₊₁₎ = D for D-FF.
Equating: J = D and K = D̅

### c) MOD-7 counter using IC 7490

**IC 7490** is a decade counter. MOD-7 counter counts from 0 to 6.

Design: Connect QA to CLKB (BCDA configuration for BCD counting). Counter resets when count reaches 7 (0111). Connect outputs QB, QC, QD (bits 1,2,3) to a NAND gate → reset pins R0(1) and R0(2).

**Answer: MOD-7 counter — counts 0000 to 0110, resets at 0111.**

---

## Q3) Algorithmic State Machines and PLDs

### a) ASM chart for 2-bit binary counter with enable

**State diagram**: 4 states (S0=00, S1=01, S2=10, S3=11). When E=1, transition to next state. When E=0, remain in current state.

**ASM elements:**
- **State box**: Contains register operations (counter value)
- **Decision box**: Tests the enable line E
- **Conditional output box**: Outputs current count

The ASM chart shows: State → Decision (E=1?) → Yes: Increment → Next state / No: No increment → Next state.

### b) PAL implementation

**PAL (Programmable Array Logic)** has a programmable AND array and fixed OR array.

For the given functions F1, F2, F3, the PAL implementation involves:
1. Listing all product terms (minterms)
2. Programming AND connections
3. Fixed OR connections combine product terms

**PAL diagram shows** AND gates with programmable connections feeding into fixed OR gates.

### c) PLA block diagram

```
          +-------------------+
Inputs -->| Programmable AND  |--> Product terms
          | Array             |
          +-------------------+
                   |
                   v
          +-------------------+
          | Programmable OR   |--> Outputs
          | Array             |
          +-------------------+
```

**PLA (Programmable Logic Array)** has both programmable AND and OR arrays, offering more flexibility than PAL.

---

## Q5) Logic Families

### a) Two-input TTL NAND gate

The **TTL NAND gate** consists of:
1. **Input stage**: Multi-emitter transistor Q₁
2. **Phase splitter**: Transistor Q₂ driving Q₃ and Q₄
3. **Output stage**: Totem-pole output (Q₃ and Q₄)

**Working**: When both inputs are HIGH, Q₁ is reverse-biased, Q₂ and Q₃ turn ON, output goes LOW (L). When any input is LOW, Q₁ is forward-biased, Q₂ and Q₃ turn OFF, Q₄ turns ON, output goes HIGH (H).

### b) CMOS inverter

```
      Vdd
       |
   Q₁ (PMOS)
       |
Input--+--Output
       |
   Q₂ (NMOS)
       |
      GND
```

**Working**: When input = 0V (LOW), Q₁ (PMOS) ON, Q₂ (NMOS) OFF → output = Vdd (HIGH). When input = Vdd (HIGH), Q₁ OFF, Q₂ ON → output = 0V (LOW).

Thus, CMOS inverter consumes negligible static power since one transistor is always OFF.

### c) TTL characteristics

i) **Fan-out**: Maximum number of standard loads a gate can drive without degrading performance. Standard TTL fan-out = 10.

ii) **Power dissipation**: Total power consumed by the gate (static + dynamic). Standard TTL = approximately 10 mW per gate.

iii) **Propagation delay**: Time taken for output to change after input changes. Standard TTL tpd ≈ 10 ns per gate.

Thus, these characteristics determine the speed, power, and driving capability of digital circuits.

---

## Q7) Introduction to Computer Architecture

### a) Microprocessor-based system

```
+-------------+     +-------------+
|   CPU / μP  |<--->|   Memory    |
|             |     | (ROM + RAM) |
+------+------+     +-------------+
       |
+------+------+
| I/O Devices |
| (Keyboard,  |
|  Display,   |
|  Printer)   |
+-------------+
```

The basic system consists of a **microprocessor**, **memory** (program + data storage), and **I/O devices** connected via a system bus.

### b) System bus structure

**System bus** consists of three groups of parallel lines:

1. **Data bus**: Bidirectional — carries data between μP, memory, and I/O (8, 16, or 32 bits wide)
2. **Address bus**: Unidirectional from μP — carries memory/I/O addresses
3. **Control bus**: Bidirectional — carries control signals (RD, WR, RESET, INT, etc.)

Thus, the system bus enables communication between all components in a microprocessor-based system.

### c) ALU using IC 74181

**IC 74181** is a 4-bit ALU capable of performing 16 arithmetic and 16 logic operations. It can be cascaded for wider word lengths (8-bit, 16-bit, 32-bit).

Arithmetic operations: ADD, SUBTRACT, INCREMENT, DECREMENT, etc.
Logic operations: AND, OR, XOR, NOT, NAND, NOR, etc.
Selection is controlled by mode select (M) and function select (S₃ S₂ S₁ S₀) pins.

**Answer: IC 74181 provides 32 operations, cascadeable for wider ALUs.**

---

═══════════════════════════════════════════════════════
EXAMINER COMMENTARY

Why this scores full marks:
- Circuit diagrams included with labeled components and connections
- Flip-flop conversion explained with characteristic equations
- Characteristic parameters defined with standard TTL values
- ASM elements clearly explained with state and decision boxes
- PLA vs PAL distinction with architecture diagrams
- Bus structure broken down into three bus types

Common Deductions:
- Not showing characteristic equations for flip-flop conversion
- Incomplete timing diagrams for counters
- Missing standard TTL/CMOS parameter values
- Confusing PLA with PAL architecture
- Not labeling bus direction (unidirectional vs bidirectional)
- Omitting the working principle for TTL/CMOS gates

Time Budget:
- Q1 (18 marks): 42 min → Q1a: 14 min, Q1b: 14 min, Q1c: 14 min
- Q3 (17 marks): 40 min → Q3a: 14 min, Q3b: 14 min, Q3c: 12 min
- Q5 (18 marks): 42 min → Q5a: 14 min, Q5b: 14 min, Q5c: 14 min
- Q7 (17 marks): 40 min → Q7a: 14 min, Q7b: 14 min, Q7c: 12 min

═══════════════════════════════════════════════════════
