import { describe, expect, it } from "vitest";

import {
  CurriculumNotFoundError,
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

  it("throws CurriculumNotFoundError for unknown curriculum", () => {
    expect(() => getCurriculum("unknown-curriculum")).toThrow(CurriculumNotFoundError);
  });

  it("returns cached curriculum on subsequent calls", () => {
    const course1 = getCurriculum();
    const course2 = getCurriculum();
    expect(course1).toBe(course2);
  });
});

describe("listCurricula", () => {
  it("includes the default curriculum entry", () => {
    const curricula = listCurricula();
    const math3 = curricula.find((entry) => entry.slug === DEFAULT_CURRICULUM_SLUG);
    expect(math3).toBeDefined();
    expect(math3?.title).toBe("Integrated math 3");
    expect(math3?.unitCount).toBeGreaterThan(0);
  });
});

describe("parseCurriculumDocument", () => {
  it("throws when document is not an object", () => {
    expect(() => parseCurriculumDocument(null)).toThrow(/expected document to be an object/);
    expect(() => parseCurriculumDocument("string")).toThrow(/expected document to be an object/);
    expect(() => parseCurriculumDocument([])).toThrow(/expected document to be an object/);
  });

  it("throws when source is missing", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    delete malformed.source;

    expect(() => parseCurriculumDocument(malformed)).toThrow(/document\.source/);
  });

  it("throws when course is missing", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    delete malformed.course;

    expect(() => parseCurriculumDocument(malformed)).toThrow(/document\.course/);
  });

  it("throws when course units are missing", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    delete malformed.course.units;

    expect(() => parseCurriculumDocument(malformed)).toThrow(/course\.units/);
  });

  it("throws when course id is missing", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    delete malformed.course.id;

    expect(() => parseCurriculumDocument(malformed)).toThrow(/course\.id/);
  });

  it("throws when course title is not a string", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    malformed.course.title = 123;

    expect(() => parseCurriculumDocument(malformed)).toThrow(/course\.title/);
  });

  it("throws when unit lessons are missing", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    delete malformed.course.units[0].lessons;

    expect(() => parseCurriculumDocument(malformed)).toThrow(/course\.units\[0\]\.lessons/);
  });

  it("throws when lesson items are missing", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    delete malformed.course.units[0].lessons[0].items;

    expect(() => parseCurriculumDocument(malformed)).toThrow(
      /course\.units\[0\]\.lessons\[0\]\.items/,
    );
  });

  it("throws when item id is not a string", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    malformed.course.units[0].lessons[0].items[0].id = 123;

    expect(() => parseCurriculumDocument(malformed)).toThrow(
      /course\.units\[0\]\.lessons\[0\]\.items\[0\]\.id/,
    );
  });

  it("throws when assessment timeEstimate has invalid bounds", () => {
    const malformed = structuredClone(document);
    // @ts-expect-error mutating for test coverage
    malformed.course.courseChallenge.timeEstimate.lowerBound = "invalid";

    expect(() => parseCurriculumDocument(malformed)).toThrow(
      /course\.courseChallenge\.timeEstimate\.lowerBound/,
    );
  });

  it("parses complete curriculum document successfully", () => {
    const result = parseCurriculumDocument(document);
    expect(result.source).toBeDefined();
    expect(result.course).toBeDefined();
    expect(result.course.id).toBe("x5549cc1686316ba5");
    expect(result.course.slug).toBe("math3");
    expect(result.course.title).toBe("Integrated math 3");
    expect(result.course.units.length).toBeGreaterThan(0);
    expect(result.course.units[0].lessons.length).toBeGreaterThan(0);
    expect(result.course.units[0].lessons[0].items.length).toBeGreaterThan(0);
  });
});
