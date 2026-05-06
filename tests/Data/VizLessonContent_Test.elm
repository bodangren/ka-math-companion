module Data.VizLessonContent_Test exposing (suite)

import Data.VizLessonContent as VizLessonContent exposing (VizBlock(..))
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Data.VizLessonContent"
        [ Test.describe "getVizContent"
            [ Test.test "returns FunctionGrapher for polynomial intro lesson"
                (\_ ->
                    case VizLessonContent.getVizContent "polynomial-arithmetic" "intro-to-polynomials" of
                        Just (FunctionGrapher _ _ _) ->
                            Expect.pass

                        _ ->
                            Expect.fail "Expected FunctionGrapher for polynomial intro"
                )
            , Test.test "returns UnitCircle for unit circle lesson"
                (\_ ->
                    case VizLessonContent.getVizContent "trigonometry" "unit-circle" of
                        Just (UnitCircle _) ->
                            Expect.pass

                        _ ->
                            Expect.fail "Expected UnitCircle for unit circle lesson"
                )
            , Test.test "returns Nothing for lesson without visualization"
                (\_ ->
                    case VizLessonContent.getVizContent "polynomial-arithmetic" "nonexistent-lesson" of
                        Nothing ->
                            Expect.pass

                        _ ->
                            Expect.fail "Expected Nothing for nonexistent lesson"
                )
            ]
        ]
