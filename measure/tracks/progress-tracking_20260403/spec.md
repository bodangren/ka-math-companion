# Specification: Progress Tracking

## Overview

Implement client-side progress tracking using LocalStorage to persist student mastery data per learning objective.

## Functional Requirements

1. **Data Model**
   - Track mastery per objective (not started, in progress, mastered)
   - Track attempt count and last attempt timestamp
   - Track correct/incorrect ratios
   - Store in LocalStorage via ports

2. **Mastery Criteria**
   - Objective mastered after 3 consecutive correct answers
   - Mastery decays after 7 days without review
   - Different thresholds for different difficulty levels

3. **Progress Visualization**
   - Progress bars on curriculum/unit pages
   - Mastery indicators on lesson pages
   - Dashboard page showing overall progress
   - Per-unit completion percentages

4. **LocalStorage Ports**
   - Save progress data
   - Load progress on page load
   - Export progress as JSON
   - Import progress from JSON

## Non-Functional Requirements

- Progress persists across browser sessions
- No server required (fully client-side)
- Data format is versioned for future migrations
- Graceful handling of storage quota limits

## Acceptance Criteria

- [ ] Progress saves to LocalStorage
- [ ] Progress loads on page refresh
- [ ] Mastery indicators display correctly
- [ ] Dashboard shows overall progress
- [ ] Export/import works
- [ ] All tests pass

## Out of Scope

- User accounts or cloud sync
- Teacher dashboards
- Multi-device sync