# Specification: Practice Problems

## Overview

Build an interactive practice problem system with multiple question types, answer validation, hints, and step-by-step solutions.

## Functional Requirements

1. **Question Types**
   - `MultipleChoice` - Select one correct answer
   - `MultiSelect` - Select all that apply
   - `NumericInput` - Enter a number
   - `ExpressionInput` - Enter a math expression
   - `GraphInteraction` - Click/drag on a visualization

2. **Answer Validation**
   - Immediate feedback on submit
   - Correct/incorrect indication
   - Partial credit for multi-part questions
   - Expression equivalence checking (e.g., `2x+3` = `3+2x`)

3. **Hints System**
   - 2-3 progressive hints per problem
   - Hints revealed one at a time
   - Hint penalty tracking (optional)

4. **Solution Reveal**
   - Step-by-step solution walkthrough
   - Key concepts highlighted
   - Alternative solution methods shown

5. **Problem Bank**
   - Create `Data/Problems.elm` with problem storage
   - Organize by unit and lesson
   - Tag problems by difficulty and concept

## Non-Functional Requirements

- Problems render with math notation
- Mobile-friendly input methods
- Accessible keyboard navigation
- No external API calls (all client-side)

## Acceptance Criteria

- [ ] All question types render and accept input
- [ ] Answer validation works correctly
- [ ] Hints system functions properly
- [ ] Solutions reveal step-by-step
- [ ] Problem bank contains 50+ problems
- [ ] All tests pass

## Out of Scope

- Adaptive problem selection (covered in Assessment track)
- Teacher problem creation interface
- Time-based scoring