module Design.Breadcrumb exposing
    ( breadcrumb
    , item
    )

import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (href, style)


item : String -> String -> Html.Html msg
item url label =
    Html.a [ href url ] [ Html.text label ]


breadcrumb : List (Html.Html msg) -> Html.Html msg
breadcrumb children =
    Html.nav
        [ style "display" "flex"
        , style "align-items" "center"
        , style "gap" Tokens.spacing.sm
        , style "font-size" Tokens.typographyScale.bodyFontSize
        ]
        (List.intersperse
            (Html.span [ style "color" ("#" ++ Tokens.colorPalette.neutral) ] [ Html.text "/" ])
            children
        )
