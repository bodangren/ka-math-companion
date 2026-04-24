module Design.Grid exposing
    ( Attr
    , Gap(..)
    , columns
    , gap
    , grid
    , large
    , medium
    , minWidth
    , small
    )

import Design.Tokens as Tokens
import Html
import Html.Attributes


type Gap
    = Small
    | Medium
    | Large


type Attr
    = ColumnsAttr Int
    | MinWidthAttr String
    | GapAttr Gap


columns : Int -> Attr
columns n =
    ColumnsAttr n


minWidth : String -> Attr
minWidth w =
    MinWidthAttr w


gap : Gap -> Attr
gap g =
    GapAttr g


small : Gap
small =
    Small


medium : Gap
medium =
    Medium


large : Gap
large =
    Large


grid : List Attr -> List (Html.Html msg) -> Html.Html msg
grid attrs children =
    let
        resolvedColumns =
            List.filterMap
                (\attr ->
                    case attr of
                        ColumnsAttr n ->
                            Just n

                        _ ->
                            Nothing
                )
                attrs
                |> List.head
                |> Maybe.withDefault 1

        resolvedMinWidth =
            List.filterMap
                (\attr ->
                    case attr of
                        MinWidthAttr w ->
                            Just w

                        _ ->
                            Nothing
                )
                attrs
                |> List.head
                |> Maybe.withDefault "200px"

        resolvedGap =
            List.filterMap
                (\attr ->
                    case attr of
                        GapAttr g ->
                            Just g

                        _ ->
                            Nothing
                )
                attrs
                |> List.head
                |> Maybe.withDefault Medium

        gapValue =
            case resolvedGap of
                Small ->
                    Tokens.spacing.xs

                Medium ->
                    Tokens.spacing.sm

                Large ->
                    Tokens.spacing.md
    in
    Html.div
        [ Html.Attributes.style "display" "grid"
        , Html.Attributes.style "grid-template-columns" ("repeat(" ++ String.fromInt resolvedColumns ++ ", minmax(" ++ resolvedMinWidth ++ ", 1fr))")
        , Html.Attributes.style "gap" gapValue
        ]
        children
