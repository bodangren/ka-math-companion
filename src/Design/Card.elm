module Design.Card exposing (Attr, card, header, footer)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes


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

        cardStyles =
            "border-radius:8px;border:1px solid #" ++ colorPalette.neutral ++ ";overflow:hidden;font-family:" ++ typographyScale.bodyFont ++ ";"

        headerStyles =
            "padding:" ++ spacing.md ++ ";border-bottom:1px solid #" ++ colorPalette.neutral ++ ";background-color:#f9fafb;"
                ++ ";font-size:" ++ typographyScale.bodyFontSize ++ ";font-weight:600;"

        footerStyles =
            "padding:" ++ spacing.md ++ ";border-top:1px solid #" ++ colorPalette.neutral ++ ";background-color:#f9fafb;"
                ++ ";font-size:" ++ typographyScale.smallFontSize ++ ";"
    in
    Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "display" "flex", Html.Attributes.style "flex-direction" "column", Html.Attributes.style "all" cardStyles ]
        (List.concat
            [ if List.isEmpty headerContent then
                []

              else
                [ Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" headerStyles ] headerContent
                ]
            , [ Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "padding" spacing.md, Html.Attributes.style "all" "initial" ] children ]
            , if List.isEmpty footerContent then
                []

              else
                [ Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" footerStyles ] footerContent
                ]
            ]
        )