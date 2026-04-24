module Design.Progress exposing (Attr, progress, label)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes exposing (attribute)


type Attr
    = Label String


label : String -> Attr
label =
    Label


progress : List Attr -> Int -> Html.Html msg
progress attrs percentage =
    let
        resolvedLabel =
            attrs
                |> List.filterMap
                    (\attr ->
                        case attr of
                            Label l ->
                                Just l
                    )
                |> List.head

        containerStyleValue =
            "width:100%;font-family:" ++ typographyScale.bodyFont ++ ";"

        labelStyleValue =
            "font-size:"
                ++ typographyScale.smallFontSize
                ++ ";color:#374151;margin-bottom:"
                ++ spacing.xs
                ++ ";display:flex;justify-content:space-between;"

        trackStyleValue =
            "width:100%;height:8px;background-color:#e5e7eb;border-radius:9999px;overflow:hidden;"

        fillStyleValue =
            "height:100%;width:"
                ++ String.fromInt (clamp 0 100 percentage)
                ++ "%;background-color:#"
                ++ colorPalette.primary
                ++ ";border-radius:9999px;transition:width 0.3s ease;"
    in
    Html.div [ attribute "style" containerStyleValue ]
        [ Html.div [ attribute "style" labelStyleValue ]
            [ case resolvedLabel of
                Just l ->
                    Html.text l

                Nothing ->
                    Html.text ""
            , Html.text (String.fromInt (clamp 0 100 percentage) ++ "%")
            ]
        , Html.div [ attribute "style" trackStyleValue ]
            [ Html.div [ attribute "style" fillStyleValue ] []
            ]
        ]