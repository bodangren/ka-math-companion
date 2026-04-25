# Track Plan: Practice Problems

## Phase 1: Problem Data Model

- [ ] **Task 1: Create Problem Types**
  - [ ] Write Tests: Verify type constructors for all question types
  - [ ] Implement: Create `src/Data/Problem.elm` with question types

- [ ] **Task 2: Create Problem Bank**
  - [ ] Write Tests: Verify problems load by unit/lesson
  - [ ] Implement: Create `src/Data/Problems/` with unit modules

## Phase 2: Question Renderers

- [ ] **Task 3: MultipleChoice Component**
  - [ ] Write Tests: Verify selection and validation work
  - [ ] Implement: Create `src/Components/Problem/MultipleChoice.elm`

- [ ] **Task 4: MultiSelect Component**
  - [ ] Write Tests: Verify multi-selection works
  - [ ] Implement: Create `src/Components/Problem/MultiSelect.elm`

- [ ] **Task 5: NumericInput Component**
  - [ ] Write Tests: Verify numeric validation
  - [ ] Implement: Create `src/Components/Problem/NumericInput.elm`

- [ ] **Task 6: ExpressionInput Component**
  - [ ] Write Tests: Verify expression parsing and equivalence
  - [ ] Implement: Create `src/Components/Problem/ExpressionInput.elm`

## Phase 3: Answer Validation

- [ ] **Task 7: Validation Engine**
  - [ ] Write Tests: Verify correct/incorrect detection
  - [ ] Implement: Create `src/Logic/Validation.elm`

- [ ] **Task 8: Expression Equivalence**
  - [ ] Write Tests: Verify equivalent expressions match
  - [ ] Implement: Add expression normalization logic

## Phase 4: Hints & Solutions

- [ ] **Task 9: Hints System**
  - [ ] Write Tests: Verify hints reveal progressively
  - [ ] Implement: Add hint state and reveal logic

- [ ] **Task 10: Solution Renderer**
  - [ ] Write Tests: Verify solution steps render
  - [ ] Implement: Create step-by-step solution component

## Phase 5: Problem Content

- [ ] **Task 11: Unit 1 Problems (Polynomials)**
  - [ ] Write Tests: Verify problems render and validate
  - [ ] Implement: Create 10+ problems for polynomial lessons

- [ ] **Task 12: Unit 5 Problems (Logarithms)**
  - [ ] Write Tests: Verify problems render and validate
  - [ ] Implement: Create 10+ problems for logarithm lessons

- [ ] **Task 13: Unit 8 Problems (Trigonometry)**
  - [ ] Write Tests: Verify problems render and validate
  - [ ] Implement: Create 10+ problems for trig lessons

## Phase 6: Integration

- [ ] **Task 14: Add problems to lesson pages**
  - [ ] Write Tests: Verify practice section appears
  - [ ] Implement: Add practice problems section to Lesson_.elm
