# Software Engineering — Sample Paper 1 — Ideal Solution

---

## Q1) Design Engineering

### a) Four design concepts

1. **Abstraction**: Hiding implementation details and exposing only essential features. Example: A
   class `Student` provides `calculateGPA()` without revealing internal grade calculation logic.

2. **Modularity**: Dividing a system into independently functional modules with well-defined
   interfaces. Example: An e-commerce system with separate modules for inventory, payment, and user
   management.

3. **Refinement**: Stepwise decomposition from high-level abstract statements to detailed design.
   Example: Starting with "Process order" → decomposed into "Validate → Payment → Ship → Notify".

4. **Architecture**: The overall structure of the system — components, their relationships, and
   properties. Example: A layered architecture with presentation, business logic, and data access
   layers.

Thus, these concepts guide the creation of maintainable and scalable software designs.

### b) Design patterns

**Design patterns** are reusable solutions to commonly occurring problems in software design.

Patterns can be used in design by:

1. **Identification**: Recognizing a recurring problem in the current design context
2. **Selection**: Choosing the appropriate pattern (Creational, Structural, or Behavioral)
3. **Adaptation**: Adjusting the pattern to fit specific requirements
4. **Integration**: Incorporating the pattern into the overall architecture

Example: The **Observer pattern** is used for event handling systems where multiple objects need
notification of state changes.

Thus, design patterns provide proven solutions that reduce design risk and improve communication
among developers.

---

## Q3) Estimation and Scheduling

### a) W5HH principle

The **W5HH principle** (by Barry Boehm) answers five questions for project planning:

1. **Why** is the system being developed? — Justification and business goals
2. **What** will be done? — Functions, features, and deliverables
3. **When** will it be done? — Timeline, milestones, deadlines
4. **Who** is responsible? — Team roles and responsibilities
5. **Where** is it located? — Organizational and physical location
6. **How** will it be done? — Technical approach, methods, tools
7. **How much** will it cost? — Budget estimation and resources

Thus, W5HH provides a comprehensive framework for project planning that covers all stakeholder
concerns.

### b) Project management life cycle

The **project management life cycle** consists of five phases:

1. **Initiation**: Defining project scope, goals, and feasibility. Creating the project charter.
2. **Planning**: Developing detailed plans — schedule, budget, resources, risk management, quality
   plan.
3. **Execution**: Implementing the plan — developing the product, managing teams, communication.
4. **Monitoring and Control**: Tracking progress against plans — status reports, change control,
   quality audits.
5. **Closure**: Final delivery, documentation, lessons learned, resource release.

Thus, the project management life cycle provides structured governance for delivering projects
successfully.

---

## Q5) Software Quality and Testing

### a) Software quality dilemma

The **software quality dilemma** refers to the inherent tension between:

- **Time to market**: Pressure to release quickly
- **Quality goals**: Desire for defect-free, reliable software
- **Budget constraints**: Limited resources for testing and verification
- **Feature scope**: Customer demand for extensive functionality

Thus, the dilemma requires balanced trade-offs where cutting quality for speed often leads to higher
long-term costs from maintenance and rework.

### b) Objectives and types of testing

**Objectives of testing:**

1. **Verification**: Is the product built correctly? (meets specifications)
2. **Validation**: Is the right product built? (meets user needs)
3. **Defect detection**: Finding errors before deployment
4. **Confidence building**: Ensuring reliability for stakeholders

**Types of testing:**

1. **Unit testing**: Testing individual modules/functions in isolation
2. **Integration testing**: Testing interactions between combined modules
3. **System testing**: Testing the complete integrated system
4. **Acceptance testing**: Testing by end-users against requirements
5. **Regression testing**: Re-testing after changes to ensure no new defects

Thus, each testing level serves a distinct purpose in the verification and validation process.

---

## Q7) Risk and Configuration Management

### a) Software Configuration Management (SCM)

**SCM** is the process of identifying, controlling, and tracking changes to software artifacts
throughout the development life cycle.

**SCM elements:**

1. **Configuration identification**: Identifying and labeling all configuration items
2. **Version control**: Managing different versions of artifacts
3. **Change control**: Formal process for evaluating and approving changes
4. **Configuration auditing**: Verifying that the configuration is complete and consistent
5. **Status accounting**: Recording and reporting the status of change requests

Thus, SCM ensures traceability, reproducibility, and integrity of all software artifacts.

### b) Risk — Reactive and Proactive strategies

**Risk** is an uncertain event or condition that, if it occurs, has a negative effect on project
objectives.

**Reactive risk strategy**: Responding to risks after they occur (firefighting). Example: Adding
extra developers when a critical module falls behind schedule.

**Proactive risk strategy**: Identifying and mitigating risks before they occur. Example: Early
prototyping to reduce technical uncertainty, building buffer time into the schedule.

Thus, proactive strategies are more cost-effective as they prevent problems rather than fix them
after occurrence.

---

═══════════════════════════════════════════════════════ EXAMINER COMMENTARY

Why this scores full marks:

- Each design concept is defined with a concrete software example
- Design pattern usage shown as a step-by-step process
- W5HH principle broken into all 6(+1) questions
- Testing types organized by level with clear objectives
- SCM elements listed with their specific purpose
- Risk strategies compared with practical project examples

Common Deductions:

- Confusing verification with validation
- Listing testing types without explaining when each is used
- Omitting the W5HH "Why" question or treating it as obvious
- Not distinguishing between project management and software process
- Using vague examples instead of named systems
- Missing the key element of risk — uncertainty (not just problems)

Time Budget:

- Q1 (18 marks): 42 min → Q1a: 22 min, Q1b: 20 min
- Q3 (17 marks): 40 min → Q3a: 20 min, Q3b: 20 min
- Q5 (18 marks): 42 min → Q5a: 20 min, Q5b: 22 min
- Q7 (17 marks): 40 min → Q7a: 22 min, Q7b: 18 min

═══════════════════════════════════════════════════════
