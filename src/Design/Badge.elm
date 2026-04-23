module Design.Badge exposing (Attr, badge, default, primary, secondary, success, warning, error)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes


type Attr
    = Color String


default : Attr
default =
    Color ("#" ++ colorPalette.neutral)


primary : Attr
primary =
    Color ("#" ++ colorPalette.primary)


secondary : Attr
secondary =
    Color ("#" ++ colorPalette.secondary)


success : Attr
success =
    Color ("#" ++ colorPalette.success)


warning : Attr
warning =
    Color ("#" ++ colorPalette.warning)


error : Attr
error =
    Color ("#" ++ colorPalette.error)


badge : List Attr -> List (Html.Html msg) -> Html.Html msg
badge attrs children =
    let
        resolvedColor =
            attrs
                |> List.filterMap
                    (\attr ->
                        case attr of
                            Color c ->
                                Just c
                    )
                |> List.head
                |> Maybe.withDefault ("#" ++ colorPalette.neutral)

        badgeStyles =
            "display:inline-block;padding:"
                ++ spacing.xs
                ++ " "
                ++ spacing.sm
                ++ ";border-radius:9999px;font-size:"
                ++ typographyScale.smallFontSize
                ++ ";font-family:"
                ++ typographyScale.bodyFont
                ++ ";background-color:"
                ++ resolvedColor
                ++ ";color:#fff;font-weight:500;"
    in
    Html.span [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" badgeStyles ] children