# Agent Guide

This document orients automation, AI assistants, and future contributors to the conventions of the KA Math Companion repository.

## Repository Facts

- Static Next.js application exported for GitHub Pages (`next export` → `./out`).
- Content-first: objectives, lessons, practice generators, and flashcards live under `content/`.
- Pedagogical focus on mastery learning, spaced retrieval, and multi-representational math instruction.
- No runtime database or server access; all state is client-side (localStorage/IndexedDB).

## Environment Expectations

- Toolchain: Node.js 20+, pnpm 8+, TypeScript, Next.js App Router with MDX support.
- Required dev commands:
  - `pnpm dev`: local development.
  - `pnpm lint`: ESLint + content lint rules (Zod checks).
  - `pnpm test`: unit/integration suite; includes generator sampling.
  - `pnpm build`: production build.
- Static export artifacts land in `./out` and are published to GitHub Pages by CI.

## Content Structure

- `content/objectives/`: YAML/JSON documents with IDs, titles, descriptions, prerequisites, standards, linked KA skills.
- `content/lessons/<objectiveId>/<slug>.mdx`: Lesson narratives with embedded React components; front matter captures metadata.
- `content/items/<objectiveId>/*.ts`: Deterministic generators exporting `generate(seed)` and `check(response)` plus hints, steps, misconception tags.
- `content/cards/<objectiveId>.json`: Flashcard decks for spaced recall.
- `docs/sprint/`: Sprint story breakdowns used by automation (`scripts/seed-issues.sh`) to create GitHub issues.
- `lib/`: Content loaders, RNG helpers, validation schemas, SRS utilities.
- `components/`: Interactive widgets (FunctionGrapher, NumberLine, DragArrange, ScaffoldedSteps, etc.).

## GitHub Workflow (gh CLI)

- Default branch: `main`, protected (PRs + approvals + lint/test checks required).
- Branch naming: `<type>/<issue-number>-<kebab-title>` where `<type>` ∈ `feat|fix|chore|docs|refactor|test`.
- Issues:
  - Must include labels (e.g., `type:feature`, `area:frontend`, `priority:P2`) and a milestone (one sprint per milestone).
  - Optional: add to project boards after creation.
- Branch flow:
  1. Create issue via `gh issue create` (include milestone, labels, assignee).
  2. Create branch from issue number.
  3. Implement feature; keep commits Conventional.
  4. Run `pnpm lint && pnpm test`.
  5. Push branch, open PR with `gh pr create --fill --label ... --milestone ...`.
  6. Request review, enable auto-squash merge (`gh pr merge --auto --squash`).
  7. After merge: `git checkout main && git pull --ff-only`, delete branch locally and remote.
- Sprint kickoff automation:
  - Author stories in `docs/sprint/SX.md`.
  - Dry-run issue seeding, then apply with `scripts/seed-issues.sh`.
  - Environment variables: `SPRINT_MILESTONE`, `ASSIGNEE`, `EXTRA_LABELS`.

## Testing & Quality Gates

- TDD mandated: write failing tests first, then implement, then refactor.
- Unit tests colocated with code (`*.test.ts` / `*.spec.ts`).
- Integration tests cover lesson rendering, data wiring, and static generation.
- Optional Playwright E2E for core flows (warmups, lesson, spaced practice).
- Coverage goal: ≥80% on core modules (flexible during MVP).
- Deterministic RNG: all item generators must accept `seed` and use shared helpers (e.g., `mulberry32`).
- Accessibility checks (axe) should run on key lesson templates.

## Deployment & Automation

- CI pipeline:
  - Install dependencies.
  - Run lint/tests.
  - Run `pnpm build` and `next export`.
  - Publish `/out` to `gh-pages`.
- Required status checks: lint, unit tests, integration tests.
- CODEOWNERS recommended for content vs. infra paths.
- Auto-label GitHub Action (optional) to apply `area:*` labels based on file globs.

## Assistant Conduct

- Honor repository-local conventions; never bypass lint/test commands when modifying code.
  - For read-only contexts, provide patch snippets instead of direct edits.
- Prefer `rg`, `sed`, `jq`, and other CLI tools for inspection; use `pnpm` for scripts.
- When editing, add concise, meaningful comments only where logic is non-trivial.
- Do not revert changes authored by humans unless explicitly instructed.
- Validate any generated code snippets for TypeScript correctness and static-site compatibility (no server-only APIs).
- Keep math notation consistent (KaTeX macros) and ensure interactive components expose accessibility hooks (keyboard, aria, reduced motion).

## Common Pitfalls

- Forgetting to add new objectives/lessons to course sequences.
- Non-deterministic generators causing flaky spaced practice tracking.
- Graph components without snapping/tolerance checks -> grading mismatches.
- Missing milestone/label on new issues (violates workflow).
- Including server-side dependencies in client components (breaks static export).

## Need Help?

- Content or pedagogy questions → consult `docs/` (to be expanded) or raise an issue labeled `type:docs`.
- Automation or workflow updates → propose changes in `AGENTS.md` via PR, route to maintainers for review.
- New interactive widget ideas → draft a design doc under `docs/design/` and link in the issue before implementation.
