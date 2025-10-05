
# Agent Guide

This document orients automation, AI assistants, and future contributors to the conventions of the KA Math Companion repository.

## Repository Facts

- **Functional static Next.js application** exported for GitHub Pages (`next export` → `./out`).
- **Current enhancement phase**: Sprint S1 of 3-sprint brownfield enhancement initiative.
- **Content-first architecture**: objectives, lessons, practice generators, and flashcards with Integrated Math 3 focus.
- **Pedagogical foundation**: Mastery learning, spaced retrieval, and multi-representational math instruction.
- **Client-side state**: All state managed via localStorage/IndexedDB with export/import capabilities.
- **BMAD framework**: Structured development with specialized agents, tasks, and quality gates.

## Environment Expectations

- Toolchain: Node.js 20+, pnpm 8+, TypeScript, Next.js App Router with MDX support.
- Required dev commands:
  - `pnpm dev`: local development.
  - `pnpm lint`: ESLint + content lint rules (Zod checks).
  - `pnpm test`: unit/integration suite; includes generator sampling.
  - `pnpm build`: production build.
- Static export artifacts land in `./out` and are published to GitHub Pages by CI.

## Content Structure

- `curriculum/`: Course content and lesson materials (MDX format)
  - `integrated-math-3.md`: Current course curriculum
- `data/`: Static data including course information and progress tracking
- `components/`: Interactive React components for math learning
  - `MasteryIndicator.tsx`: Progress visualization
  - `CurriculumOverview.tsx`: Course navigation
- `lib/`: Utilities for content loading, progress tracking, and validation
- `docs/`: Comprehensive project documentation
  - `prd/`: Sharded Product Requirements Document
  - `sprint/`: Sprint planning, roadmap, and current progress
  - `qa/`: Quality assurance artifacts and gate reviews
  - `architecture/`: Technical architecture and patterns
- `app/`: Next.js app router pages and routing structure
- `lib/`: Content loaders, RNG helpers, validation schemas, SRS utilities.
- `components/`: Interactive widgets (FunctionGrapher, NumberLine, DragArrange, ScaffoldedSteps, etc.).

## GitHub Workflow (gh CLI)

- **Default branch**: `main`, protected with PRs + approvals + lint/test checks required.
- **Branch naming**: `<type>/<issue-number>-<kebab-title>` where `<type>` ∈ `feat|fix|chore|docs|refactor|test`.
- **Issue management**:
  - Must include labels (e.g., `type:feature`, `area:frontend`, `priority:P2`) and sprint milestone.
  - Optional: add to project boards for enhanced tracking.
- **Development flow**:
  1. Create issue via `gh issue create` (include milestone, labels, assignee).
  2. Create branch from issue number.
  3. Implement feature following BMAD story structure.
  4. Run `pnpm lint && pnpm test` for validation.
  5. Push branch, open PR with `gh pr create --fill --label ... --milestone ...`.
  6. Request review, enable auto-squash merge (`gh pr merge --auto --squash`).
  7. After merge: `git checkout main && git pull --ff-only`, cleanup branches.
- **Sprint management**:
  - Stories authored in `docs/sprint/SX.md` with BMAD framework.
  - Issue seeding via `scripts/seed-issues.sh` with sprint context.
  - Environment variables: `SPRINT_MILESTONE`, `ASSIGNEE`, `EXTRA_LABELS`.
- **Quality gates**: QA reviews and automated checks ensure code quality and feature completeness.

## Testing & Quality Gates

- **TDD approach**: Write failing tests first, then implement, then refactor.
- **Test structure**: Unit tests colocated with code (`*.test.ts` / `*.spec.ts`).
- **Integration coverage**: Lesson rendering, data wiring, and static generation.
- **E2E testing**: Optional Playwright for core flows (warmups, lessons, spaced practice).
- **Coverage targets**: ≥80% on core modules (flexible during enhancement sprints).
- **Deterministic generators**: All item generators accept `seed` parameter using shared helpers.
- **Accessibility**: Automated checks (axe) on key lesson templates and components.
- **BMAD quality gates**: Structured QA process with risk assessment and traceability.
- **Static export validation**: Ensure all changes maintain GitHub Pages compatibility.

## Deployment & Automation

- **CI/CD pipeline**:
  - Install dependencies with pnpm.
  - Run lint and test suites.
  - Execute `pnpm build` and `next export`.
  - Publish `/out` to `gh-pages` branch.
- **Required checks**: Lint, unit tests, integration tests must pass.
- **Khan Academy sync**: Automated course data updates (see `docs/automation.md`).
- **CODEOWNERS**: Recommended for content vs. infrastructure path separation.
- **Auto-labeling**: GitHub Actions apply `area:*` labels based on file patterns.
- **Sprint deployments**: Regular releases aligned with sprint milestones.

## Assistant Conduct

- **Repository conventions**: Honor local patterns; never bypass lint/test commands when modifying code.
- **Read-only context**: Provide patch snippets instead of direct edits when appropriate.
- **Tool preferences**: Use `rg`, `sed`, `jq`, and CLI tools for inspection; `pnpm` for scripts.
- **Code quality**: Add concise, meaningful comments only where logic is non-trivial.
- **Change management**: Do not revert human-authored changes unless explicitly instructed.
- **Validation**: Ensure generated code is TypeScript-compliant and static-site compatible.
- **BMAD framework**: Follow structured story development and quality gate processes.
- **Math consistency**: Maintain KaTeX macros and ensure accessibility in interactive components.
- **Sprint awareness**: Consider current sprint context and enhancement roadmap when making changes.

## Common Pitfalls

- **Content management**: Forgetting to add new objectives/lessons to course sequences.
- **Generator determinism**: Non-deterministic generators causing flaky spaced practice tracking.
- **Component precision**: Graph components without snapping/tolerance checks causing grading mismatches.
- **Workflow compliance**: Missing milestone/label on new issues (violates BMAD workflow).
- **Static compatibility**: Including server-side dependencies in client components (breaks export).
- **Sprint alignment**: Making changes outside current sprint scope without proper planning.
- **Quality gates**: Bypassing QA reviews or risk assessment processes.
- **Documentation**: Not updating sharded PRD sections when requirements evolve.

## Current Project Context

### Enhancement Initiative
- **Phase**: Brownfield enhancement of functional static site
- **Current Sprint**: S1 - Static Site Foundation (see `docs/sprint/S1.md`)
- **Target**: Integrated Math 3 curriculum enhancement
- **Architecture**: Maintaining static export while adding interactivity

### BMAD Configuration
- **Framework**: BMad-Method v4 with sharded PRD and architecture
- **Story Location**: `docs/stories/` for structured development
- **QA Process**: Risk assessment, traceability, and quality gates
- **Agents**: Specialized roles for dev, qa, po, sm, and other functions
- **Documentation**: Comprehensive sharded structure under `docs/`

### Development Standards
- **Language**: TypeScript with strict type checking
- **Framework**: Next.js App Router with static export
- **Styling**: CSS with responsive design principles
- **Testing**: Jest for unit/integration, Playwright for E2E
- **Linting**: ESLint with content validation rules

## Need Help?

- **Content and pedagogy**: Consult sharded PRD (`docs/prd/`) or raise issue labeled `type:docs`.
- **BMAD framework**: See `AGENTS.md` for agent guidance and task workflows.
- **Sprint planning**: Refer to `docs/sprint/` for current sprint and roadmap questions.
- **Automation and workflow**: Propose changes via PR, route to maintainers for review.
- **Interactive components**: Draft design doc under `docs/design/` and link in issue before implementation.
- **Quality assurance**: Consult `docs/qa/` for testing standards and gate processes.
- **Khan Academy integration**: See `docs/automation.md` for sync and data management.

<!-- BEGIN: BMAD-AGENTS -->
# BMAD-METHOD Agents and Tasks

This section is BMAD-METHOD for Codex, Claude Code, and OpenCode. 

## Agents

### Directory

| Title | ID | When To Use |
|---|---|---|
| UX Expert | ux-expert | Use for UI/UX design, wireframes, prototypes, front-end specifications, and user experience optimization |
| Scrum Master | sm | Use for story creation, epic management, retrospectives in party-mode, and agile process guidance |
| Test Architect & Quality Advisor | qa | Use for comprehensive test architecture review, quality gate decisions, and code improvement. Provides thorough analysis including requirements traceability, risk assessment, and test strategy. Advisory only - teams choose their quality bar. |
| Product Owner | po | Use for backlog management, story refinement, acceptance criteria, sprint planning, and prioritization decisions |
| Product Manager | pm | Use for creating PRDs, product strategy, feature prioritization, roadmap planning, and stakeholder communication |
| Full Stack Developer | dev | 'Use for code implementation, debugging, refactoring, and development best practices' |
| BMad Master Orchestrator | bmad-orchestrator | Use for workflow coordination, multi-agent tasks, role switching guidance, and when unsure which specialist to consult |
| BMad Master Task Executor | bmad-master | Use when you need comprehensive expertise across all domains, running 1 off tasks that do not require a persona, or just wanting to use the same agent for many things. |
| Architect | architect | Use for system design, architecture documents, technology selection, API design, and infrastructure planning |
| Business Analyst | analyst | Use for market research, brainstorming, competitive analysis, creating project briefs, initial project discovery, and documenting existing projects (brownfield) |


### UX Expert (id: ux-expert)
Source: .bmad-core/agents/ux-expert.md

- When to use: Use for UI/UX design, wireframes, prototypes, front-end specifications, and user experience optimization
- How to activate: Mention "As ux-expert, ..." or "Use UX Expert to ..."


### Scrum Master (id: sm)
Source: .bmad-core/agents/sm.md

- When to use: Use for story creation, epic management, retrospectives in party-mode, and agile process guidance
- How to activate: Mention "As sm, ..." or "Use Scrum Master to ..."


### Test Architect & Quality Advisor (id: qa)
Source: .bmad-core/agents/qa.md

- When to use: Use for comprehensive test architecture review, quality gate decisions, and code improvement. Provides thorough analysis including requirements traceability, risk assessment, and test strategy. Advisory only - teams choose their quality bar.
- How to activate: Mention "As qa, ..." or "Use Test Architect & Quality Advisor to ..."


### Product Owner (id: po)
Source: .bmad-core/agents/po.md

- When to use: Use for backlog management, story refinement, acceptance criteria, sprint planning, and prioritization decisions
- How to activate: Mention "As po, ..." or "Use Product Owner to ..."


### Product Manager (id: pm)
Source: .bmad-core/agents/pm.md

- When to use: Use for creating PRDs, product strategy, feature prioritization, roadmap planning, and stakeholder communication
- How to activate: Mention "As pm, ..." or "Use Product Manager to ..."


### Full Stack Developer (id: dev)
Source: .bmad-core/agents/dev.md

- When to use: 'Use for code implementation, debugging, refactoring, and development best practices'
- How to activate: Mention "As dev, ..." or "Use Full Stack Developer to ..."


### BMad Master Orchestrator (id: bmad-orchestrator)
Source: .bmad-core/agents/bmad-orchestrator.md

- When to use: Use for workflow coordination, multi-agent tasks, role switching guidance, and when unsure which specialist to consult
- How to activate: Mention "As bmad-orchestrator, ..." or "Use BMad Master Orchestrator to ..."


### BMad Master Task Executor (id: bmad-master)
Source: .bmad-core/agents/bmad-master.md

- When to use: Use when you need comprehensive expertise across all domains, running 1 off tasks that do not require a persona, or just wanting to use the same agent for many things.
- How to activate: Mention "As bmad-master, ..." or "Use BMad Master Task Executor to ..."


### Architect (id: architect)
Source: .bmad-core/agents/architect.md

- When to use: Use for system design, architecture documents, technology selection, API design, and infrastructure planning
- How to activate: Mention "As architect, ..." or "Use Architect to ..."


### Business Analyst (id: analyst)
Source: .bmad-core/agents/analyst.md

- When to use: Use for market research, brainstorming, competitive analysis, creating project briefs, initial project discovery, and documenting existing projects (brownfield)
- How to activate: Mention "As analyst, ..." or "Use Business Analyst to ..."

## Tasks

These are reusable task briefs you can reference directly in Codex.

### Task: validate-next-story
Source: .bmad-core/tasks/validate-next-story.md
- How to use: "Use task validate-next-story with the appropriate agent" and paste relevant parts as needed.


### Task: trace-requirements
Source: .bmad-core/tasks/trace-requirements.md
- How to use: "Use task trace-requirements with the appropriate agent" and paste relevant parts as needed.


### Task: test-design
Source: .bmad-core/tasks/test-design.md
- How to use: "Use task test-design with the appropriate agent" and paste relevant parts as needed.


### Task: shard-doc
Source: .bmad-core/tasks/shard-doc.md
- How to use: "Use task shard-doc with the appropriate agent" and paste relevant parts as needed.


### Task: risk-profile
Source: .bmad-core/tasks/risk-profile.md
- How to use: "Use task risk-profile with the appropriate agent" and paste relevant parts as needed.


### Task: review-story
Source: .bmad-core/tasks/review-story.md
- How to use: "Use task review-story with the appropriate agent" and paste relevant parts as needed.


### Task: qa-gate
Source: .bmad-core/tasks/qa-gate.md
- How to use: "Use task qa-gate with the appropriate agent" and paste relevant parts as needed.


### Task: nfr-assess
Source: .bmad-core/tasks/nfr-assess.md
- How to use: "Use task nfr-assess with the appropriate agent" and paste relevant parts as needed.


### Task: kb-mode-interaction
Source: .bmad-core/tasks/kb-mode-interaction.md
- How to use: "Use task kb-mode-interaction with the appropriate agent" and paste relevant parts as needed.


### Task: index-docs
Source: .bmad-core/tasks/index-docs.md
- How to use: "Use task index-docs with the appropriate agent" and paste relevant parts as needed.


### Task: generate-ai-frontend-prompt
Source: .bmad-core/tasks/generate-ai-frontend-prompt.md
- How to use: "Use task generate-ai-frontend-prompt with the appropriate agent" and paste relevant parts as needed.


### Task: facilitate-brainstorming-session
Source: .bmad-core/tasks/facilitate-brainstorming-session.md
- How to use: "Use task facilitate-brainstorming-session with the appropriate agent" and paste relevant parts as needed.


### Task: execute-checklist
Source: .bmad-core/tasks/execute-checklist.md
- How to use: "Use task execute-checklist with the appropriate agent" and paste relevant parts as needed.


### Task: document-project
Source: .bmad-core/tasks/document-project.md
- How to use: "Use task document-project with the appropriate agent" and paste relevant parts as needed.


### Task: create-next-story
Source: .bmad-core/tasks/create-next-story.md
- How to use: "Use task create-next-story with the appropriate agent" and paste relevant parts as needed.


### Task: create-doc
Source: .bmad-core/tasks/create-doc.md
- How to use: "Use task create-doc with the appropriate agent" and paste relevant parts as needed.


### Task: create-deep-research-prompt
Source: .bmad-core/tasks/create-deep-research-prompt.md
- How to use: "Use task create-deep-research-prompt with the appropriate agent" and paste relevant parts as needed.


### Task: create-brownfield-story
Source: .bmad-core/tasks/create-brownfield-story.md
- How to use: "Use task create-brownfield-story with the appropriate agent" and paste relevant parts as needed.


### Task: correct-course
Source: .bmad-core/tasks/correct-course.md
- How to use: "Use task correct-course with the appropriate agent" and paste relevant parts as needed.


### Task: brownfield-create-story
Source: .bmad-core/tasks/brownfield-create-story.md
- How to use: "Use task brownfield-create-story with the appropriate agent" and paste relevant parts as needed.


### Task: brownfield-create-epic
Source: .bmad-core/tasks/brownfield-create-epic.md
- How to use: "Use task brownfield-create-epic with the appropriate agent" and paste relevant parts as needed.


### Task: apply-qa-fixes
Source: .bmad-core/tasks/apply-qa-fixes.md
- How to use: "Use task apply-qa-fixes with the appropriate agent" and paste relevant parts as needed.


### Task: advanced-elicitation
Source: .bmad-core/tasks/advanced-elicitation.md
- How to use: "Use task advanced-elicitation with the appropriate agent" and paste relevant parts as needed.


<!-- END: BMAD-AGENTS -->
