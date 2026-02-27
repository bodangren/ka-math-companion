module Pages.Curriculum.Unit_.Lesson_Test exposing (suite)

import Dict
import Html
import Pages.Curriculum.Unit_.Lesson_ as Lesson
import Route.Path
import Test
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)
import Url


suite : Test.Test
suite =
    Test.describe "Pages.Curriculum.Unit_.Lesson_"
        [ Test.test "view renders lesson title" <|
            \_ ->
                let
                    model =
                        {}

                    route =
                        { path = Route.Path.Curriculum_Unit__Lesson_ { unit = "polynomial-arithmetic", lesson = "intro-to-polynomials" }
                        , params = { lesson = "intro-to-polynomials" }
                        , query = Dict.empty
                        , hash = Nothing
                        , url = { protocol = Url.Http, host = "localhost", port_ = Nothing, path = "/curriculum/polynomial-arithmetic/intro-to-polynomials", query = Nothing, fragment = Nothing }
                        }
                in
                Lesson.view route model
                    |> .body
                    |> List.map (Html.map never)
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Intro to polynomials" ]
        ]
