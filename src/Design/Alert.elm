module Design.Alert exposing (AlertType(..), alert, info, success, warning, error)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes


type AlertType
    = Info
    | Success
    | Warning
    | Error


info : AlertType
info =
    Info


success : AlertType
success =
    Success


warning : AlertType
warning =
    Warning


error : AlertType
error =
    Error


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

        containerStyles =
            "border-radius:8px;padding:"
                ++ spacing.md
                ++ ";border-left:4px solid "
                ++ borderColor
                ++ ";background-color:"
                ++ bgColor
                ++ ";font-family:"
                ++ typographyScale.bodyFont
                ++ ";"

        titleStyles =
            "font-size:"
                ++ typographyScale.bodyFontSize
                ++ ";font-weight:600;color:"
                ++ iconColor
                ++ ";margin-bottom:"
                ++ spacing.sm
                ++ ";"

        contentStyles =
            "font-size:"
                ++ typographyScale.bodyFontSize
                ++ ";color:#374151;"
    in
    Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" containerStyles ]
        [ Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" titleStyles ] title
        , Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" contentStyles ] content
        ]