# Track Plan: Spaced Practice (SRS)

## Phase 1: Leitner Box Logic

- [x] **Task 1: Create SRS Data Types**
  - [x] Write Tests: Verify box/card types
  - [x] Implement: Create `src/Data/SRS.elm` with Leitner types

- [x] **Task 2: Box Progression Logic**
  - [x] Write Tests: Verify correct moves card up, incorrect moves down
  - [x] Implement: Create `src/Logic/Leitner.elm`

- [x] **Task 3: Due Date Calculation**
  - [x] Write Tests: Verify intervals calculated correctly
  - [x] Implement: Add interval logic for each box

## Phase 2: Flashcard Component

- [x] **Task 4: Flashcard Renderer**
  - [x] Write Tests: Verify front/back render
  - [x] Implement: Create `src/Components/Flashcard.elm`

- [x] **Task 5: Flip Animation**
  - [x] Write Tests: Verify flip state toggles
  - [x] Implement: Add CSS transitions for card flip

- [x] **Task 6: Self-Grading**
  - [x] Write Tests: Verify correct/incorrect buttons work
  - [x] Implement: Add grading interaction

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