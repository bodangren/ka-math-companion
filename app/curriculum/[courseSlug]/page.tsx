import type { Metadata } from "next";
import { notFound } from "next/navigation";

import {
  CurriculumNotFoundError,
  type CurriculumCourse,
  getCurriculum,
  listCurricula,
} from "../../../lib/getCurriculum";
import { CurriculumOverview } from "../CurriculumOverview";

type PageProps = {
  params: {
    courseSlug: string;
  };
};

function tryGetCurriculum(slug: string): CurriculumCourse | null {
  try {
    return getCurriculum(slug);
  } catch (error) {
    if (error instanceof CurriculumNotFoundError) {
      return null;
    }
    throw error;
  }
}

export function generateStaticParams() {
  return listCurricula().map(({ slug }) => ({ courseSlug: slug }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { courseSlug } = params;
  const course = tryGetCurriculum(courseSlug);
  if (!course) {
    return {
      title: "Curriculum not found · KA Math Companion",
      description: "We couldn’t find that curriculum. Check the course list for available sequences.",
    };
  }

  return {
    title: `${course.title} · KA Math Companion`,
    description: course.description,
  };
}

export default async function CurriculumCoursePage({ params }: PageProps) {
  const { courseSlug } = params;
  const course = tryGetCurriculum(courseSlug);

  if (!course) {
    notFound();
  }

  return <CurriculumOverview course={course} courseSlug={courseSlug} />;
}
