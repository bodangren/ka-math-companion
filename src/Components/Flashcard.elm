module Components.Flashcard exposing (flashcard, flipCard, isFlipped, viewCard, correctButton, incorrectButton, gradingButtons)

import Data.SRS exposing (Card(..))
import Design.Button as Button
import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html
import Html.Attributes exposing (attribute, style)


flipCard : Bool -> Bool
flipCard current =
    not current


isFlipped : Bool -> Bool
isFlipped state =
    state


flashcard : Card -> Bool -> (msg -> Html.Html msg) -> Html.Html msg
flashcard =
    viewCard


viewCard : Card -> Bool -> (msg -> Html.Html msg) -> Html.Html msg
viewCard (Card fields) isFlippedState _ =
    let
        innerStyle =
            if isFlippedState then
                "position:relative;width:100%;height:100%;transition:transform 0.6s;transform-style:preserve-3d;transform:rotateY(180deg);"
            else
                "position:relative;width:100%;height:100%;transition:transform 0.6s;transform-style:preserve-3d;transform:rotateY(0deg);"

        cardContainerStyle =
            "perspective:1000px;width:100%;min-height:200px;cursor:pointer;"

        faceStyle =
            "position:absolute;width:100%;height:100%;backface-visibility:hidden;display:flex;align-items:center;justify-content:center;padding:"
                ++ spacing.lg
                ++ ";border-radius:24px;box-shadow:0 10px 15px -3px rgba(0,0,0,0.05);font-family:"
                ++ typographyScale.bodyFont
                ++ ";font-size:"
                ++ typographyScale.h3FontSize
                ++ ";"

        frontStyle =
            faceStyle
                ++ "background:#"
                ++ colorPalette.white
                ++ ";"

        backStyle =
            faceStyle
                ++ "background:#"
                ++ colorPalette.surface
                ++ ";transform:rotateY(180deg);"
    in
    Html.div
        [ attribute "style" cardContainerStyle ]
        [ Html.div
            [ attribute "style" innerStyle ]
            [ Html.div
                [ attribute "style" frontStyle ]
                [ Html.text fields.question ]
            , Html.div
                [ attribute "style" backStyle ]
                [ Html.text fields.answer ]
            ]
        ]


correctButton : msg -> Html.Html msg
correctButton msg =
    Html.button
        [ attribute "style" ("background:#" ++ colorPalette.primary ++ ";color:#" ++ colorPalette.white ++ ";border:none;border-radius:9999px;padding:" ++ spacing.sm ++ " " ++ spacing.lg ++ ";font-family:" ++ typographyScale.bodyFont ++ ";font-weight:600;cursor:pointer;margin-right:" ++ spacing.md ++ ";")
        , attribute "onclick" ("dispatchEvent(new Event('click',{bubbles:true}))")
        ]
        [ Html.text "Correct ✓" ]


incorrectButton : msg -> Html.Html msg
incorrectButton msg =
    Html.button
        [ attribute "style" ("background:#" ++ colorPalette.secondary ++ ";color:#" ++ colorPalette.white ++ ";border:none;border-radius:9999px;padding:" ++ spacing.sm ++ " " ++ spacing.lg ++ ";font-family:" ++ typographyScale.bodyFont ++ ";font-weight:600;cursor:pointer;")
        , attribute "onclick" ("dispatchEvent(new Event('click',{bubbles:true}))")
        ]
        [ Html.text "Incorrect ✗" ]


gradingButtons : (msg -> Html.Html msg) -> msg -> msg -> List (Html.Html msg)
gradingButtons toHtml correctMsg incorrectMsg =
    [ correctButton correctMsg, incorrectButton incorrectMsg ]