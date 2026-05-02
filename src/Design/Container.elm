module Design.Container exposing (container)

import Design.Tokens exposing (spacing)
import Html exposing (Html, div)
import Html.Attributes exposing (attribute)


container : List (Html msg) -> Html msg
container children =
    div
        [ attribute "style"
            ("max-width:1200px;margin:0 auto;padding:0 " ++ spacing.md ++ ";")
        ]
        children
