import { describe, expect, it } from "vitest";

import {
  DEFAULT_CURRICULUM_SLUG,
  getCurriculum,
  listCurricula,
  parseCurriculumDocument,
} from "./getCurriculum";
import document from "../docs/data/integrated-math-3.course.json" assert { type: "json" };

describe("getCurriculum", () => {
  it("returns course metadata with units and lessons", () => {
    const course = getCurriculum();
    expect(course.slug).toBe("math3");
    expect(course.units.length).toBeGreaterThan(0);
    const firstUnit = course.units[0];
    expect(firstUnit.lessons.length).toBeGreaterThan(0);
  });

  it("accepts an explicit curriculum slug", () => {
    const course = getCurriculum(DEFAULT_CURRICULUM_SLUG);
    expect(course.title).toBe("Integrated math 3");
  });
});

describe("listCurricula", () => {
  it("includes the default curriculum entry", () => {
    const curricula = listCurricula();
    const math3 = curricula.find((entry) => entry.slug === DEFAULT_CURRICULUM_SLUG);
    expect(math3).toBeDefined();
    expect(math3?.title).toBe("Integrated math 3");
  });
});

describe("parseCurriculumDocument", () => {
  it("throws when course units are missing", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    delete malformed.course.units;

    expect(() => parseCurriculumDocument(malformed)).toThrow(/course\.units/);
  });
});
