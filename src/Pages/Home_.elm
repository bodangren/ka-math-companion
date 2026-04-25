module Pages.Home_ exposing (page)

import Design.Button as Button
import Design.Card as Card
import Design.Container as Container
import Design.Grid as Grid
import Design.Header as Header
import Design.Stack as Stack
import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (style)
import View exposing (View)


page : View msg
page =
    { title = "KA Math Companion"
    , body =
        [ Html.div
            [ style "min-h" "100-vh"
            , style "background-color" ("#" ++ Tokens.colorPalette.surface)
            , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
            , style "font-family" Tokens.typographyScale.bodyFont
            ]
            [ viewHeader
            , Container.container
                [ viewHero
                , viewFeatures
                ]
            ]
        ]
    }


viewHeader : Html.Html msg
viewHeader =
    Header.header
        [ Header.brand "KA Math Companion"
        , Header.link "/curriculum" "Curriculum"
        ]
        []


viewHero : Html.Html msg
viewHero =
    Html.div
        [ style "padding" (Tokens.spacing.xxl ++ " 0")
        , style "margin-bottom" Tokens.spacing.xxl
        ]
        [ Stack.stack Stack.Vertical
            [ Stack.spacing Stack.Large ]
            [ Html.h1
                [ style "font-size" Tokens.typographyScale.h1FontSize
                , style "font-family" Tokens.typographyScale.headingFont
                , style "font-weight" "700"
                , style "margin" "0"
                , style "line-height" "1.0"
                , style "letter-spacing" "-0.04em"
                ]
                [ Html.text "Pedagogy-First"
                , Html.br [] []
                , Html.span [ style "color" ("#" ++ Tokens.colorPalette.primary) ] [ Html.text "Math Mastery" ]
                ]
            , Html.p
                [ style "font-size" Tokens.typographyScale.largeFontSize
                , style "max-width" "600px"
                , style "line-height" "1.6"
                , style "font-weight" "400"
                , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                ]
                [ Html.text "A technical companion to Khan Academy Integrated Math 3. Built for durable understanding through conceptual rigor and spaced retrieval." ]
            , Html.div [ style "padding-top" Tokens.spacing.md ]
                [ Button.button Button.Primary
                    [ Button.large ]
                    [ Html.text "Explore Curriculum" ]
                ]
            ]
        ]


viewFeatures : Html.Html msg
viewFeatures =
    Html.div [ style "padding-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Core Infrastructure" ]
        , Grid.grid
            [ Grid.columns 3, Grid.gap Grid.Large ]
            [ viewFeatureCard "13 Units" "Comprehensive coverage from Polynomials to Rational Functions."
            , viewFeatureCard "Interactive" "Conceptual exploration with visualizations and precision examples."
            , viewFeatureCard "Spaced Review" "Leitner-based retrieval system for permanent mastery."
            ]
        ]


viewFeatureCard : String -> String -> Html.Html msg
viewFeatureCard title description =
    Card.withHeader
        [ Html.text title ]
        [ Html.p [ style "margin" "0", style "line-height" "1.5" ] [ Html.text description ] ]
