module Math exposing (MathExpr(..), render, renderDisplay)


type MathExpr
    = InlineMath String
    | DisplayMath String


render : MathExpr -> { latex : String, displayMode : Bool }
render expr =
    case expr of
        InlineMath latex ->
            { latex = latex, displayMode = False }

        DisplayMath latex ->
            { latex = latex, displayMode = True }


renderDisplay : String -> MathExpr
renderDisplay latex =
    DisplayMath latex
