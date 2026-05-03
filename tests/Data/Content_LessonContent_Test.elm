module Data.Content_LessonContent_Test exposing (suite)

import Data.LessonContent exposing (getContent)
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Data.LessonContent.getContent"
        [ Test.test "returns content for known lesson" <|
            \_ ->
                let
                    content =
                        getContent "polynomial-arithmetic" "intro-to-polynomials"
                in
                case content of
                    Just c ->
                        Expect.equal c.unitSlug "polynomial-arithmetic"

                    Nothing ->
                        Expect.fail "Expected content but got Nothing"
        , Test.test "returns Nothing for unknown lesson" <|
            \_ ->
                let
                    content =
                        getContent "unknown-unit" "unknown-lesson"
                in
                Expect.equal content Nothing
        ]