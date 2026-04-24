module Data.CurriculumTest exposing (suite)

import Data.Curriculum exposing (Course, Lesson, Unit)
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
                            , objectives = [ "Define polynomial, degree, leading coefficient, and standard form" ]
                            , description = "Learn the basics of polynomials"
                            , estimatedMinutes = 30
                            }
                    in
                    Expect.equal lesson.title "Intro to polynomials"
            , Test.test "lesson has description field" <|
                \_ ->
                    let
                        lesson : Lesson
                        lesson =
                            { title = "Test"
                            , slug = "test"
                            , objectives = []
                            , description = "Test description"
                            , estimatedMinutes = 15
                            }
                    in
                    Expect.equal lesson.description "Test description"
            , Test.test "lesson has estimatedMinutes field" <|
                \_ ->
                    let
                        lesson : Lesson
                        lesson =
                            { title = "Test"
                            , slug = "test"
                            , objectives = []
                            , description = "Test"
                            , estimatedMinutes = 45
                            }
                    in
                    Expect.equal lesson.estimatedMinutes 45
            ]
        ]
