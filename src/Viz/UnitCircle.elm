module Viz.UnitCircle exposing
    ( UnitCircle
    , empty
    , init
    , onClickSelect
    , render
    , withAngle
    , withCoords
    , withDragEnabled
    , withLabel
    , withSelectedAngle
    )

import Html
import Html.Events exposing (onClick)
import Svg
import Svg.Attributes exposing (fill, fontSize, textAnchor)
import Svg.Helpers as Svg


type alias UnitCircle msg =
    { width : Int
    , height : Int
    , radius : Int
    , angle : Float
    , selectedAngle : Float
    , label : Maybe String
    , showCoords : Bool
    , dragEnabled : Bool
    , onClickMsg : Maybe (Float -> msg)
    }


empty : UnitCircle msg
empty =
    { width = 200
    , height = 200
    , radius = 90
    , angle = 0
    , selectedAngle = 0
    , label = Nothing
    , showCoords = False
    , dragEnabled = False
    , onClickMsg = Nothing
    }


init : Int -> UnitCircle msg
init w =
    { width = w
    , height = w
    , radius = w // 2 - 10
    , angle = 0
    , selectedAngle = 0
    , label = Nothing
    , showCoords = False
    , dragEnabled = False
    , onClickMsg = Nothing
    }


withAngle : Float -> UnitCircle msg -> UnitCircle msg
withAngle a uc =
    { uc | angle = a, selectedAngle = a }


withLabel : String -> UnitCircle msg -> UnitCircle msg
withLabel l uc =
    { uc | label = Just l }


withCoords : Bool -> UnitCircle msg -> UnitCircle msg
withCoords show uc =
    { uc | showCoords = show }


withSelectedAngle : Float -> UnitCircle msg -> UnitCircle msg
withSelectedAngle a uc =
    { uc | selectedAngle = a }


withDragEnabled : Bool -> UnitCircle msg -> UnitCircle msg
withDragEnabled enabled uc =
    { uc | dragEnabled = enabled }


onClickSelect : (Float -> msg) -> UnitCircle msg -> UnitCircle msg
onClickSelect msgFn uc =
    { uc | onClickMsg = Just msgFn }


render : UnitCircle msg -> Html.Html msg
render uc =
    let
        cx =
            uc.width // 2

        cy =
            uc.height // 2

        circleAttrs =
            [ Svg.withFill "none"
            , Svg.withStroke "#1E293B"
            , Svg.withStrokeWidth 2
            ]

        circleAttrsWithClick =
            case uc.onClickMsg of
                Just msgFn ->
                    circleAttrs ++ [ onClick (msgFn uc.angle) ]

                Nothing ->
                    circleAttrs

        circleElement =
            Svg.svgCircle cx cy uc.radius circleAttrsWithClick []

        axesLines =
            renderAxes cx cy uc.radius

        angleArc =
            renderAngleArc cx cy uc.radius uc.angle

        pointOnCircle =
            renderAnglePoint cx cy uc.radius uc.angle

        coordLabels =
            if uc.showCoords then
                renderCoordLabels cx cy uc.radius uc.angle

            else
                []

        labelElement =
            case uc.label of
                Just l ->
                    [ Svg.svgText l
                        cx
                        (cy + uc.radius + 20)
                        [ Svg.withFill "#64748B"
                        , Svg.withFontSize "12"
                        , Svg.withTextAnchor "middle"
                        ]
                    ]

                Nothing ->
                    []
    in
    Svg.svgContainer uc.width
        uc.height
        []
        ([ circleElement ] ++ axesLines ++ [ angleArc, pointOnCircle ] ++ coordLabels ++ labelElement)


renderAxes : Int -> Int -> Int -> List (Html.Html msg)
renderAxes cx cy radius =
    [ Svg.svgLine (cx - radius)
        cy
        (cx + radius)
        cy
        [ Svg.withStroke "#CBD5E1", Svg.withStrokeWidth 1 ]
        []
    , Svg.svgLine cx
        (cy - radius)
        cx
        (cy + radius)
        [ Svg.withStroke "#CBD5E1", Svg.withStrokeWidth 1 ]
        []
    ]


renderAngleArc : Int -> Int -> Int -> Float -> Html.Html msg
renderAngleArc cx cy radius angle =
    let
        arcRadius =
            radius // 3

        startX =
            cx + arcRadius

        endX =
            cx + round (toFloat arcRadius * cos angle)

        endY =
            cy - round (toFloat arcRadius * sin angle)
    in
    Svg.svgPath
        ("M " ++ String.fromInt cx ++ " " ++ String.fromInt cy ++ " L " ++ String.fromInt startX ++ " " ++ String.fromInt cy ++ " A " ++ String.fromInt arcRadius ++ " " ++ String.fromInt arcRadius ++ " 0 0 0 " ++ String.fromInt endX ++ " " ++ String.fromInt endY)
        [ Svg.withStroke "#3B82F6", Svg.withStrokeWidth 2, Svg.withFill "none" ]
        []


renderAnglePoint : Int -> Int -> Int -> Float -> Html.Html msg
renderAnglePoint cx cy radius angle =
    let
        pointX =
            cx + round (toFloat radius * cos angle)

        pointY =
            cy - round (toFloat radius * sin angle)
    in
    Svg.svgCircle pointX
        pointY
        6
        [ Svg.withFill "#3B82F6", Svg.withStroke "#1E293B", Svg.withStrokeWidth 1 ]
        []


renderCoordLabels : Int -> Int -> Int -> Float -> List (Html.Html msg)
renderCoordLabels cx cy radius angle =
    let
        cosVal =
            cos angle

        sinVal =
            sin angle

        labelRadius =
            radius + 15

        cosLabelX =
            cx + round (toFloat labelRadius * cosVal)

        cosLabelY =
            cy + 5

        sinLabelX =
            cx - 5

        sinLabelY =
            cy - round (toFloat labelRadius * sinVal)
    in
    [ Svg.svgText (String.fromFloat (toFloat (Basics.round (cosVal * 100)) / 100))
        cosLabelX
        cosLabelY
        [ Svg.withFill "#64748B", Svg.withFontSize "11", Svg.withTextAnchor "middle" ]
    , Svg.svgText (String.fromFloat (toFloat (Basics.round (sinVal * 100)) / 100))
        sinLabelX
        sinLabelY
        [ Svg.withFill "#64748B", Svg.withFontSize "11", Svg.withTextAnchor "end" ]
    ]
