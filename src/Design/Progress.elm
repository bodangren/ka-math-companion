module Design.Progress exposing (Attr, label, progress)

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
            "width:100%;font-family:" ++ typographyScale.bodyFont ++ ";margin-bottom:" ++ spacing.md ++ ";"

        labelStyleValue =
            "font-size:"
                ++ typographyScale.smallFontSize
                ++ ";color:#" ++ colorPalette.textPrimary
                ++ ";margin-bottom:"
                ++ spacing.xs
                ++ ";display:flex;justify-content:space-between;font-weight:600;"

        trackStyleValue =
            "width:100%;height:12px;background-color:rgba(0,0,0,0.05);position:relative;overflow:hidden;border-radius:9999px;"

        fillStyleValue =
            "height:100%;width:"
                ++ String.fromInt (clamp 0 100 percentage)
                ++ "%;background-color:#"
                ++ colorPalette.primary
                ++ ";transition:width 0.3s ease;border-radius:9999px;"
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
