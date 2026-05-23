# Specification: Progress Integration & Data Portability

## Overview

The progress-tracking infrastructure (data model, ports, logic, and dashboard) is complete, but the actual lesson and unit pages still show `NotStarted` for all mastery badges. Additionally, the export/import ports exist with no UI, and several open tech-debt items (duplicated `findUnit`, missing page-level tests) reduce maintainability. This track wires progress data end-to-end and delivers data portability for learners.

## Functional Requirements

1. **Real Mastery Badges**
   - Unit and lesson pages read actual progress from LocalStorage via existing ports.
   - Mastery badges reflect the learner's true state: `NotStarted`, `InProgress`, `Mastered`.
   - Badge updates immediately when a lesson is completed or a quiz is passed.

2. **Export & Import UI**
   - Learners can export their full progress (mastery, SRS box states, preferences) to a JSON file.
   - Learners can import a previously exported JSON file to restore progress.
   - Import validates file format and version; shows error for incompatible exports.

3. **Shared Curriculum Lookup**
   - Extract duplicated `findUnit` logic from `Unit_.elm` and `Lesson_.elm` into a shared `Curriculum` module.
   - All page modules use the shared helper.

4. **Page-Level View Tests**
   - Add Elm tests for `Unit_` and `Lesson_` view functions verifying rendered HTML structure.
   - Tests assert presence of key elements: title, mastery badge, lesson list, navigation.

## Non-Functional Requirements

- Zero runtime exceptions (Elm guarantee preserved).
- Export/import works offline (no server dependency).
- LocalStorage schema versioned for forward compatibility.
- All existing tests continue to pass.

## Acceptance Criteria

- [ ] Mastery badges on unit and lesson pages show real progress data from LocalStorage.
- [ ] Export button downloads a valid JSON file containing all learner state.
- [ ] Import button restores learner state from a valid JSON file.
- [ ] Import rejects malformed or version-mismatched files with a user-visible error.
- [ ] `findUnit` exists only in the shared `Curriculum` module.
- [ ] `Unit_` and `Lesson_` view tests assert on rendered HTML, not just `Expect.pass`.
- [ ] All 300+ tests pass and build succeeds.

## Out of Scope

- Cloud sync or multi-device progress sharing.
- Automatic backup scheduling.
- Teacher dashboard or class-level analytics.
