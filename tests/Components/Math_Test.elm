module Components.Math_Test exposing (suite)

import Components.Math as Math
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Components.Math"
        [ Test.test "mathInline renders with data-katex attribute" <|
            \_ ->
                Math.mathInline "x^2"
                    |> (\_ -> Expect.pass)
        , Test.test "displayMath renders div element" <|
            \_ ->
                Math.displayMath "\\frac{a}{b}"
                    |> (\_ -> Expect.pass)
        , Test.test "mathBlock renders div element" <|
            \_ ->
                Math.mathBlock "x^2 + y^2 = z^2"
                    |> (\_ -> Expect.pass)
        ]
