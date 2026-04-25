module Pages.Home_Test exposing (suite)

import Expect
import Html
import Pages.Home_ as Home
import Test
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)


suite : Test.Test
suite =
    Test.describe "Pages.Home_"
        [ Test.test "page has correct title" <|
            \_ ->
                Home.page.title
                    |> Expect.equal "KA Math Companion"
        , Test.test "page body contains heading with app name" <|
            \_ ->
                Home.page.body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "KA Math Companion" ]
        , Test.test "page body contains description" <|
            \_ ->
                Home.page.body
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "A technical companion to Khan Academy Integrated Math 3" ]
        ]
