module Pages.Curriculum.Unit.Lesson_Test exposing (suite)

import Expect
import Html
import Pages.Curriculum.Unit.Lesson_ as Lesson
import Test
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)


suite : Test.Test
suite =
    Test.describe "Pages.Curriculum.Unit.Lesson_"
        [ Test.test "page has correct title for intro-to-polynomials lesson" <|
            \_ ->
                let
                    params =
                        { unit = "polynomial-arithmetic"
                        , lesson = "intro-to-polynomials"
                        }
                in
                Lesson.page params
                    |> .title
                    |> Expect.equal "Intro to polynomials - KA Math Companion"
        , Test.test "page body contains lesson title" <|
            \_ ->
                let
                    params =
                        { unit = "polynomial-arithmetic"
                        , lesson = "intro-to-polynomials"
                        }
                in
                Lesson.page params
                    |> .body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Intro to polynomials" ]
        , Test.test "page body contains back link to unit" <|
            \_ ->
                let
                    params =
                        { unit = "polynomial-arithmetic"
                        , lesson = "intro-to-polynomials"
                        }
                in
                Lesson.page params
                    |> .body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Polynomial Arithmetic" ]
        ]
