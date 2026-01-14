# Track Spec: Sprint S2: Foundation and Infrastructure

## Overview
This track focuses on upgrading the technical foundation of the KA Math Companion to support modern development workflows and a consistent, accessible user experience.

## Objectives
1. **Modern Build System**: Migrate from Next.js default build to Vite with HMR for faster development cycles.
2. **Robust Testing Framework**: Upgrade to Vitest (native Vite integration) and React Testing Library with ≥80% coverage.
3. **Design System**: Establish a token-based theme system (light/dark) and a base library of accessible UI components.
4. **Scalable State Management**: Implement Zustand for global state and React Query for efficient data fetching/caching.
5. **Quality & Accessibility**: Ensure WCAG 2.1 AA compliance and establish performance benchmarks.

## Technical Approach
- **Build**: Configure `vite.config.ts` while maintaining Next.js static export compatibility.
- **Styling**: Implement design tokens using CSS Variables or a theme provider.
- **State**: Design a modular Zustand store with slices for `user`, `curriculum`, and `progress`.
- **Documentation**: Use Storybook 7+ for component isolation and documentation.

## Success Criteria
- `pnpm dev` starts in <2s with HMR.
- `pnpm test` runs with ≥80% coverage.
- All base components (Button, Input, Card, Modal) meet WCAG AA standards.
- Theme switching (Light/Dark) persists in localStorage.
