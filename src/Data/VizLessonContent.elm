module Data.VizLessonContent exposing (VizBlock(..), getVizContent)


type VizBlock
    = FunctionGrapher String (Float -> Float) String
    | UnitCircle Float


getVizContent : String -> String -> Maybe VizBlock
getVizContent unitSlug lessonSlug =
    case ( unitSlug, lessonSlug ) of
        ( "polynomial-arithmetic", "intro-to-polynomials" ) ->
            Just (FunctionGrapher "x^3 - 2x^2 - x + 2" (\x -> x ^ 3 - 2 * x ^ 2 - x + 2) "#3B82F6")

        ( "polynomial-arithmetic", "multiplying-binomials-by-polynomials" ) ->
            Just (FunctionGrapher "(x+2)(x-3) = x^2 - x - 6" (\x -> (x + 2) * (x - 3)) "#22C55E")

        ( "exponentials-and-logarithms", "exponentials-and-logarithms" ) ->
            Just (FunctionGrapher "y = 2^x" (\x -> 2 ^ x) "#3B82F6")

        ( "exponentials-and-logarithms", "properties-of-logarithms" ) ->
            Just (FunctionGrapher "y = log_2(x)" (\x -> logBase 2 x) "#22C55E")

        ( "exponentials-and-logarithms", "solving-exponential-equations" ) ->
            Just (FunctionGrapher "y = 2^{3x+1}" (\x -> 2 ^ (3 * x + 1)) "#F97316")

        ( "trigonometry", "unit-circle" ) ->
            Just (UnitCircle (pi / 4))

        ( "trigonometry", "laws-of-sines-and-cosines" ) ->
            Just (UnitCircle (pi / 6))

        ( "trigonometry", "pythagorean-identity" ) ->
            Just (UnitCircle (pi / 3))

        _ ->
            Nothing
