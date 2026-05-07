module Pages.Dashboard exposing (page)

import Data.IntegratedMath3 as IntegratedMath3
import Design.Card as Card
import Design.Container as Container
import Design.Footer as Footer
import Design.Grid as Grid
import Design.Header as Header
import Design.ProgressBar as ProgressBar
import Design.Stack as Stack
import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (style)
import Logic.Progress as Progress
import View exposing (View)


page : View msg
page =
    { title = "Dashboard - KA Math Companion"
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
                [ Stack.stack Stack.Vertical
                    [ Stack.spacing Stack.Large ]
                    [ viewTitleSection
                    , viewOverallProgress
                    , viewUnitsBreakdown
                    ]
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
        ]
        []


viewTitleSection : Html.Html msg
viewTitleSection =
    Html.h1
        [ style "font-size" Tokens.typographyScale.h1FontSize
        , style "font-family" Tokens.typographyScale.headingFont
        , style "font-weight" "700"
        , style "margin" "0"
        , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
        ]
        [ Html.text "Your Progress" ]


viewOverallProgress : Html.Html msg
viewOverallProgress =
    Card.card
        [ Stack.stack Stack.Vertical
            [ Stack.spacing Stack.Medium ]
            [ Html.div
                [ style "font-size" Tokens.typographyScale.largeFontSize
                , style "font-weight" "600"
                , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
                ]
                [ Html.text "Overall Mastery" ]
            , ProgressBar.progressBar (Just "0% complete") 0
            , Html.div
                [ style "font-size" Tokens.typographyScale.smallFontSize
                , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                ]
                [ Html.text "Start learning to track your progress" ]
            ]
        ]


viewUnitsBreakdown : Html.Html msg
viewUnitsBreakdown =
    Html.div
        [ style "width" "100%"
        ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "700"
            , style "margin-bottom" Tokens.spacing.md
            , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
            ]
            [ Html.text "Unit Breakdown" ]
        , Grid.grid
            [ Grid.columns 2, Grid.gap Grid.Medium ]
            (List.map viewUnitProgress IntegratedMath3.course.units)
        ]


viewUnitProgress : { title : String, slug : String, lessons : List a } -> Html.Html msg
viewUnitProgress unit =
    let
        unitProgress =
            0

        lessonCount =
            List.length unit.lessons
    in
    Card.card
        [ Stack.stack Stack.Vertical
            [ Stack.spacing Stack.Small ]
            [ Html.h3
                [ style "font-size" Tokens.typographyScale.h3FontSize
                , style "font-family" Tokens.typographyScale.headingFont
                , style "font-weight" "600"
                , style "margin" "0"
                , style "color" ("#" ++ Tokens.colorPalette.primary)
                ]
                [ Html.text unit.title ]
            , Html.div
                [ style "font-size" Tokens.typographyScale.smallFontSize
                , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                ]
                [ Html.text (String.fromInt lessonCount ++ " lessons") ]
            , ProgressBar.progressBar Nothing unitProgress
            ]
        ]
