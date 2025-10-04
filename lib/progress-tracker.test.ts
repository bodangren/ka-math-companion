import assert from "node:assert/strict";
import test from "node:test";
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

test("ProgressTracker creates default progress for new lesson", () => {
  const lessonId = "test-lesson-1";
  const progress = ProgressTracker.getLessonProgress(lessonId);
  
  assert.equal(progress.lessonId, lessonId);
  assert.equal(progress.attempts, 0);
  assert.equal(progress.correctAttempts, 0);
  assert.equal(progress.lastAttemptDate, null);
  assert.equal(progress.masteryLevel, "not-started");
  assert.equal(progress.hintsUsed, 0);
  assert.equal(progress.spacedPracticeStreak, 0);
});

test("ProgressTracker updates lesson progress", () => {
  const lessonId = "test-lesson-2";
  
  const updated = ProgressTracker.updateLessonProgress(lessonId, {
    attempts: 10,
    correctAttempts: 8,
    hintsUsed: 2,
  });
  
  assert.equal(updated.attempts, 10);
  assert.equal(updated.correctAttempts, 8);
  assert.equal(updated.hintsUsed, 2);
  assert.equal(updated.masteryLevel, "mastered");
  assert.ok(updated.lastAttemptDate);
});

test("ProgressTracker calculates mastery levels correctly", () => {
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
    
    assert.equal(progress.masteryLevel, expected, 
      `Expected ${expected} for ${correct}/${attempts} correct with ${hints} hints`);
  });
});

test("ProgressTracker persists progress to localStorage", () => {
  const lessonId = "test-lesson-persist";
  
  // Clear any existing data
  mockLocalStorage.clear();
  ProgressTracker.clearProgress();
  
  ProgressTracker.updateLessonProgress(lessonId, {
    attempts: 5,
    correctAttempts: 4,
  });
  
  // Verify it was stored
  const stored = mockLocalStorage.get('ka:progress:v1');
  assert.ok(stored, "progress should be stored in localStorage");
  
  // Clear in-memory state but keep localStorage
  const storedData = stored;
  mockLocalStorage.clear();
  mockLocalStorage.set('ka:progress:v1', storedData);
  
  // Force ProgressTracker to read from localStorage by clearing any internal cache
  ProgressTracker._clearCache();
  
  // Retrieve progress again
  const retrieved = ProgressTracker.getLessonProgress(lessonId);
  
  assert.equal(retrieved.attempts, 5);
  assert.equal(retrieved.correctAttempts, 4);
});

test("ProgressTracker exports and imports progress", () => {
  const lessonId = "test-lesson-export";
  
  // Clear any existing data
  mockLocalStorage.clear();
  ProgressTracker.clearProgress();
  
  const updated = ProgressTracker.updateLessonProgress(lessonId, {
    attempts: 3,
    correctAttempts: 2,
  });
  
  assert.ok(updated, "update should return progress");
  
  const exported = ProgressTracker.exportProgress();
  assert.ok(exported.includes(lessonId));
  
  // Clear and import
  ProgressTracker.clearProgress();
  const importSuccess = ProgressTracker.importProgress(exported);
  
  assert.ok(importSuccess);
  
  const retrieved = ProgressTracker.getLessonProgress(lessonId);
  assert.equal(retrieved.attempts, 3);
  assert.equal(retrieved.correctAttempts, 2);
});

test("ProgressTracker handles invalid import data", () => {
  const importSuccess = ProgressTracker.importProgress("invalid json");
  assert.equal(importSuccess, false);
  
  const importSuccess2 = ProgressTracker.importProgress('{"invalid": "structure"}');
  assert.equal(importSuccess2, false);
});