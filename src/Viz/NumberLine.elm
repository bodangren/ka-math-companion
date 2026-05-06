module Viz.NumberLine exposing
    ( NumberLine
    , empty
    , init
    , onClickSelect
    , render
    , withInterval
    , withPoint
    , withRange
    , withSelection
    )

import Html
import Html.Events exposing (onClick)
import Svg
import Svg.Attributes exposing (cx, cy, fill, r, stroke, strokeWidth)
import Svg.Helpers as Svg


type alias NumberLine msg =
    { width : Int
    , height : Int
    , min : Float
    , max : Float
    , points : List Point
    , intervals : List Interval
    , selectedPoint : Maybe Int
    , onClickMsg : Maybe (Int -> msg)
    }


type alias Point =
    { value : Float
    , isOpen : Bool
    , label : Maybe String
    }


type alias Interval =
    { start : Float
    , end : Float
    , isOpenStart : Bool
    , isOpenEnd : Bool
    , color : String
    }


empty : NumberLine msg
empty =
    { width = 800
    , height = 150
    , min = -10
    , max = 10
    , points = []
    , intervals = []
    , selectedPoint = Nothing
    , onClickMsg = Nothing
    }


init : Int -> Float -> Float -> NumberLine msg
init w minVal maxVal =
    { width = w
    , height = 150
    , min = minVal
    , max = maxVal
    , points = []
    , intervals = []
    , selectedPoint = Nothing
    , onClickMsg = Nothing
    }


withRange : Float -> Float -> NumberLine msg -> NumberLine msg
withRange minVal maxVal nl =
    { nl | min = minVal, max = maxVal }


withPoint : Float -> Bool -> Maybe String -> NumberLine msg -> NumberLine msg
withPoint value isOpen label nl =
    let
        newPoint =
            Point value isOpen label
    in
    { nl | points = nl.points ++ [ newPoint ] }


withInterval : Float -> Float -> Bool -> Bool -> String -> NumberLine msg -> NumberLine msg
withInterval start end isOpenStart isOpenEnd color nl =
    let
        newInterval =
            Interval start end isOpenStart isOpenEnd color
    in
    { nl | intervals = nl.intervals ++ [ newInterval ] }


withSelection : Maybe Int -> NumberLine msg -> NumberLine msg
withSelection index nl =
    { nl | selectedPoint = index }


onClickSelect : (Int -> msg) -> NumberLine msg -> NumberLine msg
onClickSelect msg nl =
    { nl | onClickMsg = Just msg }


render : NumberLine msg -> Html.Html msg
render nl =
    let
        lineY =
            nl.height // 2

        tickSize =
            5

        ticks =
            renderTicks nl lineY tickSize

        axisLine =
            Svg.svgLine 0
                lineY
                nl.width
                lineY
                [ Svg.withStroke "#64748B", Svg.withStrokeWidth 2 ]
                []

        renderedPoints =
            List.indexedMap (renderPoint nl lineY) nl.points

        renderedIntervals =
            List.map (renderInterval nl lineY) nl.intervals
    in
    Svg.svgContainer nl.width
        nl.height
        []
        ([ axisLine ] ++ ticks ++ renderedIntervals ++ renderedPoints)


renderTicks : NumberLine msg -> Int -> Int -> List (Html.Html msg)
renderTicks nl lineY tickSize =
    let
        range =
            nl.max - nl.min

        step =
            if range <= 20 then
                1

            else if range <= 50 then
                5

            else
                10

        tickValues =
            List.filter
                (\v -> (Basics.round v |> modBy step) == 0)
                (List.map (\n -> nl.min + (nl.max - nl.min) * toFloat n / 50) (List.range 0 50))

        valueToX value =
            Basics.round ((value - nl.min) / (nl.max - nl.min) * toFloat nl.width)

        tickPositions =
            List.map valueToX tickValues

        tickValueList =
            tickValues
    in
    List.indexedMap
        (\idx x ->
            let
                labelValue =
                    case List.drop idx tickValueList |> List.head of
                        Just v ->
                            String.fromFloat v

                        Nothing ->
                            ""
            in
            Svg.svgGroup
                []
                [ Svg.svgLine x
                    (lineY - tickSize)
                    x
                    (lineY + tickSize)
                    [ Svg.withStroke "#64748B", Svg.withStrokeWidth 1 ]
                    []
                , Svg.svgText labelValue
                    (x + 3)
                    (lineY + 20)
                    [ Svg.withFill "#64748B" ]
                ]
        )
        tickPositions


renderPoint : NumberLine msg -> Int -> Int -> Point -> Html.Html msg
renderPoint nl lineY index point =
    let
        x =
            Basics.round ((point.value - nl.min) / (nl.max - nl.min) * toFloat nl.width)

        circleRadius =
            if nl.selectedPoint == Just index then
                8

            else
                6

        circleColor =
            if nl.selectedPoint == Just index then
                "#3B82F6"

            else
                "#1E293B"

        clickHandler =
            case nl.onClickMsg of
                Just msgFn ->
                    [ onClick (msgFn index) ]

                Nothing ->
                    []

        circleElement =
            if point.isOpen then
                Svg.svgCircle x
                    lineY
                    circleRadius
                    ([ Svg.withFill "white"
                     , Svg.withStroke circleColor
                     , Svg.withStrokeWidth 2
                     ]
                        ++ clickHandler
                    )
                    []

            else
                Svg.svgCircle x
                    lineY
                    circleRadius
                    ([ Svg.withFill circleColor
                     , Svg.withStroke circleColor
                     , Svg.withStrokeWidth 2
                     ]
                        ++ clickHandler
                    )
                    []

        labelElement =
            case point.label of
                Just label ->
                    [ Svg.svgText label
                        (x + 10)
                        (lineY - 10)
                        [ Svg.withFill "#475569" ]
                    ]

                Nothing ->
                    []
    in
    Svg.svgGroup [] (circleElement :: labelElement)


renderInterval : NumberLine msg -> Int -> Interval -> Html.Html msg
renderInterval nl lineY interval =
    let
        startX =
            Basics.round ((interval.start - nl.min) / (nl.max - nl.min) * toFloat nl.width)

        endX =
            Basics.round ((interval.end - nl.min) / (nl.max - nl.min) * toFloat nl.width)

        width =
            Basics.abs (endX - startX)

        rectX =
            Basics.min startX endX
    in
    Svg.svgRect rectX
        (lineY - 3)
        width
        6
        [ Svg.withFill interval.color
        , Svg.withStroke interval.color
        , Svg.withStrokeWidth 1
        ]
        []
