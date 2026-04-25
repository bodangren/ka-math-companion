# Technology Stack

## Core Frameworks

- **Frontend**: ElmLand
- **Language**: Elm 0.19.1
- **Styling**: Tailwind CSS (via ElmLand integration)

## Content & Rendering

- **Math Notation**: KaTeX (via ports)
- **Charts & Graphs**: elm-charts (native), ECharts/D3 (via ports for complex visualizations)

## Tooling & Infrastructure

- **Package Manager**: npm
- **Build System**: ElmLand CLI + Vite
- **Deployment**: GitHub Pages (static export)
- **Code Quality**: elm-review, elm-format

## Testing

- **Unit**: elm-test
- **E2E**: Playwright (for interaction flows)

## State Management

- **Architecture**: The Elm Architecture (TEA) — built-in
- **Persistence**: Browser LocalStorage (via ports)

## Interop Strategy

- **Ports**: JavaScript interop for:
  - KaTeX rendering
  - Complex chart libraries
  - Browser APIs not available in Elm
- **Flags**: Initial app state from localStorage
