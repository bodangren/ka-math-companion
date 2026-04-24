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
                        Container.container [] [ Html.text "Content" ]
                in
                Expect.pass
        , Test.test "container has max-width" <|
            \_ ->
                let
                    container =
                        Container.container [] [ Html.text "Content" ]
                in
                Expect.pass
        , Test.test "container is centered" <|
            \_ ->
                let
                    container =
                        Container.container [] [ Html.text "Content" ]
                in
                Expect.pass
        , Test.test "container has horizontal padding" <|
            \_ ->
                let
                    container =
                        Container.container [] [ Html.text "Content" ]
                in
                Expect.pass
        , Test.describe "width variants"
            [ Test.test "container with mobile width" <|
                \_ ->
                    let
                        container =
                            Container.container [ Container.mobile ] [ Html.text "Mobile" ]
                    in
                    Expect.pass
            , Test.test "container with tablet width" <|
                \_ ->
                    let
                        container =
                            Container.container [ Container.tablet ] [ Html.text "Tablet" ]
                    in
                    Expect.pass
            , Test.test "container with desktop width" <|
                \_ ->
                    let
                        container =
                            Container.container [ Container.desktop ] [ Html.text "Desktop" ]
                    in
                    Expect.pass
            , Test.test "container with wide width" <|
                \_ ->
                    let
                        container =
                            Container.container [ Container.wide ] [ Html.text "Wide" ]
                    in
                    Expect.pass
            , Test.test "container with full width" <|
                \_ ->
                    let
                        container =
                            Container.container [ Container.full ] [ Html.text "Full" ]
                    in
                    Expect.pass
            ]
        ]
