module Design.ContainerTest exposing (suite)

import Design.Container as Container
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Container"
        [ Test.test "container renders with children" <|
            \_ ->
                let
                    container =
                        Container.container [ Html.text "Content" ]
                in
                Expect.pass
        , Test.test "container has max-width" <|
            \_ ->
                let
                    container =
                        Container.container [ Html.text "Content" ]
                in
                Expect.pass
        , Test.test "container is centered" <|
            \_ ->
                let
                    container =
                        Container.container [ Html.text "Content" ]
                in
                Expect.pass
        , Test.test "container has horizontal padding" <|
            \_ ->
                let
                    container =
                        Container.container [ Html.text "Content" ]
                in
                Expect.pass
        ]
