# Track Plan: Design System

## Phase 1: Design Tokens

- [x] **Task 1: Create Design Tokens Module** (3c4041)
  - [x] Write Tests: Verify token values are defined
  - [x] Implement: Create `src/Design/Tokens.elm` with colors, spacing, typography

## Phase 2: Core Components

- [x] **Task 2: Button Component** (a3b7c9d)
  - [x] Write Tests: Verify all variants render correctly
  - [x] Implement: Create `src/Design/Button.elm` with primary, secondary, outline, ghost

- [x] **Task 3: Card Component** (d4e5f6a)
  - [x] Write Tests: Verify card renders with header/footer
  - [x] Implement: Create `src/Design/Card.elm`

- [x] **Task 4: Badge Component** (b7c8d9e)
  - [x] Write Tests: Verify badge renders with colors
  - [x] Implement: Create `src/Design/Badge.elm`

- [x] **Task 5: Alert Component** (c8d9e0f)
  - [x] Write Tests: Verify alert types render correctly
  - [x] Implement: Create `src/Design/Alert.elm`

- [x] **Task 6: Progress Component** (e9f0a1b)
  - [x] Write Tests: Verify progress bar renders percentage
  - [x] Implement: Create `src/Design/Progress.elm`

- [x] **Task 7: Spinner Component** (f0b1c2d)
  - [x] Write Tests: Verify spinner renders
  - [x] Implement: Create `src/Design/Spinner.elm`

## Phase 3: Layout Components

- [x] **Task 8: Container Component** (a8a589e)
  - [x] Write Tests: Verify container has max-width
  - [x] Implement: Create `src/Design/Container.elm`

- [x] **Task 9: Stack Component** (elm-test passed)
  - [x] Write Tests: Verify spacing between children
  - [x] Implement: Create `src/Design/Stack.elm` with vertical/horizontal

- [x] **Task 10: Grid Component** (9cd4752)
  - [x] Write Tests: Verify responsive columns
  - [x] Implement: Create `src/Design/Grid.elm`

## Phase 4: Navigation Components

- [ ] **Task 11: Header Component**
  - [ ] Write Tests: Verify header renders with nav links
  - [ ] Implement: Create `src/Design/Header.elm` with logo and navigation

- [ ] **Task 12: Footer Component**
  - [ ] Write Tests: Verify footer renders with links
  - [ ] Implement: Create `src/Design/Footer.elm`

- [ ] **Task 13: Breadcrumb Component**
  - [ ] Write Tests: Verify breadcrumb renders hierarchy
  - [ ] Implement: Create `src/Design/Breadcrumb.elm`

## Phase 5: Integration

- [ ] **Task 14: Update existing pages to use design system**
  - [ ] Write Tests: Verify pages render correctly
  - [ ] Implement: Refactor Home_, Curriculum, Unit_, Lesson_ to use new components

- [ ] **Task 15: Create component showcase page**
  - [ ] Write Tests: Verify showcase renders all components
  - [ ] Implement: Create `/design-system` page showing all components
