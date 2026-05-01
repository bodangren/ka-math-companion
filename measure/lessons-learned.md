# Lessons Learned

> This file is curated working memory, not an append-only log. Keep it at or below **50 lines**.
> Remove or condense entries that are no longer relevant to near-term planning.

## Architecture & Design
<!-- Decisions made that future tracks should be aware of -->

- (YYYY-MM-DD, track_id) Example: Chose X over Y because of Z constraint

## Recurring Gotchas
<!-- Problems encountered repeatedly; save future tracks from the same pain -->

- (YYYY-MM-DD, track_id) Example: Always check for null before accessing config values

## Patterns That Worked Well
<!-- Approaches worth repeating -->

- (2026-04-09, curriculum-data) TDD for type changes: write failing tests first, then add fields to all usages systematically
- (2026-04-10, curriculum-data) Batch similar tasks: adding objectives to multiple units in one commit reduced context switching
- (2026-04-11, curriculum-data) Unit indexing: use `List.drop n |> List.head` to safely access units by position
- (2026-04-12, curriculum-data) TDD for curriculum: write failing test first, then implement. Tests confirmed Unit 7 already had objectives (plan was stale)
- (2026-04-12, curriculum-data) Modeling unit objectives cover: function combination/periodicity, end behavior analysis, formula rearrangement, multi-variable word problems
- (2026-04-13, curriculum-data) Study Design objectives: statistical inference, hypothesis testing, experimental design topics
- (2026-04-13, curriculum-data) Binomial Probability objectives: binomial formula, combinations, mean and standard deviation of distribution
- (2026-04-13, curriculum-data) Normal Distribution objectives: empirical rule, z-scores, probability calculations with standard normal distribution
- (2026-04-15, curriculum-data) TDD for lesson descriptions: write test checking String.length description > 0 first, then implement. Unit 7 done; 60+ lessons still need descriptions.
- (2026-04-16, curriculum-data) Completed all lesson descriptions: 52 lessons across 13 units now have descriptions. Test-driven approach confirmed progress.
- (2026-04-17, curriculum-data) TDD for validation: write tests first that enumerate issues, then implement fix. Added tests for all lessons having positive estimatedMinutes and non-empty objectives.
- (2026-04-23, design-system) TDD for design tokens: write tests first verifying all token values, then implement. Elm module structure requires proper type aliases and exposed values.
- (2026-04-23, design-system) Design system structure: use `src/Design/` for source modules, `tests/Design/` for tests, following existing Data/ pattern in this project.
- (2026-04-23, design-system) Elm type variables with msg: When Attr type uses `Html.Html msg`, declare `type Attr msg` not `type Attr`. Unbound type variable error means you need to add the type variable.
- (2026-04-23, design-system) Container component pattern: use Width type with variants (Mobile, Tablet, Desktop, Wide, Full), List.filterMap to resolve attrs, spacing from Design.Tokens for padding
- (2026-04-24, design-system) Stack component design: Direction and Spacing are separate concerns. Direction (Vertical/Horizontal) is a parameter to `stack`, not an Attr. Spacing variants (Small/Medium/Large) are exported as values for use in `spacing` attribute.
- (2026-04-24, design-system) Grid component pattern: Use `repeat(n, minmax(minWidth, 1fr))` for responsive columns. Attr pattern for columns, tabletColumns, desktopColumns, minWidth, gap.
- (2026-04-24, design-system) Critical bug: `Html.Attributes.style "all" "cssString"` does NOT apply CSS. Elm's `style` function takes (property, value) pairs, not raw CSS. Fix: use `Html.Attributes.attribute "style" "cssString"` to set the style attribute directly.
- (2026-04-24, design-system) Elm tests pass even with broken HTML generation (tests use Expect.pass). Test quality matters — render tests would catch style issues.
- (2026-04-24, design-system) Spacing values in Tokens (e.g., "16px") must be concatenated correctly when building CSS strings: `"padding:" ++ spacing.md ++ ";"`
- (2026-04-24, design-system) When fixing style attributes, consolidate multiple CSS rules into single `attribute "style" "..."` to avoid duplicate style attributes on same element
- (2026-04-25, design-system) Removed dead Grid attrs (tabletColumns, desktopColumns): computed but never applied to CSS. Lesson: unused code that looks functional is worse than no code - it misleads future maintainers. Attrs should only exist if they're actually used.
- (2026-04-25, visual_refresh) Elm operator precedence: `attribute "x" "y" ++ z` is parsed as `(attribute "x" "y") ++ z`, not `attribute "x" ("y" ++ z)`. Always use parentheses when concatenating strings to pass to a function.
- (2026-04-25, visual_refresh) When refactoring component APIs, update tests as part of the same change. Tests are coupled to public API signatures - they will break if you don't update them.
- (2026-04-25, visual_refresh) Elm module exports: `exposing (badge)` does not expose the `Variant` type or its constructors. Use `exposing (Variant(..), badge)` to expose both the type and constructors for tests.

## Planning Improvements
<!-- Notes on where estimates were wrong and why -->

- (2026-05-02, design-system) Footer integration: Footer uses `margin-top: auto` to push it to bottom in flex column layout. Must add `display:flex;flex-direction:column` to parent div and include footer as direct child alongside header and main content.
