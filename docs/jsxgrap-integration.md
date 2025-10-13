# JSXGraph Integration Development Specification

## 1. Purpose and Scope

This document defines how JSXGraph will be integrated into the **KA Math Companion** project to provide interactive, pedagogically rich visualizations and manipulatives for math learning. JSXGraph enables dynamic, accessible, and deterministic visual tasks compatible with the project’s static Next.js export architecture.

### Goals

* Support **exploratory and scaffolded practice** within static MDX lessons.
* Enable **auto-gradable interactive tasks** (e.g., plotting asymptotes, drawing graphs).
* Maintain **determinism and static export compatibility**.
* Align with the platform’s pedagogy of conceptual understanding and productive struggle.

---

## 2. Integration Architecture

### 2.1 React Wrapper (`JXGBoard`)

* Single lightweight wrapper component responsible for initializing a JSXGraph board within a `<div>`.
* Initialization occurs client-side after hydration using dynamic import of `jsxgraph`.
* No runtime resizing (fixed container dimensions for static stability).
* Provides props:

  * `bbox`: bounding box array [xMin, yMax, xMax, yMin].
  * `ariaLabel`: accessibility label.
  * `onInit(board, JXG)`: callback for content-specific setup.
  * `height`, `width`: fixed dimensions.

### 2.2 Lifecycle and Cleanup

* Board is created once and destroyed on component unmount via `JXG.JSXGraph.freeBoard(board)`.
* No `ResizeObserver` or dynamic size recalculation to avoid hydration mismatch or feedback loops.

### 2.3 Determinism

* All interactive items (lines, points, sliders) are generated from a seeded deterministic generator.
* A local linear congruential generator (LCG) ensures reproducible randomness.
* Student responses reference only minimal data (seed + action parameters) for persistence.

---

## 3. Pedagogical Use Cases

| Type                | Description                                                    | Example                                          |
| ------------------- | -------------------------------------------------------------- | ------------------------------------------------ |
| **Exploration**     | Students manipulate parameters to explore function properties. | Adjust amplitude/phase of sine wave.             |
| **Construction**    | Students build or identify mathematical objects.               | Draw asymptotes and points on rational function. |
| **Matching**        | Students adjust sliders or equations to match a target graph.  | Tune `A`, `B`, `C`, `D` for a sine function.     |
| **Proof/Reasoning** | Visual argument or counterexample generation.                  | Drag points to test geometric conjectures.       |

---

## 4. Authoring Pattern

### 4.1 Generator Module

Each interactive task uses a deterministic generator exported from `content/items/<id>.ts`.

```ts
export function generate(seed: number): GeneratedTask;
export function check(response: StudentResponse, gen: GeneratedTask): CheckResult;
```

* `generate()` defines canonical parameters and expected responses.
* `check()` verifies correctness numerically or symbolically with tolerances.

### 4.2 Lesson Embedding

* Authors embed `<JXGBoard />` inside MDX content.
* Use `onInit` callback to create the board elements (e.g., sliders, points, function graphs).
* Combine with `<ScaffoldedSteps />`, `<WorkedExample />`, or `<FadedExample />` for structured practice.

---

## 5. Accessibility and UX

* All boards have `role="application"` and descriptive `aria-label`s.
* Elements must be navigable via keyboard (tab + arrow nudge).
* Points and sliders should include snap options for fine control.
* Avoid motion-triggered resizing; maintain consistent bounding box.
* Ensure color contrast and consider reduced-motion and high-contrast themes.

---

## 6. Testing and Validation

* **Unit Tests**: Ensure deterministic generation and `check()` function accuracy.
* **Integration Tests**: Confirm JSXGraph boards render without hydration mismatch.
* **Smoke Tests**: Verify RNG determinism, stable rendering, and cleanup integrity.
* **Visual Tests (Playwright)**: Confirm ARIA compliance and visible correctness feedback.

---

## 7. Performance and Static Export

* JSXGraph loads dynamically only on the client side.
* No reliance on window size or dynamic reflow; static layout guarantees export compatibility.
* Future optimization: lazy load JSXGraph only when interactive content is in view.

---

## 8. Future Enhancements

* Add **KaTeX-integrated labels** for mathematical fidelity.
* Implement **text-input-based function matching** tasks.
* Create reusable templates for **geometry**, **statistics**, and **calculus** items.
* Extend analytics: log interaction patterns for mastery analysis.
* Support multi-step scaffolding tied to spaced-retrieval scheduling.

---

## 9. Example Specification Structure

```
/specs/jsxgraph/
  |- core-architecture.md
  |- pedagogical-patterns.md
  |- authoring-guide.md
  |- accessibility.md
  |- testing-checklist.md
  |- roadmap.md
```
