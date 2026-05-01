module Pages.Curriculum.Unit_.Lesson_ exposing (page)

import Data.Curriculum exposing (Lesson, Unit)
import Data.IntegratedMath3 as IntegratedMath3
import Design.Breadcrumb as Breadcrumb
import Design.Card as Card
import Design.Container as Container
import Design.Header as Header
import Design.Stack as Stack
import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (href, style)
import View exposing (View)


page : { unit : String, lesson : String } -> View msg
page params =
    case ( findUnit params.unit, findLesson params.unit params.lesson ) of
        ( Just unit, Just lesson ) ->
            viewLesson unit lesson

        ( Just unit, Nothing ) ->
            viewLessonNotFound unit params.lesson

        ( Nothing, _ ) ->
            viewUnitNotFound params.unit


findUnit : String -> Maybe Unit
findUnit slug =
    IntegratedMath3.course.units
        |> List.filter (\u -> u.slug == slug)
        |> List.head


findLesson : String -> String -> Maybe Lesson
findLesson unitSlug lessonSlug =
    findUnit unitSlug
        |> Maybe.andThen
            (\unit ->
                unit.lessons
                    |> List.filter (\l -> l.slug == lessonSlug)
                    |> List.head
            )


viewLesson : Unit -> Lesson -> View msg
viewLesson unit lesson =
    { title = lesson.title ++ " - KA Math Companion"
    , body =
        [ Html.div
            [ style "min-h" "100-vh"
            , style "background-color" ("#" ++ Tokens.colorPalette.surface)
            , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
            , style "font-family" Tokens.typographyScale.bodyFont
            ]
            [ viewHeader
            , Container.container
                [ Stack.stack Stack.Vertical
                    [ Stack.spacing Stack.Medium ]
                    [ viewBreadcrumb unit
                    , viewLessonTitle lesson
                    , viewObjectives lesson
                    ]
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


viewBreadcrumb : Unit -> Html.Html msg
viewBreadcrumb unit =
    Breadcrumb.breadcrumb
        [ Breadcrumb.item "/curriculum" "Curriculum"
        , Breadcrumb.item ("/curriculum/" ++ unit.slug) unit.title
        ]


viewLessonTitle : Lesson -> Html.Html msg
viewLessonTitle lesson =
    Html.h1
        [ style "font-size" Tokens.typographyScale.h1FontSize
        , style "font-family" Tokens.typographyScale.headingFont
        , style "font-weight" "700"
        , style "margin" "0"
        , style "line-height" "1.0"
        , style "letter-spacing" "-0.04em"
        , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
        ]
        [ Html.text lesson.title ]


viewObjectives : Lesson -> Html.Html msg
viewObjectives lesson =
    Card.withHeader
        [ Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin" "0"
            , style "color" ("#" ++ Tokens.colorPalette.primary)
            ]
            [ Html.text "Learning Objectives" ]
        ]
        [ viewObjectiveList lesson.objectives ]


viewObjectiveList : List String -> Html.Html msg
viewObjectiveList objectives =
    if List.isEmpty objectives then
        Html.p
            [ style "color" ("#" ++ Tokens.colorPalette.textSecondary)
            , style "font-style" "italic"
            ]
            [ Html.text "Objectives coming soon..." ]

    else
        Stack.stack Stack.Vertical
            [ Stack.spacing Stack.Small ]
            (List.map viewObjective objectives)


viewObjective : String -> Html.Html msg
viewObjective objective =
    Html.div
        [ style "display" "flex"
        , style "align-items" "flex-start"
        , style "gap" Tokens.spacing.sm
        ]
        [ Html.span
            [ style "color" ("#" ++ Tokens.colorPalette.primary)
            , style "font-size" Tokens.typographyScale.h3FontSize
            , style "line-height" "1"
            ]
            [ Html.text "•" ]
        , Html.span
            [ style "font-size" Tokens.typographyScale.largeFontSize
            , style "line-height" "1.5"
            , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
            ]
            [ Html.text objective ]
        ]


viewLessonNotFound : Unit -> String -> View msg
viewLessonNotFound unit lessonSlug =
    { title = "Lesson Not Found - KA Math Companion"
    , body =
        [ Html.div
            [ style "min-h" "100-vh"
            , style "background-color" ("#" ++ Tokens.colorPalette.surface)
            , style "font-family" Tokens.typographyScale.bodyFont
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
                        [ Html.text "Lesson Not Found" ]
                    , Html.p
                        [ style "font-size" Tokens.typographyScale.largeFontSize
                        , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                        ]
                        [ Html.text ("Could not find lesson: " ++ lessonSlug) ]
                    , Html.a
                        [ href ("/curriculum/" ++ unit.slug)
                        , style "text-decoration" "none"
                        , style "color" ("#" ++ Tokens.colorPalette.primary)
                        , style "font-weight" "600"
                        ]
                        [ Html.text ("Back to " ++ unit.title) ]
                    ]
                ]
            ]
        ]
    }


viewUnitNotFound : String -> View msg
viewUnitNotFound unitSlug =
    { title = "Unit Not Found - KA Math Companion"
    , body =
        [ Html.div
            [ style "min-h" "100-vh"
            , style "background-color" ("#" ++ Tokens.colorPalette.surface)
            , style "font-family" Tokens.typographyScale.bodyFont
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
                        [ Html.text ("Could not find unit: " ++ unitSlug) ]
                    , Html.a
                        [ href "/curriculum"
                        , style "text-decoration" "none"
                        , style "color" ("#" ++ Tokens.colorPalette.primary)
                        , style "font-weight" "600"
                        ]
                        [ Html.text "← Back to Curriculum" ]
                    ]
                ]
            ]
        ]
    }