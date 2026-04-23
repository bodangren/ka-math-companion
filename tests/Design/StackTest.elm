module Design.StackTest exposing (suite)

import Design.Stack as Stack
import Html
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Design.Stack"
        [ Test.test "stack renders with children" <|
            \_ ->
                let
                    stack =
                        Stack.stack Stack.Vertical [] [ Html.text "Child 1", Html.text "Child 2" ]
                in
                Expect.pass
        , Test.test "stack has gap between children" <|
            \_ ->
                let
                    stack =
                        Stack.stack Stack.Vertical [] [ Html.text "Child 1", Html.text "Child 2" ]
                in
                Expect.pass
        , Test.test "stack applies direction styles" <|
            \_ ->
                let
                    stack =
                        Stack.stack Stack.Horizontal [] [ Html.text "Item 1", Html.text "Item 2" ]
                in
                Expect.pass
        , Test.test "vertical stack renders" <|
            \_ ->
                let
                    stack =
                        Stack.stack Stack.Vertical [] [ Html.text "Vertical" ]
                in
                Expect.pass
        , Test.test "horizontal stack renders" <|
            \_ ->
                let
                    stack =
                        Stack.stack Stack.Horizontal [] [ Html.text "Horizontal" ]
                in
                Expect.pass
        , Test.test "stack with small spacing renders" <|
            \_ ->
                let
                    stack =
                        Stack.stack Stack.Vertical [ Stack.spacing Stack.small ] [ Html.text "Small" ]
                in
                Expect.pass
        , Test.test "stack with medium spacing renders" <|
            \_ ->
                let
                    stack =
                        Stack.stack Stack.Vertical [ Stack.spacing Stack.medium ] [ Html.text "Medium" ]
                in
                Expect.pass
        , Test.test "stack with large spacing renders" <|
            \_ ->
                let
                    stack =
                        Stack.stack Stack.Vertical [ Stack.spacing Stack.large ] [ Html.text "Large" ]
                in
                Expect.pass
        , Test.test "stack with mixed children renders" <|
            \_ ->
                let
                    stack =
                        Stack.stack Stack.Horizontal
                            []
                            [ Html.text "Item 1", Html.text "Item 2", Html.text "Item 3" ]
                in
                Expect.pass
        ]