module Components.VizContainer exposing (viewVizBlock)

import Data.VizLessonContent exposing (VizBlock(..))
import Design.Card as Card
import Design.Tokens as Tokens
import Html exposing (Html)
import Html.Attributes exposing (style)
import Viz.FunctionGrapher as FunctionGrapher
import Viz.UnitCircle as UnitCircle


viewVizBlock : VizBlock -> Html msg
viewVizBlock vizBlock =
    case vizBlock of
        FunctionGrapher label fn color ->
            Card.card
                [ Html.div
                    [ style "padding" Tokens.spacing.md ]
                    [ Html.p
                        [ style "font-weight" "600"
                        , style "margin-bottom" Tokens.spacing.sm
                        , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
                        ]
                        [ Html.text label ]
                    , FunctionGrapher.render
                        (FunctionGrapher.empty
                            |> FunctionGrapher.withFunction fn color
                            |> FunctionGrapher.withViewport 500 300
                        )
                    ]
                ]

        UnitCircle angle ->
            Card.card
                [ Html.div
                    [ style "padding" Tokens.spacing.md ]
                    [ Html.p
                        [ style "font-weight" "600"
                        , style "margin-bottom" Tokens.spacing.sm
                        , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
                        ]
                        [ Html.text "Interactive Unit Circle" ]
                    , UnitCircle.render
                        (UnitCircle.init 200
                            |> UnitCircle.withAngle angle
                            |> UnitCircle.withCoords True
                        )
                    ]
                ]
