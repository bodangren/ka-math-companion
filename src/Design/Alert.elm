module Design.Alert exposing (AlertType(..), alert)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes exposing (attribute)


type AlertType
    = Info
    | Success
    | Warning
    | Error


alert : AlertType -> List (Html.Html msg) -> List (Html.Html msg) -> Html.Html msg
alert alertType title content =
    let
        ( bgColor, borderColor, iconColor ) =
            case alertType of
                Info ->
                    ( "#eff6ff", "#" ++ colorPalette.info, "#" ++ colorPalette.info )

                Success ->
                    ( "#ecfdf5", "#" ++ colorPalette.success, "#" ++ colorPalette.success )

                Warning ->
                    ( "#fffbeb", "#" ++ colorPalette.warning, "#" ++ colorPalette.warning )

                Error ->
                    ( "#fef2f2", "#" ++ colorPalette.error, "#" ++ colorPalette.error )

        containerStyleValue =
            "border-radius:8px;padding:"
                ++ spacing.md
                ++ ";border-left:4px solid "
                ++ borderColor
                ++ ";background-color:"
                ++ bgColor
                ++ ";font-family:"
                ++ typographyScale.bodyFont
                ++ ";"

        titleStyleValue =
            "font-size:"
                ++ typographyScale.bodyFontSize
                ++ ";font-weight:600;color:"
                ++ iconColor
                ++ ";margin-bottom:"
                ++ spacing.sm
                ++ ";"

        contentStyleValue =
            "font-size:"
                ++ typographyScale.bodyFontSize
                ++ ";color:#374151;"
    in
    Html.div [ attribute "style" containerStyleValue ]
        [ Html.div [ attribute "style" titleStyleValue ] title
        , Html.div [ attribute "style" contentStyleValue ] content
        ]