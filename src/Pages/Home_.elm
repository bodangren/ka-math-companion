module Pages.Home_ exposing (page)

import Html
import Html.Attributes exposing (class)
import View exposing (View)


page : View msg
page =
    { title = "KA Math Companion"
    , body =
        [ Html.div [ class "min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex items-center justify-center" ]
            [ Html.div [ class "text-center" ]
                [ Html.h1 [ class "text-4xl font-bold text-indigo-900 mb-4" ]
                    [ Html.text "KA Math Companion" ]
                , Html.p [ class "text-lg text-gray-600" ]
                    [ Html.text "A pedagogy-first companion to Khan Academy math courses" ]
                ]
            ]
        ]
    }
