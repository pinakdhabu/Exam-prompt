# Microprocessor — Sample Paper 1 — Ideal Solution

---

## Q1) Memory Management

### a) System and non-system descriptors in 80386

**Descriptors** are 8-byte entries in descriptor tables that define the properties of memory segments.

**System descriptors**:
1. **LDT descriptor**: Defines the Local Descriptor Table segment
2. **TSS descriptor**: Defines Task State Segment for task switching
3. **Call gate descriptor**: Enables inter-privilege level control transfer
4. **Interrupt gate descriptor**: Defines interrupt handler entry points
5. **Trap gate descriptor**: Defines trap handler entry points

**Non-system (code/data) descriptors**:
1. **Code segment descriptor**: Defines executable memory segments with read/execute permissions
2. **Data segment descriptor**: Defines readable/writable data segments including stack segments

Thus, descriptors define the type, base address, limit, and access rights for each memory segment.

### b) LGDT, LIDT, SIDT instructions

i) **LGDT (Load Global Descriptor Table Register)**: Loads the base address and limit of the GDT into the GDTR. Syntax: `LGDT mem48`. Used during system initialization.

ii) **LIDT (Load Interrupt Descriptor Table Register)**: Loads the base address and limit of the IDT into the IDTR. Syntax: `LIDT mem48`. Sets up the interrupt vector table.

iii) **SIDT (Store Interrupt Descriptor Table Register)**: Stores the contents of IDTR (base + limit) into memory. Syntax: `SIDT mem48`. Used for saving/querying IDT configuration.

Thus, these instructions manage the descriptor table registers essential for protected mode operation.

### c) Address translation in 80386

```
              Logical Address (Selector:Offset)
                      |
                      v
            Segmentation Unit
            (Uses GDT/LDT via GDTR/LDTR)
                      |
                      v
            Linear Address (32-bit)
                      |
                      v
              Paging Unit (if enabled)
            (Uses Page Directory/Page Tables via CR3)
                      |
                      v
            Physical Address (32-bit)
```

**Step 1**: The selector indexes into GDT or LDT to obtain the segment descriptor containing base address.
**Step 2**: Base address + offset → Linear address.
**Step 3**: If paging is enabled, the linear address is translated through page directory and page tables to the physical address.

Thus, segmentation and paging provide memory protection and virtualization.

---

## Q3) Protection

### a) Five aspects of protection in segmentation

1. **Type checking**: Code segments are execute-only or execute/read; data segments are read/write. Prevents executing data or writing to code.
2. **Limit checking**: Every access is verified against the segment limit. Prevents out-of-bounds memory access.
3. **Privilege level checking**: The Current Privilege Level (CPL) is compared against the Descriptor Privilege Level (DPL). Prevents lower-privilege access to higher-privilege segments.
4. **Procedure entry restrictions**: Call gates enforce controlled entry into higher-privilege procedures.
5. **I/O protection**: The I/O Privilege Level (IOPL) controls access to I/O instructions, preventing user programs from directly accessing hardware.

Thus, segmented protection provides layered security for multi-tasking operating systems.

### b) DPL, EPL, IOPL

**DPL (Descriptor Privilege Level)**: The privilege level stored in a segment descriptor indicating which privilege levels can access the segment. Ranges from 0 (most privileged, kernel) to 3 (least privileged, user).

**EPL (Effective Privilege Level)**: The lower (numerically larger) of CPL and Requested Privilege Level (RPL). EPL = max(CPL, RPL). Used for access checking between segments.

**IOPL (I/O Privilege Level)**: A field in the EFLAGS register that defines the minimum privilege level required to execute I/O-sensitive instructions (IN, OUT, CLI, STI). IOPL = 0 means only ring 0 can perform I/O.

Thus, these privilege mechanisms enforce controlled access to protected resources.

### c) Need for protection in 80386

**Protection mechanisms** are needed to:
1. **Isolate user processes**: Prevent one application from corrupting another's memory
2. **Protect the operating system**: Prevent user programs from accessing kernel memory and data structures
3. **Prevent unauthorized I/O**: Stop user programs from directly manipulating hardware
4. **Support multi-tasking**: Enable safe context switching between tasks
5. **Detect programming errors**: Trap illegal memory accesses (null pointers, buffer overflows)

Thus, protection is fundamental to modern multi-tasking operating systems running on the 80386.

---

## Q5) Multitasking and Virtual 8086 Mode

### a) V86 task structure and protection

The **Virtual 8086 (V86) task** is a special execution mode that allows running 8086 real-mode programs within a protected-mode environment.

**Structure:**
- V86 tasks run at CPL = 3 (least privileged)
- The V86 flag in EFLAGS distinguishes V86 mode from protected mode
- 1 MB address space is emulated using page tables for linear-to-physical mapping
- I/O permissions are controlled via the I/O Permission Bitmap (IOPB) in the TSS

**Protection within V86**: I/O-sensitive instructions (INT, CLI, STI, IN, OUT) cause a General Protection Fault (#GP) unless the corresponding bit in the IOPB permits the operation.

### b) Task State Segment (TSS)

```
+-----------------------+
| Back link (prev TSS)  | ← 0
+-----------------------+
| ESP0 (stack pointer)  | ← Ring 0 stack
+-----------------------+
| SS0 (stack segment)   |
+-----------------------+
| ... (ESP1, SS1, etc.) |
+-----------------------+
| CR3 (page directory)  | ← Page table base
+-----------------------+
| EIP, EAX, EBX, ...    | ← Saved register state
+-----------------------+
| (registers continued) | ← General purpose + segment regs
+-----------------------+
| LDT selector          | ← Task's LDT
+-----------------------+
| I/O bitmap base       | ← I/O permission bitmap offset
+-----------------------+
```

The **TSS** holds the complete execution state for a task, enabling context switching between tasks.

### c) Entering and leaving virtual mode

**Entering V86 Mode:**
1. Set the VM flag in EFLAGS to 1
2. Load a segment selector that points to a segment descriptor with DPL=0
3. The processor switches to V86 mode when executing IRETD to a code segment in V86 mode
4. Memory management uses page tables for linear-to-physical translation

**Leaving V86 Mode:**
1. A trap, interrupt, or exception in V86 mode transfers control back to the protected-mode handler
2. The VM flag is automatically cleared
3. The processor returns to protected mode at the privilege level specified in the handler's code segment

Thus, the V86 mode enables backward compatibility with 8086 software within a protected environment.

---

## Q7) Interrupts and Microcontrollers

### a) Interrupt handling in protected mode

```
      Interrupt Vector N
           |
           v
     IDT Entry (Interrupt/Task/Trap Gate)
           |
           v
     Check: DPL ≥ CPL (or via IDT)
           |
           v
     Obtain handler address from gate descriptor:
     Selector:Offset
           |
           v
     Privilege check: CPL vs handler DPL
           |
           v
     If privilege level changes: Stack switch via TSS
     Push: SS, ESP, EFLAGS, CS, EIP, Error Code
           |
           v
     Execute handler → IRETD returns to original code
```

### b) Enabling and disabling interrupts in 80386

1. **CLI (Clear Interrupt Flag)**: Clears IF in EFLAGS. Disables maskable hardware interrupts (INTR). Only executable when CPL ≤ IOPL.

2. **STI (Set Interrupt Flag)**: Sets IF in EFLAGS. Enables maskable hardware interrupts. After STI, interrupts are recognized after the next instruction.

3. **IF flag**: Controls recognition of INTR. Non-maskable interrupts (NMI) are unaffected.

4. **VIF (Virtual Interrupt Flag)**: Virtual IF for V86 mode operation — allows user-level IF manipulation under OS control.

### c) Applications of microcontrollers

1. **Automotive systems**: Engine control units (ECUs), anti-lock braking systems (ABS), airbag control
2. **Home appliances**: Washing machines, microwave ovens, smart refrigerators
3. **Consumer electronics**: TV remotes, gaming controllers, digital cameras
4. **Industrial control**: Programmable Logic Controllers (PLCs), robotics, sensor networks
5. **Medical devices**: Glucose monitors, pacemakers, infusion pumps
6. **IoT devices**: Smart sensors, wearable fitness trackers, home automation

Thus, microcontrollers are ubiquitous in embedded systems requiring dedicated control and low power consumption.

---

═══════════════════════════════════════════════════════
EXAMINER COMMENTARY

Why this scores full marks:
- Descriptor classification is comprehensive with system vs non-system types
- Address translation shown as a clear flowchart with pipeline stages
- Protection mechanism explanation references specific privilege level bits
- TSS layout shown as a structured memory map with field descriptions
- V86 mode entry/exit explained with specific flag manipulations
- Interrupt handling flow includes privilege checks and stack switching

Common Deductions:
- Confusing GDTR/LDTR/IDTR register purposes
- Not distinguishing between segments with DPL=0 vs DPL=3
- Missing the role of RPL in EPL computation
- Incomplete TSS structure — omitting I/O bitmap base or LDT selector
- Not explaining stack switch in protected-mode interrupt handling
- Omitting the distinction between IF (maskable) and NMI (non-maskable)

Time Budget:
- Q1 (18 marks): 42 min → Q1a: 14 min, Q1b: 14 min, Q1c: 14 min
- Q3 (17 marks): 40 min → Q3a: 14 min, Q3b: 14 min, Q3c: 12 min
- Q5 (18 marks): 42 min → Q5a: 14 min, Q5b: 14 min, Q5c: 14 min
- Q7 (17 marks): 40 min → Q7a: 15 min, Q7b: 13 min, Q7c: 12 min

═══════════════════════════════════════════════════════
