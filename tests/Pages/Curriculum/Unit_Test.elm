module Pages.Curriculum.Unit_Test exposing (suite)

import Expect
import Html
import Pages.Curriculum.Unit_ as Unit
import Test
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)


suite : Test.Test
suite =
    Test.describe "Pages.Curriculum.Unit_"
        [ Test.test "page has correct title for polynomial-arithmetic unit" <|
            \_ ->
                let
                    params =
                        { unit = "polynomial-arithmetic"
                        }
                in
                Unit.page params
                    |> .title
                    |> Expect.equal "Polynomial Arithmetic - KA Math Companion"
        , Test.test "page body contains unit title" <|
            \_ ->
                let
                    params =
                        { unit = "polynomial-arithmetic"
                        }
                in
                Unit.page params
                    |> .body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Polynomial Arithmetic" ]
        , Test.test "page body contains lesson titles" <|
            \_ ->
                let
                    params =
                        { unit = "polynomial-arithmetic"
                        }
                in
                Unit.page params
                    |> .body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Intro to polynomials" ]
        , Test.test "page uses Header component with brand" <|
            \_ ->
                let
                    params =
                        { unit = "polynomial-arithmetic"
                        }

                    view =
                        Unit.page params
                in
                view.body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "KA Math Companion" ]
        , Test.test "page contains back link to curriculum" <|
            \_ ->
                let
                    params =
                        { unit = "polynomial-arithmetic"
                        }
                in
                Unit.page params
                    |> .body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "← Back to Curriculum" ]
        ]