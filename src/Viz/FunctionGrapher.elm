module Viz.FunctionGrapher exposing
    ( FunctionGrapher
    , blue
    , empty
    , functions
    , getScale
    , green
    , init
    , orange
    , pan
    , plotFunction
    , purple
    , red
    , render
    , withFunction
    , withViewport
    , withZoom
    , zoomIn
    , zoomOut
    )

import Html
import Svg
import Svg.Attributes exposing (fill, stroke, strokeWidth)
import Viz.Coords as Coords
import Viz.Coords exposing (Viewport(..))
import Svg.Helpers as Svg


type alias FunctionGrapher =
    { width : Int
    , height : Int
    , functions : List ( Float -> Float, String )
    , scale : Float
    , originX : Float
    , originY : Float
    }


empty : FunctionGrapher
empty =
    { width = 800
    , height = 600
    , functions = []
    , scale = 1.0
    , originX = 400
    , originY = 300
    }


init : Int -> Int -> FunctionGrapher
init w h =
    { width = w
    , height = h
    , functions = []
    , scale = 1.0
    , originX = toFloat (w // 2)
    , originY = toFloat (h // 2)
    }


withViewport : Int -> Int -> FunctionGrapher -> FunctionGrapher
withViewport w h g =
    { g
        | width = w
        , height = h
        , originX = toFloat (w // 2)
        , originY = toFloat (h // 2)
    }


withFunction : (Float -> Float) -> String -> FunctionGrapher -> FunctionGrapher
withFunction fn color g =
    { g | functions = ( fn, color ) :: g.functions }


functions : FunctionGrapher -> List ( Float -> Float, String )
functions g =
    g.functions


withZoom : Float -> FunctionGrapher -> FunctionGrapher
withZoom factor g =
    { g | scale = factor }


getScale : FunctionGrapher -> Float
getScale g =
    g.scale


blue : String
blue =
    "#3B82F6"


green : String
green =
    "#22C55E"


orange : String
orange =
    "#F97316"


purple : String
purple =
    "#A855F7"


red : String
red =
    "#EF4444"


plotFunction : (Float -> Float) -> Viewport -> Float -> Float -> String
plotFunction fn (Viewport vp) xMin xMax =
    let
        step =
            (xMax - xMin) / toFloat (vp.width // 2)

        points =
            generatePoints fn vp.originX vp.originY vp.scale xMin step (xMax - xMin)
    in
    buildPath points


generatePoints : (Float -> Float) -> Float -> Float -> Float -> Float -> Float -> Float -> List ( Float, Float )
generatePoints fn originX originY scale xMin step range =
    let
        numPoints =
            round (range / step)
    in
    List.map
        (\i ->
            let
                x =
                    xMin + step * toFloat i

                y =
                    fn x

                screenX =
                    originX + x * scale

                screenY =
                    originY - y * scale
            in
            ( screenX, screenY )
        )
        (List.range 0 numPoints)


buildPath : List ( Float, Float ) -> String
buildPath points =
    case points of
        [] ->
            ""

        ( x, y ) :: rest ->
            let
                first =
                    "M " ++ String.fromFloat x ++ " " ++ String.fromFloat y

                segments =
                    List.map
                        (\( px, py ) -> " L " ++ String.fromFloat px ++ " " ++ String.fromFloat py)
                        rest
            in
            first ++ String.join "" segments


render : FunctionGrapher -> Html.Html msg
render g =
    let
        viewport =
            Coords.init g.width g.height

        gridLines =
            renderGrid g

        axisLines =
            axes g

        functionPlots =
            List.map
                (\( fn, color ) ->
                    let
                        pathData =
                            plotFunction fn viewport -10 10
                    in
                    Svg.svgPath
                        pathData
                        [ Svg.withStroke color 2.5
                        , Svg.withFill "none"
                        ]
                        []
                )
                g.functions
    in
    Svg.svgContainer g.width g.height [] (gridLines ++ axisLines :: functionPlots)


renderGrid : FunctionGrapher -> List (Html.Html msg)
renderGrid g =
    let
        gridColor =
            "#E2E8F0"

        xStep =
            50

        yStep =
            50

        verticalLines =
            List.map
                (\x ->
                    Svg.svgLine x 0 x g.height [ Svg.withStroke gridColor 1 ] []
                )
                (List.filter (\x -> modBy xStep x == 0) (List.range 0 g.width))

        horizontalLines =
            List.map
                (\y ->
                    Svg.svgLine 0 y g.width y [ Svg.withStroke gridColor 1 ] []
                )
                (List.filter (\y -> modBy yStep y == 0) (List.range 0 g.height))
    in
    verticalLines ++ horizontalLines


axes : FunctionGrapher -> Html.Html msg
axes g =
    let
        axisColor =
            "#64748B"
    in
    Svg.svgGroup
        []
        [ Svg.svgLine
            0
            (round g.originY)
            g.width
            (round g.originY)
            [ Svg.withStroke axisColor 2 ]
            []
        , Svg.svgLine
            (round g.originX)
            0
            (round g.originX)
            g.height
            [ Svg.withStroke axisColor 2 ]
            []
        ]


zoomIn : FunctionGrapher -> FunctionGrapher
zoomIn g =
    { g | scale = g.scale * 1.25 }


zoomOut : FunctionGrapher -> FunctionGrapher
zoomOut g =
    { g | scale = Basics.max 0.1 (g.scale / 1.25) }


pan : Float -> Float -> FunctionGrapher -> FunctionGrapher
pan dx dy g =
    { g | originX = g.originX + dx, originY = g.originY + dy }