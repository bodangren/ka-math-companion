import test from "node:test";
import assert from "node:assert/strict";

import {
  getCurriculum,
  parseCurriculumDocument,
} from "./getCurriculum";
import document from "../docs/data/integrated-math-3.course.json" assert { type: "json" };

test("getCurriculum returns course metadata with units and lessons", () => {
  const course = getCurriculum();
  assert.equal(course.slug, "math3");
  assert.ok(course.units.length > 0);
  const firstUnit = course.units[0];
  assert.ok(firstUnit.lessons.length > 0);
});

test("parseCurriculumDocument throws when course units are missing", () => {
  const malformed = structuredClone(document);
  // @ts-expect-error mutating for test coverage
  delete malformed.course.units;

  assert.throws(
    () => {
      parseCurriculumDocument(malformed);
    },
    /course\.units/
  );
});
