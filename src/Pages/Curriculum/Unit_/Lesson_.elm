module Pages.Curriculum.Unit_.Lesson_ exposing (page)

import Data.Curriculum exposing (Lesson, Unit)
import Data.IntegratedMath3 as IntegratedMath3
import Html
import Html.Attributes exposing (class, href)
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
        [ Html.div [ class "min-h-screen bg-surface p-8 font-sans text-anthracite" ]
            [ Html.div [ class "max-w-4xl mx-auto" ]
                [ Html.div [ class "mb-8 flex items-center gap-2 text-sm font-medium" ]
                    [ Html.a [ href "/curriculum", class "text-stone-500 hover:text-primary transition-colors" ]
                        [ Html.text "Curriculum" ]
                    , Html.span [ class "text-stone-300" ] [ Html.text "→" ]
                    , Html.a [ href ("/curriculum/" ++ unit.slug), class "text-stone-500 hover:text-primary transition-colors" ]
                        [ Html.text unit.title ]
                    ]
                , Html.h1 [ class "text-5xl font-serif font-bold text-anthracite mb-8 leading-tight" ]
                    [ Html.text lesson.title ]
                , Html.div [ class "bg-white rounded-orbital shadow-sm p-10" ]
                    [ Html.h2 [ class "text-2xl font-serif font-bold text-primary mb-6" ]
                        [ Html.text "Learning Objectives" ]
                    , viewObjectives lesson.objectives
                    ]
                ]
            ]
        ]
    }


viewObjectives : List String -> Html.Html msg
viewObjectives objectives =
    if List.isEmpty objectives then
        Html.p [ class "text-stone-400 italic" ]
            [ Html.text "Objectives coming soon..." ]

    else
        Html.ul [ class "space-y-4" ]
            (List.map viewObjective objectives)


viewObjective : String -> Html.Html msg
viewObjective objective =
    Html.li [ class "flex items-start text-lg leading-relaxed" ]
        [ Html.span [ class "text-primary mr-3 text-2xl leading-none" ] [ Html.text "•" ]
        , Html.text objective
        ]


viewLessonNotFound : Unit -> String -> View msg
viewLessonNotFound unit lessonSlug =
    { title = "Lesson Not Found - KA Math Companion"
    , body =
        [ Html.div [ class "min-h-screen bg-surface p-8 flex items-center justify-center font-sans" ]
            [ Html.div [ class "text-center" ]
                [ Html.h1 [ class "text-4xl font-serif font-bold text-anthracite mb-4" ]
                    [ Html.text "Lesson Not Found" ]
                , Html.p [ class "text-stone-500 mb-8" ]
                    [ Html.text ("Could not find lesson: " ++ lessonSlug) ]
                , Html.a [ href ("/curriculum/" ++ unit.slug), class "bg-primary text-white px-8 py-3 rounded-full font-semibold inline-block" ]
                    [ Html.text ("Back to " ++ unit.title) ]
                ]
            ]
        ]
    }


viewUnitNotFound : String -> View msg
viewUnitNotFound unitSlug =
    { title = "Unit Not Found - KA Math Companion"
    , body =
        [ Html.div [ class "min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-8 flex items-center justify-center" ]
            [ Html.div [ class "text-center" ]
                [ Html.h1 [ class "text-2xl font-bold text-indigo-900 mb-4" ]
                    [ Html.text "Unit Not Found" ]
                , Html.p [ class "text-gray-600" ]
                    [ Html.text ("Could not find unit: " ++ unitSlug) ]
                , Html.a [ href "/curriculum", class "text-indigo-600 hover:underline mt-4 inline-block" ]
                    [ Html.text "← Back to Curriculum" ]
                ]
            ]
        ]
    }
