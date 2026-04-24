module Design.Stack exposing
    ( Attr
    , Direction(..)
    , Spacing(..)
    , large
    , medium
    , small
    , spacing
    , stack
    )

import Design.Tokens as Tokens
import Html
import Html.Attributes


type Direction
    = Vertical
    | Horizontal


type Spacing
    = Small
    | Medium
    | Large


type Attr
    = SpacingAttr Spacing


spacing : Spacing -> Attr
spacing s =
    SpacingAttr s


small : Spacing
small =
    Small


medium : Spacing
medium =
    Medium


large : Spacing
large =
    Large


stack : Direction -> List Attr -> List (Html.Html msg) -> Html.Html msg
stack direction attrs children =
    let
        resolvedSpacing =
            List.filterMap
                (\attr ->
                    case attr of
                        SpacingAttr s ->
                            Just s
                )
                attrs
                |> List.head
                |> Maybe.withDefault Medium

        flexDirection =
            case direction of
                Vertical ->
                    "column"

                Horizontal ->
                    "row"

        gapValue =
            case resolvedSpacing of
                Small ->
                    Tokens.spacing.xs

                Medium ->
                    Tokens.spacing.sm

                Large ->
                    Tokens.spacing.md
    in
    Html.div
        [ Html.Attributes.style "display" "flex"
        , Html.Attributes.style "flex-direction" flexDirection
        , Html.Attributes.style "gap" gapValue
        ]
        children
