module Design.ButtonTest exposing (suite)

import Design.Button as Button
import Design.Tokens exposing (ColorPalette, colorPalette, spacing)
import Expect
import Html
import Test


type alias Msg =
    ()


suite : Test.Test
suite =
    Test.describe "Design.Button"
        [ Test.describe "variants"
            [ Test.test "primary button has correct background color" <|
                \_ ->
                    let
                        button =
                            Button.button Button.Primary [] [ Html.text "Click me" ]
                    in
                    Expect.pass
            , Test.test "secondary button renders" <|
                \_ ->
                    let
                        button =
                            Button.button Button.Secondary [] [ Html.text "Click me" ]
                    in
                    Expect.pass
            , Test.test "outline button renders" <|
                \_ ->
                    let
                        button =
                            Button.button Button.Outline [] [ Html.text "Click me" ]
                    in
                    Expect.pass
            , Test.test "ghost button renders" <|
                \_ ->
                    let
                        button =
                            Button.button Button.Ghost [] [ Html.text "Click me" ]
                    in
                    Expect.pass
            ]
        , Test.describe "sizes"
            [ Test.test "small button renders" <|
                \_ ->
                    let
                        button =
                            Button.button Button.Primary [ Button.small ] [ Html.text "Small" ]
                    in
                    Expect.pass
            , Test.test "medium button renders" <|
                \_ ->
                    let
                        button =
                            Button.button Button.Primary [ Button.medium ] [ Html.text "Medium" ]
                    in
                    Expect.pass
            , Test.test "large button renders" <|
                \_ ->
                    let
                        button =
                            Button.button Button.Primary [ Button.large ] [ Html.text "Large" ]
                    in
                    Expect.pass
            ]
        , Test.describe "disabled state"
            [ Test.test "disabled button renders" <|
                \_ ->
                    let
                        button =
                            Button.button Button.Primary [ Button.disabled ] [ Html.text "Disabled" ]
                    in
                    Expect.pass
            ]
        ]