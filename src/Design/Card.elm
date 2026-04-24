module Design.Card exposing (Attr, card, footer, header)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes exposing (attribute, style)


type Attr msg
    = Header (List (Html.Html msg))
    | Footer (List (Html.Html msg))


header : List (Html.Html msg) -> Attr msg
header =
    Header


footer : List (Html.Html msg) -> Attr msg
footer =
    Footer


card : List (Attr msg) -> List (Html.Html msg) -> Html.Html msg
card attrs children =
    let
        ( headerContent, footerContent ) =
            List.foldr
                (\attr ( hAcc, fAcc ) ->
                    case attr of
                        Header content ->
                            ( content ++ hAcc, fAcc )

                        Footer content ->
                            ( hAcc, content ++ fAcc )
                )
                ( [], [] )
                attrs

        cardStyleValue =
            "border-radius:8px;border:1px solid #" ++ colorPalette.neutral ++ ";overflow:hidden;font-family:" ++ typographyScale.bodyFont ++ ";display:flex;flex-direction:column;"

        headerStyleValue =
            "padding:"
                ++ spacing.md
                ++ ";border-bottom:1px solid #"
                ++ colorPalette.neutral
                ++ ";background-color:#f9fafb;font-size:"
                ++ typographyScale.bodyFontSize
                ++ ";font-weight:600;"

        footerStyleValue =
            "padding:"
                ++ spacing.md
                ++ ";border-top:1px solid #"
                ++ colorPalette.neutral
                ++ ";background-color:#f9fafb;font-size:"
                ++ typographyScale.smallFontSize
                ++ ";"

        bodyStyleValue =
            "padding:" ++ spacing.md ++ ";"
    in
    Html.div [ attribute "style" cardStyleValue ]
        (List.concat
            [ if List.isEmpty headerContent then
                []

              else
                [ Html.div [ attribute "style" headerStyleValue ] headerContent
                ]
            , [ Html.div [ attribute "style" bodyStyleValue ] children ]
            , if List.isEmpty footerContent then
                []

              else
                [ Html.div [ attribute "style" footerStyleValue ] footerContent
                ]
            ]
        )
