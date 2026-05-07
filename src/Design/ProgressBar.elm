module Design.ProgressBar exposing (progressBar)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes exposing (attribute)


progressBar : Maybe String -> Int -> Html.Html msg
progressBar maybeLabel percentage =
    let
        clampedPercentage =
            clamp 0 100 percentage

        containerStyleValue =
            "width:100%;font-family:"
                ++ typographyScale.bodyFont
                ++ ";margin-bottom:"
                ++ spacing.md
                ++ ";"

        labelStyleValue =
            "font-size:"
                ++ typographyScale.smallFontSize
                ++ ";color:#"
                ++ colorPalette.textPrimary
                ++ ";margin-bottom:"
                ++ spacing.xs
                ++ ";display:flex;justify-content:space-between;font-weight:600;"

        trackStyleValue =
            "width:100%;height:12px;background-color:rgba(0,0,0,0.05);position:relative;overflow:hidden;border-radius:9999px;"

        fillStyleValue =
            "height:100%;width:"
                ++ String.fromInt clampedPercentage
                ++ "%;background-color:#"
                ++ colorPalette.primary
                ++ ";transition:width 0.3s ease;border-radius:9999px;"
    in
    Html.div [ attribute "style" containerStyleValue ]
        [ case maybeLabel of
            Just labelText ->
                Html.div [ attribute "style" labelStyleValue ]
                    [ Html.text labelText
                    , Html.text (String.fromInt clampedPercentage ++ "%")
                    ]

            Nothing ->
                Html.text ""
        , Html.div [ attribute "style" trackStyleValue ]
            [ Html.div [ attribute "style" fillStyleValue ] []
            ]
        ]