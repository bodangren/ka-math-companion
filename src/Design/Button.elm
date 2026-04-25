module Design.Button exposing
    ( Attr
    , Size
    , Variant(..)
    , button
    , disabled
    , ghost
    , large
    , medium
    , outline
    , primary
    , secondary
    , small
    )

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes exposing (attribute, style)


type Variant
    = Primary
    | Secondary
    | Outline
    | Ghost


type Size
    = Small
    | Medium
    | Large


type Attr
    = VariantAttr Variant
    | SizeAttr Size
    | Disabled


primary : Attr
primary =
    VariantAttr Primary


secondary : Attr
secondary =
    VariantAttr Secondary


outline : Attr
outline =
    VariantAttr Outline


ghost : Attr
ghost =
    VariantAttr Ghost


small : Attr
small =
    SizeAttr Small


medium : Attr
medium =
    SizeAttr Medium


large : Attr
large =
    SizeAttr Large


disabled : Attr
disabled =
    Disabled


button : Variant -> List Attr -> List (Html.Html msg) -> Html.Html msg
button variant attrs children =
    let
        resolvedVariant =
            List.filterMap
                (\attr ->
                    case attr of
                        VariantAttr v ->
                            Just v

                        _ ->
                            Nothing
                )
                attrs
                |> List.head
                |> Maybe.withDefault variant

        resolvedSize =
            List.filterMap
                (\attr ->
                    case attr of
                        SizeAttr s ->
                            Just s

                        _ ->
                            Nothing
                )
                attrs
                |> List.head
                |> Maybe.withDefault Medium

        isDisabled =
            List.any
                (\attr ->
                    case attr of
                        Disabled ->
                            True

                        _ ->
                            False
                )
                attrs

        variantStyleValue =
            case resolvedVariant of
                Primary ->
                    "background-color:#" ++ colorPalette.primary ++ ";color:#" ++ colorPalette.white ++ ";"

                Secondary ->
                    "background-color:#" ++ colorPalette.secondary ++ ";color:#" ++ colorPalette.white ++ ";"

                Outline ->
                    "background-color:transparent;color:#" ++ colorPalette.primary ++ ";border-width:2px;border-style:solid;border-color:#" ++ colorPalette.primary ++ ";"

                Ghost ->
                    "background-color:transparent;color:#" ++ colorPalette.textSecondary ++ ";border:none;"

        sizeStyleValue =
            case resolvedSize of
                Small ->
                    "padding:" ++ spacing.xs ++ " " ++ spacing.md ++ ";font-size:" ++ typographyScale.smallFontSize ++ ";"

                Medium ->
                    "padding:" ++ spacing.sm ++ " " ++ spacing.lg ++ ";font-size:" ++ typographyScale.bodyFontSize ++ ";"

                Large ->
                    "padding:" ++ spacing.md ++ " " ++ spacing.xl ++ ";font-size:" ++ typographyScale.largeFontSize ++ ";"

        baseStyleValue =
            "border-radius:9999px;font-family:" ++ typographyScale.bodyFont ++ ";cursor:pointer;transition:all 0.2s ease;border:none;font-weight:600;display:inline-flex;align-items:center;justify-content:center;text-align:center;"

        disabledAttrs =
            if isDisabled then
                [ Html.Attributes.disabled True, style "opacity" "0.5", style "cursor" "not-allowed" ]

            else
                [ attribute "onmouseover" "this.style.opacity='0.9';this.style.transform='scale(1.02)'"
                , attribute "onmouseout" "this.style.opacity='1';this.style.transform='scale(1)'"
                ]
    in
    Html.button
        ([ attribute "style" (baseStyleValue ++ variantStyleValue ++ sizeStyleValue)
         , style "display" "inline-block"
         ]
            ++ disabledAttrs
        )
        children
