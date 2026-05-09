module Design.Header exposing
    ( Attr
    , navBadge
    , brand
    , header
    , link
    )

import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (attribute, style)


type Attr
    = BrandAttr String
    | LinkAttr String String
    | NavBadge String Int


brand : String -> Attr
brand name =
    BrandAttr name


link : String -> String -> Attr
link url label =
    LinkAttr url label


navBadge : String -> Int -> Attr
navBadge label count =
    NavBadge label count


header : List Attr -> List (Html.Html msg) -> Html.Html msg
header attrs children =
    let
        resolvedBrand =
            List.filterMap
                (\attr ->
                    case attr of
                        BrandAttr name ->
                            Just name

                        _ ->
                            Nothing
                )
                attrs
                |> List.head
                |> Maybe.withDefault ""

        navItems =
            List.map
                (\attr ->
                    case attr of
                        LinkAttr url label ->
                            Html.a
                                [ Html.Attributes.href url
                                , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                                , style "text-decoration" "none"
                                , style "font-weight" "600"
                                , style "padding" "8px 16px"
                                , style "margin-left" Tokens.spacing.sm
                                , style "border-radius" "9999px"
                                , style "transition" "all 0.2s ease"
                                , attribute "onmouseover" ("this.style.backgroundColor='rgba(0,0,0,0.05)';this.style.color='#" ++ Tokens.colorPalette.primary ++ "'")
                                , attribute "onmouseout" ("this.style.backgroundColor='transparent';this.style.color='#" ++ Tokens.colorPalette.textSecondary ++ "'")
                                ]
                                [ Html.text label ]

                        NavBadge label count ->
                            Html.a
                                [ Html.Attributes.href ("/" ++ String.toLower label)
                                , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                                , style "text-decoration" "none"
                                , style "font-weight" "600"
                                , style "padding" "8px 16px"
                                , style "margin-left" Tokens.spacing.sm
                                , style "border-radius" "9999px"
                                , style "transition" "all 0.2s ease"
                                , attribute "onmouseover" ("this.style.backgroundColor='rgba(0,0,0,0.05)';this.style.color='#" ++ Tokens.colorPalette.primary ++ "'")
                                , attribute "onmouseout" ("this.style.backgroundColor='transparent';this.style.color='#" ++ Tokens.colorPalette.textSecondary ++ "'")
                                ]
                                [ Html.text (label ++ " ")
                                , Html.span
                                    [ style "background-color" ("#" ++ Tokens.colorPalette.primary)
                                    , style "color" ("#" ++ Tokens.colorPalette.white)
                                    , style "border-radius" "9999px"
                                    , style "padding" "2px 8px"
                                    , style "font-size" "12px"
                                    , style "font-weight" "700"
                                    ]
                                    [ Html.text (String.fromInt count) ]
                                ]

                        _ ->
                            Html.text ""
                )
                attrs
    in
    Html.header
        [ style "display" "flex"
        , style "align-items" "center"
        , style "justify-content" "space-between"
        , style "padding" (Tokens.spacing.md ++ " " ++ Tokens.spacing.xxl)
        , style "background-color" ("#" ++ Tokens.colorPalette.surface)
        , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
        , style "font-family" Tokens.typographyScale.headingFont
        ]
        ([ Html.div
            [ style "font-size" Tokens.typographyScale.h3FontSize
            , style "font-weight" "700"
            , style "color" ("#" ++ Tokens.colorPalette.primary)
            ]
            [ Html.text resolvedBrand ]
         ]
            ++ [ Html.nav [ style "display" "flex" ] navItems ]
            ++ children
        )
