module Design.Footer exposing
    ( Attr
    , footer
    , link
    )

import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (style)


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
                            Just
                                (Html.a
                                    [ Html.Attributes.href url
                                    , style "margin-right" Tokens.spacing.md
                                    , style "color" ("#" ++ Tokens.colorPalette.secondary)
                                    , style "font-weight" "700"
                                    ]
                                    [ Html.text label ]
                                )
                )
                attrs
    in
    Html.footer
        [ style "display" "flex"
        , style "align-items" "center"
        , style "justify-content" "center"
        , style "padding" Tokens.spacing.xxl
        , style "background-color" ("#" ++ Tokens.colorPalette.surface)
        , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
        , style "margin-top" "auto"
        , style "font-family" Tokens.typographyScale.bodyFont
        , style "font-size" Tokens.typographyScale.smallFontSize
        , style "border-top" "1px solid rgba(0,0,0,0.05)"
        ]
        (links ++ children)
