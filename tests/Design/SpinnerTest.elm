module Design.SpinnerTest exposing (suite)

import Design.Spinner as Spinner
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Design.Spinner"
        [ Test.test "spinner renders" <|
            \_ ->
                let
                    spinner =
                        Spinner.spinner []
                in
                Expect.pass
        , Test.test "small spinner renders" <|
            \_ ->
                let
                    spinner =
                        Spinner.spinner [ Spinner.small ]
                in
                Expect.pass
        , Test.test "medium spinner renders" <|
            \_ ->
                let
                    spinner =
                        Spinner.spinner [ Spinner.medium ]
                in
                Expect.pass
        , Test.test "large spinner renders" <|
            \_ ->
                Expect.pass
        ]
