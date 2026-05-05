# Track Plan: Interactive Visualizations

## Phase 1: SVG Infrastructure

- [x] **Task 1: Create SVG Helpers Module**
  - [x] Write Tests: Verify SVG helpers render correctly
  - [x] Implement: Create `src/Svg/Helpers.elm` with common SVG functions

- [x] **Task 2: Create Coordinate System Module**
  - [x] Write Tests: Verify coordinate transformations
  - [x] Implement: Create `src/Viz/Coords.elm` for math-to-SVG mapping

## Phase 2: FunctionGrapher

- [ ] **Task 3: Basic FunctionGrapher**
  - [ ] Write Tests: Verify function plots render
  - [ ] Implement: Create `src/Viz/FunctionGrapher.elm` with axes and grid

- [ ] **Task 4: Function Plotting**
  - [ ] Write Tests: Verify polynomial/exponential/log/trig plots
  - [ ] Implement: Add function evaluation and path generation

- [ ] **Task 5: Interactive Features**
  - [ ] Write Tests: Verify zoom, pan, hover work
  - [ ] Implement: Add mouse/keyboard interaction handlers

## Phase 3: NumberLine

- [ ] **Task 6: Basic NumberLine**
  - [ ] Write Tests: Verify number line renders
  - [ ] Implement: Create `src/Viz/NumberLine.elm`

- [ ] **Task 7: Points and Intervals**
  - [ ] Write Tests: Verify points and intervals plot correctly
  - [ ] Implement: Add point/interval rendering with open/closed circles

- [ ] **Task 8: Interactive Selection**
  - [ ] Write Tests: Verify click selects points
  - [ ] Implement: Add click handlers for point selection

## Phase 4: UnitCircle

- [ ] **Task 9: Basic UnitCircle**
  - [ ] Write Tests: Verify circle and axes render
  - [ ] Implement: Create `src/Viz/UnitCircle.elm`

- [ ] **Task 10: Angle Display**
  - [ ] Write Tests: Verify angles and coordinates display
  - [ ] Implement: Add angle arcs and coordinate labels

- [ ] **Task 11: Interactive Angle Selection**
  - [ ] Write Tests: Verify click/drag selects angles
  - [ ] Implement: Add angle selection interaction

## Phase 5: Integration

- [ ] **Task 12: Add visualizations to lessons**
  - [ ] Write Tests: Verify visualizations render in lessons
  - [ ] Implement: Integrate FunctionGrapher in polynomial/log lessons

- [ ] **Task 13: Add UnitCircle to trig lessons**
  - [ ] Write Tests: Verify UnitCircle renders in trig lessons
  - [ ] Implement: Integrate UnitCircle in trigonometry lessons

- [ ] **Task 14: Create visualization demo page**
  - [ ] Write Tests: Verify demo page renders all viz
  - [ ] Implement: Create `/visualizations` showcase page
