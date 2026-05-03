module Components.Content exposing (viewLessonContent)

import Data.LessonContent exposing (CheckQuestion, ContentBlock(..), LessonContent, WorkedExample)
import Design.Alert as Alert
import Design.Card as Card
import Design.Stack as Stack
import Design.Tokens as Tokens
import Html exposing (Html)
import Html.Attributes exposing (style)


viewLessonContent : LessonContent -> List (Html msg)
viewLessonContent content =
    List.concat
        [ viewSection "Introduction" (List.map viewContentBlock content.introduction)
        , viewSection "Worked Examples" (List.map viewWorkedExample content.workedExamples)
        , if List.isEmpty content.commonMistakes then
            []

          else
            viewSection "Common Mistakes" (List.map viewMistake content.commonMistakes)
        , viewSection "Check Your Understanding" (List.map viewCheckQuestion content.checks)
        ]


viewSection : String -> List (Html msg) -> List (Html msg)
viewSection title items =
    [ Html.section
        [ style "margin-bottom" Tokens.spacing.xxl ]
        (Html.h2
            [ style "font-size" Tokens.typographyScale.h2FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.lg
            ]
            [ Html.text title ]
            :: items
        )
    ]


viewContentBlock : ContentBlock -> Html msg
viewContentBlock block =
    case block of
        Explanation text ->
            Html.p
                [ style "font-size" Tokens.typographyScale.largeFontSize
                , style "line-height" "1.6"
                , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
                , style "margin-bottom" Tokens.spacing.md
                ]
                [ Html.text text ]

        Definition term defText ->
            Card.card
                [ Html.div
                    [ style "display" "flex"
                    , style "gap" Tokens.spacing.sm
                    ]
                    [ Html.strong
                        [ style "color" ("#" ++ Tokens.colorPalette.primary) ]
                        [ Html.text (term ++ ": ") ]
                    , Html.span
                        [ style "color" ("#" ++ Tokens.colorPalette.textPrimary) ]
                        [ Html.text defText ]
                    ]
                ]


viewWorkedExample : WorkedExample -> Html msg
viewWorkedExample ex =
    Card.withHeader
        [ Html.strong [ style "font-family" Tokens.typographyScale.headingFont ] [ Html.text ("Problem: " ++ ex.problem) ] ]
        [ Stack.stack Stack.Vertical
            [ Stack.spacing Stack.Small ]
            (List.map viewStep ex.steps
                ++ [ Html.div
                        [ style "margin-top" Tokens.spacing.md
                        , style "padding" Tokens.spacing.md
                        , style "background-color" ("#" ++ Tokens.colorPalette.white)
                        , style "border-radius" "4px"
                        , style "font-weight" "600"
                        ]
                        [ Html.text ("Result: " ++ ex.result) ]
                   ]
            )
        ]


viewStep : { description : String, mathContent : String } -> Html msg
viewStep step =
    Html.div
        [ style "display" "flex"
        , style "flex-direction" "column"
        , style "gap" Tokens.spacing.xs
        ]
        [ Html.span
            [ style "color" ("#" ++ Tokens.colorPalette.textSecondary)
            , style "font-size" Tokens.typographyScale.smallFontSize
            ]
            [ Html.text step.description ]
        , Html.code
            [ style "font-family" "monospace"
            , style "font-size" Tokens.typographyScale.bodyFontSize
            , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
            ]
            [ Html.text step.mathContent ]
        ]


viewMistake : String -> Html msg
viewMistake mistake =
    Alert.alert Alert.Warning
        [ Html.text mistake ]


viewCheckQuestion : CheckQuestion -> Html msg
viewCheckQuestion q =
    Card.card
        [ Html.p
            [ style "font-weight" "600"
            , style "margin-bottom" Tokens.spacing.sm
            ]
            [ Html.text ("Q: " ++ q.question) ]
        , case q.hint of
            Just hint ->
                Html.p
                    [ style "font-size" Tokens.typographyScale.smallFontSize
                    , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                    , style "font-style" "italic"
                    ]
                    [ Html.text ("Hint: " ++ hint) ]

            Nothing ->
                Html.text ""
        ]
