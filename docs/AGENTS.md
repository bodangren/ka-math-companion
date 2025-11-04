# SynthesisFlow Agent Guide

This document orients AI assistants and contributors to the SynthesisFlow methodology used in the KA Math Companion repository.

## Repository Overview

- **Project**: KA Math Companion - A pedagogy-first, static Next.js companion to Khan Academy math courses
- **Current Phase**: Sprint S1 of 3-sprint brownfield enhancement initiative
- **Architecture**: Functional static site with client-side interactivity, exported for GitHub Pages
- **Curriculum**: Integrated Math 3 focus with mastery learning and spaced retrieval

## SynthesisFlow Methodology

This project uses SynthesisFlow, a modular, spec-driven development methodology. The workflow is broken down into discrete skills located in the `.claude/skills/` directory.

### Core Philosophy

1. **Specs as Code**: All specification changes are proposed and approved via Pull Requests
2. **Just-in-Time Context**: Use the `doc-indexer` skill to get a real-time map of all project documentation
3. **Sprint-Based**: Work is organized into GitHub Milestones and planned via the `sprint-planner` skill
4. **Atomic Issues**: Implementation is done via atomic GitHub Issues, which are executed by the `issue-executor` skill

## Available Skillsets

- **`.claude/skills/project-init/`**: For initial project scaffolding
- **`.claude/skills/doc-indexer/`**: For real-time documentation discovery
- **`.claude/skills/spec-authoring/`**: For proposing and refining new specifications
- **`.claude/skills/sprint-planner`**: For creating GitHub issues from approved specs
- **`.claude/skills/issue-executor/`**: For implementing code for a single issue
- **`.claude/skills/change-integrator/`**: For finalizing and archiving a completed change
- **`.claude/skills/agent-integrator/`**: For creating or updating this guide in `AGENTS.md`
- **`.claude/skills/project-migrate/`**: For migrating existing projects to SynthesisFlow structure
- **`.claude/skills/prd-authoring/`**: For creating Product Requirements Documents
- **`.claude/skills/spec-authoring/`**: For technical specification writing

## Development Workflow

### 1. Session Start

Always begin by assessing the current state:

```bash
# Check current branch and status
git status
git branch

# Get real-time documentation overview
bash .claude/skills/doc-indexer/scripts/scan-docs.sh
```

### 2. Planning Phase

- Use `sprint-planner` to create issues from approved specs
- Review current sprint context in `docs/S1.md`, `docs/S2.md`
- Check `docs/specs/roadmap.md` for strategic alignment

### 3. Implementation Phase

- Use `issue-executor` to work on atomic GitHub issues
- Follow project conventions: TypeScript, Next.js, static export compatibility
- Run validation: `pnpm lint && pnpm test`

### 4. Quality Assurance

- Ensure all tests pass and code is TypeScript-compliant
- Verify static export compatibility
- Check accessibility compliance

### 5. Integration Phase

- Use `change-integrator` to finalize and archive completed changes
- Update documentation as needed
- Commit changes with proper conventional commit messages

## Project Structure

### Documentation (SynthesisFlow)

```
docs/
├── specs/           # Source-of-truth specifications
│   ├── requirements.md
│   ├── roadmap.md
│   └── 1.2a.design-tokens-theme.md
├── prd.md          # Product Requirements Document
├── S1.md, S2.md    # Sprint plans
└── [other docs]     # Supporting documentation
```

### Application Code

```
app/                 # Next.js App Router pages
components/          # Interactive React components
lib/                # Utilities and helpers
curriculum/          # Course content (MDX)
data/               # Static data and course info
```

### Development Tools

- **Toolchain**: Node.js 20+, pnpm 8+, TypeScript, Next.js
- **Commands**: `pnpm dev`, `pnpm lint`, `pnpm test`, `pnpm build`
- **Testing**: Jest for unit/integration, Playwright for E2E
- **Deployment**: Static export to GitHub Pages via CI/CD

## Assistant Conduct Guidelines

- **Repository conventions**: Honor local patterns; never bypass lint/test commands
- **Read-only context**: Provide patch snippets instead of direct edits when appropriate
- **Tool preferences**: Use `rg`, `bash`, and CLI tools for inspection; `pnpm` for scripts
- **Code quality**: Add concise comments only where logic is non-trivial
- **Validation**: Ensure generated code is TypeScript-compliant and static-site compatible
- **Math consistency**: Maintain KaTeX macros and ensure accessibility in interactive components
- **Sprint awareness**: Consider current sprint context and enhancement roadmap

## Getting Started

To begin working with this project using SynthesisFlow:

1. **Assess current state**: Run `doc-indexer` to understand available documentation
2. **Check sprint context**: Review `docs/S1.md` for current sprint focus
3. **Identify work**: Find relevant issues in GitHub or create new ones
4. **Execute workflow**: Use appropriate skills for planning, implementation, and integration

## Key Documentation

- **Product Requirements**: `docs/prd.md` - Comprehensive feature planning
- **Specifications**: `docs/specs/` - Technical specifications and design docs
- **Sprint Planning**: `docs/S1.md`, `docs/S2.md` - Current sprint and roadmap
- **Automation**: `docs/automation.md` - Khan Academy sync and CI/CD
- **Project README**: `README.md` - General project information

---

**To begin, always assess the current state by checking the git branch and running the `doc-indexer`.**
