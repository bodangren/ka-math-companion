module Svg.Helpers exposing
    ( svgCircle
    , svgContainer
    , svgGroup
    , svgLine
    , svgPath
    , svgRect
    , svgText
    , withFill
    , withStroke
    , withTransform
    , withViewBox
    )

import Html
import Svg
import Svg.Attributes exposing (cx, cy, d, fill, height, r, rx, ry, stroke, strokeWidth, transform, viewBox, width, x, x1, x2, y, y1, y2)


svgContainer : Int -> Int -> List (Svg.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
svgContainer w h attrs children =
    Svg.svg
        ([ width (String.fromInt w)
         , height (String.fromInt h)
         , viewBox ("0 0 " ++ String.fromInt w ++ " " ++ String.fromInt h)
         ]
            ++ attrs
        )
        children


svgGroup : List (Svg.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
svgGroup attrs children =
    Svg.g attrs children


svgLine : Int -> Int -> Int -> Int -> List (Svg.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
svgLine x1Val y1Val x2Val y2Val attrs children =
    Svg.line
        ([ x1 (String.fromInt x1Val)
         , y1 (String.fromInt y1Val)
         , x2 (String.fromInt x2Val)
         , y2 (String.fromInt y2Val)
         ]
            ++ attrs
        )
        children


svgCircle : Int -> Int -> Int -> List (Svg.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
svgCircle cxVal cyVal rVal attrs children =
    Svg.circle
        ([ cx (String.fromInt cxVal)
         , cy (String.fromInt cyVal)
         , r (String.fromInt rVal)
         ]
            ++ attrs
        )
        children


svgPath : String -> List (Svg.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
svgPath dVal attrs children =
    Svg.path
        ([ d dVal ]
            ++ attrs
        )
        children


svgText : String -> Int -> Int -> List (Svg.Attribute msg) -> Html.Html msg
svgText content xVal yVal attrs =
    Svg.text_
        ([ x (String.fromInt xVal)
         , y (String.fromInt yVal)
         ]
            ++ attrs
        )
        [ Svg.text content ]


svgRect : Int -> Int -> Int -> Int -> List (Svg.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
svgRect xVal yVal wVal hVal attrs children =
    Svg.rect
        ([ x (String.fromInt xVal)
         , y (String.fromInt yVal)
         , width (String.fromInt wVal)
         , height (String.fromInt hVal)
         ]
            ++ attrs
        )
        children


withViewBox : String -> Svg.Attribute msg
withViewBox value =
    viewBox value


withFill : String -> Svg.Attribute msg
withFill value =
    fill value


withStroke : String -> Float -> Svg.Attribute msg
withStroke color widthVal =
    stroke color


withTransform : String -> Svg.Attribute msg
withTransform value =
    transform value
