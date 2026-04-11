module Data.IntegratedMath3Test exposing (suite)

import Data.IntegratedMath3 as IntegratedMath3
import Data.Curriculum exposing (Unit)
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
        ]
