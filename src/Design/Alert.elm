module Design.Alert exposing (Variant(..), alert)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html exposing (Html, div)
import Html.Attributes exposing (attribute, style)


type Variant
    = Info
    | Success
    | Warning
    | Error


alert : Variant -> List (Html msg) -> Html msg
alert variant children =
    let
        variantColor =
            case variant of
                Info ->
                    colorPalette.info

                Success ->
                    colorPalette.success

                Warning ->
                    colorPalette.warning

                Error ->
                    colorPalette.error
    in
    div
        [ attribute "style"
            ("background-color:#" ++ colorPalette.white ++ ";box-shadow:0 4px 6px -1px rgba(0,0,0,0.05);padding:" ++ spacing.sm ++ " " ++ spacing.lg ++ ";margin-bottom:" ++ spacing.md ++ ";border-radius:9999px;font-family:" ++ typographyScale.bodyFont ++ ";display:flex;align-items:center;gap:" ++ spacing.sm ++ ";border:1px solid rgba(0,0,0,0.05);")
        ]
        [ div
            [ attribute "style"
                ("width:12px;height:12px;border-radius:50%;background-color:#" ++ variantColor ++ ";flex-shrink:0;")
            ]
            []
        , div
            [ attribute "style" ("color:#" ++ colorPalette.textPrimary ++ ";font-weight:500;") ]
            children
        ]
