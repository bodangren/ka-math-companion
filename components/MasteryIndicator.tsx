'use client';

import React from 'react';
import type { LessonProgress } from '../lib/progress-tracker';

interface MasteryIndicatorProps {
  progress: LessonProgress;
  size?: 'small' | 'medium' | 'large';
  showLabel?: boolean;
  className?: string;
}

const masteryConfig = {
  'not-started': {
    color: 'bg-gray-400',
    borderColor: 'border-gray-400',
    bgColor: 'bg-gray-100',
    textColor: 'text-gray-600',
    label: 'Not started',
    description: 'No attempts yet',
    pattern: '○',
  },
  struggling: {
    color: 'bg-red-500',
    borderColor: 'border-red-500',
    bgColor: 'bg-red-100',
    textColor: 'text-red-700',
    label: 'Struggling',
    description: 'Less than 50% correct',
    pattern: '▲',
  },
  progressing: {
    color: 'bg-yellow-500',
    borderColor: 'border-yellow-500',
    bgColor: 'bg-yellow-100',
    textColor: 'text-yellow-700',
    label: 'Progressing',
    description: '50-79% correct',
    pattern: '◐',
  },
  mastered: {
    color: 'bg-green-500',
    borderColor: 'border-green-500',
    bgColor: 'bg-green-100',
    textColor: 'text-green-700',
    label: 'Mastered',
    description: '80%+ correct',
    pattern: '●',
  },
  overlearned: {
    color: 'bg-blue-500',
    borderColor: 'border-blue-500',
    bgColor: 'bg-blue-100',
    textColor: 'text-blue-700',
    label: 'Overlearned',
    description: 'Sustained mastery',
    pattern: '★',
  },
} as const;

const sizeClasses = {
  small: {
    container: 'w-4 h-4',
    text: 'text-xs',
  },
  medium: {
    container: 'w-5 h-5',
    text: 'text-sm',
  },
  large: {
    container: 'w-6 h-6',
    text: 'text-base',
  },
} as const;

export function MasteryIndicator({
  progress,
  size = 'small',
  showLabel = false,
  className = '',
}: MasteryIndicatorProps) {
  const config = masteryConfig[progress.masteryLevel];
  const sizeClass = sizeClasses[size];

  return (
    <div
      className={`inline-flex items-center gap-2 ${className}`}
      role="img"
      aria-label={`${config.label}: ${config.description}`}
    >
      <div
        className={`
          relative rounded-full border-2 ${config.borderColor} ${config.color}
          ${sizeClass.container}
          flex items-center justify-center
          transition-colors duration-200
        `}
        title={config.description}
      >
        <span
          className={`
            ${sizeClass.text} font-bold text-white
            flex items-center justify-center
          `}
          aria-hidden="true"
        >
          {config.pattern}
        </span>
      </div>
      {showLabel && (
        <span className={`text-xs font-medium ${config.textColor}`}>
          {config.label}
        </span>
      )}
    </div>
  );
}

export function MasteryLegend() {
  return (
    <div
      className="flex flex-wrap gap-4 text-xs"
      role="list"
      aria-label="Mastery level legend"
    >
      {Object.entries(masteryConfig).map(([level, config]) => (
        <div
          key={level}
          className="flex items-center gap-2"
          role="listitem"
        >
          <MasteryIndicator
            progress={{
              lessonId: 'demo',
              attempts: 1,
              correctAttempts: 1,
              lastAttemptDate: null,
              masteryLevel: level as LessonProgress['masteryLevel'],
              hintsUsed: 0,
              spacedPracticeStreak: 0,
            }}
            size="small"
          />
          <span className="text-gray-600">{config.label}</span>
        </div>
      ))}
    </div>
  );
}