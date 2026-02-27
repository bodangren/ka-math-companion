# Track Plan: Next.js to Elm/ElmLand Migration

## Phase 1: Next.js Removal & Cleanup

- [~] **Task 1: Remove Next.js Application Code**
  - [ ] Write Tests: N/A (deletion task)
  - [ ] Implement: Delete `app/`, `components/`, `lib/` directories
- [ ] **Task 2: Remove Next.js Configuration**
  - [ ] Write Tests: N/A (deletion task)
  - [ ] Implement: Delete `next.config.ts`, `next-env.d.ts`, `tsconfig.json`, `mdx.d.ts`
- [ ] **Task 3: Remove Build Artifacts**
  - [ ] Write Tests: N/A (deletion task)
  - [ ] Implement: Delete `.next/`, `out/`, `node_modules/`, `pnpm-lock.yaml`
- [ ] **Task 4: Remove JavaScript Tooling**
  - [ ] Write Tests: N/A (deletion task)
  - [ ] Implement: Delete `vitest.config.ts`, `vitest.setup.ts`, `.eslintrc.cjs`, `.prettierrc.json`, `.prettierignore`
- [ ] **Task 5: Update package.json**
  - [ ] Write Tests: N/A (configuration task)
  - [ ] Implement: Remove all Next.js/React dependencies, reset for ElmLand
- [ ] **Task: Conductor - User Manual Verification 'Phase 1: Next.js Removal & Cleanup'**

## Phase 2: Elm/ElmLand Foundation

- [ ] **Task 6: Initialize ElmLand Project**
  - [ ] Write Tests: Verify ElmLand CLI is installed and project scaffolds correctly
  - [ ] Implement: Run `npx elm-land init` and verify project structure
- [ ] **Task 7: Configure Tailwind CSS**
  - [ ] Write Tests: Verify Tailwind classes apply correctly in rendered page
  - [ ] Implement: Confirm ElmLand Tailwind integration, add custom config if needed
- [ ] **Task 8: Set Up Code Quality Tools**
  - [ ] Write Tests: Verify elm-review and elm-format execute without errors
  - [ ] Implement: Create `elm-review.json` config, add format scripts to package.json
- [ ] **Task 9: Configure elm-test**
  - [ ] Write Tests: Create sample test that passes
  - [ ] Implement: Run `npx elm-land test` setup, verify test runner works
- [ ] **Task: Conductor - User Manual Verification 'Phase 2: Elm/ElmLand Foundation'**

## Phase 3: Curriculum Data Model

- [ ] **Task 10: Design Curriculum Types**
  - [ ] Write Tests: Unit tests for curriculum type constructors and decoders
  - [ ] Implement: Create `src/Data/Curriculum.elm` with Course, Unit, Lesson types
- [ ] **Task 11: Parse Curriculum Data**
  - [ ] Write Tests: Verify curriculum markdown parses into Elm structures
  - [ ] Implement: Create curriculum data module, embed parsed data as Elm constants
- [ ] **Task: Conductor - User Manual Verification 'Phase 3: Curriculum Data Model'**

## Phase 4: Routing & Pages

- [ ] **Task 12: Home Page**
  - [ ] Write Tests: Verify home page renders with expected content
  - [ ] Implement: Create `src/Pages/Home_.elm` with landing content
- [ ] **Task 13: Curriculum Overview Page**
  - [ ] Write Tests: Verify all units are listed with correct links
  - [ ] Implement: Create `src/Pages/Curriculum.elm` displaying unit list
- [ ] **Task 14: Unit Detail Page**
  - [ ] Write Tests: Verify unit page shows lessons with correct hierarchy
  - [ ] Implement: Create `src/Pages/Curriculum/Unit_.elm` with dynamic routing
- [ ] **Task 15: Lesson Detail Page**
  - [ ] Write Tests: Verify lesson page renders objectives
  - [ ] Implement: Create `src/Pages/Curriculum/Unit/Lesson_.elm` with nested routing
- [ ] **Task: Conductor - User Manual Verification 'Phase 4: Routing & Pages'**

## Phase 5: Integration & Deployment

- [ ] **Task 16: Update .gitignore**
  - [ ] Write Tests: N/A (configuration task)
  - [ ] Implement: Add Elm-specific ignores (elm-stuff/, .elm-land/)
- [ ] **Task 17: Verify Build & Static Export**
  - [ ] Write Tests: Verify `npm run build` produces static files
  - [ ] Implement: Run production build, verify output structure
- [ ] **Task 18: Update Documentation**
  - [ ] Write Tests: N/A (documentation task)
  - [ ] Implement: Update README.md with Elm/ElmLand instructions
- [ ] **Task: Conductor - User Manual Verification 'Phase 5: Integration & Deployment'**
