module Pages.Home_ exposing (page)

import Html
import Html.Attributes exposing (class, href)
import View exposing (View)


page : View msg
page =
    { title = "KA Math Companion"
    , body =
        [ Html.div [ class "min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100" ]
            [ viewNav
            , viewHero
            , viewFeatures
            ]
        ]
    }


viewNav : Html.Html msg
viewNav =
    Html.nav [ class "flex items-center justify-between px-8 py-4" ]
        [ Html.a [ href "/", class "text-xl font-bold text-indigo-900" ]
            [ Html.text "KA Math" ]
        , Html.div [ class "flex gap-6" ]
            [ Html.a [ href "/curriculum", class "text-indigo-700 hover:text-indigo-900 font-medium" ]
                [ Html.text "Curriculum" ]
            ]
        ]


viewHero : Html.Html msg
viewHero =
    Html.div [ class "flex flex-col items-center justify-center px-8 py-20" ]
        [ Html.h1 [ class "text-5xl font-bold text-indigo-900 mb-6 text-center" ]
            [ Html.text "KA Math Companion" ]
        , Html.p [ class "text-xl text-gray-600 mb-8 text-center max-w-2xl" ]
            [ Html.text "A pedagogy-first companion to Khan Academy Integrated Math 3. Build durable understanding through conceptual exploration and spaced practice." ]
        , Html.a
            [ href "/curriculum"
            , class "bg-indigo-600 text-white px-8 py-3 rounded-lg font-medium hover:bg-indigo-700 transition-colors"
            ]
            [ Html.text "Browse Curriculum" ]
        ]


viewFeatures : Html.Html msg
viewFeatures =
    Html.div [ class "max-w-4xl mx-auto px-8 py-16" ]
        [ Html.h2 [ class "text-2xl font-bold text-indigo-900 mb-8 text-center" ]
            [ Html.text "What You'll Find" ]
        , Html.div [ class "grid grid-cols-1 md:grid-cols-3 gap-6" ]
            [ viewFeatureCard "13 Units" "Polynomials through rational functions, covering Integrated Math 3."
            , viewFeatureCard "Interactive Lessons" "Conceptual exploration with visualizations and examples."
            , viewFeatureCard "Spaced Practice" "Leitner-based review system for long-term retention."
            ]
        ]


viewFeatureCard : String -> String -> Html.Html msg
viewFeatureCard title description =
    Html.div [ class "bg-white rounded-lg shadow-sm p-6" ]
        [ Html.h3 [ class "text-lg font-semibold text-indigo-700 mb-2" ]
            [ Html.text title ]
        , Html.p [ class "text-gray-600" ]
            [ Html.text description ]
        ]
