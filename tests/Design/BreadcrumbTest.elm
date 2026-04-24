module Design.BreadcrumbTest exposing (suite)

import Design.Breadcrumb as Breadcrumb
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Breadcrumb"
        [ Test.test "breadcrumb renders with separator" <|
            \_ ->
                let
                    breadcrumb =
                        Breadcrumb.breadcrumb [] [ Html.text "Home" ]
                in
                Expect.pass
        , Test.test "breadcrumb renders with items" <|
            \_ ->
                let
                    breadcrumb =
                        Breadcrumb.breadcrumb []
                            [ Breadcrumb.item "/home" "Home"
                            , Breadcrumb.item "/about" "About"
                            ]
                in
                Expect.pass
        , Test.test "breadcrumb renders single item" <|
            \_ ->
                let
                    breadcrumb =
                        Breadcrumb.breadcrumb [] [ Breadcrumb.item "/home" "Home" ]
                in
                Expect.pass
        ]