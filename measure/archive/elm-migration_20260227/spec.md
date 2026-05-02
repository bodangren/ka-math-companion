# Specification: Next.js to Elm/ElmLand Migration

## Overview

Migrate the application from Next.js/React to Elm/ElmLand, removing the existing JavaScript infrastructure and establishing a new Elm-based foundation while preserving all curriculum data.

## Functional Requirements

1. **Elm/ElmLand Setup**
   - Initialize ElmLand project with Tailwind CSS integration
   - Configure build system and development tooling
   - Set up elm-test for unit testing
   - Configure elm-review and elm-format for code quality

2. **Routing & Navigation**
   - Home page (`/`)
   - Curriculum overview page (`/curriculum`)
   - Unit pages (`/curriculum/:unit-slug`)
   - Lesson pages (`/curriculum/:unit-slug/:lesson-slug`)

3. **Curriculum Data Integration**
   - Parse existing `curriculum/integrated-math-3.md` into Elm data structures
   - Create type-safe curriculum model in Elm
   - Render curriculum hierarchy (units, lessons, objectives)

4. **Next.js Removal**
   - Remove `app/`, `components/`, `lib/` directories
   - Remove Next.js config files and dependencies
   - Remove TypeScript/JavaScript tooling
   - Clean up build artifacts (`.next/`, `out/`, `node_modules/`)

## Non-Functional Requirements

- **Performance**: Static site generation for fast page loads
- **Accessibility**: Semantic HTML, keyboard navigation support
- **Maintainability**: Type-safe Elm codebase with >80% test coverage

## Acceptance Criteria

- [ ] ElmLand app runs with `npm run dev`
- [ ] All four page routes render without errors
- [ ] Curriculum data displays correctly with proper hierarchy
- [ ] No Next.js or React files remain in the codebase
- [ ] Unit tests pass with >80% coverage

## Out of Scope

- Design system / UI components (future track)
- KaTeX rendering (future track)
- Charts and visualizations (future track)
- Interactive lesson components (future track)
- Progress tracking / state persistence (future track)
