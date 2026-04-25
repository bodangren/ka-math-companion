module Design.BadgeTest exposing (suite)

import Design.Badge as Badge
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Badge"
        [ Test.test "neutral badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge Badge.Neutral "Neutral"
                in
                Expect.pass
        , Test.test "success badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge Badge.Success "Success"
                in
                Expect.pass
        , Test.test "warning badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge Badge.Warning "Warning"
                in
                Expect.pass
        , Test.test "error badge renders" <|
            \_ ->
                let
                    badge =
                        Badge.badge Badge.Error "Error"
                in
                Expect.pass
        ]
