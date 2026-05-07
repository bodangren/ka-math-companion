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

## Phase 3: Progress Visualization (Complete)

- [x] **Task 6: Progress Bar Component**
  - [x] Write Tests: Verify progress bar renders percentage
  - [x] Implement: Create `src/Design/ProgressBar.elm`

- [x] **Task 7: Mastery Badge Component**
  - [x] Write Tests: Verify badge shows correct state
  - [x] Implement: Create `src/Design/MasteryBadge.elm`

- [x] **Task 8: Update Curriculum Pages**
  - [x] Write Tests: Verify progress shows on curriculum
  - [x] Implement: Add progress indicators to Curriculum.elm

- [x] **Task 9: Update Unit Pages**
  - [x] Write Tests: Verify progress shows on units
  - [x] Implement: Add progress indicators to Unit_.elm

## Phase 4: Dashboard (Complete)

- [x] **Task 10: Create Dashboard Page**
  - [x] Write Tests: Verify dashboard renders
  - [x] Implement: Create `src/Pages/Dashboard.elm`

- [x] **Task 11: Overall Progress Stats**
  - [x] Write Tests: Verify stats calculate correctly
  - [x] Implement: Add progress statistics to dashboard

- [x] **Task 12: Unit Progress Breakdown**
  - [x] Write Tests: Verify per-unit stats show
  - [x] Implement: Add unit-by-unit progress view

## Phase 5: Export/Import (Deferred)
- Task 13 and 14 deferred - export/import ports added but UI not implemented

## Phase 6: Integration (Deferred)
- Task 15 deferred - no practice problems yet

## Summary
Progress tracking core infrastructure complete through Phase 4:
- Data model with mastery levels (NotStarted, InProgress, Mastered)
- LocalStorage ports for persistence
- Logic.Progress state manager
- Mastery calculation (3 consecutive correct = mastered)
- Decay system (7 day review trigger)
- ProgressBar and MasteryBadge UI components
- Curriculum and Unit pages with progress indicators
- Dashboard page with overall stats and unit breakdown
