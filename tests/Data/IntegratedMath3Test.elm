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
        ]
