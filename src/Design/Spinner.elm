module Design.Spinner exposing (Attr, spinner, small, medium, large)

import Design.Tokens exposing (colorPalette)
import Html
import Html.Attributes


type Size
    = Small
    | Medium
    | Large


type Attr
    = SizeAttr Size


small : Attr
small =
    SizeAttr Small


medium : Attr
medium =
    SizeAttr Medium


large : Attr
large =
    SizeAttr Large


spinner : List Attr -> Html.Html msg
spinner attrs =
    let
        resolvedSize =
            attrs
                |> List.filterMap
                    (\attr ->
                        case attr of
                            SizeAttr s ->
                                Just s
                    )
                |> List.head
                |> Maybe.withDefault Medium

        ( sizeValue, strokeWidth ) =
            case resolvedSize of
                Small ->
                    ( "16px", "2px" )

                Medium ->
                    ( "24px", "2px" )

                Large ->
                    ( "32px", "3px" )

        containerStyles =
            "display:inline-block;width:"
                ++ sizeValue
                ++ ";height:"
                ++ sizeValue
                ++ ";"

        circleStyles =
            "width:100%;height:100%;animation:spin 1s linear infinite;transform-origin:center;"
                ++ "stroke:#"
                ++ colorPalette.primary
                ++ ";"
                ++ "stroke-width:"
                ++ strokeWidth
                ++ ";"

    in
    Html.div [ Html.Attributes.style "all" "initial", Html.Attributes.style "all" containerStyles ]
        [ Html.node "svg"
            [ Html.Attributes.attribute "viewBox" "0 0 24 24"
            , Html.Attributes.attribute "fill" "none"
            , Html.Attributes.style "all" circleStyles
            ]
            [ Html.node "circle"
                [ Html.Attributes.attribute "cx" "12"
                , Html.Attributes.attribute "cy" "12"
                , Html.Attributes.attribute "r" "10"
                , Html.Attributes.attribute "stroke-opacity" "0.25"
                , Html.Attributes.attribute "stroke-dasharray" "31.4 31.4"
                , Html.Attributes.attribute "stroke-dashoffset" "0"
                ]
                []
            ]
        ]