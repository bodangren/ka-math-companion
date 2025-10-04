import assert from "node:assert/strict";
import test from "node:test";
import { JSDOM } from "jsdom";
import React from "react";
import { renderToStaticMarkup } from "react-dom/server";

import { MasteryIndicator, MasteryLegend } from "./MasteryIndicator";
import type { LessonProgress } from "../lib/progress-tracker";

function createMockProgress(level: LessonProgress['masteryLevel']): LessonProgress {
  return {
    lessonId: 'test',
    attempts: 1,
    correctAttempts: 1,
    lastAttemptDate: null,
    masteryLevel: level,
    hintsUsed: 0,
    spacedPracticeStreak: 0,
  };
}

test("MasteryIndicator renders different mastery levels", () => {
  const levels: LessonProgress['masteryLevel'][] = [
    'not-started', 'struggling', 'progressing', 'mastered', 'overlearned'
  ];
  
  levels.forEach(level => {
    const progress = createMockProgress(level);
    const markup = renderToStaticMarkup(
      <MasteryIndicator progress={progress} />
    );
    const { document } = new JSDOM(markup).window;
    
    const indicator = document.querySelector('[role="img"]');
    assert.ok(indicator, "indicator should have role=img");
    
    const ariaLabel = indicator?.getAttribute('aria-label');
    assert.ok(ariaLabel, "indicator should have aria-label");
    
    // Check for the human-readable label, not the internal enum value
    const expectedLabels = {
      'not-started': 'Not started',
      'struggling': 'Struggling', 
      'progressing': 'Progressing',
      'mastered': 'Mastered',
      'overlearned': 'Overlearned',
    };
    const expectedLabel = expectedLabels[level];
    assert.ok(ariaLabel?.includes(expectedLabel), `aria-label should include ${expectedLabel}`);
  });
});

test("MasteryIndicator shows label when requested", () => {
  const progress = createMockProgress('mastered');
  const markup = renderToStaticMarkup(
    <MasteryIndicator progress={progress} showLabel={true} />
  );
  const { document } = new JSDOM(markup).window;
  
  const label = document.querySelector('span:not([aria-hidden])');
  assert.ok(label, "label should be visible when showLabel=true");
  assert.match(label?.textContent || '', /Mastered/, "label should show mastery level");
});

test("MasteryIndicator applies size classes correctly", () => {
  const progress = createMockProgress('progressing');
  
  const sizes = ['small', 'medium', 'large'] as const;
  const expectedSizes = [
    { width: '16px', height: '16px' },
    { width: '20px', height: '20px' },
    { width: '24px', height: '24px' },
  ];
  
  sizes.forEach((size, index) => {
    const markup = renderToStaticMarkup(
      <MasteryIndicator progress={progress} size={size} />
    );
    const { document } = new JSDOM(markup).window;
    
    const container = document.querySelector('.mastery-indicator');
    assert.ok(container, "container should exist");
    
    const style = container?.getAttribute('style') || '';
    assert.ok(style.includes(`width:${expectedSizes[index].width}`), 
      `size ${size} should have width ${expectedSizes[index].width}`);
    assert.ok(style.includes(`height:${expectedSizes[index].height}`), 
      `size ${size} should have height ${expectedSizes[index].height}`);
  });
});

test("MasteryLegend renders all mastery levels", () => {
  const markup = renderToStaticMarkup(<MasteryLegend />);
  const { document } = new JSDOM(markup).window;
  
  const indicators = document.querySelectorAll('[role="listitem"]');
  assert.equal(indicators.length, 5, "should show 5 mastery levels");
  
  const labels = Array.from(indicators as NodeListOf<Element>).map(item => 
    item.textContent?.trim()
  );
  
  const expectedLabels = ['Not started', 'Struggling', 'Progressing', 'Mastered', 'Overlearned'];
  expectedLabels.forEach(expected => {
    assert.ok(labels.some(label => label?.includes(expected)), 
      `should include label: ${expected}`);
  });
});

test("MasteryIndicator has proper accessibility attributes", () => {
  const progress = createMockProgress('struggling');
  const markup = renderToStaticMarkup(
    <MasteryIndicator progress={progress} />
  );
  const { document } = new JSDOM(markup).window;
  
  const indicator = document.querySelector('[role="img"]');
  assert.ok(indicator, "should have role=img");
  
  const ariaLabel = indicator?.getAttribute('aria-label');
  assert.ok(ariaLabel, "should have aria-label");
  assert.ok(ariaLabel?.includes('Struggling'), "aria-label should describe status");
  assert.ok(ariaLabel?.includes('Less than 50% correct'), "aria-label should give details");
  
  const title = indicator?.querySelector('div')?.getAttribute('title');
  assert.ok(title, "should have title attribute");
  assert.equal(title, "Less than 50% correct");
});