# Track Plan: Progress Tracking

## Phase 1: Data Model & Ports (Complete)

- [x] **Task 1: Create Progress Data Types**
  - [x] Write Tests: Verify type constructors
  - [x] Implement: Create `src/Data/Progress.elm` with mastery types

- [x] **Task 2: Set Up LocalStorage Ports**
  - [x] Write Tests: Verify port types compile
  - [x] Implement: Add save/load ports to `src/Ports.elm`

- [x] **Task 3: Create Progress Manager**
  - [x] Write Tests: Verify progress updates correctly
  - [x] Implement: Create `src/Logic/Progress.elm` for state management

## Phase 2: Mastery Logic (Complete)

- [x] **Task 4: Mastery Calculation**
  - [x] Write Tests: Verify mastery thresholds work
  - [x] Implement: Add mastery state machine logic (updateMasteryOnAttempt)

- [x] **Task 5: Decay System**
  - [x] Write Tests: Verify mastery decays after time
  - [x] Implement: Add time-based decay logic (needsReview)

## Phase 3: Progress Visualization

- [ ] **Task 6: Progress Bar Component**
  - [ ] Write Tests: Verify progress bar renders percentage
  - [ ] Implement: Create `src/Components/ProgressBar.elm`

- [ ] **Task 7: Mastery Badge Component**
  - [ ] Write Tests: Verify badge shows correct state
  - [ ] Implement: Create `src/Components/MasteryBadge.elm`

- [ ] **Task 8: Update Curriculum Pages**
  - [ ] Write Tests: Verify progress shows on curriculum
  - [ ] Implement: Add progress indicators to Curriculum.elm

- [ ] **Task 9: Update Unit Pages**
  - [ ] Write Tests: Verify progress shows on units
  - [ ] Implement: Add progress indicators to Unit_.elm

## Phase 4: Dashboard

- [ ] **Task 10: Create Dashboard Page**
  - [ ] Write Tests: Verify dashboard renders
  - [ ] Implement: Create `src/Pages/Dashboard.elm`

- [ ] **Task 11: Overall Progress Stats**
  - [ ] Write Tests: Verify stats calculate correctly
  - [ ] Implement: Add progress statistics to dashboard

- [ ] **Task 12: Unit Progress Breakdown**
  - [ ] Write Tests: Verify per-unit stats show
  - [ ] Implement: Add unit-by-unit progress view

## Phase 5: Export/Import

- [ ] **Task 13: Export Functionality**
  - [ ] Write Tests: Verify JSON export works
  - [ ] Implement: Add export button and JSON generation

- [ ] **Task 14: Import Functionality**
  - [ ] Write Tests: Verify JSON import works
  - [ ] Implement: Add import input and validation

## Phase 6: Integration

- [ ] **Task 15: Connect to Practice Problems**
  - [ ] Write Tests: Verify progress updates on answer
  - [ ] Implement: Wire practice problems to progress tracking
