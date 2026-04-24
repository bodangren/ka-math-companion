module Design.AlertTest exposing (suite)

import Design.Alert as Alert
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Design.Alert"
        [ Test.test "info alert renders" <|
            \_ ->
                let
                    alert =
                        Alert.alert Alert.Info [] [ Html.text "Information message" ]
                in
                Expect.pass
        , Test.test "success alert renders" <|
            \_ ->
                let
                    alert =
                        Alert.alert Alert.Success [] [ Html.text "Success message" ]
                in
                Expect.pass
        , Test.test "warning alert renders" <|
            \_ ->
                let
                    alert =
                        Alert.alert Alert.Warning [] [ Html.text "Warning message" ]
                in
                Expect.pass
        , Test.test "error alert renders" <|
            \_ ->
                let
                    alert =
                        Alert.alert Alert.Error [] [ Html.text "Error message" ]
                in
                Expect.pass
        ]
