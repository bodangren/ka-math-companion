module Data.IntegratedMath3Test exposing (suite)

import Data.IntegratedMath3 as IntegratedMath3
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Data.IntegratedMath3"
        [ Test.test "course has correct title" <|
            \_ ->
                Expect.equal IntegratedMath3.course.title "Integrated Math 3"
        , Test.test "course has correct slug" <|
            \_ ->
                Expect.equal IntegratedMath3.course.slug "integrated-math-3"
        , Test.test "course has 13 units" <|
            \_ ->
                Expect.equal (List.length IntegratedMath3.course.units) 13
        , Test.test "first unit is Polynomial Arithmetic" <|
            \_ ->
                let
                    firstUnit =
                        List.head IntegratedMath3.course.units
                in
                case firstUnit of
                    Just unit ->
                        Expect.equal unit.title "Polynomial Arithmetic"

                    Nothing ->
                        Expect.fail "No units found"
        , Test.test "first unit has correct slug" <|
            \_ ->
                let
                    firstUnit =
                        List.head IntegratedMath3.course.units
                in
                case firstUnit of
                    Just unit ->
                        Expect.equal unit.slug "polynomial-arithmetic"

                    Nothing ->
                        Expect.fail "No units found"
        , Test.test "Unit 2 lessons have non-empty objectives" <|
            \_ ->
                let
                    unit2 =
                        IntegratedMath3.course.units
                            |> List.drop 1
                            |> List.head
                in
                case unit2 of
                    Just unit ->
                        unit.lessons
                            |> List.map (\lesson -> List.length lesson.objectives > 0)
                            |> List.all identity
                            |> Expect.equal True

                    Nothing ->
                        Expect.fail "Unit 2 not found"
        , Test.test "Unit 3 lessons have non-empty objectives" <|
            \_ ->
                let
                    unit3 =
                        IntegratedMath3.course.units
                            |> List.drop 2
                            |> List.head
                in
                case unit3 of
                    Just unit ->
                        unit.lessons
                            |> List.map (\lesson -> List.length lesson.objectives > 0)
                            |> List.all identity
                            |> Expect.equal True

                    Nothing ->
                        Expect.fail "Unit 3 not found"
        , Test.test "Unit 4 lessons have non-empty objectives" <|
            \_ ->
                let
                    unit4 =
                        IntegratedMath3.course.units
                            |> List.drop 3
                            |> List.head
                in
                case unit4 of
                    Just unit ->
                        unit.lessons
                            |> List.map (\lesson -> List.length lesson.objectives > 0)
                            |> List.all identity
                            |> Expect.equal True

                    Nothing ->
                        Expect.fail "Unit 4 not found"
        , Test.test "Unit 7 (Equations) lessons have non-empty objectives" <|
            \_ ->
                let
                    unit7 =
                        IntegratedMath3.course.units
                            |> List.drop 6
                            |> List.head
                in
                case unit7 of
                    Just unit ->
                        unit.lessons
                            |> List.map (\lesson -> List.length lesson.objectives > 0)
                            |> List.all identity
                            |> Expect.equal True

                    Nothing ->
                        Expect.fail "Unit 7 not found"
        , Test.test "Unit 9 (Modeling) lessons have non-empty objectives" <|
            \_ ->
                let
                    unit9 =
                        IntegratedMath3.course.units
                            |> List.drop 8
                            |> List.head
                in
                case unit9 of
                    Just unit ->
                        unit.lessons
                            |> List.map (\lesson -> List.length lesson.objectives > 0)
                            |> List.all identity
                            |> Expect.equal True

                    Nothing ->
                        Expect.fail "Unit 9 not found"
        , Test.test "Unit 10 (Study Design) lessons have non-empty objectives" <|
            \_ ->
                let
                    unit10 =
                        IntegratedMath3.course.units
                            |> List.drop 9
                            |> List.head
                in
                case unit10 of
                    Just unit ->
                        unit.lessons
                            |> List.map (\lesson -> List.length lesson.objectives > 0)
                            |> List.all identity
                            |> Expect.equal True

                    Nothing ->
                        Expect.fail "Unit 10 not found"
        , Test.test "Unit 11 (Binomial Probability) lessons have non-empty objectives" <|
            \_ ->
                let
                    unit11 =
                        IntegratedMath3.course.units
                            |> List.drop 10
                            |> List.head
                in
                case unit11 of
                    Just unit ->
                        unit.lessons
                            |> List.map (\lesson -> List.length lesson.objectives > 0)
                            |> List.all identity
                            |> Expect.equal True

                    Nothing ->
                        Expect.fail "Unit 11 not found"
        , Test.test "Unit 12 (Normal Distributions) lessons have non-empty objectives" <|
            \_ ->
                let
                    unit12 =
                        IntegratedMath3.course.units
                            |> List.drop 11
                            |> List.head
                in
                case unit12 of
                    Just unit ->
                        unit.lessons
                            |> List.map (\lesson -> List.length lesson.objectives > 0)
                            |> List.all identity
                            |> Expect.equal True

                    Nothing ->
                        Expect.fail "Unit 12 not found"
        , Test.test "All lessons have non-empty descriptions" <|
            \_ ->
                let
                    lessonsWithEmptyDescriptions =
                        IntegratedMath3.course.units
                            |> List.concatMap (\unit -> List.map (\lesson -> ( unit.title, lesson.title, lesson.description )) unit.lessons)
                            |> List.filter (\( _, _, description ) -> String.isEmpty description)
                in
                case lessonsWithEmptyDescriptions of
                    [] ->
                        Expect.pass

                    first :: rest ->
                        let
                            ( unitTitle, lessonTitle, _ ) =
                                first

                            count =
                                1 + List.length rest
                        in
                        Expect.fail <|
                            String.fromInt count
                                ++ " lesson(s) missing descriptions: "
                                ++ lessonTitle
                                ++ " in "
                                ++ unitTitle
        , Test.test "Unit 7 (Equations) lessons have non-empty descriptions" <|
            \_ ->
                let
                    unit7 =
                        IntegratedMath3.course.units
                            |> List.drop 6
                            |> List.head
                in
                case unit7 of
                    Just unit ->
                        unit.lessons
                            |> List.map (\lesson -> String.length lesson.description > 0)
                            |> List.all identity
                            |> Expect.equal True

                    Nothing ->
                        Expect.fail "Unit 7 not found"
        , Test.test "All lessons have positive estimatedMinutes" <|
            \_ ->
                let
                    lessonsWithInvalidTime =
                        IntegratedMath3.course.units
                            |> List.concatMap (\unit -> List.map (\lesson -> ( unit.title, lesson.title, lesson.estimatedMinutes )) unit.lessons)
                            |> List.filter (\( _, _, minutes ) -> minutes <= 0)
                in
                case lessonsWithInvalidTime of
                    [] ->
                        Expect.pass

                    first :: rest ->
                        let
                            ( unitTitle, lessonTitle, minutes ) =
                                first

                            count =
                                1 + List.length rest
                        in
                        Expect.fail <|
                            String.fromInt count
                                ++ " lesson(s) with invalid time estimates: "
                                ++ lessonTitle
                                ++ " in "
                                ++ unitTitle
                                ++ " has "
                                ++ String.fromInt minutes
                                ++ " minutes"
        , Test.test "All lessons have non-empty objectives" <|
            \_ ->
                let
                    lessonsWithEmptyObjectives =
                        IntegratedMath3.course.units
                            |> List.concatMap (\unit -> List.map (\lesson -> ( unit.title, lesson.title, lesson.objectives )) unit.lessons)
                            |> List.filter (\( _, _, objectives ) -> List.isEmpty objectives)
                in
                case lessonsWithEmptyObjectives of
                    [] ->
                        Expect.pass

                    first :: rest ->
                        let
                            ( unitTitle, lessonTitle, _ ) =
                                first

                            count =
                                1 + List.length rest
                        in
                        Expect.fail <|
                            String.fromInt count
                                ++ " lesson(s) missing objectives: "
                                ++ lessonTitle
                                ++ " in "
                                ++ unitTitle
        ]
