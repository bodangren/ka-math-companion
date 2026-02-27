# Initial Concept

A pedagogy-first, static Elm companion to Khan Academy math courses, designed to help learners build durable understanding through conceptual exploration and spaced retrieval.

# Product Guide

## Target Audience

- **Students**: Learners in middle and high school math (specifically Integrated Math 3) looking for conceptual depth and mastery-based practice.
- **Teachers**: Educators seeking a structured, static-site companion for curriculum delivery and tracking.

## Core Goals

- **Mastery Learning**: Ensure students achieve deep understanding before progressing.
- **Pedagogical Balance**: Blend conceptual discovery with explicit instruction and scaffolded practice.
- **Durable Retention**: Use spaced retrieval (SRS) to help knowledge persist over time.
- **Accessibility**: Provide a keyboard-first, screen-reader-friendly experience for all learners.
- **Reliability**: Leverage Elm's zero-runtime-exception guarantee for a stable learning experience.

## Key Features

- **Interactive Lessons**: Curriculum with embedded Elm visualizations (FunctionGrapher, NumberLine, etc.).
- **Progress Tracking**: Local storage-based mastery tracking per learning objective.
- **Spaced Practice**: Integrated Leitner-based review system for long-term retention.
- **Khan Academy Sync**: Automated tooling to keep curriculum aligned with official Khan Academy units.
- **Static Export**: High-performance, low-cost hosting via GitHub Pages.

## Technical Advantages

- **Compile-Time Safety**: Elm's type system catches errors before they reach users.
- **Predictable State**: The Elm Architecture eliminates state management complexity.
- **Maintainability**: Pure functions and immutable data make refactoring safe.
