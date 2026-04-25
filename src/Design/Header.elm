module Design.Header exposing
    ( Attr
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


brand : String -> Attr
brand name =
    BrandAttr name


link : String -> String -> Attr
link url label =
    LinkAttr url label


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
            List.filterMap
                (\attr ->
                    case attr of
                        LinkAttr url label ->
                            Just
                                (Html.a
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
                                )

                        _ ->
                            Nothing
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
