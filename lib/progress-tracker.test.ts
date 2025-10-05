import { beforeEach, describe, expect, it } from "vitest";
import { ProgressTracker, type LessonProgress } from "./progress-tracker";

// Mock localStorage and window object
const mockLocalStorage = new Map<string, string>();

Object.defineProperty(global, 'window', {
  value: {
    localStorage: {
      getItem: (key: string) => mockLocalStorage.get(key) || null,
      setItem: (key: string, value: string) => mockLocalStorage.set(key, value),
      removeItem: (key: string) => mockLocalStorage.delete(key),
      clear: () => mockLocalStorage.clear(),
      get length() {
        return mockLocalStorage.size;
      },
      key: (index: number) => {
        const keys = Array.from(mockLocalStorage.keys());
        return keys[index] || null;
      },
    },
  },
  writable: true,
});

describe("ProgressTracker", () => {
  beforeEach(() => {
    mockLocalStorage.clear();
    ProgressTracker.clearProgress();
  });

  it("creates default progress for new lesson", () => {
    const lessonId = "test-lesson-1";
    const progress = ProgressTracker.getLessonProgress(lessonId);

    expect(progress.lessonId).toBe(lessonId);
    expect(progress.attempts).toBe(0);
    expect(progress.correctAttempts).toBe(0);
    expect(progress.lastAttemptDate).toBeNull();
    expect(progress.masteryLevel).toBe("not-started");
    expect(progress.hintsUsed).toBe(0);
    expect(progress.spacedPracticeStreak).toBe(0);
  });

  it("updates lesson progress", () => {
    const lessonId = "test-lesson-2";

    const updated = ProgressTracker.updateLessonProgress(lessonId, {
      attempts: 10,
      correctAttempts: 8,
      hintsUsed: 2,
    });

    expect(updated.attempts).toBe(10);
    expect(updated.correctAttempts).toBe(8);
    expect(updated.hintsUsed).toBe(2);
    expect(updated.masteryLevel).toBe("mastered");
    expect(updated.lastAttemptDate).toBeTruthy();
  });

  it("calculates mastery levels correctly", () => {
    const testCases: Array<{
      attempts: number;
      correct: number;
      hints: number;
      spacedPracticeStreak?: number;
      expected: LessonProgress['masteryLevel'];
    }> = [
      { attempts: 0, correct: 0, hints: 0, expected: "not-started" },
      { attempts: 10, correct: 3, hints: 0, expected: "struggling" },
      { attempts: 10, correct: 6, hints: 0, expected: "progressing" },
      { attempts: 10, correct: 8, hints: 1, expected: "mastered" },
      { attempts: 10, correct: 9, hints: 0, spacedPracticeStreak: 3, expected: "overlearned" },
    ];

    testCases.forEach(({ attempts, correct, hints, spacedPracticeStreak = 0, expected }) => {
      const lessonId = `test-${attempts}-${correct}`;
      const progress = ProgressTracker.updateLessonProgress(lessonId, {
        attempts,
        correctAttempts: correct,
        hintsUsed: hints,
        spacedPracticeStreak,
      });

      expect(progress.masteryLevel).toBe(expected);
    });
  });

  it("persists progress to localStorage", () => {
    const lessonId = "test-lesson-persist";

    ProgressTracker.updateLessonProgress(lessonId, {
      attempts: 5,
      correctAttempts: 4,
    });

    const stored = mockLocalStorage.get('ka:progress:v1');
    expect(stored).toBeTruthy();

    const storedData = stored;
    mockLocalStorage.clear();
    if (storedData) {
      mockLocalStorage.set('ka:progress:v1', storedData);
    }

    ProgressTracker._clearCache();

    const retrieved = ProgressTracker.getLessonProgress(lessonId);

    expect(retrieved.attempts).toBe(5);
    expect(retrieved.correctAttempts).toBe(4);
  });

  it("exports and imports progress", () => {
    const lessonId = "test-lesson-export";

    const updated = ProgressTracker.updateLessonProgress(lessonId, {
      attempts: 3,
      correctAttempts: 2,
    });

    expect(updated).toBeTruthy();

    const exported = ProgressTracker.exportProgress();
    expect(exported.includes(lessonId)).toBe(true);

    ProgressTracker.clearProgress();
    const importSuccess = ProgressTracker.importProgress(exported);

    expect(importSuccess).toBe(true);

    const retrieved = ProgressTracker.getLessonProgress(lessonId);
    expect(retrieved.attempts).toBe(3);
    expect(retrieved.correctAttempts).toBe(2);
  });

  it("handles invalid import data", () => {
    const importSuccess = ProgressTracker.importProgress("invalid json");
    expect(importSuccess).toBe(false);

    const importSuccess2 = ProgressTracker.importProgress('{"invalid": "structure"}');
    expect(importSuccess2).toBe(false);
  });
});
