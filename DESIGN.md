---
version: 2.0.0
name: Orbital Editorial
colors:
  primary: "#EB001B"
  secondary: "#FF5F00"
  accent: "#F79E1B"
  neutral: "#6E6E6E"
  success: "#15803D"
  warning: "#CA8A04"
  error: "#DC2626"
  info: "#EB001B"
  surface: "#F9F7F2"
  white: "#FFFFFF"
  text-primary: "#1A1A1A"
  text-secondary: "#555555"
typography:
  h1:
    fontFamily: "'Newsreader', serif"
    fontSize: 3.5rem
    fontWeight: 700
    lineHeight: 1.0
  h2:
    fontFamily: "'Newsreader', serif"
    fontSize: 2.5rem
    fontWeight: 600
    lineHeight: 1.1
  h3:
    fontFamily: "'Newsreader', serif"
    fontSize: 1.75rem
    fontWeight: 600
    lineHeight: 1.2
  body:
    fontFamily: "'Inter', sans-serif"
    fontSize: 1.125rem
    fontWeight: 400
    lineHeight: 1.6
  large:
    fontFamily: "'Inter', sans-serif"
    fontSize: 1.25rem
    fontWeight: 500
    lineHeight: 1.6
  small:
    fontFamily: "'Inter', sans-serif"
    fontSize: 0.875rem
    fontWeight: 500
    lineHeight: 1.6
spacing:
  xs: 8px
  sm: 12px
  md: 24px
  lg: 36px
  xl: 48px
  xxl: 96px
rounded:
  full: 9999px
  pill: 9999px
  orbital: "24px"
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.white}"
    rounded: "{rounded.full}"
  button-secondary:
    backgroundColor: "{colors.secondary}"
    textColor: "{colors.white}"
    rounded: "{rounded.full}"
  card:
    backgroundColor: "{colors.white}"
    rounded: "{rounded.orbital}"
  alert:
    backgroundColor: "{colors.surface}"
    rounded: "{rounded.pill}"
---

# Orbital Editorial

## Overview
A visual identity that blends the authoritative warmth of high-end editorial print with the dynamic, interlocking geometry of the Mastercard "orbital" aesthetic. It rejects technical coldness in favor of a warm cream canvas, generous white space, and soft pill-shaped interactive elements that feel human and inviting yet mathematically precise.

## Design Principles
1. **Editorial Warmth**: Using high-contrast serif typography for headings to create an atmosphere of academic authority and traditional warmth.
2. **Orbital Geometry**: Emphasizing the circle and the pill shape as the primary container forms, reflecting the interconnected nature of mathematical concepts.
3. **Chromatic Energy**: Utilizing a vibrant, Mastercard-inspired palette of Red, Orange, and Yellow to inject energy and focus into the learning experience.
4. **Luxurious Spacing**: Providing ample breathing room between elements to reduce cognitive load and emphasize content clarity.

## Colors
- **Mastercard Red (#EB001B)**: The primary action color, used for critical buttons and key highlights.
- **Mastercard Orange (#FF5F00)**: The secondary action color, representing momentum and progress.
- **Mastercard Yellow (#F79E1B)**: The accent color, used for mastery indicators and celebrations.
- **Warm Cream (#F9F7F2)**: The "canvas" background, providing a softer, more editorial reading experience than pure white.
- **Anthracite (#1A1A1A)**: The primary text color, ensuring high legibility and a premium feel.

## Typography
- **Headings (Newsreader)**: An elegant serif that provides a scholarly and warm editorial feel.
- **Body (Inter)**: A clear, humanist sans-serif optimized for reading technical and mathematical notation.

## Structural Elements
- **Shapes**: Every interactive element must utilize the "pill" shape (maximum border-radius) or the "orbital" soft corner (24px). Sharp corners are strictly avoided.
- **Overlaps**: Encourage subtle overlapping of circular elements to reflect the Mastercard "Orbital" concept.
- **Shadows**: Use extremely soft, diffuse shadows or flat design with color-based depth. Avoid heavy, hard-edged shadows.

## Component Specifications
- **Buttons**: Fully rounded (pill shape), with high-saturation backgrounds and white text. No borders.
- **Cards**: Large 24px corner radius, white background, with a very subtle, light shadow.
- **Alerts**: Pill-shaped containers with soft background tints and colored icons.
