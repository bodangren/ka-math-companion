module Pages.Curriculum.Unit_.Lesson_ exposing (Model, Msg, page, view)

import Data.Curriculum exposing (Lesson, Unit)
import Data.IntegratedMath3 as IntegratedMath3
import Html
import Html.Attributes exposing (class, href)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    Never


page : Shared.Model -> Route { unit : String, lesson : String } -> Page Model Msg
page _ route =
    Page.sandbox
        { init = {}
        , update = \_ model -> model
        , view = view route
        }


view : Route { unit : String, lesson : String } -> Model -> View Msg
view route _ =
    case ( findUnit route.params.unit, findLesson route.params.unit route.params.lesson ) of
        ( Just unit, Just lesson ) ->
            viewLesson unit lesson

        ( Just unit, Nothing ) ->
            viewLessonNotFound unit route.params.lesson
        ( Nothing, _ ) ->
            viewUnitNotFound route.params.unit


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


viewLesson : Unit -> Lesson -> View Msg
viewLesson unit lesson =
    { title = lesson.title ++ " - KA Math Companion"
    , body =
        [ Html.div [ class "min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-8" ]
            [ Html.div [ class "max-w-4xl mx-auto" ]
                [ Html.div [ class "mb-4" ]
                    [ Html.a [ href "/curriculum", class "text-indigo-600 hover:underline" ]
                        [ Html.text "← Curriculum" ]
                    , Html.span [ class "mx-2 text-gray-400" ] [ Html.text "/" ]
                    , Html.a [ href ("/curriculum/" ++ unit.slug), class "text-indigo-600 hover:underline" ]
                        [ Html.text unit.title ]
                    ]
                , Html.h1 [ class "text-3xl font-bold text-indigo-900 mb-6" ]
                    [ Html.text lesson.title ]
                , Html.div [ class "bg-white rounded-lg shadow-sm p-6" ]
                    [ Html.h2 [ class "text-lg font-semibold text-gray-700 mb-4" ]
                        [ Html.text "Learning Objectives" ]
                    , viewObjectives lesson.objectives
                    ]
                ]
            ]
        ]
    }


viewObjectives : List { description : String } -> Html.Html Msg
viewObjectives objectives =
    if List.isEmpty objectives then
        Html.p [ class "text-gray-500 italic" ]
            [ Html.text "Objectives coming soon..." ]

    else
        Html.ul [ class "space-y-2" ]
            (List.map viewObjective objectives)


viewObjective : { description : String } -> Html.Html Msg
viewObjective objective =
    Html.li [ class "flex items-start" ]
        [ Html.span [ class "text-indigo-500 mr-2" ] [ Html.text "•" ]
        , Html.text objective.description
        ]


viewLessonNotFound : Unit -> String -> View Msg
viewLessonNotFound unit lessonSlug =
    { title = "Lesson Not Found - KA Math Companion"
    , body =
        [ Html.div [ class "min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-8 flex items-center justify-center" ]
            [ Html.div [ class "text-center" ]
                [ Html.h1 [ class "text-2xl font-bold text-indigo-900 mb-4" ]
                    [ Html.text "Lesson Not Found" ]
                , Html.p [ class "text-gray-600" ]
                    [ Html.text ("Could not find lesson: " ++ lessonSlug) ]
                , Html.a [ href ("/curriculum/" ++ unit.slug), class "text-indigo-600 hover:underline mt-4 inline-block" ]
                    [ Html.text ("← Back to " ++ unit.title) ]
                ]
            ]
        ]
    }


viewUnitNotFound : String -> View Msg
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
