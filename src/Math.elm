module Math exposing (MathExpr(..), render, renderDisplay, parseMath)


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


parseMath : String -> List MathExpr
parseMath text =
    let
        extractDisplay acc str =
            case String.indexes "$$" str of
                [] ->
                    extractInline acc str

                firstPos :: _ ->
                    let
                        before = String.slice 0 firstPos str
                        afterStart = firstPos + 2
                        rest = String.slice afterStart (String.length str) str
                    in
                    case String.indexes "$$" rest of
                        [] ->
                            extractInline acc (before ++ "$$" ++ rest)

                        secondPos :: _ ->
                            let
                                latex = String.slice 0 secondPos rest
                                after = String.slice (secondPos + 2) (String.length rest) rest
                                beforeExpr = if String.isEmpty before then [] else [ InlineMath before ]
                            in
                            extractDisplay (DisplayMath latex :: beforeExpr ++ acc) after

        extractInline acc str =
            case String.indexes "$" str of
                [] ->
                    if String.isEmpty str then
                        List.reverse acc
                    else
                        List.reverse <| InlineMath str :: acc

                firstPos :: _ ->
                    let
                        before = String.slice 0 firstPos str
                        afterStart = firstPos + 1
                        rest = String.slice afterStart (String.length str) str
                    in
                    case String.indexes "$" rest of
                        [] ->
                            if String.isEmpty str then
                                List.reverse acc
                            else
                                List.reverse <| InlineMath str :: acc

                        secondPos :: _ ->
                            let
                                latex = String.slice 0 secondPos rest
                                after = String.slice (secondPos + 1) (String.length rest) rest
                                beforeExpr = if String.isEmpty before then [] else [ InlineMath before ]
                            in
                            extractInline (InlineMath latex :: beforeExpr ++ acc) after
    in
    extractDisplay [] text
