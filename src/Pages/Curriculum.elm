module Pages.Curriculum exposing (page)

import Data.IntegratedMath3 as IntegratedMath3
import Design.Card as Card
import Design.Container as Container
import Design.Grid as Grid
import Design.Header as Header
import Design.Tokens as Tokens
import Html
import Html.Attributes exposing (href, style)
import View exposing (View)


page : View msg
page =
    { title = "Curriculum - KA Math Companion"
    , body =
        [ Html.div
            [ style "min-h" "100-vh"
            , style "background-color" ("#" ++ Tokens.colorPalette.surface)
            , style "color" ("#" ++ Tokens.colorPalette.textPrimary)
            , style "font-family" Tokens.typographyScale.bodyFont
            ]
            [ viewHeader
            , Container.container
                [ Html.div [ style "padding" (Tokens.spacing.xl ++ " 0") ]
                    [ Html.h1
                        [ style "font-size" Tokens.typographyScale.h1FontSize
                        , style "font-family" Tokens.typographyScale.headingFont
                        , style "font-weight" "700"
                        , style "margin-bottom" Tokens.spacing.sm
                        ]
                        [ Html.text "Curriculum" ]
                    , Html.p
                        [ style "font-size" Tokens.typographyScale.largeFontSize
                        , style "margin-bottom" Tokens.spacing.xl
                        , style "font-weight" "500"
                        , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                        ]
                        [ Html.text "Integrated Math 3 • 13 Units" ]
                    , Grid.grid
                        [ Grid.columns 2, Grid.gap Grid.Large ]
                        (List.map viewUnit IntegratedMath3.course.units)
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


viewUnit : { title : String, slug : String, lessons : List a } -> Html.Html msg
viewUnit unit =
    Html.a
        [ href ("/curriculum/" ++ unit.slug)
        , style "text-decoration" "none"
        , style "color" "inherit"
        , style "display" "block"
        , style "transition" "transform 0.2s ease"
        , attribute "onmouseover" "this.style.transform='translateY(-4px)'"
        , attribute "onmouseout" "this.style.transform='translateY(0)'"
        ]
        [ Card.card
            [ Html.h2
                [ style "font-size" Tokens.typographyScale.h3FontSize
                , style "font-family" Tokens.typographyScale.headingFont
                , style "font-weight" "600"
                , style "margin-bottom" Tokens.spacing.xs
                , style "color" ("#" ++ Tokens.colorPalette.primary)
                ]
                [ Html.text unit.title ]
            , Html.div
                [ style "font-family" Tokens.typographyScale.bodyFont
                , style "font-size" Tokens.typographyScale.smallFontSize
                , style "font-weight" "600"
                , style "color" ("#" ++ Tokens.colorPalette.textSecondary)
                ]
                [ Html.text (String.fromInt (List.length unit.lessons) ++ " Modules") ]
            ]
        ]
