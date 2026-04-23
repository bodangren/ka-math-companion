# Tech Debt Registry

> This file is curated working memory, not an append-only log. Keep it at or below **50 lines**.
> Remove or summarize resolved items when they no longer need to influence near-term planning.
>
> **Severity:** `Critical` | `High` | `Medium` | `Low`
> **Status:** `Open` | `Resolved`

| Date | Track | Item | Severity | Status | Notes |
|------|-------|------|----------|--------|-------|
| 2026-04-12 | curriculum-data | Add real descriptions to all lessons | Medium | Resolved | All 52 lessons now have descriptions |
| 2026-04-17 | curriculum-data | Full data validation | Medium | Resolved | Validation tests confirm all lessons have objectives, descriptions, and time estimates |
| 2026-01-01 | example_track | Example: Hardcoded timeout value | Low | Resolved | Replaced with config value in v1.2 |
| 2026-04-14 | design-system | Duplicated findUnit in Unit_.elm and Lesson_.elm | Low | Open | Extract to shared Curriculum module |
| 2026-04-14 | lesson-content | No page-level tests for Unit_ and Lesson_ views | Medium | Open | Only data model tests exist, no Html render tests |
| 2026-04-23 | design-system | Design token hardcoded values | Low | Resolved | Design.Tokens module now provides centralized token values |
| 2026-04-24 | design-system | All components use `style "all" cssString` — styles never applied | Critical | Open | `Html.Attributes.style` takes property+value, not raw CSS. Use `attribute "style" str` or individual `style` calls. Affects Button, Card, Badge, Alert, Progress, Spinner, Container |
| 2026-04-24 | design-system | Spinner `@keyframes` animation never injected into DOM | Medium | Open | `keyframesStyle` was dead code; animation won't work without a `<style>` node injection |
| 2026-04-24 | design-system | Card.elm double semicolons in headerStyles/footerStyles (lines 43,47) | Low | Open | `++;` creates `;;` in CSS string — cosmetic, browsers tolerate it |
| 2026-04-24 | design-system | Progress component does not clamp percentage to 0-100 | Low | Open | Negative or >100 values produce invalid CSS width |
