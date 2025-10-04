import assert from "node:assert/strict";
import test from "node:test";
import { JSDOM } from "jsdom";
import React from "react";
import { renderToStaticMarkup } from "react-dom/server";

import { DEFAULT_CURRICULUM_SLUG, getCurriculum } from "../../lib/getCurriculum";
import { MasteryIndicator } from "../../components/MasteryIndicator";

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
