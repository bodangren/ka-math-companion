module Data.LessonContent_Test exposing (suite)

import Data.LessonContent exposing (ContentBlock(..), Step, explanation, definition, example, checkQuestion)
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Data.LessonContent"
        [ Test.test "explanation creates Explanation block" <|
            \_ ->
                let
                    block =
                        explanation "This is an explanation"
                in
                case block of
                    Explanation text ->
                        Expect.equal text "This is an explanation"

                    _ ->
                        Expect.fail "Expected Explanation block"
        , Test.test "definition creates Definition block" <|
            \_ ->
                let
                    block =
                        definition "Polynomial" "A sum of terms with non-negative integer exponents"
                in
                case block of
                    Definition term def ->
                        Expect.equal ( term, def ) ( "Polynomial", "A sum of terms with non-negative integer exponents" )

                    _ ->
                        Expect.fail "Expected Definition block"
        , Test.test "example creates WorkedExample" <|
            \_ ->
                let
                    step =
                        Step "Multiply x by itself" "x \\cdot x = x^2"
                    ex =
                        example "(x+1)^2" [ step ] "x^2 + 2x + 1"
                in
                Expect.equal ( ex.problem, ex.result ) ( "(x+1)^2", "x^2 + 2x + 1" )
        , Test.test "checkQuestion creates CheckQuestion" <|
            \_ ->
                let
                    q =
                        checkQuestion "What is (x+1)^2?" "x^2 + 2x + 1" (Just "Expand the binomial")
                in
                Expect.equal ( q.question, q.answer, q.hint ) ( "What is (x+1)^2?", "x^2 + 2x + 1", Just "Expand the binomial" )
        ]