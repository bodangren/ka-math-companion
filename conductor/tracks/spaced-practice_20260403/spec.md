# Specification: Spaced Practice (SRS)

## Overview

Implement a Leitner box spaced repetition system to help students retain concepts long-term through scheduled review.

## Functional Requirements

1. **Leitner Box System**
   - 5 boxes with increasing review intervals
   - Box 1: Review daily
   - Box 2: Review every 3 days
   - Box 3: Review weekly
   - Box 4: Review bi-weekly
   - Box 5: Review monthly (mastered)

2. **Flashcard Component**
   - Front: Question or concept prompt
   - Back: Answer with explanation
   - Flip animation
   - Self-grading (correct/incorrect)

3. **Review Queue**
   - Daily queue of due cards
   - Priority based on box level
   - Show count of due/total cards
   - Session summary after review

4. **Card Management**
   - Auto-create cards from mastered objectives
   - Manual card creation (future)
   - Card statistics (accuracy, review count)

## Non-Functional Requirements

- Review state persists in LocalStorage
- Smooth flip animations
- Mobile-friendly tap interactions
- Accessible with keyboard controls

## Acceptance Criteria

- [ ] Leitner box logic works correctly
- [ ] Flashcards flip and display properly
- [ ] Review queue shows due cards
- [ ] Progress moves cards between boxes
- [ ] Daily review page functions
- [ ] All tests pass

## Out of Scope

- Custom card creation interface
- Shared decks or social features
- SM-2 algorithm (use Leitner v1)