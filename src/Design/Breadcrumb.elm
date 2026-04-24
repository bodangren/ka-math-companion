module Design.Breadcrumb exposing
    ( Attr
    , item
    , breadcrumb
    )

import Design.Tokens as Tokens
import Html
import Html.Attributes


type Attr
    = ItemAttr String String


item : String -> String -> Html.Html msg
item url label =
    Html.a [ Html.Attributes.href url ] [ Html.text label ]


breadcrumb : List Attr -> List (Html.Html msg) -> Html.Html msg
breadcrumb attrs children =
    Html.nav
        [ Html.Attributes.style "display" "flex"
        , Html.Attributes.style "align-items" "center"
        , Html.Attributes.style "gap" Tokens.spacing.sm
        , Html.Attributes.style "font-size" Tokens.typographyScale.bodyFontSize
        ]
        (List.intersperse
            (Html.span [ Html.Attributes.style "color" ("#" ++ Tokens.colorPalette.neutral) ] [ Html.text "/" ])
            children
        )