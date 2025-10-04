'use client';

import React, { useEffect, useState } from "react";
import Link from "next/link";
import type { Route } from "next";

import type {
  CurriculumCourse,
  CurriculumLesson,
  CurriculumUnit,
} from "../../lib/getCurriculum";
import { ProgressTracker, type LessonProgress } from "../../lib/progress-tracker";
import { MasteryIndicator, MasteryLegend } from "../../components/MasteryIndicator";

// Khan Academy awards 100 mastery points per skill exercise; use that to estimate totals.
const MASTERY_POINTS_PER_EXERCISE = 100;

function extractSlugSegment(slug: string | null): string {
  if (!slug) return "";
  const segment = slug.split(":").pop();
  return segment ?? slug;
}

function buildLessonHref(
  courseSlug: string,
  unit: CurriculumUnit,
  lesson: CurriculumLesson,
): Route<`/curriculum/${string}/${string}/${string}`> {
  const unitSlug = extractSlugSegment(unit.slug);
  const lessonSlug = extractSlugSegment(lesson.slug);
  return `/curriculum/${courseSlug}/${unitSlug}/${lessonSlug}` as Route<
    `/curriculum/${string}/${string}/${string}`
  >;
}

function estimateMasteryPoints(unit: CurriculumUnit): number {
  return unit.lessons.reduce((total, lesson) => {
    const exerciseCount = lesson.items.filter((item) => item.kind === "Exercise").length;
    return total + exerciseCount * MASTERY_POINTS_PER_EXERCISE;
  }, 0);
}

export function CurriculumOverview({
  course,
  courseSlug,
}: {
  course: CurriculumCourse;
  courseSlug: string;
}) {
  const [lessonProgress, setLessonProgress] = useState<Record<string, LessonProgress>>({});
  
  useEffect(() => {
    // Load progress from localStorage on mount
    const progress = ProgressTracker.getAllProgress().lessons;
    setLessonProgress(progress);
  }, []);

  const units = course.units;
  const totalLessons = units.reduce((sum, unit) => sum + unit.lessons.length, 0);
  const totalMasteryPoints = units.reduce(
    (sum, unit) => sum + estimateMasteryPoints(unit),
    0,
  );

  return (
    <section
      aria-labelledby="curriculum-heading"
      className="stack gap-lg"
      data-testid="curriculum-overview"
    >
      <Link className="back-link" href="/curriculum">
        ← Browse all curricula
      </Link>
      <header className="stack gap-sm curriculum-header">
        <div>
          <p className="eyebrow">Course overview</p>
          <h1 id="curriculum-heading" className="curriculum-title">
            {course.title}
          </h1>
          <p className="lead curriculum-lead">{course.description}</p>
        </div>
        <dl className="overview-metrics" aria-label="Curriculum summary">
          <div>
            <dt>Units</dt>
            <dd>{units.length}</dd>
          </div>
          <div>
            <dt>Lessons</dt>
            <dd>{totalLessons}</dd>
          </div>
          <div>
            <dt>Mastery points</dt>
            <dd>{totalMasteryPoints.toLocaleString()}</dd>
          </div>
        </dl>
      </header>

      <ol className="stack gap-lg" data-testid="curriculum-unit-list">
        {units.map((unit, index) => {
          const masteryPoints = estimateMasteryPoints(unit);
          const unitTitle = unit.title ?? `Unit ${index + 1}`;
          return (
            <li
              key={unit.id}
              className="card unit-card"
              data-testid="curriculum-unit"
            >
              <header className="unit-card-header">
                <div className="unit-card-heading">
                  <p className="unit-index">Unit {index + 1}</p>
                  <h2 className="unit-title" data-testid="unit-title">
                    {unitTitle}
                  </h2>
                  {unit.description ? (
                    <p className="unit-summary">{unit.description}</p>
                  ) : null}
                </div>
                <dl className="unit-meta" aria-label="Unit summary">
                  <div className="unit-meta-item">
                    <dt>Lessons</dt>
                    <dd data-testid="lessons-count">{unit.lessons.length}</dd>
                  </div>
                  <div className="unit-meta-item">
                    <dt>Mastery points</dt>
                    <dd data-testid="mastery-points">
                      {masteryPoints.toLocaleString()}
                    </dd>
                  </div>
                </dl>
              </header>

              <div className="unit-lessons">
                <div className="flex items-center justify-between mb-4">
                  <h3 className="unit-lessons-heading">Lessons</h3>
                  <MasteryLegend />
                </div>
                <ol className="unit-lessons-list">
                  {unit.lessons.map((lesson) => {
                    const lessonTitle = lesson.title ?? "Untitled lesson";
                    const href = buildLessonHref(courseSlug, unit, lesson);
                    const progress = lessonProgress[lesson.id] || {
                      lessonId: lesson.id,
                      attempts: 0,
                      correctAttempts: 0,
                      lastAttemptDate: null,
                      masteryLevel: 'not-started' as const,
                      hintsUsed: 0,
                      spacedPracticeStreak: 0,
                    };
                    
                    return (
                      <li key={lesson.id} className="flex items-center gap-3">
                        <MasteryIndicator progress={progress} size="small" />
                        <Link href={href} className="flex-1">{lessonTitle}</Link>
                      </li>
                    );
                  })}
                </ol>
              </div>
            </li>
          );
        })}
      </ol>
    </section>
  );
}
