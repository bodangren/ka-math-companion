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
- (2026-05-05, katex-integration) Error handling: katex.js already handles errors gracefully via `throwOnError: false` and try/catch fallback to plain text. Accessibility via rendered HTML structure.
- (2026-05-05, interactive-viz) elm/svg package: Use `Svg` module for SVG elements, import specific `Svg.Attributes` functions. Html.svg doesn't exist - it's `Svg.svg`.
- (2026-05-05, interactive-viz) Expect.false does not exist in Elm test Expect. Use case/if pattern with Expect.pass/Expect.fail instead.
- (2026-05-06, interactive-viz) Elm pipe precedence: `|>` has lower precedence than function application. Parenthesize: `(round v |> modBy step) == 0`.
- (2026-05-06, interactive-viz) Elm SVG: `cos` and `sin` are built-in, not from a Math module. Use `Basics.cos` and `Basics.sin`.
- (2026-05-06, interactive-viz) Elm float division: `/` requires Float operands. Use `toFloat` to convert Int to Float before dividing.
- (2026-05-06, interactive-viz) Elm Expect.within order: `Expect.within (Expect.Absolute 0.001) expected actual` not the other way around.
- (2026-05-07, interactive-viz) Elm config pattern: withAngle now sets both angle AND selectedAngle. Keep related fields in sync when setting through builder functions.
- (2026-05-07, progress-tracking) Elm port tests: can't test Cmd output directly in elm-test. Test exposed functions by verifying type signatures compile
- (2026-05-07, spaced-practice) Elm custom type with record: `Card (CardFields ...)` requires wrapping in variant constructor when pattern matching
- (2026-05-07, spaced-practice) Elm let bindings: `~` is invalid in let. Use `let boxedCard = Card {...} in` not `let ~(Card c) = card`
- (2026-05-08, spaced-practice) Elm Html div with style: `Html.div [attribute "style" cssString] children` - use `attribute` not `style` for CSS
- (2026-05-08, spaced-practice) Elm flip animation: `transform:rotateY(180deg)` requires `perspective:1000px` on container and `backface-visibility:hidden` on faces
- (2026-05-09, spaced-practice) Elm shadowing: variable names like `nextReviewDate` in lambda args shadow top-level functions. Use distinct names (`nextReviewDateStr`, `boxInterval`).
- (2026-05-09, spaced-practice) Elm record update syntax: you cannot use record update syntax for multiple fields. Must construct new record.
- (2026-05-09, spaced-practice) Elm Expect.within for floats: `Expect.equal` doesn't work for floats. Use `Expect.within (Expect.Absolute 0.001) expected actual`
- (2026-05-09, spaced-practice) Elm custom type variants: defining `type NavBadge = NavBadge String Int` twice causes name clash error. Remove duplicate type alias.
- (2026-05-09, spaced-practice) SRS LocalStorage: encode/decode roundtrip test verifies persistence works correctly