# Track Plan: Spaced Practice (SRS)

## Phase 1: Leitner Box Logic

- [ ] **Task 1: Create SRS Data Types**
  - [ ] Write Tests: Verify box/card types
  - [ ] Implement: Create `src/Data/SRS.elm` with Leitner types

- [ ] **Task 2: Box Progression Logic**
  - [ ] Write Tests: Verify correct moves card up, incorrect moves down
  - [ ] Implement: Create `src/Logic/Leitner.elm`

- [ ] **Task 3: Due Date Calculation**
  - [ ] Write Tests: Verify intervals calculated correctly
  - [ ] Implement: Add interval logic for each box

## Phase 2: Flashcard Component

- [ ] **Task 4: Flashcard Renderer**
  - [ ] Write Tests: Verify front/back render
  - [ ] Implement: Create `src/Components/Flashcard.elm`

- [ ] **Task 5: Flip Animation**
  - [ ] Write Tests: Verify flip state toggles
  - [ ] Implement: Add CSS transitions for card flip

- [ ] **Task 6: Self-Grading**
  - [ ] Write Tests: Verify correct/incorrect buttons work
  - [ ] Implement: Add grading interaction

## Phase 3: Review Queue

- [ ] **Task 7: Queue Generation**
  - [ ] Write Tests: Verify due cards collected
  - [ ] Implement: Create queue logic in `src/Logic/Review.elm`

- [ ] **Task 8: Review Session Page**
  - [ ] Write Tests: Verify session shows cards
  - [ ] Implement: Create `src/Pages/Review.elm`

- [ ] **Task 9: Session Summary**
  - [ ] Write Tests: Verify summary shows stats
  - [ ] Implement: Add session completion view

## Phase 4: Card Management

- [ ] **Task 10: Auto-Create Cards**
  - [ ] Write Tests: Verify cards created from mastered objectives
  - [ ] Implement: Add card generation on mastery

- [ ] **Task 11: Card Statistics**
  - [ ] Write Tests: Verify stats track correctly
  - [ ] Implement: Add accuracy and review count tracking

## Phase 5: Persistence

- [ ] **Task 12: LocalStorage Integration**
  - [ ] Write Tests: Verify save/load works
  - [ ] Implement: Add ports for SRS data

- [ ] **Task 13: Daily Notification Badge**
  - [ ] Write Tests: Verify badge shows count
  - [ ] Implement: Add due count to navigation

## Phase 6: Integration

- [ ] **Task 14: Add Review to Navigation**
  - [ ] Write Tests: Verify link appears in nav
  - [ ] Implement: Add Review link to Header

- [ ] **Task 15: Connect to Progress Tracking**
  - [ ] Write Tests: Verify SRS syncs with progress
  - [ ] Implement: Wire SRS to progress system
