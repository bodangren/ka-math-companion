# KA Math Companion

A pedagogy-first, static Next.js companion to Khan Academy math courses. The site blends conceptual exploration, algorithmic scaffolding, and spaced retrieval practice to help learners build durable understanding across middle and high school mathematics.

## Project Overview

The KA Math Companion is a functional educational platform enhancing Khan Academy's Integrated Math 3 curriculum. We're currently in Sprint S1 of a structured enhancement initiative focusing on UI/UX improvements, interactive practice generators, and teacher tools while maintaining our static site architecture.

### Current State & Sprint Focus

- **Existing Foundation**: Fully functional static Next.js application with curriculum navigation and mastery tracking
- **Current Sprint (S1)**: Static site foundation improvements and Khan Academy sync automation
- **Enhancement Roadmap**: 3-sprint plan targeting modern UI/UX, interactive practice, and teacher dashboard
- **Architecture**: Maintaining static export compatibility while adding client-side interactivity
- **Content Model**: Content-first approach with objectives, lessons, and deterministic generators

### Sprint Progress

**Sprint S1: Static Site Foundation** (See [S1.md](docs/sprint/S1.md))
- ✅ Basic curriculum integration and mastery indicators
- 🔄 Enhanced static site generation and export
- 🔄 Automated Khan Academy sync improvements
- 🔄 Progress tracking and visualization enhancements

See our [roadmap](docs/sprint/roadmap.md) for the complete 3-sprint development plan.

## Guiding Principles

- **Mastery learning**: Track progress per objective; mastery requires success in scaffolded + independent practice and sustained spaced-review performance.
- **Balanced pedagogy**: Sequence lessons from activation of prior knowledge → conceptual exploration → explicit instruction → worked/faded examples → guided and independent practice.
- **Retrieval & spacing**: Local SRS scheduler surfaces due items and flashcards with configurable intervals (Leitner v1, upgradeable to SM-2).
- **Multiple representations**: Number lines, algebra tiles, dynamic graphs, tables, and written explanations are presented side-by-side to support dual coding.
- **Productive struggle with support**: Tiered hints, misconception-specific feedback, and error-analysis tasks encourage strategic help-seeking.
- **Accessibility by default**: Keyboard-first interactions, ARIA labels, KaTeX with textual fallbacks, reduced-motion and high-contrast toggles.

## Architecture Overview

- **Framework**: Next.js (App Router) exported as a static site (`output: 'export'`, `trailingSlash: true`) for GitHub Pages deployment.
- **Content model**  
  - `content/objectives/*.yml|json`: canonical objective metadata (prereqs, standards, references).
  - `content/lessons/<objectiveId>/<slug>.mdx`: MDX lessons with YAML front matter; embed React components for activities.
  - `content/items/<objectiveId>/*.ts`: Deterministic item generators exporting `generate(seed)` + `check(response)`.
  - `content/courses/*.json`: Course sequences referencing objective IDs with optional overrides.
  - `content/cards/*.json`: Flashcard decks per objective for rote knowledge.
- **Build-time utilities** (`lib/content-loader.ts`, `lib/validators.ts`):
  - File-system enumerators validate content with Zod.
  - Emit `content/index.json` for client-side search, prerequisite lookups, and SRS scheduling.
- **Client components** (`components/`):
  - `FunctionGrapher`, `NumberLine`, `TileAreaModel`, `ScaffoldedSteps`, `WorkedExample`, `FadedExample`, `DragArrange`.
  - All interactions are client-only (`'use client'`) and seeded for reproducibility.
- **State management**:
  - `localStorage` keys (`ka:settings:v1`, `ka:progress:v1`, `ka:srs:v1`, `ka:notes:v1`).
  - Optional download/upload of a JSON progress export for multi-device use.

## Getting Started

```bash
pnpm install
pnpm dev         # run locally (http://localhost:3000)
pnpm lint        # static analysis
pnpm test        # unit/integration tests
pnpm build       # next build && next export (outputs to ./out)
```

> **Prerequisites**: Node.js 20+, pnpm 8+, GitHub CLI (`gh`) configured with repo access.

## Content Authoring Workflow

1. **Define an objective** in `content/objectives/` with title, description, prerequisites, and linked KA skills.
2. **Author or update lessons** in MDX:
   - Use front matter for metadata (duration, vocab, misconceptions).
   - Embed interactive components (e.g., `<FunctionGrapher config={...} />`).
   - Include retrieval starters and reflection prompts.
3. **Add practice generators**:
   - Create a TypeScript module exporting deterministic `generate`/`check` functions.
   - Provide step data, hints, and misconception tags.
   - Include automated sample generation in `pnpm test` to catch invalid seeds.
4. **Optional flashcards** per objective to reinforce vocabulary or formulas.
5. **Run validators** (`pnpm lint && pnpm test`) before publishing.

## Curriculum Sync (Khan Academy)

- `@bhavjit/khan-api` powers a script that snapshots Khan Academy course data so our local curriculum tracks official units.
- Run `node docs/scripts/sync-khan-course.mjs --path /math/math3 --slug integrated-math-3` to refresh `docs/data/integrated-math-3.course.json`.
- Pass `--path` for other courses (for example, `/math/algebra2`) and `--out` to write to a custom location.
- See `docs/automation.md` for all flags, JSON schema notes, and follow-up tasks (Markdown generation, diffing, CI hooks).

## Spaced Practice

- Default Leitner 5-box system with intervals (1, 2, 4, 8, 16 days).
- Items move up on correct responses without hints; drop on errors or heavy hint use.
- Daily session mixes current lesson objectives (≈70%) with due review items (≈30%).
- Flashcards share the same SRS backend for rote knowledge.
- Future roadmap: SM-2 algorithm, streak bonuses, streak decay visualizations.

## Graphing & Notation

- **Notation**: KaTeX for fast, offline-friendly rendering; math inputs offer live previews with a constrained symbol palette.
- **Graph fidelity**:
  - SVG-based grapher with snapping, keyboard navigation, retina support, and ARIA descriptions.
  - Supports points, lines, segments, rays, polygons, circles, parabolas, inequalities (phase 2).
  - Checkers compare canonical forms with tolerances; deterministic seeds guarantee identical layouts for shareable links.

## Testing Strategy

- **Unit tests**: Item generators, checkers, utility math functions.
- **Integration tests**: Lesson pages render with given content; static export smoke tests ensure required routes exist.
- **Visual/interaction tests**: Playwright (opt-in) for primary lesson flows and accessibility assertions.
- **Content linting**: Verify objective references, prerequisite DAG integrity, and hint coverage per item.

## Deployment

1. `pnpm build` → `next export` writes static assets to `out/`.
2. GitHub Actions workflow uploads `out/` to the `gh-pages` branch.
3. GitHub Pages serves the site at `<user>.github.io/<repo>` with SPA fallback disabled (only static exports).

## GitHub-Centric Workflow (gh CLI)

- Default branch `main`, trunk-based. Every issue gets a short-lived branch (`<type>/<issue>-<title>`).
- Issues must include label(s), milestone, and (optionally) project board entry.
- Commit messages follow Conventional Commits.
- Prefer squash merges; enable auto-merge after approvals and passing checks.
- Protect `main`: require PR, ≥1 approval, lint/test checks.
- Scripts:
  - `gh issue create` + `git switch -c` workflow (see below).
  - Sprint seeding via `scripts/seed-issues.sh` and `docs/sprint/SX.md`.
- Post-merge hygiene: checkout `main`, `git pull --ff-only`, prune merged branches locally and remote.

```bash
export SPRINT_MILESTONE="S0 – Skeleton + Auth"
TITLE="Lesson scaffolding for vertex form"
DESC="Goals, acceptance criteria..."
NUM=$(gh issue create --title "$TITLE" --body "$DESC" --label "type:feature" --milestone "$SPRINT_MILESTONE" --assignee @me --json number --jq .number)
BR="feat/${NUM}-$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g;s/^-|-$//g' | cut -c1-40)"
git switch -c "$BR"
```

## Development Roadmap

### Current Sprint (S1): Static Site Foundation
- Enhanced static site generation and GitHub Pages deployment
- Improved Khan Academy course sync automation (see [automation.md](docs/automation.md))
- Progress tracking and mastery visualization improvements
- Content structure optimization for Integrated Math 3

### Upcoming Sprints
- **S2**: Interactive Practice Components - FunctionGrapher, NumberLine, DragArrange
- **S3**: Teacher Dashboard & Analytics - Comprehensive tools for educators

### Long-term Vision
- SM-2 spacing algorithm and richer analytics
- Expanded accessibility settings (reduced motion, high contrast)
- Cross-course dashboards and integrated math mappings
- Advanced gamification and engagement features

See [roadmap.md](docs/sprint/roadmap.md) for detailed planning and [PRD](docs/prd/) for comprehensive requirements.

---

## Contributing

1. Use the GitHub CLI workflow to create an issue → branch → PR.
2. Keep changes scoped; write tests first (TDD: Red → Green → Refactor).
3. Run `pnpm lint && pnpm test` locally before pushing.
4. Request review via `gh pr edit --add-reviewer`.
5. Enable auto-merge (`gh pr merge --auto --squash`).
6. After merge, sync `main` and delete the feature branch locally and remote.

## BMAD Framework & Documentation

This project uses the BMad-Method framework for structured development:
- **Agents**: Specialized AI assistants for different roles (see [AGENTS.md](AGENTS.md))
- **Tasks**: Reusable workflows for development activities
- **Documentation**: Structured PRD, architecture, and quality assurance

### Key Documentation
- [Product Requirements](docs/prd/) - Sharded PRD with comprehensive feature planning
- [Sprint Planning](docs/sprint/) - Current sprint and roadmap
- [Automation Guide](docs/automation.md) - Khan Academy sync and CI/CD
- [Architecture Guide](docs/architecture/) - Technical architecture and patterns

See `AGENTS.md` for automation and assistant guidance.
