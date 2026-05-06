# Specification: Lesson Content

## Overview

Create rich educational content for each lesson including conceptual explanations, step-by-step worked examples, and comprehension checks.

## Functional Requirements

1. **Lesson Structure**
   - Introduction/Concept Overview
   - Key Definitions
   - Worked Examples (2-3 per lesson)
   - Common Mistakes/Misconceptions
   - Check Your Understanding (2-3 questions)

2. **Content Types**
   - `Explanation` - Conceptual text with math notation
   - `Definition` - Key terms with formal definitions
   - `Example` - Step-by-step worked problems
   - `CheckQuestion` - Comprehension check with answer

3. **Content Data Model**
   - Create `LessonContent` type in `Data/LessonContent.elm`
   - Store content as Elm data structures
   - Support math notation in all text fields

4. **Content Rendering**
   - Render content sections in lesson pages
   - Collapsible sections for progressive disclosure
   - Answer reveal for comprehension checks

## Non-Functional Requirements

- Content follows pedagogical best practices
- Progressive difficulty within lessons
- Clear, concise language appropriate for grade level
- Consistent formatting across all lessons

## Acceptance Criteria

- [ ] All 13 units have at least 2 lessons with full content
- [ ] Content includes introduction, examples, and checks
- [ ] Math notation renders correctly in content
- [ ] Comprehension checks are interactive
- [ ] All tests pass

## Out of Scope

- Video content or multimedia (future enhancement)
- Adaptive difficulty (future enhancement)
- User-generated content