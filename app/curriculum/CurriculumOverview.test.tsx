import { describe, expect, it } from "vitest";
import { JSDOM } from "jsdom";
import React from "react";
import { renderToStaticMarkup } from "react-dom/server";

import { DEFAULT_CURRICULUM_SLUG, getCurriculum } from "../../lib/getCurriculum";
import { MasteryIndicator } from "../../components/MasteryIndicator";
import { CurriculumOverview } from "./CurriculumOverview";

describe("CurriculumOverview", () => {
  it("renders mastery indicator in curriculum context", () => {
  // Test that the MasteryIndicator component can render with different progress states
  const progressStates = [
    { lessonId: 'test-1', attempts: 0, correctAttempts: 0, lastAttemptDate: null, masteryLevel: 'not-started' as const, hintsUsed: 0, spacedPracticeStreak: 0 },
    { lessonId: 'test-2', attempts: 10, correctAttempts: 3, lastAttemptDate: null, masteryLevel: 'struggling' as const, hintsUsed: 0, spacedPracticeStreak: 0 },
    { lessonId: 'test-3', attempts: 10, correctAttempts: 8, lastAttemptDate: null, masteryLevel: 'mastered' as const, hintsUsed: 1, spacedPracticeStreak: 0 },
  ];

  progressStates.forEach(progress => {
    const markup = renderToStaticMarkup(
      <MasteryIndicator progress={progress} showLabel={true} />
    );
    const { document } = new JSDOM(markup).window;
    
    const indicator = document.querySelector('[role="img"]');
    expect(indicator).toBeTruthy();
    
    const ariaLabel = indicator?.getAttribute('aria-label');
    expect(ariaLabel).toBeTruthy();
    
    // Check for the human-readable label, not the internal enum value
    const expectedLabels = {
      'not-started': 'Not started',
      'struggling': 'Struggling', 
      'progressing': 'Progressing',
      'mastered': 'Mastered',
      'overlearned': 'Overlearned',
    };
    const expectedLabel = expectedLabels[progress.masteryLevel];
      expect(ariaLabel?.includes(expectedLabel)).toBe(true);
  });
  });

  it("lists units with static lesson links", () => {
    const course = getCurriculum(DEFAULT_CURRICULUM_SLUG);
    const markup = renderToStaticMarkup(
      <CurriculumOverview course={course} courseSlug={DEFAULT_CURRICULUM_SLUG} />
    );
    const { document } = new JSDOM(markup).window;

    const overview = document.querySelector('[data-testid="curriculum-overview"]');
    expect(overview).toBeTruthy();

    const lessonCountNodes = document.querySelectorAll('[data-testid="lessons-count"]');
    expect(lessonCountNodes.length).toBeGreaterThan(0);

    const firstLessonLink = document.querySelector('.unit-lessons-list a');
    expect(firstLessonLink).toBeTruthy();

    const href = firstLessonLink?.getAttribute("href");
    expect(href).toBeTruthy();
    expect(href?.startsWith(`/curriculum/${DEFAULT_CURRICULUM_SLUG}/`)).toBe(true);
    expect(href?.includes("?")).toBe(false);
  });
});
