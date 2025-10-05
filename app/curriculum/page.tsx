import Link from "next/link";
import type { Metadata } from "next";

import { listCurricula } from "../../lib/getCurriculum";

export const metadata: Metadata = {
  title: "Curricula · KA Math Companion",
  description:
    "Browse Khan Academy-aligned high school math sequences and drill into unit-level lessons and practice.",
};

export default function CurriculumIndexPage() {
  const curricula = listCurricula();

  return (
    <section
      aria-labelledby="curricula-heading"
      className="stack gap-lg"
      data-testid="curricula-index"
    >
      <header className="stack gap-sm">
        <p className="eyebrow">Curricula</p>
        <h1 id="curricula-heading" className="curricula-title">
          High school math pathways
        </h1>
        <p className="lead curricula-lead">
          Explore Khan Academy-integrated courses that power our lessons, practice generators, and spaced review.
        </p>
      </header>

      <ol className="curricula-grid" data-testid="curricula-list">
        {curricula.map((course) => (
          <li key={course.slug} className="card course-card">
            <div className="stack gap-sm">
              <h2 className="course-card-title">{course.title}</h2>
              <p className="course-card-description">{course.description}</p>
            </div>
            <dl className="course-card-meta" aria-label="Course summary">
              <div>
                <dt>Units</dt>
                <dd>{course.unitCount}</dd>
              </div>
            </dl>
            <Link
              className="course-card-link"
              href={`/curriculum/${course.slug}`}
            >
              View curriculum
            </Link>
          </li>
        ))}
      </ol>
    </section>
  );
}
