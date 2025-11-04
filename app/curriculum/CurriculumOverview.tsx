"use client";

import React, { useEffect, useState } from "react";
import Link from "next/link";
import type { Route } from "next";

import type { CurriculumCourse, CurriculumLesson, CurriculumUnit } from "../../lib/getCurriculum";
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
  return `/curriculum/${courseSlug}/${unitSlug}/${lessonSlug}` as Route<`/curriculum/${string}/${string}/${string}`>;
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
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState("");
  const [filterStatus, setFilterStatus] = useState<
    "all" | "not-started" | "in-progress" | "completed" | "struggling"
  >("all");

  useEffect(() => {
    try {
      // Load progress from localStorage on mount
      const progress = ProgressTracker.getAllProgress().lessons;
      setLessonProgress(progress);
    } catch (err) {
      setError("Failed to load progress data");
      console.error("Progress loading error:", err);
    }
  }, []);

  const units = course.units;
  const totalLessons = units.reduce((sum, unit) => sum + unit.lessons.length, 0);
  const totalMasteryPoints = units.reduce((sum, unit) => sum + estimateMasteryPoints(unit), 0);

  // Calculate progress statistics
  const progressStats = {
    totalLessons,
    completedLessons: Object.values(lessonProgress).filter(
      (progress) => progress.masteryLevel === "mastered" || progress.masteryLevel === "overlearned",
    ).length,
    inProgressLessons: Object.values(lessonProgress).filter(
      (progress) => progress.masteryLevel === "progressing",
    ).length,
    notStartedLessons: Object.values(lessonProgress).filter(
      (progress) => progress.masteryLevel === "not-started",
    ).length,
    strugglingLessons: Object.values(lessonProgress).filter(
      (progress) => progress.masteryLevel === "struggling",
    ).length,
  };

  const completionPercentage =
    totalLessons > 0 ? Math.round((progressStats.completedLessons / totalLessons) * 100) : 0;

  // Filter units and lessons based on search and filter
  const filteredUnits = units
    .map((unit) => {
      const filteredLessons = unit.lessons.filter((lesson) => {
        const lessonTitle = (lesson.title ?? "").toLowerCase();
        const matchesSearch = lessonTitle.includes(searchQuery.toLowerCase());

        if (!matchesSearch) return false;

        if (filterStatus === "all") return true;

        const progress = lessonProgress[lesson.id];
        if (!progress) return filterStatus === "not-started";

        switch (filterStatus) {
          case "not-started":
            return progress.masteryLevel === "not-started";
          case "in-progress":
            return progress.masteryLevel === "progressing";
          case "completed":
            return progress.masteryLevel === "mastered" || progress.masteryLevel === "overlearned";
          case "struggling":
            return progress.masteryLevel === "struggling";
          default:
            return true;
        }
      });

      return {
        ...unit,
        lessons: filteredLessons,
      };
    })
    .filter((unit) => {
      const unitTitle = (unit.title ?? "").toLowerCase();
      const unitDescription = (unit.description ?? "").toLowerCase();
      const unitMatchesSearch =
        unitTitle.includes(searchQuery.toLowerCase()) ||
        unitDescription.includes(searchQuery.toLowerCase());
      const hasMatchingLessons = unit.lessons.length > 0;

      return unitMatchesSearch || hasMatchingLessons;
    });

  if (error) {
    return (
      <section
        aria-labelledby="curriculum-heading"
        className="stack gap-lg"
        data-testid="curriculum-overview"
      >
        <Link className="back-link" href="/curriculum">
          ← Browse all curricula
        </Link>
        <div className="card" style={{ borderColor: "#ef4444", backgroundColor: "#fef2f2" }}>
          <h2 style={{ color: "#dc2626", margin: "0 0 1rem 0" }}>Unable to load curriculum</h2>
          <p style={{ margin: 0 }}>{error}</p>
          <button
            onClick={() => window.location.reload()}
            className="button"
            style={{ marginTop: "1rem", backgroundColor: "#dc2626" }}
          >
            Try again
          </button>
        </div>
      </section>
    );
  }

  return (
    <section
      aria-labelledby="curriculum-heading"
      className="stack gap-lg"
      data-testid="curriculum-overview"
    >
      <nav aria-label="Navigation">
        <Link className="back-link" href="/curriculum">
          ← Browse all curricula
        </Link>
      </nav>
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
            <dd aria-label={`${units.length} units in this course`}>{units.length}</dd>
          </div>
          <div>
            <dt>Lessons</dt>
            <dd aria-label={`${totalLessons} total lessons`}>{totalLessons}</dd>
          </div>
          <div>
            <dt>Mastery points</dt>
            <dd
              aria-label={`${totalMasteryPoints.toLocaleString()} total mastery points available`}
            >
              {totalMasteryPoints.toLocaleString()}
            </dd>
          </div>
        </dl>

        {/* Progress Summary */}
        <section className="progress-summary" aria-labelledby="progress-heading">
          <h2 id="progress-heading" className="sr-only">
            Progress Summary
          </h2>
          <div className="progress-overview">
            <div className="progress-stats">
              <div className="progress-stat">
                <span className="progress-label">Overall Progress</span>
                <span
                  className="progress-value"
                  aria-label={`${completionPercentage} percent complete`}
                >
                  {completionPercentage}%
                </span>
              </div>
              <div
                className="progress-bar-container"
                role="progressbar"
                aria-valuenow={completionPercentage}
                aria-valuemin={0}
                aria-valuemax={100}
                aria-label={`Course progress: ${completionPercentage}% complete`}
              >
                <div className="progress-bar" style={{ width: `${completionPercentage}%` }} />
              </div>
            </div>
            <div
              className="progress-breakdown"
              role="list"
              aria-label="Progress breakdown by mastery level"
            >
              <div className="progress-item" role="listitem">
                <MasteryIndicator
                  progress={{
                    lessonId: "completed",
                    attempts: 1,
                    correctAttempts: 1,
                    lastAttemptDate: null,
                    masteryLevel: "mastered",
                    hintsUsed: 0,
                    spacedPracticeStreak: 0,
                  }}
                  size="small"
                />
                <span aria-label={`${progressStats.completedLessons} lessons completed`}>
                  {progressStats.completedLessons} completed
                </span>
              </div>
              <div className="progress-item" role="listitem">
                <MasteryIndicator
                  progress={{
                    lessonId: "progressing",
                    attempts: 1,
                    correctAttempts: 1,
                    lastAttemptDate: null,
                    masteryLevel: "progressing",
                    hintsUsed: 0,
                    spacedPracticeStreak: 0,
                  }}
                  size="small"
                />
                <span aria-label={`${progressStats.inProgressLessons} lessons in progress`}>
                  {progressStats.inProgressLessons} in progress
                </span>
              </div>
              <div className="progress-item" role="listitem">
                <MasteryIndicator
                  progress={{
                    lessonId: "struggling",
                    attempts: 1,
                    correctAttempts: 1,
                    lastAttemptDate: null,
                    masteryLevel: "struggling",
                    hintsUsed: 0,
                    spacedPracticeStreak: 0,
                  }}
                  size="small"
                />
                <span aria-label={`${progressStats.strugglingLessons} lessons need help`}>
                  {progressStats.strugglingLessons} need help
                </span>
              </div>
            </div>
          </div>
        </section>
      </header>

      {/* Search and Filter Controls */}
      <section className="search-filters" aria-labelledby="search-heading">
        <h2 id="search-heading" className="sr-only">
          Search and Filter
        </h2>
        <div className="search-controls">
          <div className="search-input-container">
            <label htmlFor="lesson-search" className="search-label">
              Search lessons:
            </label>
            <input
              id="lesson-search"
              type="text"
              placeholder="Search by lesson title..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="search-input"
              aria-label="Search lessons by title"
            />
            {searchQuery && (
              <button
                onClick={() => setSearchQuery("")}
                className="clear-search"
                aria-label="Clear search"
              >
                ✕
              </button>
            )}
          </div>

          <div className="filter-controls">
            <label htmlFor="status-filter" className="filter-label">
              Filter by status:
            </label>
            <select
              id="status-filter"
              value={filterStatus}
              onChange={(e) =>
                setFilterStatus(
                  e.target.value as
                    | "all"
                    | "not-started"
                    | "in-progress"
                    | "completed"
                    | "struggling",
                )
              }
              className="filter-select"
              aria-label="Filter lessons by mastery status"
            >
              <option value="all">All lessons</option>
              <option value="not-started">Not started</option>
              <option value="in-progress">In progress</option>
              <option value="completed">Completed</option>
              <option value="struggling">Need help</option>
            </select>
          </div>
        </div>

        {(searchQuery || filterStatus !== "all") && (
          <div className="search-results-summary">
            <span>
              Showing {filteredUnits.reduce((sum, unit) => sum + unit.lessons.length, 0)} of{" "}
              {totalLessons} lessons
              {searchQuery && ` matching "${searchQuery}"`}
              {filterStatus !== "all" && ` with status "${filterStatus.replace("-", " ")}"`}
            </span>
          </div>
        )}
      </section>

      <ol className="stack gap-lg" data-testid="curriculum-unit-list">
        {filteredUnits.map((unit, index) => {
          const masteryPoints = estimateMasteryPoints(unit);
          const unitTitle = unit.title ?? `Unit ${index + 1}`;
          return (
            <li key={unit.id} className="card unit-card" data-testid="curriculum-unit">
              <header className="unit-card-header">
                <div className="unit-card-heading">
                  <p className="unit-index">Unit {index + 1}</p>
                  <h2 className="unit-title" data-testid="unit-title">
                    {unitTitle}
                  </h2>
                  {unit.description ? <p className="unit-summary">{unit.description}</p> : null}
                </div>
                <dl className="unit-meta" aria-label="Unit summary">
                  <div className="unit-meta-item">
                    <dt>Lessons</dt>
                    <dd data-testid="lessons-count">{unit.lessons.length}</dd>
                  </div>
                  <div className="unit-meta-item">
                    <dt>Mastery points</dt>
                    <dd data-testid="mastery-points">{masteryPoints.toLocaleString()}</dd>
                  </div>
                </dl>
              </header>

              <div className="unit-lessons">
                <div className="unit-lessons-header">
                  <h3 className="unit-lessons-heading">Lessons</h3>
                  <MasteryLegend />
                </div>
                <div className="unit-lessons-content">
                  {unit.lessons.length === 0 ? (
                    <p className="no-lessons">No lessons available in this unit.</p>
                  ) : (
                    <ol className="unit-lessons-list">
                      {unit.lessons.map((lesson) => {
                        const lessonTitle = lesson.title ?? "Untitled lesson";
                        const href = buildLessonHref(courseSlug, unit, lesson);
                        const progress = lessonProgress[lesson.id] || {
                          lessonId: lesson.id,
                          attempts: 0,
                          correctAttempts: 0,
                          lastAttemptDate: null,
                          masteryLevel: "not-started" as const,
                          hintsUsed: 0,
                          spacedPracticeStreak: 0,
                        };

                        return (
                          <li key={lesson.id} className="unit-lesson-item">
                            <MasteryIndicator
                              progress={progress}
                              size="small"
                              className="lesson-indicator"
                            />
                            <Link
                              href={href}
                              className="lesson-link"
                              aria-label={`Start ${lessonTitle}`}
                            >
                              <span className="lesson-title">{lessonTitle}</span>
                              <span className="lesson-status">
                                {progress.masteryLevel === "not-started" && "Not started"}
                                {progress.masteryLevel === "struggling" && "Needs review"}
                                {progress.masteryLevel === "progressing" && "In progress"}
                                {progress.masteryLevel === "mastered" && "Completed"}
                                {progress.masteryLevel === "overlearned" && "Mastered"}
                              </span>
                            </Link>
                          </li>
                        );
                      })}
                    </ol>
                  )}
                </div>
              </div>
            </li>
          );
        })}
      </ol>
    </section>
  );
}
