# Specification: Khan Academy Sync

## Overview

Enhance the Khan Academy sync script to automatically detect curriculum changes and keep local data aligned with official Khan Academy units.

## Functional Requirements

1. **Enhanced Sync Script**
   - Fetch full course structure from Khan Academy API
   - Parse units, lessons, and objectives
   - Compare with local curriculum data
   - Generate diff report

2. **Diff Detection**
   - New units/lessons added
   - Units/lessons removed
   - Titles changed
   - Reordering detected

3. **GitHub Action**
   - Run weekly on schedule
   - Create PR if changes detected
   - Include diff summary in PR description
   - Notify on failure

4. **Merge Strategy**
   - Auto-merge title changes
   - Flag structural changes for review
   - Preserve local content additions
   - Handle conflicts gracefully

## Non-Functional Requirements

- Script runs in <30 seconds
- No API rate limit issues
- Clear error messages
- Idempotent (safe to run multiple times)

## Acceptance Criteria

- [ ] Sync script fetches and compares data
- [ ] Diff report generates correctly
- [ ] GitHub Action runs on schedule
- [ ] PRs created for changes
- [ ] Local content preserved
- [ ] All tests pass

## Out of Scope

- Real-time sync
- Bi-directional sync (push to Khan Academy)
- Content translation