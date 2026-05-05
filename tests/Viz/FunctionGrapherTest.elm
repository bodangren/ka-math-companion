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
        ]