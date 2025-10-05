# Curriculum Sync Automation

This project uses Khan Academy's internal GraphQL API (via the [`@bhavjit/khan-api`](https://github.com/bhavjitChauhan/khan-api) client) to keep our curriculum outline aligned with the live Integrated Math 3 course.

## Fetching course data

```bash
pnpm install             # once, to ensure dependencies are present
pnpm sync:khan:math3
```

The script:

- Downloads the latest `ContentForPath` safelisted query definition.
- Calls Khan Academy's GraphQL endpoint for the provided course path (default `/math/math3`, the Integrated Math 3 route).
- Normalizes the response into a compact JSON structure (course metadata → units → lessons → learnables → assessments).
- Writes the result to `docs/data/<slug>.course.json` (`docs/data/integrated-math-3.course.json` by default).

## Customizing the fetch

Flag | Description | Default
-----|-------------|--------
`--path` | Course URL path to mirror (as seen on khanacademy.org) | `/math/math3`
`--country` | Country code hint for curriculum variations | `US`
`--slug` | Filename slug for the generated data file | Derived from course slug
`--out` | Custom output path (relative or absolute) | `docs/data/<slug>.course.json`

Example – mirror Algebra 2 into `docs/data/algebra2.course.json`:

```bash
pnpm sync:khan -- --path /math/algebra2 --slug algebra2
```

## Next steps

- Transform the generated JSON into Markdown sections under `curriculum/` (e.g., `curriculum/unit-01.md`).
- Capture deltas across runs to highlight new/retired Khan Academy skills.
- Support incremental updates (fetch a single unit) and attach to future CI checks so curriculum drift is easy to spot.
