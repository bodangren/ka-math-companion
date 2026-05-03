module Pages.Curriculum.Unit_ exposing (page)

import Data.Curriculum exposing (Lesson, Unit)
import Data.IntegratedMath3 as IntegratedMath3
import Design.Card as Card
import Design.Container as Container
import Design.Footer as Footer
import Design.Header as Header
import Design.Stack as Stack
import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (href, style)
import View exposing (View)


page : { unit : String } -> View msg
page params =
    case findUnit params.unit of
        Just unit ->
            viewUnit unit

        Nothing ->
            viewNotFound params.unit


findUnit : String -> Maybe Unit
findUnit slug =
    IntegratedMath3.course.units
        |> List.filter (\u -> u.slug == slug)
        |> List.head


viewUnit : Unit -> View msg
viewUnit unit =
    { title = unit.title ++ " - KA Math Companion"
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
                    [ Stack.spacing Stack.Medium ]
                    [ viewBackLink
                    , viewUnitTitle unit
                    , viewLessons unit
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


viewBackLink : Html.Html msg
viewBackLink =
    Html.a
        [ href "/curriculum"
        , style "text-decoration" "none"
        , style "color" ("#" ++ Tokens.colorPalette.primary)
        , style "font-weight" "600"
        , style "margin-bottom" Tokens.spacing.md
        ]
        [ Html.text "← Back to Curriculum" ]


viewUnitTitle : Unit -> Html.Html msg
viewUnitTitle unit =
    Html.h1
        [ style "font-size" Tokens.typographyScale.h1FontSize
        , style "font-family" Tokens.typographyScale.headingFont
        , style "font-weight" "700"
        , style "margin" "0"
        , style "line-height" "1.0"
        , style "letter-spacing" "-0.04em"
        , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
        ]
        [ Html.text unit.title ]


viewLessons : Unit -> Html.Html msg
viewLessons unit =
    Stack.stack Stack.Vertical
        [ Stack.spacing Stack.Small ]
        (List.map (viewLesson unit.slug) unit.lessons)


viewLesson : String -> Lesson -> Html.Html msg
viewLesson unitSlug lesson =
    Html.a
        [ href ("/curriculum/" ++ unitSlug ++ "/" ++ lesson.slug)
        , style "text-decoration" "none"
        ]
        [ Card.card
            [ Html.h2
                [ style "font-size" Tokens.typographyScale.h3FontSize
                , style "font-family" Tokens.typographyScale.headingFont
                , style "font-weight" "600"
                , style "margin" "0"
                , style "color" ("#" ++ Tokens.colorPalette.primary)
                ]
                [ Html.text lesson.title ]
            ]
        ]


viewNotFound : String -> View msg
viewNotFound slug =
    { title = "Unit Not Found - KA Math Companion"
    , body =
        [ Html.div
            [ style "min-h" "100-vh"
            , style "background-color" ("#" ++ Tokens.colorPalette.surface)
            , style "font-family" Tokens.typographyScale.bodyFont
            , style "display" "flex"
            , style "flex-direction" "column"
            ]
            [ viewHeader
            , Container.container
                [ Stack.stack Stack.Vertical
                    [ Stack.spacing Stack.Medium ]
                    [ Html.h1
                        [ style "font-size" Tokens.typographyScale.h1FontSize
                        , style "font-family" Tokens.typographyScale.headingFont
                        , style "font-weight" "700"
                        , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
                        ]
                        [ Html.text "Unit Not Found" ]
                    , Html.p
                        [ style "font-size" Tokens.typographyScale.largeFontSize
                        , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                        ]
                        [ Html.text ("Could not find unit: " ++ slug) ]
                    , Html.a
                        [ href "/curriculum"
                        , style "text-decoration" "none"
                        , style "color" ("#" ++ Tokens.colorPalette.primary)
                        , style "font-weight" "600"
                        ]
                        [ Html.text "Return to Curriculum" ]
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
