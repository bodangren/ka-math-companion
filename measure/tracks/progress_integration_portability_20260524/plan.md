# Track Plan: Progress Integration & Data Portability

## Phase 1: Shared Curriculum Module & findUnit Refactor (TDD)

- [ ] **Task 1: Extract findUnit to Curriculum module**
  - [ ] Write Tests: Verify `Curriculum.findUnit` returns correct unit for valid and invalid IDs.
  - [ ] Implement: Create `src/Logic/Curriculum.elm` with shared `findUnit`.
- [ ] **Task 2: Refactor Unit_.elm**
  - [ ] Write Tests: Verify `Unit_` page compiles and behaves correctly after import change.
  - [ ] Implement: Replace local `findUnit` with shared `Curriculum.findUnit`.
- [ ] **Task 3: Refactor Lesson_.elm**
  - [ ] Write Tests: Verify `Lesson_` page compiles and behaves correctly after import change.
  - [ ] Implement: Replace local `findUnit` with shared `Curriculum.findUnit`.
- [ ] **Task 4: Measure — Manual Verification**
  - [ ] Verify all pages load correctly after refactor.

## Phase 2: Real Mastery Badge Integration (TDD)

- [ ] **Task 5: Progress Decoder for Pages**
  - [ ] Write Tests: Verify decoder handles valid progress JSON and missing keys gracefully.
  - [ ] Implement: Add `Progress.forUnit` and `Progress.forLesson` helpers in `src/Logic/Progress.elm`.
- [ ] **Task 6: Wire Progress into Unit_.elm**
  - [ ] Write Tests: Verify `Unit_` view renders correct badge state based on progress input.
  - [ ] Implement: Pass progress through flags/model; update `MasteryBadge` rendering.
- [ ] **Task 7: Wire Progress into Lesson_.elm**
  - [ ] Write Tests: Verify `Lesson_` view renders correct badge state based on progress input.
  - [ ] Implement: Pass progress through flags/model; update `MasteryBadge` rendering.
- [ ] **Task 8: Measure — Manual Verification**
  - [ ] Complete a lesson in browser and confirm badge updates from `NotStarted` to `InProgress` or `Mastered`.

## Phase 3: Export UI & Logic (TDD)

- [ ] **Task 9: Export Encoder**
  - [ ] Write Tests: Verify encoder produces valid JSON with all required sections (progress, SRS, preferences).
  - [ ] Implement: Add `Export.encodeAll` in `src/Logic/Export.elm`.
- [ ] **Task 10: Export Button Component**
  - [ ] Write Tests: Verify button renders and triggers download port.
  - [ ] Implement: Add export button to settings or dashboard page; wire to `Ports.downloadFile`.
- [ ] **Task 11: Measure — Manual Verification**
  - [ ] Click export in browser and verify downloaded JSON contains expected data.

## Phase 4: Import UI & Logic (TDD)

- [ ] **Task 12: Import Decoder with Version Check**
  - [ ] Write Tests: Verify decoder accepts current version and rejects outdated/invalid JSON.
  - [ ] Implement: Add `Import.decodeAll` with version validation and error type.
- [ ] **Task 13: Import File Input Component**
  - [ ] Write Tests: Verify file input renders and triggers file-read port.
  - [ ] Implement: Add hidden file input and import button; wire to `Ports.readFile`.
- [ ] **Task 14: Import Feedback UI**
  - [ ] Write Tests: Verify success and error messages render correctly.
  - [ ] Implement: Add alert/toast for import result; on success, reload progress state.
- [ ] **Task 15: Measure — Manual Verification**
  - [ ] Import a previously exported file and verify progress restores correctly.

## Phase 5: Page-Level View Tests (TDD)

- [ ] **Task 16: Unit_ View Tests**
  - [ ] Write Tests: Assert rendered HTML contains unit title, mastery badge, and lesson links.
  - [ ] Write Tests: Assert badge CSS classes match progress state.
- [ ] **Task 17: Lesson_ View Tests**
  - [ ] Write Tests: Assert rendered HTML contains lesson title, content sections, and navigation.
  - [ ] Write Tests: Assert next/previous lesson links are correct.
- [ ] **Task 18: Measure — Manual Verification**
  - [ ] Run `elm-test` and confirm all tests pass with meaningful assertions.

## Phase 6: Cleanup & Final Verification

- [ ] **Task 19: Remove dead code**
  - [ ] Delete local `findUnit` copies from `Unit_.elm` and `Lesson_.elm` if still present.
  - [ ] Run `elm-review` and fix any new issues.
- [ ] **Task 20: Build & Test**
  - [ ] Run full `elm-test` suite (300+ tests).
  - [ ] Run `elm-format` on changed files.
  - [ ] Run production build and verify no errors.
- [ ] **Task 21: Update Documentation**
  - [ ] Update `tracks.md` with completed track entry.
  - [ ] Document export JSON schema version in dev docs.
