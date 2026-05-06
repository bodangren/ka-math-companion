# Specification: KaTeX Integration

## Overview

Integrate KaTeX library for rendering mathematical notation using Elm ports. Enable inline and display math expressions throughout lesson content.

## Functional Requirements

1. **JavaScript Port Setup**
   - Create port for sending math expressions to JavaScript
   - Create port for receiving rendered HTML back
   - Handle KaTeX loading and initialization

2. **Elm Math Module**
   - Create `Math.elm` module with functions for math rendering
   - Support inline math (`$...$`) and display math (`$$...$$`)
   - Parse math expressions from strings

3. **Usage in Components**
   - Add math rendering to lesson pages
   - Support math in objectives and descriptions
   - Handle rendering errors gracefully

4. **Math Expression Types**
   - `InlineMath` - Inline expressions (fractions, exponents)
   - `DisplayMath` - Centered block equations
   - `MathBlock` - Multi-line equation systems

## Non-Functional Requirements

- KaTeX loaded from CDN for performance
- Graceful fallback if KaTeX fails to load
- No flickering or layout shift during rendering
- Accessible math with ARIA labels

## Acceptance Criteria

- [ ] KaTeX loads and renders on page load
- [ ] Inline math renders correctly (e.g., `$x^2$`)
- [ ] Display math renders correctly (e.g., `$$\int_a^b f(x)dx$$`)
- [ ] Math renders on lesson pages
- [ ] Error handling for invalid expressions
- [ ] All tests pass

## Out of Scope

- Math input/editing by users (future enhancement)
- Complex diagram rendering (covered in Interactive Viz track)
- LaTeX document compilation