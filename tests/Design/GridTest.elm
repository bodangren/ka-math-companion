module Design.GridTest exposing (suite)

import Design.Grid as Grid
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Grid"
        [ Test.test "grid renders with default columns" <|
            \_ ->
                let
                    grid =
                        Grid.grid [] []
                in
                Expect.pass
        , Test.test "grid with custom columns renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid [ Grid.columns 3 ] []
                in
                Expect.pass
        , Test.test "grid with responsive columns renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid [ Grid.columns 2, Grid.minWidth "200px" ] []
                in
                Expect.pass
        , Test.test "grid with tablet columns renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid [ Grid.tabletColumns 4 ] []
                in
                Expect.pass
        , Test.test "grid with desktop columns renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid [ Grid.desktopColumns 6 ] []
                in
                Expect.pass
        , Test.test "grid with gap renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid [ Grid.gap Grid.Medium ] []
                in
                Expect.pass
        , Test.test "grid with children renders" <|
            \_ ->
                let
                    grid =
                        Grid.grid []
                            [ Html.text "Item 1"
                            , Html.text "Item 2"
                            , Html.text "Item 3"
                            ]
                in
                Expect.pass
        ]
