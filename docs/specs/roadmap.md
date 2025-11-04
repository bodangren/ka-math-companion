# Sprint Roadmap

This document sketches the next three sprints for the KA Math Companion project. Each sprint is two weeks and oriented around a single theme to keep the scope manageable.

| Sprint | Theme | Key Goals | Exit Criteria |
| ------ | ----- | --------- | ------------- |
| S1 | Static site foundation | Scaffold Next.js export, wire curriculum data ingestion, and establish content lint/test automation | Build passes `pnpm lint`, `pnpm test`, and `pnpm build`; Integrated Math 3 data sync produces consumable JSON; baseline course shell renders locally |
| S2 | Content authoring & practice generators | Author first objective, lesson, and deterministic practice items; add flashcard pipeline; ensure pedagogical scaffolds render | Lesson surfaces scaffolded steps and practice generator; flashcard deck loads from content; coverage checks for first objective |
| S3 | Learner experience & spaced practice | Implement progress tracking, SRS scheduling, and accessibility polish across core interactions | LocalStorage-backed progress persists across reloads; SRS queue cycles items; axe accessibility audit clears P0 blockers |

Follow-up sprints can extend content coverage unit-by-unit once the learner experience is stable.
