module Data.CurriculumTest exposing (suite)

import Data.Curriculum exposing (Course, Lesson, Objective, Unit)
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Data.Curriculum"
        [ Test.describe "Course"
            [ Test.test "can create a course with title and slug" <|
                \_ ->
                    let
                        course : Course
                        course =
                            { title = "Integrated Math 3"
                            , slug = "integrated-math-3"
                            , units = []
                            }
                    in
                    Expect.equal course.title "Integrated Math 3"
            ]
        , Test.describe "Unit"
            [ Test.test "can create a unit with title, slug, and lessons" <|
                \_ ->
                    let
                        unit : Unit
                        unit =
                            { title = "Polynomial Arithmetic"
                            , slug = "polynomial-arithmetic"
                            , lessons = []
                            }
                    in
                    Expect.equal unit.title "Polynomial Arithmetic"
            ]
        , Test.describe "Lesson"
            [ Test.test "can create a lesson with title, slug, and objectives" <|
                \_ ->
                    let
                        lesson : Lesson
                        lesson =
                            { title = "Intro to polynomials"
                            , slug = "intro-to-polynomials"
                            , objectives = []
                            }
                    in
                    Expect.equal lesson.title "Intro to polynomials"
            ]
        , Test.describe "Objective"
            [ Test.test "can create an objective with description" <|
                \_ ->
                    let
                        objective : Objective
                        objective =
                            { description = "Understand polynomial structure"
                            }
                    in
                    Expect.equal objective.description "Understand polynomial structure"
            ]
        ]
