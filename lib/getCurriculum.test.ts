import test from "node:test";
import assert from "node:assert/strict";

import {
  DEFAULT_CURRICULUM_SLUG,
  getCurriculum,
  listCurricula,
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

test("getCurriculum accepts an explicit curriculum slug", () => {
  const course = getCurriculum(DEFAULT_CURRICULUM_SLUG);
  assert.equal(course.title, "Integrated math 3");
});

test("listCurricula includes the default curriculum entry", () => {
  const curricula = listCurricula();
  const math3 = curricula.find((entry) => entry.slug === DEFAULT_CURRICULUM_SLUG);
  assert.ok(math3, "integrated math 3 curriculum should be registered");
  assert.equal(math3?.title, "Integrated math 3");
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
