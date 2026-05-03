module Pages.Design_System exposing (page)

import Design.Alert as Alert
import Design.Badge as Badge
import Design.Breadcrumb as Breadcrumb
import Design.Button as Button
import Design.Card as Card
import Design.Container as Container
import Design.Footer as Footer
import Design.Grid as Grid
import Design.Header as Header
import Design.Progress as Progress
import Design.Spinner as Spinner
import Design.Stack as Stack
import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (style)
import View exposing (View)


page : View msg
page =
    { title = "Design System"
    , body =
        [ Html.div
            [ style "min-height" "100vh"
            , style "background-color" ("#" ++ Tokens.colorPalette.surface)
            , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
            , style "font-family" Tokens.typographyScale.bodyFont
            , style "display" "flex"
            , style "flex-direction" "column"
            ]
            [ viewHeader
            , Container.container
                [ viewIntro
                , viewColors
                , viewTypography
                , viewButtons
                , viewBadges
                , viewAlerts
                , viewCards
                , viewProgress
                , viewSpinners
                , viewBreadcrumbs
                ]
            , Footer.footer
                [ Footer.link "/curriculum" "Curriculum"
                , Footer.link "/" "Home"
                ]
                [ Html.text "© 2026 KA Math Companion" ]
            ]
        ]
    }


viewHeader : Html.Html msg
viewHeader =
    Header.header
        [ Header.brand "Design System"
        , Header.link "/curriculum" "Curriculum"
        ]
        []


viewIntro : Html.Html msg
viewIntro =
    Html.div [ style "padding" (Tokens.spacing.xxl ++ " 0") ]
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
                [ Html.text "Orbital Editorial "
                , Html.span [ style "color" ("#" ++ Tokens.colorPalette.primary) ] [ Html.text "Design System" ]
                ]
            , Html.p
                [ style "font-size" Tokens.typographyScale.largeFontSize
                , style "max-width" "600px"
                , style "line-height" "1.6"
                , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                ]
                [ Html.text "A component library built with pedagogical clarity and visual warmth." ]
            ]
        ]


viewColors : Html.Html msg
viewColors =
    Html.section [ style "margin-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Color Palette" ]
        , Grid.grid
            [ Grid.columns 4, Grid.gap Grid.Medium ]
            [ viewColorSwatch "Primary" Tokens.colorPalette.primary
            , viewColorSwatch "Secondary" Tokens.colorPalette.secondary
            , viewColorSwatch "Accent" Tokens.colorPalette.accent
            , viewColorSwatch "Surface" Tokens.colorPalette.surface
            , viewColorSwatch "White" Tokens.colorPalette.white
            , viewColorSwatch "Text Primary" Tokens.colorPalette.textPrimary
            , viewColorSwatch "Text Secondary" Tokens.colorPalette.textSecondary
            ]
        ]


viewColorSwatch : String -> String -> Html.Html msg
viewColorSwatch name hex =
    Card.withHeader
        [ Html.text name ]
        [ Html.div
            [ style "width" "100%"
            , style "height" "80px"
            , style "background-color" ("#" ++ hex)
            , style "border-radius" "8px"
            ]
            []
        , Html.p
            [ style "font-family" "monospace"
            , style "font-size" Tokens.typographyScale.smallFontSize
            , style "margin" (Tokens.spacing.sm ++ " 0 0 0")
            ]
            [ Html.text ("#" ++ hex) ]
        ]


viewTypography : Html.Html msg
viewTypography =
    Html.section [ style "margin-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Typography" ]
        , Card.withHeader
            [ Html.text "Scale" ]
            [ Stack.stack Stack.Vertical
                [ Stack.spacing Stack.Medium ]
                [ Html.h1
                    [ style "font-size" Tokens.typographyScale.h1FontSize
                    , style "font-family" Tokens.typographyScale.headingFont
                    , style "font-weight" "700"
                    , style "margin" "0"
                    ]
                    [ Html.text "Heading 1" ]
                , Html.h2
                    [ style "font-size" Tokens.typographyScale.h2FontSize
                    , style "font-family" Tokens.typographyScale.headingFont
                    , style "font-weight" "600"
                    , style "margin" "0"
                    ]
                    [ Html.text "Heading 2" ]
                , Html.p
                    [ style "font-size" Tokens.typographyScale.bodyFontSize
                    , style "margin" "0"
                    ]
                    [ Html.text "Body text at standard size" ]
                , Html.p
                    [ style "font-size" Tokens.typographyScale.smallFontSize
                    , style "margin" "0"
                    ]
                    [ Html.text "Small caption text" ]
                ]
            ]
        ]


viewButtons : Html.Html msg
viewButtons =
    Html.section [ style "margin-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Buttons" ]
        , Grid.grid
            [ Grid.columns 4, Grid.gap Grid.Medium ]
            [ viewButtonGroup "Primary" Button.Primary
            , viewButtonGroup "Secondary" Button.Secondary
            , viewButtonGroup "Outline" Button.Outline
            , viewButtonGroup "Ghost" Button.Ghost
            ]
        ]


viewButtonGroup : String -> Button.Variant -> Html.Html msg
viewButtonGroup label variant =
    Card.withHeader
        [ Html.text label ]
        [ Stack.stack Stack.Vertical
            [ Stack.spacing Stack.Small ]
            [ Button.button variant [ Button.small ] [ Html.text "Small" ]
            , Button.button variant [ Button.medium ] [ Html.text "Medium" ]
            , Button.button variant [ Button.large ] [ Html.text "Large" ]
            , Button.button variant [ Button.disabled ] [ Html.text "Disabled" ]
            ]
        ]


viewBadges : Html.Html msg
viewBadges =
    Html.section [ style "margin-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Badges" ]
        , Grid.grid
            [ Grid.columns 5, Grid.gap Grid.Medium ]
            [ viewBadgeExample "Neutral" Badge.Neutral
            , viewBadgeExample "Success" Badge.Success
            , viewBadgeExample "Warning" Badge.Warning
            , viewBadgeExample "Error" Badge.Error
            , viewBadgeExample "Info" Badge.Neutral
            ]
        ]


viewBadgeExample : String -> Badge.Variant -> Html.Html msg
viewBadgeExample label variant =
    Card.withHeader
        [ Html.text label ]
        [ Badge.badge variant "Badge"
        ]


viewAlerts : Html.Html msg
viewAlerts =
    Html.section [ style "margin-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Alerts" ]
        , Stack.stack Stack.Vertical
            [ Stack.spacing Stack.Medium ]
            [ Alert.alert Alert.Info [ Html.text "Information message for the student." ]
            , Alert.alert Alert.Success [ Html.text "Correct! You've mastered this concept." ]
            , Alert.alert Alert.Warning [ Html.text "Review recommended before proceeding." ]
            , Alert.alert Alert.Error [ Html.text "Not quite right. Try again." ]
            ]
        ]


viewCards : Html.Html msg
viewCards =
    Html.section [ style "margin-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Cards" ]
        , Grid.grid
            [ Grid.columns 3, Grid.gap Grid.Medium ]
            [ Card.withHeader
                [ Html.text "Card Header" ]
                [ Html.p [ style "margin" "0" ] [ Html.text "Card content goes here." ] ]
            , Card.withFooter
                [ Html.text "With Footer" ]
                [ Html.p [ style "margin" "0" ] [ Html.text "This card has a header and footer." ] ]
                [ Html.p [ style "margin" "0" ] [ Html.text "Footer text" ] ]
            , Card.card
                [ Html.p [ style "margin" "0" ] [ Html.text "Simple card with no header or footer." ] ]
            ]
        ]


viewProgress : Html.Html msg
viewProgress =
    Html.section [ style "margin-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Progress" ]
        , Stack.stack Stack.Vertical
            [ Stack.spacing Stack.Medium ]
            [ Progress.progress [] 25
            , Progress.progress [] 50
            , Progress.progress [] 75
            , Progress.progress [] 100
            ]
        ]


viewSpinners : Html.Html msg
viewSpinners =
    Html.section [ style "margin-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Spinners" ]
        , Grid.grid
            [ Grid.columns 3, Grid.gap Grid.Medium ]
            [ Card.withHeader
                [ Html.text "Small" ]
                [ Spinner.spinner [ Spinner.small ] ]
            , Card.withHeader
                [ Html.text "Medium" ]
                [ Spinner.spinner [ Spinner.medium ] ]
            , Card.withHeader
                [ Html.text "Large" ]
                [ Spinner.spinner [ Spinner.large ] ]
            ]
        ]


viewBreadcrumbs : Html.Html msg
viewBreadcrumbs =
    Html.section [ style "margin-bottom" Tokens.spacing.xxl ]
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.xl
            ]
            [ Html.text "Breadcrumbs" ]
        , Card.withHeader
            [ Html.text "Navigation" ]
            [ Breadcrumb.breadcrumb
                [ Breadcrumb.item "/" "Home"
                , Breadcrumb.item "/curriculum" "Curriculum"
                , Breadcrumb.item "/curriculum/polynomial-factorization" "Unit 2"
                ]
            ]
        ]
