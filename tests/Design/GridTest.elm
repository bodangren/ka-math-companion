module Design.GridTest exposing (suite)

import Design.Grid as Grid
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Grid"
        [ Test.test "grid renders with children" <|
            \_ ->
                let
                    grid =
                        Grid.grid []
                            [ Html.text "Item 1"
                            , Html.text "Item 2"
                            ]
                in
                Expect.pass
        , Test.test "grid with columns renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid [ Grid.columns 3 ]
                            [ Html.text "Item 1" ]
                in
                Expect.pass
        , Test.test "grid with minWidth renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid [ Grid.minWidth "250px" ]
                            [ Html.text "Item" ]
                in
                Expect.pass
        , Test.test "grid with gap renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid [ Grid.gap Grid.Medium ]
                            [ Html.text "Item" ]
                in
                Expect.pass
        , Test.test "grid with large gap renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid [ Grid.gap Grid.Large ]
                            [ Html.text "Item" ]
                in
                Expect.pass
        ]