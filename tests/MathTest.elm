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
        ]