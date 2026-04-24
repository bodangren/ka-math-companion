module Design.Header exposing
    ( Attr
    , brand
    , link
    , header
    )

import Design.Tokens as Tokens
import Html
import Html.Attributes


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
                            Just (Html.a [ Html.Attributes.href url ] [ Html.text label ])
                        _ ->
                            Nothing
                )
                attrs
    in
    Html.header
        [ Html.Attributes.style "display" "flex"
        , Html.Attributes.style "align-items" "center"
        , Html.Attributes.style "justify-content" "space-between"
        , Html.Attributes.style "padding" (Tokens.spacing.md ++ " " ++ Tokens.spacing.lg)
        , Html.Attributes.style "background-color" ("#" ++ Tokens.colorPalette.primary)
        , Html.Attributes.style "color" "#fff"
        ]
        ([ Html.div [ Html.Attributes.style "font-size" Tokens.typographyScale.largeFontSize
                    , Html.Attributes.style "font-weight" "bold"
                    ]
                    [ Html.text resolvedBrand ]
         ]
            ++ navItems
            ++ children
        )