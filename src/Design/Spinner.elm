module Design.Spinner exposing (Attr, large, medium, small, spinner)

import Design.Tokens exposing (colorPalette)
import Html
import Html.Attributes exposing (attribute)


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

        containerStyleValue =
            "display:inline-block;width:"
                ++ sizeValue
                ++ ";height:"
                ++ sizeValue
                ++ ";"

        circleStyleValue =
            "width:100%;height:100%;animation:spin 1s linear infinite;transform-origin:center;"
                ++ "stroke:#"
                ++ colorPalette.primary
                ++ ";"
                ++ "stroke-width:"
                ++ strokeWidth
                ++ ";"
    in
    Html.div [ attribute "style" containerStyleValue ]
        [ Html.node "svg"
            [ attribute "viewBox" "0 0 24 24"
            , attribute "fill" "none"
            , attribute "style" circleStyleValue
            ]
            [ Html.node "circle"
                [ attribute "cx" "12"
                , attribute "cy" "12"
                , attribute "r" "10"
                , attribute "stroke-opacity" "0.25"
                , attribute "stroke-dasharray" "31.4 31.4"
                , attribute "stroke-dashoffset" "0"
                ]
                []
            ]
        ]
