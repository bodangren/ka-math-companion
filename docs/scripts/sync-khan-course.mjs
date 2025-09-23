#!/usr/bin/env node
import {fileURLToPath} from 'node:url';
import {dirname, resolve, relative} from 'node:path';
import {mkdir, writeFile} from 'node:fs/promises';
import {
  assertDataResponse,
  getLatestQuery,
  getLatestQueryHash,
  graphql
} from '@bhavjit/khan-api';

const SCRIPT_DIR = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = resolve(SCRIPT_DIR, '..', '..');
const DEFAULT_PATH = '/math/math3';
const DEFAULT_COUNTRY_CODE = 'US';
const QUERY_NAME = 'ContentForPath';
const GRAPHQL_ENDPOINT = `https://www.khanacademy.org/api/internal/graphql/${QUERY_NAME}`;

function parseArgs(argv) {
  const args = {};
  const tokens = argv.slice(2);
  for (let i = 0; i < tokens.length; i += 1) {
    const token = tokens[i];
    if (!token.startsWith('--')) continue;
    const key = token.slice(2);
    const value = tokens[i + 1];
    if (!value || value.startsWith('--')) {
      args[key] = true;
      i -= 1;
    } else {
      args[key] = value;
      i += 1;
    }
  }
  return args;
}

function toAbsoluteUrl(urlPath) {
  if (!urlPath) return null;
  return urlPath.startsWith('http') ? urlPath : `https://www.khanacademy.org${urlPath}`;
}

function mapAssessment(node) {
  if (!node) return null;
  const base = {
    id: node.id ?? null,
    slug: node.slug ?? null,
    title: node.translatedTitle ?? null,
    descriptor: node.contentDescriptor ?? null,
    kind: node.__typename ?? null,
    url: toAbsoluteUrl(node.urlWithinCurationNode ?? node.canonicalUrl ?? null),
    exerciseLength: node.exerciseLength ?? node.expectedDoNCount ?? null,
    timeEstimate: node.timeEstimate
      ? {
          lowerBound: node.timeEstimate.lowerBound ?? null,
          upperBound: node.timeEstimate.upperBound ?? null
        }
      : null
  };
  if (typeof node.index === 'number') {
    base.index = node.index;
  }
  return base;
}

function mapLearnable(item) {
  if (!item) return null;
  return {
    id: item.id ?? null,
    slug: item.slug ?? null,
    title: item.translatedTitle ?? null,
    description: item.translatedDescription ?? null,
    kind: item.__typename ?? item.contentKind ?? null,
    contentKind: item.contentKind ?? null,
    descriptor: item.contentDescriptor ?? null,
    url: toAbsoluteUrl(item.canonicalUrl ?? item.urlWithinCurationNode ?? null),
    isSkillCheck: item.isSkillCheck ?? null,
    exerciseLength: item.exerciseLength ?? null,
    timeEstimate: item.timeEstimate
      ? {
          lowerBound: item.timeEstimate.lowerBound ?? null,
          upperBound: item.timeEstimate.upperBound ?? null
        }
      : null
  };
}

function mapLesson(lesson) {
  if (!lesson) return null;
  return {
    id: lesson.id ?? null,
    slug: lesson.slug ?? null,
    title: lesson.translatedTitle ?? null,
    description: lesson.translatedDescription ?? null,
    relativeUrl: lesson.relativeUrl ?? null,
    url: toAbsoluteUrl(lesson.relativeUrl ?? null),
    items: (lesson.curatedChildren ?? [])
      .map(mapLearnable)
      .filter(Boolean)
  };
}

function mapUnit(unit) {
  if (!unit) return null;
  const lessons = [];
  const quizzes = [];
  const unitTests = [];
  const others = [];

  for (const child of unit.allOrderedChildren ?? []) {
    switch (child?.__typename) {
      case 'Lesson':
        lessons.push(mapLesson(child));
        break;
      case 'TopicQuiz':
        quizzes.push(mapAssessment(child));
        break;
      case 'TopicUnitTest':
        unitTests.push(mapAssessment(child));
        break;
      default:
        if (child) others.push(mapAssessment(child));
    }
  }

  return {
    id: unit.id ?? null,
    slug: unit.slug ?? null,
    title: unit.translatedTitle ?? null,
    description: unit.translatedDescription ?? null,
    relativeUrl: unit.relativeUrl ?? null,
    url: toAbsoluteUrl(unit.relativeUrl ?? null),
    lessons: lessons.filter(Boolean),
    assessments: {
      quizzes: quizzes.filter(Boolean),
      unitTests: unitTests.filter(Boolean),
      other: others.filter(Boolean)
    }
  };
}

async function main() {
  const args = parseArgs(process.argv);
  const coursePath = args.path ?? DEFAULT_PATH;
  const countryCode = args.country ?? DEFAULT_COUNTRY_CODE;
  const explicitSlug = args.slug ?? null;
  const outArg = args.out ?? null;

  const query = await getLatestQuery(QUERY_NAME);
  if (!query) {
    throw new Error(`Failed to load GraphQL query definition for ${QUERY_NAME}`);
  }
  const queryHash = await getLatestQueryHash(QUERY_NAME);

  const response = await graphql(
    GRAPHQL_ENDPOINT,
    query,
    { path: coursePath, countryCode },
    { headers: { 'content-type': 'application/json' } }
  );
  const payload = await response.json();
  assertDataResponse(payload);

  const routeData = payload.data?.contentRoute;
  const contentData = routeData?.listedPathData ?? routeData?.unlistedPathData;
  const course = contentData?.course;

  if (!course) {
    throw new Error(`No course found for path "${coursePath}"`);
  }

  const normalized = {
    source: {
      query: QUERY_NAME,
      queryHash,
      path: coursePath,
      countryCode,
      fetchedAt: new Date().toISOString(),
      contentCommitSha: payload.data?.content?.metadata?.commitSha ?? null
    },
    course: {
      id: course.id ?? null,
      slug: course.slug ?? null,
      title: course.translatedTitle ?? null,
      description: course.translatedDescription ?? null,
      relativeUrl: course.relativeUrl ?? null,
      url: toAbsoluteUrl(course.relativeUrl ?? null),
      masteryEnabled: course.masteryEnabled ?? null,
      isListedForLearners: course.isListedForLearners ?? null,
      courseChallenge: mapAssessment(course.courseChallenge),
      masteryChallenge: mapAssessment(course.masteryChallenge),
      units: (course.unitChildren ?? []).map(mapUnit).filter(Boolean)
    }
  };

  const effectiveSlug = explicitSlug ?? normalized.course.slug ?? coursePath.split('/').filter(Boolean).pop();
  if (!effectiveSlug) {
    throw new Error('Unable to determine output slug for course');
  }

  const outputPath = outArg
    ? resolve(REPO_ROOT, outArg)
    : resolve(REPO_ROOT, 'docs', 'data', `${effectiveSlug}.course.json`);

  await mkdir(dirname(outputPath), { recursive: true });
  await writeFile(outputPath, `${JSON.stringify(normalized, null, 2)}\n`);

  const relPath = relative(REPO_ROOT, outputPath) || outputPath;
  console.log(`Saved course data to ${relPath}`);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
