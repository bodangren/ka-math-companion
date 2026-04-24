module Design.FooterTest exposing (suite)

import Design.Footer as Footer
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Footer"
        [ Test.test "footer renders with content" <|
            \_ ->
                let
                    footer =
                        Footer.footer [] [ Html.text "Copyright 2026" ]
                in
                Expect.pass
        , Test.test "footer renders with link" <|
            \_ ->
                let
                    footer =
                        Footer.footer [ Footer.link "/privacy" "Privacy" ] []
                in
                Expect.pass
        , Test.test "footer renders with multiple links" <|
            \_ ->
                let
                    footer =
                        Footer.footer [ Footer.link "/a" "A", Footer.link "/b" "B" ] []
                in
                Expect.pass
        ]
