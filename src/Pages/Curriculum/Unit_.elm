module Pages.Curriculum.Unit_ exposing (page)

import Data.Curriculum exposing (Lesson, Unit)
import Data.IntegratedMath3 as IntegratedMath3
import Html
import Html.Attributes exposing (class, href)
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
        [ Html.div [ class "min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-8" ]
            [ Html.div [ class "max-w-4xl mx-auto" ]
                [ Html.a [ href "/curriculum", class "text-indigo-600 hover:underline mb-4 inline-block" ]
                    [ Html.text "← Back to Curriculum" ]
                , Html.h1 [ class "text-3xl font-bold text-indigo-900 mb-6" ]
                    [ Html.text unit.title ]
                , Html.div [ class "space-y-3" ]
                    (List.map (viewLesson unit.slug) unit.lessons)
                ]
            ]
        ]
    }


viewLesson : String -> Lesson -> Html.Html msg
viewLesson unitSlug lesson =
    Html.a
        [ href ("/curriculum/" ++ unitSlug ++ "/" ++ lesson.slug)
        , class "block bg-white rounded-lg shadow-sm p-4 hover:shadow-md transition-shadow"
        ]
        [ Html.h2 [ class "text-lg font-semibold text-indigo-700" ]
            [ Html.text lesson.title ]
        ]


viewNotFound : String -> View msg
viewNotFound slug =
    { title = "Unit Not Found - KA Math Companion"
    , body =
        [ Html.div [ class "min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-8 flex items-center justify-center" ]
            [ Html.div [ class "text-center" ]
                [ Html.h1 [ class "text-2xl font-bold text-indigo-900 mb-4" ]
                    [ Html.text "Unit Not Found" ]
                , Html.p [ class "text-gray-600" ]
                    [ Html.text ("Could not find unit: " ++ slug) ]
                , Html.a [ href "/curriculum", class "text-indigo-600 hover:underline mt-4 inline-block" ]
                    [ Html.text "← Back to Curriculum" ]
                ]
            ]
        ]
    }
