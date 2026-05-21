# Track Plan: Assessment & Mastery

## Phase 1: Quiz Data Model

- [ ] **Task 1: Create Quiz Types**
  - [ ] Write Tests: Verify quiz/question types
  - [ ] Implement: Create `src/Data/Quiz.elm`

- [ ] **Task 2: Quiz Generation Logic**
  - [ ] Write Tests: Verify random selection works
  - [ ] Implement: Create `src/Logic/Quiz.elm` for generation

## Phase 2: Quiz Interface

- [ ] **Task 3: Quiz Page**
  - [ ] Write Tests: Verify quiz renders questions
  - [ ] Implement: Create `src/Pages/Quiz/Unit_.elm`

- [ ] **Task 4: Quiz Navigation**
  - [ ] Write Tests: Verify next/prev/submit work
  - [ ] Implement: Add quiz navigation controls

- [ ] **Task 5: Quiz Results**
  - [ ] Write Tests: Verify score calculation
  - [ ] Implement: Create results view with breakdown

## Phase 3: Mastery System

- [ ] **Task 6: Mastery Calculation**
  - [ ] Write Tests: Verify 80% threshold works
  - [ ] Implement: Add mastery determination logic

- [ ] **Task 7: Mastery Indicators**
  - [ ] Write Tests: Verify mastery badges show
  - [ ] Implement: Add mastery badges to unit pages

- [ ] **Task 8: Retry System**
  - [ ] Write Tests: Verify retry generates new questions
  - [ ] Implement: Add retry functionality

## Phase 4: Prerequisites

- [ ] **Task 9: Prerequisite Data**
  - [ ] Write Tests: Verify prerequisite relationships
  - [ ] Implement: Define prerequisites in curriculum data

- [ ] **Task 10: Lock/Unlock Logic**
  - [ ] Write Tests: Verify units lock/unlock correctly
  - [ ] Implement: Add prerequisite checking

- [ ] **Task 11: Locked Unit UI**
  - [ ] Write Tests: Verify locked units display
  - [ ] Implement: Show locked state on curriculum page

## Phase 5: Progress Reports

- [ ] **Task 12: Report Page**
  - [ ] Write Tests: Verify report renders
  - [ ] Implement: Create `src/Pages/Report.elm`

- [ ] **Task 13: Unit Breakdown**
  - [ ] Write Tests: Verify per-unit stats
  - [ ] Implement: Add detailed unit statistics

- [ ] **Task 14: Suggestions**
  - [ ] Write Tests: Verify suggestions based on data
  - [ ] Implement: Add suggested focus areas

## Phase 6: Integration

- [ ] **Task 15: Add Quiz Links**
  - [ ] Write Tests: Verify quiz links appear
  - [ ] Implement: Add quiz links to unit pages
