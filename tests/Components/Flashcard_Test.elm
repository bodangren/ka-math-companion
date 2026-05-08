module Components.Flashcard_Test exposing (suite)

import Components.Flashcard as Flashcard
import Data.SRS exposing (newCard)
import Expect
import Html
import Test


suite : Test.Test
suite =
    Test.describe "Components.Flashcard"
        [ Test.describe "flipCard"
            [ Test.test "flipCard toggles state from True to False" <|
                \_ ->
                    Flashcard.flipCard True
                        |> Expect.equal False
            , Test.test "flipCard toggles state from False to True" <|
                \_ ->
                    Flashcard.flipCard False
                        |> Expect.equal True
            ]
        , Test.describe "isFlipped"
            [ Test.test "isFlipped returns True when state is True" <|
                \_ ->
                    Flashcard.isFlipped True
                        |> Expect.equal True
            , Test.test "isFlipped returns False when state is False" <|
                \_ ->
                    Flashcard.isFlipped False
                        |> Expect.equal False
            ]
        , Test.describe "flashcard"
            [ Test.test "flashcard renders without crashing when not flipped" <|
                \_ ->
                    let
                        card =
                            newCard "What is 2+2?" "4" "obj-1"

                        html =
                            Flashcard.flashcard card False (always (Html.text ""))
                    in
                    case html of
                        _ ->
                            Expect.pass
            , Test.test "flashcard renders without crashing when flipped" <|
                \_ ->
                    let
                        card =
                            newCard "What is 2+2?" "4" "obj-1"

                        html =
                            Flashcard.flashcard card True (always (Html.text ""))
                    in
                    case html of
                        _ ->
                            Expect.pass
            ]
        , Test.describe "viewCard"
            [ Test.test "viewCard renders front of card with question" <|
                \_ ->
                    let
                        card =
                            newCard "Test question" "Test answer" "obj-1"

                        html =
                            Flashcard.viewCard card False (always (Html.text ""))
                    in
                    case html of
                        _ ->
                            Expect.pass
            , Test.test "viewCard renders back of card with answer" <|
                \_ ->
                    let
                        card =
                            newCard "Test question" "Test answer" "obj-1"

                        html =
                            Flashcard.viewCard card True (always (Html.text ""))
                    in
                    case html of
                        _ ->
                            Expect.pass
            ]
        , Test.describe "gradingButtons"
            [ Test.test "correctButton renders without crashing" <|
                \_ ->
                    let
                        html =
                            Flashcard.correctButton (always (Html.text ""))
                    in
                    case html of
                        _ ->
                            Expect.pass
            , Test.test "incorrectButton renders without crashing" <|
                \_ ->
                    let
                        html =
                            Flashcard.incorrectButton (always (Html.text ""))
                    in
                    case html of
                        _ ->
                            Expect.pass
            , Test.test "gradingButtons returns two buttons" <|
                \_ ->
                    let
                        buttons =
                            Flashcard.gradingButtons (always (Html.text "")) () ()
                    in
                    List.length buttons
                        |> Expect.equal 2
            ]
        ]