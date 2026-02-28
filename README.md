# KA Math Companion

A pedagogy-first, static Elm companion to Khan Academy math courses. The site blends conceptual exploration, algorithmic scaffolding, and spaced retrieval practice to help learners build durable understanding across middle and high school mathematics.

## Project Overview

The KA Math Companion is a functional educational platform enhancing Khan Academy's Integrated Math 3 curriculum. Built with ElmLand for compile-time safety and zero runtime exceptions.

### Current State

- **Framework**: ElmLand (Elm 0.19.1) with Tailwind CSS
- **Architecture**: Static site generation for GitHub Pages deployment
- **Content Model**: Type-safe curriculum data in Elm modules
- **Testing**: elm-test with elm-review for code quality

### Curriculum Coverage

- 13 instructional units from Khan Academy Integrated Math 3
- Units, lessons, and learning objectives hierarchy
- Progress tracking (future enhancement)

## Guiding Principles

- **Mastery learning**: Track progress per objective; mastery requires success in scaffolded + independent practice and sustained spaced-review performance.
- **Balanced pedagogy**: Sequence lessons from activation of prior knowledge → conceptual exploration → explicit instruction → worked/faded examples → guided and independent practice.
- **Retrieval & spacing**: Local SRS scheduler surfaces due items and flashcards with configurable intervals (Leitner v1, upgradeable to SM-2).
- **Multiple representations**: Number lines, algebra tiles, dynamic graphs, tables, and written explanations are presented side-by-side to support dual coding.
- **Productive struggle with support**: Tiered hints, misconception-specific feedback, and error-analysis tasks encourage strategic help-seeking.
- **Accessibility by default**: Keyboard-first interactions, ARIA labels, KaTeX with textual fallbacks, reduced-motion and high-contrast toggles.

## Architecture Overview

- **Framework**: ElmLand (Elm 0.19.1) with Vite build system
- **Styling**: Tailwind CSS via CDN
- **Routing**: File-based routing with dynamic parameters
- **Content model**: Type-safe Elm data structures in `src/Data/`
- **Deployment**: Static export to GitHub Pages

## Getting Started

```bash
npm install
npm run dev         # run locally (http://localhost:1234)
npm run test        # unit tests
npm run review      # code quality checks
npm run build       # production build (outputs to ./dist)
```

> **Prerequisites**: Node.js 18+, npm

## Project Structure

```
src/
├── Data/
│   ├── Curriculum.elm      # Course, Unit, Lesson types
│   └── IntegratedMath3.elm # Curriculum data
└── Pages/
    ├── Home_.elm           # /
    ├── Curriculum.elm      # /curriculum
    └── Curriculum/
        └── Unit_/
            └── Lesson_.elm # /curriculum/:unit/:lesson

tests/
├── Data/                   # Data module tests
└── Pages/                  # Page component tests

review/
└── src/
    └── ReviewConfig.elm    # elm-review configuration
```

## Available Scripts

| Command                | Description                                       |
| ---------------------- | ------------------------------------------------- |
| `npm run dev`          | Start development server at http://localhost:1234 |
| `npm run build`        | Build for production (outputs to ./dist)          |
| `npm run test`         | Run elm-test suite                                |
| `npm run review`       | Run elm-review code quality checks                |
| `npm run format`       | Format code with elm-format                       |
| `npm run format:check` | Check formatting without modifying                |

## Curriculum Sync (Khan Academy)

- `@bhavjit/khan-api` powers a script that snapshots Khan Academy course data so our local curriculum tracks official units.
- Run `npm run sync:khan:math3` to refresh curriculum data.

## Deployment

1. `npm run build` writes static assets to `dist/`.
2. GitHub Actions workflow uploads `dist/` to the `gh-pages` branch.
3. GitHub Pages serves the site at `<user>.github.io/<repo>`.

## Development Roadmap

### Completed

- ✅ Elm/ElmLand migration from Next.js
- ✅ Curriculum data model with 13 units
- ✅ Routing for curriculum, units, and lessons
- ✅ Static site generation

### Upcoming

- **Phase 2**: Design system and UI components
- **Phase 3**: KaTeX rendering for math notation
- **Phase 4**: Interactive visualizations (charts, graphs)
- **Phase 5**: Progress tracking and state persistence

## Contributing

1. Create an issue → branch → PR workflow.
2. Keep changes scoped; write tests first (TDD: Red → Green → Refactor).
3. Run `npm run test && npm run review` locally before pushing.
4. Request review and enable auto-merge after approvals.

## License

MIT
