module Pages.ReviewPage exposing (page)

import Data.SRS exposing (Card(..), newCard)
import Design.Card as Card
import Design.Container as Container
import Design.Footer as Footer
import Design.Header as Header
import Design.Stack as Stack
import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (attribute, style)
import Logic.Review as Review
import View exposing (View)


type alias Model =
    { session : Review.ReviewSession
    , isFlipped : Bool
    }


init : Model
init =
    { session = Review.createSession [ newCard "What is the quadratic formula?" "x = (-b ± √(b²-4ac)) / 2a" "obj-srs-1" ]
    , isFlipped = False
    }


page : View msg
page =
    { title = "Daily Review - KA Math Companion"
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
                [ viewReviewContent
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
        , Header.link "/review" "Review"
        ]
        []


viewCardContent : Card -> Html.Html msg
viewCardContent (Card fields) =
    Html.div
        [ attribute "style" "padding:24px;text-align:center;font-size:18px;" ]
        [ Html.text fields.question ]


viewReviewContent : Html.Html msg
viewReviewContent =
    let
        session =
            init.session

        remaining =
            Review.getRemainingCount session

        total =
            Review.cardCount session

        current =
            Review.currentCard session
    in
    Html.div [ style "padding" (Tokens.spacing.xxl ++ " 0") ]
        [ Html.h1
            [ style "font-size" Tokens.typographyScale.h1FontSize
            , style "font-family" Tokens.typographyScale.headingFont
            , style "font-weight" "700"
            , style "margin-bottom" Tokens.spacing.sm
            ]
            [ Html.text "Daily Review" ]
        , Html.div [ style "margin-bottom" Tokens.spacing.lg ]
            [ Html.text ("Cards remaining: " ++ String.fromInt remaining ++ " of " ++ String.fromInt total)
            ]
        , case current of
            Just card ->
                Html.div []
                    [ Card.card
                        [ Stack.stack Stack.Vertical
                            [ Stack.spacing Stack.Large ]
                            [ viewCardContent card
                            , Html.div [ style "margin-top" Tokens.spacing.lg ]
                                [ Html.button
                                    [ style "background-color" ("#" ++ Tokens.colorPalette.primary)
                                    , style "color" ("#" ++ Tokens.colorPalette.white)
                                    , style "border" "none"
                                    , style "border-radius" "9999px"
                                    , style "padding" (Tokens.spacing.sm ++ " " ++ Tokens.spacing.lg)
                                    , style "font-family" Tokens.typographyScale.bodyFont
                                    , style "font-weight" "600"
                                    , style "cursor" "pointer"
                                    , style "margin-right" Tokens.spacing.md
                                    ]
                                    [ Html.text "Correct ✓" ]
                                , Html.button
                                    [ style "background-color" ("#" ++ Tokens.colorPalette.secondary)
                                    , style "color" ("#" ++ Tokens.colorPalette.white)
                                    , style "border" "none"
                                    , style "border-radius" "9999px"
                                    , style "padding" (Tokens.spacing.sm ++ " " ++ Tokens.spacing.lg)
                                    , style "font-family" Tokens.typographyScale.bodyFont
                                    , style "font-weight" "600"
                                    , style "cursor" "pointer"
                                    ]
                                    [ Html.text "Incorrect ✗" ]
                                ]
                            ]
                        ]
                    ]

            Nothing ->
                viewSessionComplete
        ]


viewSessionComplete : Html.Html msg
viewSessionComplete =
    Card.card
        [ Stack.stack Stack.Vertical
            [ Stack.spacing Stack.Medium ]
            [ Html.h2
                [ style "font-size" Tokens.typographyScale.h2FontSize
                , style "font-family" Tokens.typographyScale.headingFont
                , style "font-weight" "600"
                ]
                [ Html.text "Session Complete!" ]
            , Html.p [ style "color" ("#" ++ Tokens.colorPalette.textSecondary) ]
                [ Html.text "Great job! You've reviewed all your due cards. Come back tomorrow for more practice." ]
            ]
        ]