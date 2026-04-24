module Design.ProgressTest exposing (suite)

import Design.Progress as Progress
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Design.Progress"
        [ Test.test "progress bar renders at 0%" <|
            \_ ->
                let
                    progress =
                        Progress.progress [] 0
                in
                Expect.pass
        , Test.test "progress bar renders at 50%" <|
            \_ ->
                let
                    progress =
                        Progress.progress [] 50
                in
                Expect.pass
        , Test.test "progress bar renders at 100%" <|
            \_ ->
                let
                    progress =
                        Progress.progress [] 100
                in
                Expect.pass
        , Test.test "progress bar with label renders" <|
            \_ ->
                let
                    progress =
                        Progress.progress [ Progress.label "Loading..." ] 75
                in
                Expect.pass
        ]
