# Tech Debt Registry

> This file is curated working memory, not an append-only log. Keep it at or below **50 lines**.
> Remove or summarize resolved items when they no longer need to influence near-term planning.
>
> **Severity:** `Critical` | `High` | `Medium` | `Low`
> **Status:** `Open` | `Resolved`

| Date | Track | Item | Severity | Status | Notes |
|------|-------|------|----------|--------|-------|
| 2026-05-03 | design-system | Elm Land auto-generates Design_System_ route with params despite page having no params | Critical | Open | Build fails with "TOO MANY ARGS". Elm Land framework bug - route generation mismatch with page signature. Workaround: rename page to avoid trailing underscore or manually patch generated files |
| 2026-05-07 | interactive-viz | Tasks 12-14: Viz integration into lessons and demo page | Medium | Resolved | FunctionGrapher in polynomial/log lessons, UnitCircle in trig lessons, /visualizations demo page |
| 2026-05-07 | progress-tracking | Export/Import UI not implemented | Low | Open | Ports exist but no UI for export/import buttons |
| 2026-05-07 | progress-tracking | Mastery badges show NotStarted always | Low | Open | Unit_.elm shows MasteryBadge.NotStarted for all lessons - needs real progress data |
| 2026-04-12 | curriculum-data | Add real descriptions to all lessons | Medium | Resolved | All 52 lessons now have descriptions |
| 2026-04-17 | curriculum-data | Full data validation | Medium | Resolved | Validation tests confirm all lessons have objectives, descriptions, and time estimates |
| 2026-01-01 | example_track | Example: Hardcoded timeout value | Low | Resolved | Replaced with config value in v1.2 |
| 2026-04-14 | design-system | Duplicated findUnit in Unit_.elm and Lesson_.elm | Low | Open | Extract to shared Curriculum module |
| 2026-04-14 | lesson-content | No page-level tests for Unit_ and Lesson_ views | Medium | Open | Only data model tests exist, no Html render tests |
| 2026-04-24 | design-system | All components use `style "all" cssString` — styles never applied | Critical | Resolved | Fixed: replaced `Html.Attributes.style "all" "css"` with `Html.Attributes.attribute "style" "css"` in Button, Alert, Badge, Card, Progress, Spinner |
| 2026-04-24 | design-system | Spinner `@keyframes` animation never injected into DOM | Medium | Resolved | Fixed: Added keyframesStyle via `Html.node "style"` to inject @keyframes spin animation |
| 2026-04-24 | design-system | Card.elm double semicolons in headerStyles/footerStyles (lines 43,47) | Low | Resolved | Fixed in review: removed extra `;` between background-color and font-size |
| 2026-04-24 | design-system | Progress component does not clamp percentage to 0-100 | Low | Resolved | Added `clamp 0 100` to percentage and display value |
| 2026-04-25 | design-system | Grid.elm tabletColumns/desktopColumns computed but never applied to CSS | Medium | Resolved | Removed unused tabletColumns/desktopColumns attrs; Grid now only exposes functional columns, minWidth, gap |
| 2026-04-25 | design-system | All design-system tests use `Expect.pass` — no real assertions on rendered HTML | Medium | Open | Tests only verify functions don't crash; should assert actual style values or DOM structure |
| 2026-04-25 | design-system | Mixed style application: some components use `attribute "style" string`, others use `style` individual | Low | Open | Button.elm mixes both; should standardize on one approach across all components |
| 2026-04-25 | visual_refresh | Visual refresh changed design tokens and component APIs | Medium | Resolved | Tests updated to match Orbital Editorial theme values |
| 2026-05-01 | curriculum-data | Task 6 marked done but work already complete - Unit 7 has objectives/descriptions/time | Low | Resolved | Plan was stale; verification confirmed all data present |
