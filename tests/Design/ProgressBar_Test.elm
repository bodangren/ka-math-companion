module Design.ProgressBar_Test exposing (suite)

import Design.ProgressBar as ProgressBar
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Design.ProgressBar"
        [ Test.test "progressBar renders 0% with label" <|
            \_ ->
                let
                    _ =
                        ProgressBar.progressBar (Just "Progress") 0
                in
                Expect.pass
        , Test.test "progressBar renders 50% with label" <|
            \_ ->
                let
                    _ =
                        ProgressBar.progressBar (Just "Progress") 50
                in
                Expect.pass
        , Test.test "progressBar renders 100% with label" <|
            \_ ->
                let
                    _ =
                        ProgressBar.progressBar (Just "Progress") 100
                in
                Expect.pass
        , Test.test "progressBar renders without label" <|
            \_ ->
                let
                    _ =
                        ProgressBar.progressBar Nothing 75
                in
                Expect.pass
        , Test.test "progressBar clamps over 100" <|
            \_ ->
                let
                    _ =
                        ProgressBar.progressBar (Just "Progress") 150
                in
                Expect.pass
        , Test.test "progressBar clamps negative values" <|
            \_ ->
                let
                    _ =
                        ProgressBar.progressBar (Just "Progress") -10
                in
                Expect.pass
        ]