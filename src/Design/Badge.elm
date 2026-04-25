module Design.Badge exposing (Variant(..), badge)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html exposing (Html, span)
import Html.Attributes exposing (attribute)


type Variant
    = Neutral
    | Success
    | Warning
    | Error


badge : Variant -> String -> Html msg
badge variant label =
    let
        bgColor =
            case variant of
                Neutral ->
                    colorPalette.neutral

                Success ->
                    colorPalette.success

                Warning ->
                    colorPalette.warning

                Error ->
                    colorPalette.error
    in
    span
        [ attribute "style"
            ("background-color:#" ++ bgColor ++ ";color:#" ++ colorPalette.white ++ ";padding:4px " ++ spacing.sm ++ ";font-size:" ++ typographyScale.smallFontSize ++ ";font-family:" ++ typographyScale.bodyFont ++ ";font-weight:700;border-radius:9999px;display:inline-block;line-height:1;")
        ]
        [ Html.text label ]
