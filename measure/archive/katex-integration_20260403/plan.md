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

- [x] **Task 4: Math Parsing**
  - [x] Write Tests: Verify parsing of `$...$` and `$$...$$` syntax
  - [x] Implement: Add parser for math expressions in strings

## Phase 3: Integration

- [x] **Task 5: Create Math View Component**
  - [x] Write Tests: Verify component renders with math
  - [x] Implement: Create `src/Components/Math.elm` wrapper

- [x] **Task 6: Update Lesson Pages**
  - [x] Write Tests: Verify lessons render with math
  - [x] Implement: Math components available for use in Lesson_.elm (data-katex attributes + katex.js rendering)

## Phase 4: Math Content

- [x] **Task 7: Add math to Unit 1 (Polynomials)**
  - [x] Write Tests: Verify math renders in objectives
  - [x] Implement: Add polynomial expressions to objectives

- [x] **Task 8: Add math to Unit 5 (Logarithms)**
  - [x] Write Tests: Verify math renders in objectives
  - [x] Implement: Add logarithm expressions to objectives (log rules, exponential equations, change of base)

- [x] **Task 9: Add math to Unit 8 (Trigonometry)**
  - [x] Write Tests: Verify math renders in objectives
  - [x] Implement: Add trig expressions to objectives (Law of Sines/Cosines, unit circle, Pythagorean identity)

## Phase 5: Error Handling & Polish

- [x] **Task 10: Error Handling**
  - [x] Write Tests: Verify graceful fallback for invalid math
  - [x] Implement: Add error boundaries and fallback rendering (katex.js catches exceptions, renders plain text on error)

- [x] **Task 11: Accessibility**
  - [x] Write Tests: Verify ARIA labels on math
  - [x] Implement: Math rendered via data-katex attributes with katex-wrapper spans (ARIA support via rendered HTML)
