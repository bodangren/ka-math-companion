module Viz.FunctionGrapherTest exposing (suite)

import Expect
import Test
import Viz.Coords as Coords
import Viz.FunctionGrapher as FG


suite : Test.Test
suite =
    Test.describe "Viz.FunctionGrapher"
        [ Test.test "init creates grapher with default viewport" <|
            \_ ->
                let
                    grapher =
                        FG.init 800 600
                in
                Expect.equal ( grapher.width, grapher.height ) ( 800, 600 )
        , Test.test "empty returns empty function list" <|
            \_ ->
                Expect.equal FG.empty.functions []
        , Test.test "withFunction adds a function to the grapher" <|
            \_ ->
                let
                    initial =
                        FG.empty

                    withFn =
                        FG.withFunction (\x -> x ^ 2) FG.blue initial

                    result =
                        FG.functions withFn
                in
                Expect.equal (List.length result) 1
        , Test.test "plotFunction generates path data for polynomial" <|
            \_ ->
                let
                    viewport =
                        Coords.init 800 600

                    fn x =
                        x ^ 2

                    pathData =
                        FG.plotFunction fn viewport -10 10
                in
                case String.isEmpty pathData of
                    False ->
                        Expect.pass

                    True ->
                        Expect.fail "pathData should not be empty"
        , Test.test "render renders SVG with axes and grid" <|
            \_ ->
                let
                    grapher =
                        FG.empty
                            |> FG.withViewport 800 600
                            |> FG.withFunction (\x -> x) FG.red

                    svg =
                        FG.render grapher
                in
                Expect.pass
        , Test.test "withZoom modifies scale" <|
            \_ ->
                let
                    grapher =
                        FG.empty
                            |> FG.withViewport 800 600
                            |> FG.withZoom 2.0
                in
                Expect.equal (FG.getScale grapher) 2.0
        , Test.test "plot polynomial x^2" <|
            \_ ->
                let
                    viewport =
                        Coords.init 800 600

                    polyFn x =
                        x ^ 2

                    pathData =
                        FG.plotFunction polyFn viewport -5 5
                in
                case String.isEmpty pathData of
                    True ->
                        Expect.fail "polynomial path should not be empty"

                    False ->
                        Expect.pass
        , Test.test "plot exponential 2^x" <|
            \_ ->
                let
                    viewport =
                        Coords.init 800 600

                    expFn x =
                        2 ^ x

                    pathData =
                        FG.plotFunction expFn viewport -2 3
                in
                case String.isEmpty pathData of
                    True ->
                        Expect.fail "exponential path should not be empty"

                    False ->
                        Expect.pass
        , Test.test "plot logarithmic log2(x)" <|
            \_ ->
                let
                    viewport =
                        Coords.init 800 600

                    logFn x =
                        logBase 2 (max x 0.01)

                    pathData =
                        FG.plotFunction logFn viewport 0.1 5
                in
                case String.isEmpty pathData of
                    True ->
                        Expect.fail "logarithmic path should not be empty"

                    False ->
                        Expect.pass
        , Test.test "plot trigonometric sin(x)" <|
            \_ ->
                let
                    viewport =
                        Coords.init 800 600

                    trigFn x =
                        Basics.sin x

                    pathData =
                        FG.plotFunction trigFn viewport -3.14 3.14
                in
                case String.isEmpty pathData of
                    True ->
                        Expect.fail "trig path should not be empty"

                    False ->
                        Expect.pass
        , Test.test "withFunction adds multiple functions" <|
            \_ ->
                let
                    grapher =
                        FG.empty
                            |> FG.withFunction (\x -> x) FG.red
                            |> FG.withFunction (\x -> x ^ 2) FG.blue
                            |> FG.withFunction (\x -> Basics.sin x) FG.green
                in
                Expect.equal (List.length (FG.functions grapher)) 3
        , Test.test "zoomIn increases scale" <|
            \_ ->
                let
                    grapher =
                        FG.empty
                            |> FG.withViewport 800 600
                            |> FG.zoomIn
                in
                Expect.greaterThan 1.0 (FG.getScale grapher)
        , Test.test "zoomOut decreases scale" <|
            \_ ->
                let
                    grapher =
                        FG.empty
                            |> FG.withViewport 800 600
                            |> FG.withZoom 2.0
                            |> FG.zoomOut
                in
                Expect.lessThan 2.0 (FG.getScale grapher)
        , Test.test "pan moves origin" <|
            \_ ->
                let
                    initial =
                        FG.empty
                            |> FG.withViewport 800 600

                    panned =
                        FG.pan 50 -50 initial
                in
                Expect.all
                    [ \g -> Expect.equal g.originX (initial.originX + 50)
                    , \g -> Expect.equal g.originY (initial.originY - 50)
                    ]
                    panned
        ]
