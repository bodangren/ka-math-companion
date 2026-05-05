module Viz.CoordsTest exposing (suite)

import Viz.Coords as Coords
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Viz.Coords"
        [ Test.test "init creates default viewport" <|
            \_ ->
                let
                    vp =
                        Coords.init 800 600
                in
                case vp of
                    Coords.Viewport _ ->
                        Expect.pass
        , Test.test "viewportX maps math x to screen x" <|
            \_ ->
                let
                    vp =
                        Coords.init 800 600
                    screenX =
                        Coords.viewportX 0 vp
                in
                Expect.equal 400 screenX
        , Test.test "viewportY maps math y to screen y" <|
            \_ ->
                let
                    vp =
                        Coords.init 800 600
                    screenY =
                        Coords.viewportY 0 vp
                in
                Expect.equal 300 screenY
        , Test.test "mathX maps screen x to math x" <|
            \_ ->
                let
                    vp =
                        Coords.init 800 600
                    mathX =
                        Coords.mathX 400 vp
                in
                Expect.equal 0 mathX
        , Test.test "mathY maps screen y to math y" <|
            \_ ->
                let
                    vp =
                        Coords.init 800 600
                    mathY =
                        Coords.mathY 300 vp
                in
                Expect.equal 0 mathY
        , Test.test "withZoom changes scale" <|
            \_ ->
                let
                    vp =
                        Coords.init 800 600
                    zoomed =
                        Coords.withZoom 2.0 vp
                    scaled =
                        Coords.getScale zoomed
                in
                Expect.equal 2.0 scaled
        , Test.test "withPan shifts origin" <|
            \_ ->
                let
                    vp =
                        Coords.init 800 600
                    panned =
                        Coords.withPan ( 100, 0 ) vp
                    origin =
                        Coords.getOrigin panned
                in
                case origin of
                    ( ox, oy ) ->
                        if ox == 500 && oy == 300 then
                            Expect.pass

                        else
                            Expect.fail ("Expected origin (500, 300), got " ++ String.fromFloat ox ++ ", " ++ String.fromFloat oy)
        , Test.test "evalAtX evaluates function at x" <|
            \_ ->
                let
                    vp =
                        Coords.init 800 600
                    fn x =
                        x * x
                    yVal =
                        Coords.evalAtX fn 2 vp
                in
                Expect.equal 4 yVal
        ]