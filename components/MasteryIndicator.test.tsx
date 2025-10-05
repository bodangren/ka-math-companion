import { describe, expect, it } from "vitest";
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

describe("MasteryIndicator", () => {
  it("renders different mastery levels", () => {
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
      expect(indicator).toBeTruthy();

      const ariaLabel = indicator?.getAttribute('aria-label');
      expect(ariaLabel).toBeTruthy();

      const expectedLabels = {
        'not-started': 'Not started',
        'struggling': 'Struggling',
        'progressing': 'Progressing',
        'mastered': 'Mastered',
        'overlearned': 'Overlearned',
      };
      const expectedLabel = expectedLabels[level];
      expect(ariaLabel?.includes(expectedLabel)).toBe(true);
    });
  });

  it("shows label when requested", () => {
    const progress = createMockProgress('mastered');
    const markup = renderToStaticMarkup(
      <MasteryIndicator progress={progress} showLabel={true} />
    );
    const { document } = new JSDOM(markup).window;

    const label = document.querySelector('span:not([aria-hidden])');
    expect(label).toBeTruthy();
    expect(label?.textContent || '').toMatch(/Mastered/);
  });

  it("applies size classes correctly", () => {
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
      expect(container).toBeTruthy();

      const style = container?.getAttribute('style') || '';
      expect(style.includes(`width:${expectedSizes[index].width}`)).toBe(true);
      expect(style.includes(`height:${expectedSizes[index].height}`)).toBe(true);
    });
  });

  it("has proper accessibility attributes", () => {
    const progress = createMockProgress('struggling');
    const markup = renderToStaticMarkup(
      <MasteryIndicator progress={progress} />
    );
    const { document } = new JSDOM(markup).window;

    const indicator = document.querySelector('[role="img"]');
    expect(indicator).toBeTruthy();

    const ariaLabel = indicator?.getAttribute('aria-label');
    expect(ariaLabel).toBeTruthy();
    expect(ariaLabel?.includes('Struggling')).toBe(true);
    expect(ariaLabel?.includes('Less than 50% correct')).toBe(true);

    const title = indicator?.querySelector('div')?.getAttribute('title');
    expect(title).toBe("Less than 50% correct");
  });
});

describe("MasteryLegend", () => {
  it("renders all mastery levels", () => {
    const markup = renderToStaticMarkup(<MasteryLegend />);
    const { document } = new JSDOM(markup).window;

    const indicators = document.querySelectorAll('[role="listitem"]');
    expect(indicators.length).toBe(5);

    const labels = Array.from(indicators as NodeListOf<Element>).map(item =>
      item.textContent?.trim()
    );

    const expectedLabels = ['Not started', 'Struggling', 'Progressing', 'Mastered', 'Overlearned'];
    expectedLabels.forEach(expected => {
      expect(labels.some(label => label?.includes(expected))).toBe(true);
    });
  });
});
