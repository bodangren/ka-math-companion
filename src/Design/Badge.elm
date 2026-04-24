module Design.Badge exposing (Attr, badge, error, primary, secondary, success, warning)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes exposing (attribute)


type Attr
    = Color String


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

        badgeStyleValue =
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
    Html.span [ attribute "style" badgeStyleValue ] children
