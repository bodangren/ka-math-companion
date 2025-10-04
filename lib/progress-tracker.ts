export interface LessonProgress {
  lessonId: string;
  attempts: number;
  correctAttempts: number;
  lastAttemptDate: string | null;
  masteryLevel: 'not-started' | 'struggling' | 'progressing' | 'mastered' | 'overlearned';
  hintsUsed: number;
  spacedPracticeStreak: number;
}

export interface ProgressState {
  lessons: Record<string, LessonProgress>;
  version: string;
}

const PROGRESS_STORAGE_KEY = 'ka:progress:v1';
const CURRENT_VERSION = '1.0.0';

export class ProgressTracker {
  private static getStoredProgress(): ProgressState {
    if (typeof window === 'undefined') {
      return { lessons: {}, version: CURRENT_VERSION };
    }

    try {
      const stored = window.localStorage.getItem(PROGRESS_STORAGE_KEY);
      if (!stored) {
        return { lessons: {}, version: CURRENT_VERSION };
      }

      const parsed = JSON.parse(stored) as ProgressState;
      return {
        ...parsed,
        version: CURRENT_VERSION,
      };
    } catch {
      return { lessons: {}, version: CURRENT_VERSION };
    }
  }

  private static saveProgress(progress: ProgressState): void {
    if (typeof window === 'undefined') return;

    try {
      window.localStorage.setItem(PROGRESS_STORAGE_KEY, JSON.stringify(progress));
    } catch {
      // Silently fail if localStorage is full or unavailable
    }
  }

  static getLessonProgress(lessonId: string): LessonProgress {
    const progress = this.getStoredProgress();
    return progress.lessons[lessonId] || {
      lessonId,
      attempts: 0,
      correctAttempts: 0,
      lastAttemptDate: null,
      masteryLevel: 'not-started',
      hintsUsed: 0,
      spacedPracticeStreak: 0,
    };
  }

  static updateLessonProgress(
    lessonId: string,
    update: Partial<Omit<LessonProgress, 'lessonId'>>
  ): LessonProgress {
    const progress = this.getStoredProgress();
    const current = progress.lessons[lessonId] || {
      lessonId,
      attempts: 0,
      correctAttempts: 0,
      lastAttemptDate: null,
      masteryLevel: 'not-started',
      hintsUsed: 0,
      spacedPracticeStreak: 0,
    };

    const updated: LessonProgress = {
      ...current,
      ...update,
      lastAttemptDate: new Date().toISOString(),
    };

    // Recalculate mastery level based on performance
    updated.masteryLevel = this.calculateMasteryLevel(updated);

    progress.lessons[lessonId] = updated;
    this.saveProgress(progress);

    return updated;
  }

  private static calculateMasteryLevel(progress: LessonProgress): LessonProgress['masteryLevel'] {
    if (progress.attempts === 0) {
      return 'not-started';
    }

    const accuracy = progress.correctAttempts / progress.attempts;
    const hintRatio = progress.attempts > 0 ? progress.hintsUsed / progress.attempts : 0;

    // Overlearned: High accuracy with sustained spaced practice
    if (accuracy >= 0.9 && progress.spacedPracticeStreak >= 3) {
      return 'overlearned';
    }

    // Mastered: High accuracy without excessive hints
    if (accuracy >= 0.8 && hintRatio <= 0.2) {
      return 'mastered';
    }

    // Progressing: Moderate accuracy or completed with hints
    if (accuracy >= 0.5) {
      return 'progressing';
    }

    // Struggling: Low accuracy
    return 'struggling';
  }

  static getAllProgress(): ProgressState {
    return this.getStoredProgress();
  }

  static exportProgress(): string {
    return JSON.stringify(this.getStoredProgress(), null, 2);
  }

  static importProgress(jsonString: string): boolean {
    try {
      const imported = JSON.parse(jsonString) as ProgressState;
      if (imported.lessons && typeof imported.lessons === 'object') {
        this.saveProgress({
          lessons: imported.lessons,
          version: CURRENT_VERSION,
        });
        return true;
      }
    } catch {
      // Invalid JSON
    }
    return false;
  }

  static clearProgress(): void {
    if (typeof window === 'undefined') return;
    window.localStorage.removeItem(PROGRESS_STORAGE_KEY);
  }

  // For testing purposes
  static _clearCache(): void {
    // This method exists to clear any in-memory caching if added in the future
  }
}