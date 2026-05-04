# Track Plan: KaTeX Integration

## Phase 1: JavaScript Infrastructure

- [x] **Task 1: Create KaTeX JavaScript Module**
  - [ ] Write Tests: N/A (JavaScript module)
  - [x] Implement: Create `public/katex.js` with KaTeX loader and port handlers

- [x] **Task 2: Set Up Elm Ports**
  - [ ] Write Tests: Verify port types compile
  - [x] Implement: Create `src/Ports.elm` with outgoing/incoming ports

## Phase 2: Elm Math Module

- [x] **Task 3: Create Math Module**
  - [x] Write Tests: Verify math expression types
  - [x] Implement: Create `src/Math.elm` with InlineMath, DisplayMath types

- [ ] **Task 4: Math Parsing**
  - [ ] Write Tests: Verify parsing of `$...$` and `$$...$$` syntax
  - [ ] Implement: Add parser for math expressions in strings

## Phase 3: Integration

- [x] **Task 5: Create Math View Component**
  - [x] Write Tests: Verify component renders with math
  - [x] Implement: Create `src/Components/Math.elm` wrapper

- [ ] **Task 6: Update Lesson Pages**
  - [ ] Write Tests: Verify lessons render with math
  - [ ] Implement: Add math rendering to Lesson_.elm

## Phase 4: Math Content

- [ ] **Task 7: Add math to Unit 1 (Polynomials)**
  - [ ] Write Tests: Verify math renders in objectives
  - [ ] Implement: Add polynomial expressions to objectives

- [ ] **Task 8: Add math to Unit 5 (Logarithms)**
  - [ ] Write Tests: Verify math renders in objectives
  - [ ] Implement: Add logarithm expressions to objectives

- [ ] **Task 9: Add math to Unit 8 (Trigonometry)**
  - [ ] Write Tests: Verify math renders in objectives
  - [ ] Implement: Add trig expressions to objectives

## Phase 5: Error Handling & Polish

- [ ] **Task 10: Error Handling**
  - [ ] Write Tests: Verify graceful fallback for invalid math
  - [ ] Implement: Add error boundaries and fallback rendering

- [ ] **Task 11: Accessibility**
  - [ ] Write Tests: Verify ARIA labels on math
  - [ ] Implement: Add accessible labels to rendered math
