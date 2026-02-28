module Pages.Curriculum.Unit_.Lesson_Test exposing (suite)

import Html
import Pages.Curriculum.Unit_.Lesson_ as Lesson
import Test
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)


suite : Test.Test
suite =
    Test.describe "Pages.Curriculum.Unit_.Lesson_"
        [ Test.test "page renders lesson title" <|
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
        ]
