# Track Plan: Accessibility

## Phase 1: Keyboard Navigation

- [ ] **Task 1: Focus Management**
  - [ ] Write Tests: Verify all elements focusable
  - [ ] Implement: Add focus styles and tab indices

- [ ] **Task 2: Skip Links**
  - [ ] Write Tests: Verify skip link works
  - [ ] Implement: Add skip-to-content link

- [ ] **Task 3: Keyboard Shortcuts**
  - [ ] Write Tests: Verify shortcuts trigger actions
  - [ ] Implement: Add keyboard event handlers

## Phase 2: ARIA & Semantics

- [ ] **Task 4: ARIA Labels Audit**
  - [ ] Write Tests: Verify all interactive elements labeled
  - [ ] Implement: Add missing ARIA labels

- [ ] **Task 5: Live Regions**
  - [ ] Write Tests: Verify dynamic content announced
  - [ ] Implement: Add ARIA live regions

- [ ] **Task 6: Heading Hierarchy**
  - [ ] Write Tests: Verify heading levels correct
  - [ ] Implement: Fix heading hierarchy across pages

## Phase 3: Display Preferences

- [ ] **Task 7: Preferences Data Model**
  - [ ] Write Tests: Verify preference types
  - [ ] Implement: Create `src/Data/Preferences.elm`

- [ ] **Task 8: Reduced Motion Mode**
  - [ ] Write Tests: Verify animations disabled
  - [ ] Implement: Add reduced motion CSS

- [ ] **Task 9: High Contrast Mode**
  - [ ] Write Tests: Verify contrast ratios
  - [ ] Implement: Add high contrast theme

- [ ] **Task 10: Font Size Adjustment**
  - [ ] Write Tests: Verify font sizes change
  - [ ] Implement: Add font size controls

## Phase 4: Math Accessibility

- [ ] **Task 11: Math Text Descriptions**
  - [ ] Write Tests: Verify descriptions render
  - [ ] Implement: Add text alternatives for math

- [ ] **Task 12: Math Keyboard Navigation**
  - [ ] Write Tests: Verify math elements focusable
  - [ ] Implement: Add keyboard support for math

## Phase 5: Preferences UI

- [ ] **Task 13: Preferences Panel**
  - [ ] Write Tests: Verify panel renders
  - [ ] Implement: Create preferences modal/page

- [ ] **Task 14: Persistence**
  - [ ] Write Tests: Verify preferences save/load
  - [ ] Implement: Add LocalStorage for preferences

## Phase 6: Testing & Polish

- [ ] **Task 15: Accessibility Audit**
  - [ ] Write Tests: Run automated accessibility tests
  - [ ] Implement: Fix any issues found
