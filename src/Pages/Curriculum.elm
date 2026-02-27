module Pages.Curriculum exposing (page)

import Data.IntegratedMath3 as IntegratedMath3
import Html
import Html.Attributes exposing (class, href)
import View exposing (View)


page : View msg
page =
    { title = "Curriculum - KA Math Companion"
    , body =
        [ Html.div [ class "min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-8" ]
            [ Html.div [ class "max-w-4xl mx-auto" ]
                [ Html.h1 [ class "text-3xl font-bold text-indigo-900 mb-6" ]
                    [ Html.text "Curriculum" ]
                , Html.p [ class "text-gray-600 mb-8" ]
                    [ Html.text "Integrated Math 3 - 13 Units" ]
                , Html.div [ class "space-y-4" ]
                    (List.map viewUnit IntegratedMath3.course.units)
                ]
            ]
        ]
    }


viewUnit : { title : String, slug : String, lessons : List a } -> Html.Html msg
viewUnit unit =
    Html.a
        [ href ("/curriculum/" ++ unit.slug)
        , class "block bg-white rounded-lg shadow-sm p-4 hover:shadow-md transition-shadow"
        ]
        [ Html.h2 [ class "text-lg font-semibold text-indigo-700" ]
            [ Html.text unit.title ]
        , Html.p [ class "text-sm text-gray-500" ]
            [ Html.text (String.fromInt (List.length unit.lessons) ++ " lessons") ]
        ]
