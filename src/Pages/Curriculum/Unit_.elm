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
        [ Html.div [ class "min-h-screen bg-surface p-8 font-sans text-anthracite" ]
            [ Html.div [ class "max-w-4xl mx-auto" ]
                [ Html.a [ href "/curriculum", class "text-primary hover:opacity-80 mb-8 inline-block font-semibold" ]
                    [ Html.text "← Back to Curriculum" ]
                , Html.h1 [ class "text-5xl font-serif font-bold text-anthracite mb-8 leading-tight" ]
                    [ Html.text unit.title ]
                , Html.div [ class "space-y-4" ]
                    (List.map (viewLesson unit.slug) unit.lessons)
                ]
            ]
        ]
    }


viewLesson : String -> Lesson -> Html.Html msg
viewLesson unitSlug lesson =
    Html.a
        [ href ("/curriculum/" ++ unitSlug ++ "/" ++ lesson.slug)
        , class "block bg-white rounded-orbital shadow-sm p-6 hover:shadow-md transition-all hover:-translate-y-1"
        ]
        [ Html.h2 [ class "text-xl font-bold text-primary" ]
            [ Html.text lesson.title ]
        ]


viewNotFound : String -> View msg
viewNotFound slug =
    { title = "Unit Not Found - KA Math Companion"
    , body =
        [ Html.div [ class "min-h-screen bg-surface p-8 flex items-center justify-center font-sans" ]
            [ Html.div [ class "text-center" ]
                [ Html.h1 [ class "text-4xl font-serif font-bold text-anthracite mb-4" ]
                    [ Html.text "Unit Not Found" ]
                , Html.p [ class "text-stone-500 mb-8" ]
                    [ Html.text ("Could not find unit: " ++ slug) ]
                , Html.a [ href "/curriculum", class "bg-primary text-white px-8 py-3 rounded-full font-semibold inline-block" ]
                    [ Html.text "Return to Curriculum" ]
                ]
            ]
        ]
    }
