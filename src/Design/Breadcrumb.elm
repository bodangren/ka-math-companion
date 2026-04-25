module Design.Breadcrumb exposing
    ( breadcrumb
    , item
    )

import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (href, style)


item : String -> String -> Html.Html msg
item url label =
    Html.a
        [ href url
        , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
        , style "text-decoration" "none"
        , style "font-weight" "500"
        , style "transition" "color 0.2s ease"
        ]
        [ Html.text label ]


breadcrumb : List (Html.Html msg) -> Html.Html msg
breadcrumb children =
    Html.nav
        [ style "display" "flex"
        , style "align-items" "center"
        , style "gap" Tokens.spacing.sm
        , style "font-size" Tokens.typographyScale.smallFontSize
        , style "font-family" Tokens.typographyScale.bodyFont
        , style "margin-bottom" Tokens.spacing.md
        , style "padding" (Tokens.spacing.sm ++ " 0")
        ]
        (List.intersperse
            (Html.span [ style "color" "rgba(0,0,0,0.1)", style "margin" ("0 " ++ Tokens.spacing.xs) ] [ Html.text "→" ])
            children
        )
