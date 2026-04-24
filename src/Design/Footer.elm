module Design.Footer exposing
    ( Attr
    , link
    , footer
    )

import Design.Tokens as Tokens
import Html
import Html.Attributes


type Attr
    = LinkAttr String String


link : String -> String -> Attr
link url label =
    LinkAttr url label


footer : List Attr -> List (Html.Html msg) -> Html.Html msg
footer attrs children =
    let
        links =
            List.filterMap
                (\attr ->
                    case attr of
                        LinkAttr url label ->
                            Just (Html.a [ Html.Attributes.href url, Html.Attributes.style "margin-right" Tokens.spacing.md ] [ Html.text label ])
                )
                attrs
    in
    Html.footer
        [ Html.Attributes.style "display" "flex"
        , Html.Attributes.style "align-items" "center"
        , Html.Attributes.style "justify-content" "center"
        , Html.Attributes.style "padding" Tokens.spacing.md
        , Html.Attributes.style "background-color" ("#" ++ Tokens.colorPalette.neutral)
        , Html.Attributes.style "color" "#fff"
        , Html.Attributes.style "margin-top" "auto"
        ]
        (links ++ children)