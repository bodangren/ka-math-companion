module Design.Container exposing
    ( Width(..)
    , Attr(..)
    , container
    , mobile
    , tablet
    , desktop
    , wide
    , full
    )

import Design.Tokens exposing (spacing)
import Html
import Html.Attributes


type Width
    = Mobile
    | Tablet
    | Desktop
    | Wide
    | Full


type Attr
    = WidthAttr Width


mobile : Attr
mobile =
    WidthAttr Mobile


tablet : Attr
tablet =
    WidthAttr Tablet


desktop : Attr
desktop =
    WidthAttr Desktop


wide : Attr
wide =
    WidthAttr Wide


full : Attr
full =
    WidthAttr Full


container : List Attr -> List (Html.Html msg) -> Html.Html msg
container attrs children =
    let
        resolvedWidth =
            List.filterMap
                (\attr ->
                    case attr of
                        WidthAttr w ->
                            Just w
                )
                attrs
                |> List.head
                |> Maybe.withDefault Desktop

        maxWidthValue =
            case resolvedWidth of
                Mobile ->
                    "100%"

                Tablet ->
                    "640px"

                Desktop ->
                    "1024px"

                Wide ->
                    "1280px"

                Full ->
                    "100%"
    in
    Html.div
        [ Html.Attributes.style "width" "100%"
        , Html.Attributes.style "max-width" maxWidthValue
        , Html.Attributes.style "margin-left" "auto"
        , Html.Attributes.style "margin-right" "auto"
        , Html.Attributes.style "padding-left" spacing.md
        , Html.Attributes.style "padding-right" spacing.md
        , Html.Attributes.style "box-sizing" "border-box"
        ]
        children