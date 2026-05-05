module MathTest exposing (all)

import Expect
import Math
import Test


all : Test.Test
all =
    Test.describe "Math module"
        [ Test.test "InlineMath renders with displayMode False"
            (\() ->
                let
                    result =
                        Math.render (Math.InlineMath "x^2")
                in
                Expect.equal result { latex = "x^2", displayMode = False }
            )
        , Test.test "DisplayMath renders with displayMode True"
            (\() ->
                let
                    result =
                        Math.render (Math.DisplayMath "\\int_a^b f(x)dx")
                in
                Expect.equal result { latex = "\\int_a^b f(x)dx", displayMode = True }
            )
        , Test.test "renderDisplay creates DisplayMath"
            (\() ->
                let
                    result =
                        Math.renderDisplay "\\sum_{i=1}^n i"
                in
                case result of
                    Math.DisplayMath latex ->
                        Expect.equal latex "\\sum_{i=1}^n i"

                    Math.InlineMath _ ->
                        Expect.fail "Expected DisplayMath"
            )
        , Test.test "parseMath extracts single inline math"
            (\() ->
                let
                    result =
                        Math.parseMath "x^2"
                in
                Expect.equal result [ Math.InlineMath "x^2" ]
            )
        , Test.test "parseMath extracts single display math"
            (\() ->
                let
                    result =
                        Math.parseMath "$$x^2$$"
                in
                Expect.equal result [ Math.DisplayMath "x^2" ]
            )
        , Test.test "parseMath extracts mixed inline and display"
            (\() ->
                let
                    result =
                        Math.parseMath "The equation is $$E=mc^2$$ and then $x^2$ follows."
                in
                Expect.equal result
                    [ Math.InlineMath "The equation is "
                    , Math.DisplayMath "E=mc^2"
                    , Math.InlineMath " and then "
                    , Math.InlineMath "x^2"
                    , Math.InlineMath " follows."
                    ]
            )
        , Test.test "parseMath handles multiple display math blocks"
            (\() ->
                let
                    result =
                        Math.parseMath "First: $$a$$ and second: $$b$$"
                in
                Expect.equal result
                    [ Math.InlineMath "First: "
                    , Math.DisplayMath "a"
                    , Math.InlineMath " and second: "
                    , Math.DisplayMath "b"
                    ]
            )
        , Test.test "parseMath handles plain text with no math"
            (\() ->
                let
                    result =
                        Math.parseMath "No math here"
                in
                Expect.equal result [ Math.InlineMath "No math here" ]
            )
        , Test.test "parseMath handles empty string"
            (\() ->
                let
                    result =
                        Math.parseMath ""
                in
                Expect.equal result []
            )
        ]
