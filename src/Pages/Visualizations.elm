module Pages.Visualizations exposing (page)

import Design.Container as Container
import Design.Footer as Footer
import Design.Header as Header
import Design.Stack as Stack
import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (style)
import View exposing (View)
import Viz.FunctionGrapher as FunctionGrapher
import Viz.NumberLine as NumberLine
import Viz.UnitCircle as UnitCircle


page : View msg
page =
    { title = "Interactive Visualizations - KA Math Companion"
    , body =
        [ Html.div
            [ style "min-h" "100-vh"
            , style "background-color" ("#" ++ Tokens.colorPalette.surface)
            , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
            , style "font-family" Tokens.typographyScale.bodyFont
            , style "display" "flex"
            , style "flex-direction" "column"
            ]
            [ viewHeader
            , Container.container
                [ viewIntro
                , viewFunctionGrapherDemo
                , viewNumberLineDemo
                , viewUnitCircleDemo
                ]
            , Footer.footer
                [ Footer.link "/curriculum" "Curriculum"
                , Footer.link "/design-system" "Design System"
                ]
                [ Html.text "© 2026 KA Math Companion" ]
            ]
        ]
    }


viewHeader : Html.Html msg
viewHeader =
    Header.header
        [ Header.brand "KA Math Companion"
        , Header.link "/curriculum" "Curriculum"
        , Header.link "/visualizations" "Visualizations"
        ]
        []


viewIntro : Html.Html msg
viewIntro =
    Html.div [ style "padding" (Tokens.spacing.xxl ++ " 0") ]
        [ Html.h1
            [ style "font-size" Tokens.typographyScale.h1FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "700"
            , style "margin-bottom" Tokens.spacing.sm
            ]
            [ Html.text "Interactive Visualizations" ]
        , Html.p
            [ style "font-size" Tokens.typographyScale.largeFontSize
            , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
            , style "max-width" "600px"
            ]
            [ Html.text "Explore mathematical concepts through interactive visualizations. Click, hover, and interact to deepen your understanding." ]
        ]


viewFunctionGrapherDemo : Html.Html msg
viewFunctionGrapherDemo =
    Html.div [ style "padding-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.md
            ]
            [ Html.text "Function Grapher" ]
        , Html.p
            [ style "color" ("#" ++ Tokens.colorPalette.textSecondary)
            , style "margin-bottom" Tokens.spacing.md
            ]
            [ Html.text "Plot and explore polynomial, exponential, logarithmic, and trigonometric functions. Use the viewport controls to zoom and pan." ]
        , Html.div [ style "background-color" ("#" ++ Tokens.colorPalette.white), style "padding" Tokens.spacing.lg, style "border-radius" "8px" ]
            [ FunctionGrapher.render
                (FunctionGrapher.init 600 400
                    |> FunctionGrapher.withFunction (\x -> x ^ 2) "Polynomial: x^2"
                    |> FunctionGrapher.withFunction (\x -> 2 ^ x) "Exponential: 2^x"
                    |> FunctionGrapher.withFunction (\x -> logBase 2 x) "Logarithmic: log_2(x)"
                )
            ]
        ]


viewNumberLineDemo : Html.Html msg
viewNumberLineDemo =
    Html.div [ style "padding-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.md
            ]
            [ Html.text "Number Line" ]
        , Html.p
            [ style "color" ("#" ++ Tokens.colorPalette.textSecondary)
            , style "margin-bottom" Tokens.spacing.md
            ]
            [ Html.text "Visualize numbers, intervals, and inequalities on a number line. Perfect for understanding domain and range." ]
        , Html.div [ style "background-color" ("#" ++ Tokens.colorPalette.white), style "padding" Tokens.spacing.lg, style "border-radius" "8px" ]
            [ NumberLine.render
                (NumberLine.init 600 -10 10
                    |> NumberLine.withPoint -3 False Nothing
                    |> NumberLine.withPoint 0 False Nothing
                    |> NumberLine.withPoint 2 False Nothing
                    |> NumberLine.withPoint 5 False Nothing
                    |> NumberLine.withInterval -5 3 False False "#3B82F6"
                )
            ]
        ]


viewUnitCircleDemo : Html.Html msg
viewUnitCircleDemo =
    Html.div [ style "padding-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.md
            ]
            [ Html.text "Unit Circle" ]
        , Html.p
            [ style "color" ("#" ++ Tokens.colorPalette.textSecondary)
            , style "margin-bottom" Tokens.spacing.md
            ]
            [ Html.text "Explore trigonometry through the unit circle. See how sine and cosine values correspond to points on the circle." ]
        , Html.div [ style "background-color" ("#" ++ Tokens.colorPalette.white), style "padding" Tokens.spacing.lg, style "border-radius" "8px" ]
            [ Stack.stack Stack.Horizontal
                [ Stack.spacing Stack.Large ]
                [ UnitCircle.render
                    (UnitCircle.init 200
                        |> UnitCircle.withAngle (pi / 6)
                        |> UnitCircle.withCoords True
                        |> UnitCircle.withLabel "30°"
                    )
                , UnitCircle.render
                    (UnitCircle.init 200
                        |> UnitCircle.withAngle (pi / 4)
                        |> UnitCircle.withCoords True
                        |> UnitCircle.withLabel "45°"
                    )
                , UnitCircle.render
                    (UnitCircle.init 200
                        |> UnitCircle.withAngle (pi / 3)
                        |> UnitCircle.withCoords True
                        |> UnitCircle.withLabel "60°"
                    )
                ]
            ]
        ]
