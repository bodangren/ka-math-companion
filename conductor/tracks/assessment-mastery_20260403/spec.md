# Specification: Assessment & Mastery

## Overview

Create formal assessment system with unit quizzes, mastery thresholds, and prerequisite checking between units.

## Functional Requirements

1. **Unit Quizzes**
   - 10-15 questions per unit quiz
   - Randomized question selection from problem bank
   - Mix of question types
   - Time limit option (future)

2. **Mastery Thresholds**
   - Unit mastered at 80% quiz score
   - Objectives mastered individually
   - Visual mastery indicators
   - Retry allowed with different questions

3. **Prerequisite System**
   - Define prerequisite relationships between units
   - Lock units until prerequisites mastered
   - Override option for teachers/advanced students

4. **Progress Reports**
   - Per-unit mastery summary
   - Per-objective breakdown
   - Time spent and attempts
   - Suggested focus areas

## Non-Functional Requirements

- Quizzes generate randomly each time
- Results persist in LocalStorage
- Clear pass/fail indication
- Accessible quiz interface

## Acceptance Criteria

- [ ] Unit quizzes generate and function correctly
- [ ] Mastery thresholds calculate properly
- [ ] Prerequisites lock/unlock units
- [ ] Progress reports display accurately
- [ ] All tests pass

## Out of Scope

- Timed quizzes
- Proctoring or anti-cheating
- Teacher grading interface