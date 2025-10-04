import document from "../docs/data/integrated-math-3.course.json";

export const DEFAULT_CURRICULUM_SLUG = "integrated-math-3";

type CurriculumRegistryEntry = {
  source: unknown;
};

const CURRICULUM_REGISTRY: Record<string, CurriculumRegistryEntry> = {
  [DEFAULT_CURRICULUM_SLUG]: { source: document },
};

export interface CurriculumAssessment {
  id: string;
  slug: string;
  title: string | null;
  descriptor: string | null;
  kind: string | null;
  url: string | null;
  exerciseLength: number | null;
  timeEstimate: {
    lowerBound: number | null;
    upperBound: number | null;
  } | null;
}

export interface CurriculumItem {
  id: string;
  slug: string;
  title: string | null;
  description: string | null;
  kind: string | null;
  contentKind: string | null;
  descriptor: string | null;
  url: string | null;
  isSkillCheck: boolean | null;
  exerciseLength: number | null;
  timeEstimate: {
    lowerBound: number | null;
    upperBound: number | null;
  } | null;
}

export interface CurriculumLesson {
  id: string;
  slug: string;
  title: string | null;
  description: string | null;
  relativeUrl: string | null;
  url: string | null;
  items: CurriculumItem[];
}

export interface CurriculumUnit {
  id: string;
  slug: string;
  title: string | null;
  description: string | null;
  relativeUrl: string | null;
  url: string | null;
  lessons: CurriculumLesson[];
  assessments: {
    quizzes: CurriculumAssessment[];
    unitTests: CurriculumAssessment[];
    other: CurriculumAssessment[];
  };
}

export interface CurriculumCourse {
  id: string;
  slug: string;
  title: string;
  description: string;
  relativeUrl: string;
  url: string;
  masteryEnabled: boolean | null;
  isListedForLearners: boolean | null;
  courseChallenge: CurriculumAssessment | null;
  masteryChallenge: CurriculumAssessment | null;
  units: CurriculumUnit[];
}

export interface CurriculumSource {
  query: string | null;
  queryHash: number | null;
  path: string | null;
  countryCode: string | null;
  fetchedAt: string | null;
  contentCommitSha: string | null;
}

export interface CurriculumDocument {
  source: CurriculumSource;
  course: CurriculumCourse;
}

class CurriculumSchemaError extends Error {
  constructor(message: string) {
    super(`Invalid Integrated Math 3 course payload: ${message}`);
  }
}

export class CurriculumNotFoundError extends Error {
  constructor(slug: string) {
    super(`No curriculum registered for slug "${slug}"`);
  }
}

type JsonRecord = Record<string, unknown>;

type TimeEstimate = {
  lowerBound: number | null;
  upperBound: number | null;
} | null;

function assertObject(value: unknown, path: string): asserts value is JsonRecord {
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    throw new CurriculumSchemaError(`expected ${path} to be an object`);
  }
}

function expectString(value: unknown, path: string): string {
  if (typeof value !== "string") {
    throw new CurriculumSchemaError(`expected ${path} to be a string`);
  }
  return value;
}

function expectNullableString(value: unknown, path: string): string | null {
  if (value == null) return null;
  return expectString(value, path);
}

function expectBoolean(value: unknown, path: string): boolean {
  if (typeof value !== "boolean") {
    throw new CurriculumSchemaError(`expected ${path} to be a boolean`);
  }
  return value;
}

function expectNullableBoolean(value: unknown, path: string): boolean | null {
  if (value == null) return null;
  return expectBoolean(value, path);
}

function expectNumber(value: unknown, path: string): number {
  if (typeof value !== "number" || Number.isNaN(value)) {
    throw new CurriculumSchemaError(`expected ${path} to be a number`);
  }
  return value;
}

function expectNullableNumber(value: unknown, path: string): number | null {
  if (value == null) return null;
  return expectNumber(value, path);
}

function expectArray(value: unknown, path: string): unknown[] {
  if (!Array.isArray(value)) {
    throw new CurriculumSchemaError(`expected ${path} to be an array`);
  }
  return value;
}

function toTimeEstimate(value: unknown, path: string): TimeEstimate {
  if (value == null) return null;
  assertObject(value, path);
  return {
    lowerBound: expectNullableNumber(value.lowerBound, `${path}.lowerBound`),
    upperBound: expectNullableNumber(value.upperBound, `${path}.upperBound`),
  };
}

function normaliseAssessment(value: unknown, path: string): CurriculumAssessment {
  assertObject(value, path);
  return {
    id: expectString(value.id, `${path}.id`),
    slug: expectString(value.slug, `${path}.slug`),
    title: expectNullableString(value.title, `${path}.title`),
    descriptor: expectNullableString(value.descriptor, `${path}.descriptor`),
    kind: expectNullableString(value.kind, `${path}.kind`),
    url: expectNullableString(value.url, `${path}.url`),
    exerciseLength: expectNullableNumber(value.exerciseLength, `${path}.exerciseLength`),
    timeEstimate: toTimeEstimate(value.timeEstimate, `${path}.timeEstimate`),
  };
}

function normaliseItem(value: unknown, path: string): CurriculumItem {
  assertObject(value, path);
  return {
    id: expectString(value.id, `${path}.id`),
    slug: expectString(value.slug, `${path}.slug`),
    title: expectNullableString(value.title, `${path}.title`),
    description: expectNullableString(value.description, `${path}.description`),
    kind: expectNullableString(value.kind, `${path}.kind`),
    contentKind: expectNullableString(value.contentKind, `${path}.contentKind`),
    descriptor: expectNullableString(value.descriptor, `${path}.descriptor`),
    url: expectNullableString(value.url, `${path}.url`),
    isSkillCheck: expectNullableBoolean(value.isSkillCheck, `${path}.isSkillCheck`),
    exerciseLength: expectNullableNumber(value.exerciseLength, `${path}.exerciseLength`),
    timeEstimate: toTimeEstimate(value.timeEstimate, `${path}.timeEstimate`),
  };
}

function normaliseLesson(value: unknown, path: string): CurriculumLesson {
  assertObject(value, path);
  const items = expectArray(value.items, `${path}.items`).map((item, index) =>
    normaliseItem(item, `${path}.items[${index}]`),
  );

  return {
    id: expectString(value.id, `${path}.id`),
    slug: expectString(value.slug, `${path}.slug`),
    title: expectNullableString(value.title, `${path}.title`),
    description: expectNullableString(value.description, `${path}.description`),
    relativeUrl: expectNullableString(value.relativeUrl, `${path}.relativeUrl`),
    url: expectNullableString(value.url, `${path}.url`),
    items,
  };
}

function normaliseAssessments(value: unknown, path: string) {
  assertObject(value, path);
  const quizzes = expectArray(value.quizzes, `${path}.quizzes`).map((quiz, index) =>
    normaliseAssessment(quiz, `${path}.quizzes[${index}]`),
  );
  const unitTests = expectArray(value.unitTests, `${path}.unitTests`).map((unitTest, index) =>
    normaliseAssessment(unitTest, `${path}.unitTests[${index}]`),
  );
  const other = expectArray(value.other, `${path}.other`).map((node, index) =>
    normaliseAssessment(node, `${path}.other[${index}]`),
  );

  return { quizzes, unitTests, other };
}

function normaliseUnit(value: unknown, path: string): CurriculumUnit {
  assertObject(value, path);
  const lessons = expectArray(value.lessons, `${path}.lessons`).map((lesson, index) =>
    normaliseLesson(lesson, `${path}.lessons[${index}]`),
  );

  const assessments = normaliseAssessments(value.assessments, `${path}.assessments`);

  return {
    id: expectString(value.id, `${path}.id`),
    slug: expectString(value.slug, `${path}.slug`),
    title: expectNullableString(value.title, `${path}.title`),
    description: expectNullableString(value.description, `${path}.description`),
    relativeUrl: expectNullableString(value.relativeUrl, `${path}.relativeUrl`),
    url: expectNullableString(value.url, `${path}.url`),
    lessons,
    assessments,
  };
}

function normaliseSource(value: unknown, path: string): CurriculumSource {
  assertObject(value, path);
  return {
    query: expectNullableString(value.query, `${path}.query`),
    queryHash: expectNullableNumber(value.queryHash, `${path}.queryHash`),
    path: expectNullableString(value.path, `${path}.path`),
    countryCode: expectNullableString(value.countryCode, `${path}.countryCode`),
    fetchedAt: expectNullableString(value.fetchedAt, `${path}.fetchedAt`),
    contentCommitSha: expectNullableString(value.contentCommitSha, `${path}.contentCommitSha`),
  };
}

function normaliseCourse(value: unknown, path: string): CurriculumCourse {
  assertObject(value, path);
  const units = expectArray(value.units, `${path}.units`).map((unit, index) =>
    normaliseUnit(unit, `${path}.units[${index}]`),
  );

  return {
    id: expectString(value.id, `${path}.id`),
    slug: expectString(value.slug, `${path}.slug`),
    title: expectString(value.title, `${path}.title`),
    description: expectString(value.description, `${path}.description`),
    relativeUrl: expectString(value.relativeUrl, `${path}.relativeUrl`),
    url: expectString(value.url, `${path}.url`),
    masteryEnabled: expectNullableBoolean(value.masteryEnabled, `${path}.masteryEnabled`),
    isListedForLearners: expectNullableBoolean(value.isListedForLearners, `${path}.isListedForLearners`),
    courseChallenge: value.courseChallenge == null
      ? null
      : normaliseAssessment(value.courseChallenge, `${path}.courseChallenge`),
    masteryChallenge: value.masteryChallenge == null
      ? null
      : normaliseAssessment(value.masteryChallenge, `${path}.masteryChallenge`),
    units,
  };
}

export function parseCurriculumDocument(raw: unknown): CurriculumDocument {
  assertObject(raw, "document");
  const source = normaliseSource(raw.source, "document.source");
  const course = normaliseCourse(raw.course, "document.course");
  return { source, course };
}

const curriculumCache = new Map<string, CurriculumCourse>();

function loadCurriculum(slug: string): CurriculumCourse {
  const entry = CURRICULUM_REGISTRY[slug];
  if (!entry) {
    throw new CurriculumNotFoundError(slug);
  }
  if (!curriculumCache.has(slug)) {
    const parsed = parseCurriculumDocument(entry.source);
    curriculumCache.set(slug, parsed.course);
  }
  return curriculumCache.get(slug)!;
}

export function getCurriculum(slug: string = DEFAULT_CURRICULUM_SLUG): CurriculumCourse {
  return loadCurriculum(slug);
}

export interface RegisteredCurriculumSummary {
  slug: string;
  title: string;
  description: string;
  unitCount: number;
}

export function listCurricula(): RegisteredCurriculumSummary[] {
  return Object.keys(CURRICULUM_REGISTRY).map((slug) => {
    const course = loadCurriculum(slug);
    return {
      slug,
      title: course.title,
      description: course.description,
      unitCount: course.units.length,
    };
  });
}
