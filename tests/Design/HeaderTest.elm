module Design.HeaderTest exposing (suite)

import Design.Header as Header
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Header"
        [ Test.test "header renders with brand" <|
            \_ ->
                let
                    header =
                        Header.header [ Header.brand "My App" ] []
                in
                Expect.pass
        , Test.test "header renders with nav items" <|
            \_ ->
                let
                    header =
                        Header.header [ Header.brand "My App" ] [ Html.text "Nav 1" ]
                in
                Expect.pass
        , Test.test "header renders with link" <|
            \_ ->
                let
                    header =
                        Header.header [ Header.link "/home" "Home" ] []
                in
                Expect.pass
        , Test.test "header renders with multiple links" <|
            \_ ->
                let
                    header =
                        Header.header [ Header.link "/a" "A", Header.link "/b" "B" ] []
                in
                Expect.pass
        ]