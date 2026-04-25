module Design.CardTest exposing (suite)

import Design.Card as Card
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Card"
        [ Test.test "card renders with children" <|
            \_ ->
                let
                    card =
                        Card.card [ Html.text "Card content" ]
                in
                Expect.pass
        , Test.test "card with header renders" <|
            \_ ->
                let
                    card =
                        Card.withHeader [ Html.text "Header" ] [ Html.text "Body" ]
                in
                Expect.pass
        , Test.test "card with footer renders" <|
            \_ ->
                let
                    card =
                        Card.withFooter [ Html.text "Header" ] [ Html.text "Body" ] [ Html.text "Footer" ]
                in
                Expect.pass
        ]
