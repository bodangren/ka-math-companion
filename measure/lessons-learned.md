# Lessons Learned

> This file is curated working memory, not an append-only log. Keep it at or below **50 lines**.
> Remove or condense entries that are no longer relevant to near-term planning.

## Architecture & Design
<!-- Decisions made that future tracks should be aware of -->

## Recurring Gotchas
<!-- Problems encountered repeatedly; save future tracks from the same pain -->

## Patterns That Worked Well
<!-- Approaches worth repeating -->

- (2026-04-09, curriculum-data) TDD for type changes: write failing tests first, then add fields to all usages systematically
- (2026-04-10, curriculum-data) Batch similar tasks: adding objectives to multiple units in one commit reduced context switching
- (2026-04-11, curriculum-data) Unit indexing: use `List.drop n |> List.head` to safely access units by position
- (2026-04-15, curriculum-data) TDD for lesson descriptions: write test checking String.length description > 0 first, then implement
- (2026-04-17, curriculum-data) TDD for validation: write tests first that enumerate issues, then implement fix
- (2026-04-23, design-system) TDD for design tokens: write tests first verifying all token values, then implement
- (2026-04-23, design-system) Elm type variables with msg: When Attr type uses `Html.Html msg`, declare `type Attr msg` not `type Attr`
- (2026-04-24, design-system) Critical: `Html.Attributes.style "all" "cssString"` does NOT apply CSS. Fix: use `Html.Attributes.attribute "style" "cssString"`
- (2026-04-24, design-system) Elm tests pass even with broken HTML generation (tests use Expect.pass). Test quality matters
- (2026-04-24, design-system) When fixing style attributes, consolidate multiple CSS rules into single `attribute "style" "..."`
- (2026-04-25, design-system) Removed dead Grid attrs: computed but never applied to CSS. Unused code misleads maintainers
- (2026-04-25, visual_refresh) Elm operator precedence: `attribute "x" "y" ++ z` is parsed as `(attribute "x" "y") ++ z`. Always use parentheses
- (2026-04-25, visual_refresh) Elm module exports: `exposing (badge)` does not expose Variant constructors. Use `Variant(..)`
- (2026-05-02, katex-integration) Elm port module syntax: `port module Ports exposing (...)` requires port keyword on both module declaration and each port function
- (2026-05-02, katex-integration) KaTeX CDN: Load CSS before JS. Use `katex.render(latex, element, { throwOnError: false, displayMode: true/false })`
- (2026-05-02, design-system) Footer integration: Footer uses `margin-top: auto` in flex column layout. Must set `display:flex;flex-direction:column` on parent
- (2026-05-03, design-system) Elm Land bug: Pages with trailing underscore auto-generate routes with params even when page takes no args. Fix: rename without trailing underscore
- (2026-05-03, autonomous) All 116 tests pass. Build succeeds. App serves at localhost:1235. elm-format needed on 6 files. elm-review found 65 issues (unused test vars, unused Button/Grid exports). Fixed via format + build.
- (2026-05-03, lesson-content) Elm type aliases like `Step` must be defined BEFORE they're used in other type aliases like `WorkedExample`. Order matters in Elm type definitions.
- (2026-05-04, design-system) Spinner @keyframes animation: use `Html.node "style" [attribute "type" "text/css"] [Html.text "@keyframes ..."]` to inject CSS animation into DOM
- (2026-05-05, katex-integration) Task 7: Added inline math to Unit 1 polynomial lesson objectives. Math syntax like $ax^n$ embedded directly in objective strings. kaTeX will render on page load via data-katex attributes.
- (2026-05-05, katex-integration) Tasks 8-9: Added math notation to Unit 5 (logarithms: log rules, exponential equations) and Unit 8 (trigonometry: Law of Sines/Cosines, unit circle, Pythagorean identity). KaTeX track complete.
- (2026-05-05, katex-integration) Error handling: katex.js already handles errors gracefully via `throwOnError: false` and try/catch fallback to plain text. Accessibility via rendered HTML structure.
- (2026-05-05, interactive-viz) elm/svg package: Use `Svg` module for SVG elements, import specific `Svg.Attributes` functions. Html.svg doesn't exist - it's `Svg.svg`.
- (2026-05-05, interactive-viz) Elm variable shadowing: Using `mathX` as parameter name shadows the `mathX` function. Use distinct names like `mx` or `my` to avoid compile errors.
- (2026-05-05, interactive-viz) Expect.false does not exist in Elm test Expect. Use case/if pattern with Expect.pass/Expect.fail instead.
- (2026-05-06, interactive-viz) Elm variable shadowing: Using `mathX` as parameter name shadows the `mathX` function. Use distinct names like `mx` or `my` to avoid compile errors.
- (2026-05-06, interactive-viz) Elm pipe precedence: `|>` has lower precedence than function application. `round v |> modBy step == 0` parses as `(round v |> modBy step) == 0`. Parenthesize: `(round v |> modBy step) == 0`.
- (2026-05-06, interactive-viz) Elm SVG: `cos` and `sin` are built-in, not from a Math module. Use `Basics.cos` and `Basics.sin`.
- (2026-05-06, interactive-viz) Elm float division: `/` requires Float operands. Use `toFloat` to convert Int to Float before dividing.
- (2026-05-06, interactive-viz) Elm Expect.within order: `Expect.within (Expect.Absolute 0.001) expected actual` not the other way around.
- (2026-05-06, interactive-viz) Svg.Helpers withFontSize/textAnchor: Need to add these to Helpers module and import fontSize, textAnchor from Svg.Attributes.
- (2026-05-06, interactive-viz) Elm config pattern: withAngle now sets both angle AND selectedAngle (default behavior). Keep related fields in sync when setting through builder functions.
- (2026-05-07, interactive-viz) VizLessonContent pattern: separate data module maps (unitSlug, lessonSlug) pairs to VizBlock types. Cleaner than embedding viz in LessonContent.
- (2026-05-07, interactive-viz) NumberLine.init takes (width, min, max) not (width) alone - check function signatures before chaining builders
- (2026-05-07, progress-tracking) Elm port tests: can't test Cmd output directly in elm-test. Test exposed functions by verifying type signatures compile
- (2026-05-07, progress-tracking) Decode.map8 with piped |> Decode.andThen needs careful type alignment - use intermediate record construction to avoid pipe type mismatch