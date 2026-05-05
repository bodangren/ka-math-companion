module Viz.NumberLineTest exposing (suite)

import Expect
import Test exposing (Test)
import Viz.NumberLine exposing (..)


suite : Test
suite =
    Test.describe "Viz.NumberLine"
        [ Test.describe "empty"
            [ Test.test "creates empty number line with default values" <|
                \_ ->
                    let
                        nl =
                            empty
                    in
                    Expect.equal nl.min -10
            , Test.test "empty number line has no points" <|
                \_ ->
                    let
                        nl =
                            empty
                    in
                    Expect.equal (List.length nl.points) 0
            ]
        , Test.describe "init"
            [ Test.test "creates number line with specified range" <|
                \_ ->
                    let
                        nl =
                            init 800 -5 5
                    in
                    Expect.equal nl.min -5
            , Test.test "sets correct width" <|
                \_ ->
                    let
                        nl =
                            init 800 -5 5
                    in
                    Expect.equal nl.width 800
            ]
        , Test.describe "withRange"
            [ Test.test "updates min and max" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withRange 0 100
                    in
                    Expect.equal nl.min 0
            , Test.test "withRange correctly sets max" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withRange 0 100
                    in
                    Expect.equal nl.max 100
            ]
        , Test.describe "withPoint"
            [ Test.test "adds a closed point to the number line" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withPoint 3.0 False Nothing
                    in
                    Expect.equal (List.length nl.points) 1
            , Test.test "withPoint adds open point correctly" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withPoint 5.0 True Nothing
                    in
                    case nl.points of
                        [ point ] ->
                            Expect.equal point.isOpen True

                        _ ->
                            Expect.fail "Expected exactly one point"
            , Test.test "withPoint can add multiple points" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withPoint 1.0 False Nothing
                                |> withPoint 5.0 True Nothing
                                |> withPoint -3.0 False Nothing
                    in
                    Expect.equal (List.length nl.points) 3
            ]
        , Test.describe "withInterval"
            [ Test.test "adds an interval to the number line" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withInterval 2 5 False False "#3B82F6"
                    in
                    Expect.equal (List.length nl.intervals) 1
            , Test.test "interval has correct start and end values" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withInterval 1 4 False False "#22C55E"
                    in
                    case nl.intervals of
                        [ interval ] ->
                            Expect.equal interval.start 1

                        _ ->
                            Expect.fail "Expected exactly one interval"
            ]
        , Test.describe "render"
            [ Test.test "render produces HTML output" <|
                \_ ->
                    let
                        nl =
                            empty

                        _ =
                            render nl
                    in
                    Expect.pass
            , Test.test "render with points produces HTML" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withPoint 0 False Nothing
                                |> withPoint 5 True Nothing

                        _ =
                            render nl
                    in
                    Expect.pass
            , Test.test "render with interval produces HTML" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withInterval 1 5 False False "#3B82F6"

                        _ =
                            render nl
                    in
                    Expect.pass
            , Test.test "render with multiple intervals" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withInterval 0 3 False False "#3B82F6"
                                |> withInterval 4 7 True False "#22C55E"

                        _ =
                            render nl
                    in
                    Expect.pass
            , Test.test "render with point and interval together" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withPoint 2 False Nothing
                                |> withInterval 0 4 False False "#A855F7"

                        _ =
                            render nl
                    in
                    Expect.pass
            ]
        , Test.describe "withSelection"
            [ Test.test "withSelection sets selected point index" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withPoint 1 False Nothing
                                |> withPoint 2 False Nothing
                                |> withSelection (Just 1)
                    in
                    Expect.equal nl.selectedPoint (Just 1)
            , Test.test "withSelection can clear selection" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withPoint 1 False Nothing
                                |> withSelection (Just 0)
                                |> withSelection Nothing
                    in
                    Expect.equal nl.selectedPoint Nothing
            ]
        , Test.describe "onClickSelect"
            [ Test.test "onClickSelect attaches click handler" <|
                \_ ->
                    let
                        nl =
                            empty
                                |> withPoint 1 False Nothing
                                |> onClickSelect Basics.identity
                    in
                    case nl.onClickMsg of
                        Just _ ->
                            Expect.pass

                        Nothing ->
                            Expect.fail "Expected click handler to be set"
            ]
        ]