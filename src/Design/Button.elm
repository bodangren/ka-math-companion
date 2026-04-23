module Design.Button exposing
    ( Variant(..)
    , Size
    , Attr
    , button
    , primary
    , secondary
    , outline
    , ghost
    , small
    , medium
    , large
    , disabled
    )

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes


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

        baseStyles =
            "border-radius:4px;font-family:" ++ typographyScale.bodyFont ++ ";cursor:pointer;transition:all 0.15s ease;border:none;"

        variantStyles =
            case resolvedVariant of
                Primary ->
                    "background-color:#" ++ colorPalette.primary ++ ";color:#fff;"

                Secondary ->
                    "background-color:#" ++ colorPalette.secondary ++ ";color:#fff;"

                Outline ->
                    "background-color:transparent;color:#" ++ colorPalette.primary ++ ";border:1px solid #" ++ colorPalette.primary ++ ";"

                Ghost ->
                    "background-color:transparent;color:#" ++ colorPalette.neutral ++ ";"

        sizeStyles =
            case resolvedSize of
                Small ->
                    "padding:" ++ spacing.xs ++ " " ++ spacing.sm ++ ";font-size:" ++ typographyScale.smallFontSize ++ ";"

                Medium ->
                    "padding:" ++ spacing.sm ++ " " ++ spacing.md ++ ";font-size:" ++ typographyScale.bodyFontSize ++ ";"

                Large ->
                    "padding:" ++ spacing.md ++ " " ++ spacing.lg ++ ";font-size:" ++ typographyScale.largeFontSize ++ ";"

        disabledAttr =
            if isDisabled then
                [ Html.Attributes.disabled True, Html.Attributes.style "opacity" "0.5", Html.Attributes.style "cursor" "not-allowed" ]

            else
                []
    in
    Html.button
        ([ Html.Attributes.style "all" "initial"
         , Html.Attributes.style "display" "inline-block"
         , Html.Attributes.style "all" baseStyles
         , Html.Attributes.style "variant" variantStyles
         , Html.Attributes.style "size" sizeStyles
         ]
            ++ disabledAttr
        )
        children