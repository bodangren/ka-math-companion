module Pages.CurriculumTest exposing (suite)

import Expect
import Html
import Pages.Curriculum as Curriculum
import Test
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)


suite : Test.Test
suite =
    Test.describe "Pages.Curriculum"
        [ Test.test "page has correct title" <|
            \_ ->
                Curriculum.page.title
                    |> Expect.equal "Curriculum - KA Math Companion"
        , Test.test "page body contains heading" <|
            \_ ->
                Curriculum.page.body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Curriculum" ]
        , Test.test "page body contains first unit title" <|
            \_ ->
                Curriculum.page.body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Polynomial Arithmetic" ]
        , Test.test "page body contains last unit title" <|
            \_ ->
                Curriculum.page.body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Rational Functions" ]
        ]
