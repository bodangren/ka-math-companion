module Viz.Coords exposing
    ( Viewport(..)
    , evalAtX
    , getOrigin
    , getScale
    , init
    , mathX
    , mathY
    , viewportX
    , viewportY
    , withPan
    , withZoom
    )


type Viewport
    = Viewport
        { width : Int
        , height : Int
        , originX : Float
        , originY : Float
        , scale : Float
        }


init : Int -> Int -> Viewport
init width height =
    Viewport
        { width = width
        , height = height
        , originX = toFloat (width // 2)
        , originY = toFloat (height // 2)
        , scale = 1.0
        }


viewportX : Float -> Viewport -> Int
viewportX mx (Viewport vp) =
    Basics.round (vp.originX + mx * vp.scale)


viewportY : Float -> Viewport -> Int
viewportY my (Viewport vp) =
    Basics.round (vp.originY - my * vp.scale)


mathX : Int -> Viewport -> Float
mathX screenX (Viewport vp) =
    (toFloat screenX - vp.originX) / vp.scale


mathY : Int -> Viewport -> Float
mathY screenY (Viewport vp) =
    (vp.originY - toFloat screenY) / vp.scale


withZoom : Float -> Viewport -> Viewport
withZoom factor (Viewport vp) =
    Viewport { vp | scale = factor }


withPan : ( Float, Float ) -> Viewport -> Viewport
withPan ( dx, dy ) (Viewport vp) =
    Viewport { vp | originX = vp.originX + dx, originY = vp.originY + dy }


getScale : Viewport -> Float
getScale (Viewport vp) =
    vp.scale


getOrigin : Viewport -> ( Float, Float )
getOrigin (Viewport vp) =
    ( vp.originX, vp.originY )


evalAtX : (Float -> Float) -> Float -> Viewport -> Float
evalAtX fn x (Viewport vp) =
    fn x * vp.scale
