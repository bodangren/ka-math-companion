module Design.Progress exposing (Attr, progress, label)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes


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

        containerStyles =
            "width:100%;font-family:" ++ typographyScale.bodyFont ++ ";"

        labelStyles =
            "font-size:"
                ++ typographyScale.smallFontSize
                ++ ";color:#374151;margin-bottom:"
                ++ spacing.xs
                ++ ";display:flex;justify-content:space-between;"

        trackStyles =
            "width:100%;height:8px;background-color:#e5e7eb;border-radius:9999px;overflow:hidden;"

        fillStyles =
            "height:100%;width:"
                ++ String.fromInt percentage
                ++ "%;background-color:#"
                ++ colorPalette.primary
                ++ ";border-radius:9999px;transition:width 0.3s ease;"
    in
    Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" containerStyles ]
        [ Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" labelStyles ]
            [ case resolvedLabel of
                Just l ->
                    Html.text l

                Nothing ->
                    Html.text ""
            , Html.text (String.fromInt percentage ++ "%")
            ]
        , Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" trackStyles ]
            [ Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" fillStyles ] []
            ]
        ]