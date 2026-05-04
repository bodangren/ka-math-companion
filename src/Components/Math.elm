module Components.Math exposing (displayMath, mathBlock, mathInline)

import Html exposing (Html)
import Html.Attributes as Attr


displayMath : String -> Html msg
displayMath latex =
    Html.div
        [ Attr.attribute "data-katex" ""
        , Attr.style "margin" "1em 0"
        , Attr.style "text-align" "center"
        ]
        [ Html.text ("$$" ++ latex ++ "$$") ]


mathInline : String -> Html msg
mathInline latex =
    Html.span
        [ Attr.attribute "data-katex" "" ]
        [ Html.text ("$" ++ latex ++ "$") ]


mathBlock : String -> Html msg
mathBlock latex =
    Html.div
        [ Attr.attribute "data-katex" ""
        , Attr.style "margin" "1em 0"
        ]
        [ Html.text ("$$" ++ latex ++ "$$") ]
