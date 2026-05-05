module Viz.SvgHelpersTest exposing (suite)

import Expect
import Html
import Svg.Helpers as Svg
import Test


suite : Test.Test
suite =
    Test.describe "Svg.Helpers"
        [ Test.test "svgContainer creates element" <|
            \_ ->
                let
                    result =
                        Svg.svgContainer 800 600 [] []
                in
                Expect.pass
        , Test.test "svgContainer with viewBox" <|
            \_ ->
                let
                    result =
                        Svg.svgContainer 800 600 [ Svg.withViewBox "0 0 800 600" ] []
                in
                Expect.pass
        , Test.test "svgGroup creates element" <|
            \_ ->
                let
                    result =
                        Svg.svgGroup [] []
                in
                Expect.pass
        , Test.test "svgLine creates element" <|
            \_ ->
                let
                    result =
                        Svg.svgLine 0 0 100 100 [] []
                in
                Expect.pass
        , Test.test "svgCircle creates element" <|
            \_ ->
                let
                    result =
                        Svg.svgCircle 50 50 25 [] []
                in
                Expect.pass
        , Test.test "svgPath creates element" <|
            \_ ->
                let
                    result =
                        Svg.svgPath "M 0 0 L 100 100" [] []
                in
                Expect.pass
        , Test.test "svgText creates element" <|
            \_ ->
                let
                    result =
                        Svg.svgText "Hello" 100 50 []
                in
                Expect.pass
        , Test.test "svgRect creates element" <|
            \_ ->
                let
                    result =
                        Svg.svgRect 10 10 100 50 [] []
                in
                Expect.pass
        , Test.test "withFill returns attribute" <|
            \_ ->
                let
                    attr =
                        Svg.withFill "#FF0000"
                in
                Expect.pass
        , Test.test "withStroke returns attribute" <|
            \_ ->
                let
                    attr =
                        Svg.withStroke "#0000FF" 2
                in
                Expect.pass
        , Test.test "withTransform returns attribute" <|
            \_ ->
                let
                    attr =
                        Svg.withTransform "rotate(45)"
                in
                Expect.pass
        ]