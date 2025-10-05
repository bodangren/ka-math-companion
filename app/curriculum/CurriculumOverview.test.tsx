import assert from "node:assert/strict";
import test from "node:test";
import { JSDOM } from "jsdom";
import React from "react";
import { renderToStaticMarkup } from "react-dom/server";

import { DEFAULT_CURRICULUM_SLUG, getCurriculum } from "../../lib/getCurriculum";
import { MasteryIndicator } from "../../components/MasteryIndicator";
import { CurriculumOverview } from "./CurriculumOverview";

test("MasteryIndicator renders in curriculum context", () => {
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
    assert.ok(indicator, "indicator should render");
    
    const ariaLabel = indicator?.getAttribute('aria-label');
    assert.ok(ariaLabel, "should have accessibility label");
    
    // Check for the human-readable label, not the internal enum value
    const expectedLabels = {
      'not-started': 'Not started',
      'struggling': 'Struggling', 
      'progressing': 'Progressing',
      'mastered': 'Mastered',
      'overlearned': 'Overlearned',
    };
    const expectedLabel = expectedLabels[progress.masteryLevel];
    assert.ok(ariaLabel?.includes(expectedLabel), 
      `label should include ${expectedLabel}`);
  });
});

test("CurriculumOverview lists units with static lesson links", () => {
  const course = getCurriculum(DEFAULT_CURRICULUM_SLUG);
  const markup = renderToStaticMarkup(
    <CurriculumOverview course={course} courseSlug={DEFAULT_CURRICULUM_SLUG} />
  );
  const { document } = new JSDOM(markup).window;

  const overview = document.querySelector('[data-testid="curriculum-overview"]');
  assert.ok(overview, "curriculum overview wrapper should render");

  const lessonCountNodes = document.querySelectorAll('[data-testid="lessons-count"]');
  assert.ok(lessonCountNodes.length > 0, "lesson counts should be present for each unit");

  const firstLessonLink = document.querySelector('.unit-lessons-list a');
  assert.ok(firstLessonLink, "at least one lesson link should render");

  const href = firstLessonLink?.getAttribute("href");
  assert.ok(href, "lesson link should include href");
  assert.ok(href?.startsWith(`/curriculum/${DEFAULT_CURRICULUM_SLUG}/`), "lesson link must be statically routed");
  assert.ok(!href?.includes("?"), "lesson link should avoid query parameters for static export");
});
