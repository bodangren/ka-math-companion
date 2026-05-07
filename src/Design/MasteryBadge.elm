module Design.MasteryBadge exposing (MasteryLevel(..), masteryBadge, masteryBadgeWithLabel)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html exposing (Html, span)
import Html.Attributes exposing (attribute)


type MasteryLevel
    = NotStarted
    | InProgress
    | Mastered


masteryBadge : MasteryLevel -> Html msg
masteryBadge level =
    let
        ( labelText, bgColor, textColor ) =
            case level of
                NotStarted ->
                    ( "Not Started", colorPalette.neutral, colorPalette.white )

                InProgress ->
                    ( "In Progress", colorPalette.warning, colorPalette.white )

                Mastered ->
                    ( "Mastered", colorPalette.success, colorPalette.white )
    in
    span
        [ attribute "style"
            ("background-color:#"
                ++ bgColor
                ++ ";color:#"
                ++ textColor
                ++ ";padding:"
                ++ spacing.xs
                ++ " "
                ++ spacing.sm
                ++ ";font-size:"
                ++ typographyScale.smallFontSize
                ++ ";font-family:"
                ++ typographyScale.bodyFont
                ++ ";font-weight:700;border-radius:9999px;display:inline-block;line-height:1;")
        ]
        [ Html.text labelText ]


masteryBadgeWithLabel : MasteryLevel -> String -> Html msg
masteryBadgeWithLabel level customLabel =
    let
        ( _, bgColor, textColor ) =
            case level of
                NotStarted ->
                    ( "", colorPalette.neutral, colorPalette.white )

                InProgress ->
                    ( "", colorPalette.warning, colorPalette.white )

                Mastered ->
                    ( "", colorPalette.success, colorPalette.white )
    in
    span
        [ attribute "style"
            ("background-color:#"
                ++ bgColor
                ++ ";color:#"
                ++ textColor
                ++ ";padding:"
                ++ spacing.xs
                ++ " "
                ++ spacing.sm
                ++ ";font-size:"
                ++ typographyScale.smallFontSize
                ++ ";font-family:"
                ++ typographyScale.bodyFont
                ++ ";font-weight:700;border-radius:9999px;display:inline-block;line-height:1;")
        ]
        [ Html.text customLabel ]