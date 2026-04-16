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

## Planning Improvements
<!-- Notes on where estimates were wrong and why -->

- (YYYY-MM-DD, track_id) Example: Underestimated integration testing time by 2x
