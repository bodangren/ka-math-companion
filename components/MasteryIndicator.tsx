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
    backgroundColor: '#9ca3af',
    borderColor: '#9ca3af',
    textColor: '#4b5563',
    label: 'Not started',
    description: 'No attempts yet',
    pattern: '○',
  },
  struggling: {
    backgroundColor: '#ef4444',
    borderColor: '#ef4444',
    textColor: '#ffffff',
    label: 'Struggling',
    description: 'Less than 50% correct',
    pattern: '▲',
  },
  progressing: {
    backgroundColor: '#eab308',
    borderColor: '#eab308',
    textColor: '#ffffff',
    label: 'Progressing',
    description: '50-79% correct',
    pattern: '◐',
  },
  mastered: {
    backgroundColor: '#22c55e',
    borderColor: '#22c55e',
    textColor: '#ffffff',
    label: 'Mastered',
    description: '80%+ correct',
    pattern: '●',
  },
  overlearned: {
    backgroundColor: '#3b82f6',
    borderColor: '#3b82f6',
    textColor: '#ffffff',
    label: 'Overlearned',
    description: 'Sustained mastery',
    pattern: '★',
  },
} as const;

const sizeClasses = {
  small: {
    container: { width: '16px', height: '16px' },
    text: { fontSize: '10px' },
  },
  medium: {
    container: { width: '20px', height: '20px' },
    text: { fontSize: '12px' },
  },
  large: {
    container: { width: '24px', height: '24px' },
    text: { fontSize: '14px' },
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
        className="mastery-indicator"
        style={{
          backgroundColor: config.backgroundColor,
          borderColor: config.borderColor,
          width: sizeClass.container.width,
          height: sizeClass.container.height,
          borderRadius: '50%',
          borderWidth: '2px',
          borderStyle: 'solid',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          transition: 'background-color 0.2s ease',
        }}
        title={config.description}
      >
        <span
          style={{
            fontSize: sizeClass.text.fontSize,
            fontWeight: 'bold',
            color: config.textColor,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
          }}
          aria-hidden="true"
        >
          {config.pattern}
        </span>
      </div>
      {showLabel && (
        <span style={{
          fontSize: '12px',
          fontWeight: '500',
          color: config.textColor,
        }}>
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