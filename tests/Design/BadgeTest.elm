module Design.BadgeTest exposing (suite)

import Design.Badge as Badge
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Badge"
        [ Test.test "default badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge [] [ Html.text "Default" ]
                in
                Expect.pass
        , Test.test "primary badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge [ Badge.primary ] [ Html.text "Primary" ]
                in
                Expect.pass
        , Test.test "secondary badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge [ Badge.secondary ] [ Html.text "Secondary" ]
                in
                Expect.pass
        , Test.test "success badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge [ Badge.success ] [ Html.text "Success" ]
                in
                Expect.pass
        , Test.test "warning badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge [ Badge.warning ] [ Html.text "Warning" ]
                in
                Expect.pass
        , Test.test "error badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge [ Badge.error ] [ Html.text "Error" ]
                in
                Expect.pass
        ]