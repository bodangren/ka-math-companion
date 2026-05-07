module Logic.Leitner_Test exposing (suite)

import Data.SRS exposing (Box(..), Card(..), newCard)
import Expect
import Logic.Leitner exposing (intervalDays, moveCardDown, moveCardUp)
import Test


suite : Test.Test
suite =
    Test.describe "Logic.Leitner"
        [ Test.describe "moveCardUp"
            [ Test.test "correct answer moves card from Box1 to Box2" <|
                \_ ->
                    let
                        card =
                            newCard "q" "a" "obj-1"
                    in
                    moveCardUp card
                        |> (\(Card c) -> c.box)
                        |> Expect.equal Box2
            , Test.test "Box5 stays in Box5 on correct" <|
                \_ ->
                    let
                        boxedCard =
                            Card { question = "q", answer = "a", objectiveId = "obj-1", box = Box5, intervalDays = 30, nextReviewDate = "", reviewCount = 0, correctCount = 0 }
                    in
                    moveCardUp boxedCard
                        |> (\(Card c) -> c.box)
                        |> Expect.equal Box5
            ]
        , Test.describe "moveCardDown"
            [ Test.test "incorrect answer moves card from Box3 to Box2" <|
                \_ ->
                    let
                        boxedCard =
                            Card { question = "q", answer = "a", objectiveId = "obj-1", box = Box3, intervalDays = 7, nextReviewDate = "", reviewCount = 0, correctCount = 0 }
                    in
                    moveCardDown boxedCard
                        |> (\(Card c) -> c.box)
                        |> Expect.equal Box2
            , Test.test "incorrect answer moves card from Box1 to Box1" <|
                \_ ->
                    let
                        card =
                            newCard "q" "a" "obj-1"
                    in
                    moveCardDown card
                        |> (\(Card c) -> c.box)
                        |> Expect.equal Box1
            ]
        , Test.describe "intervalDays"
            [ Test.test "Box1 has interval of 1 day" <|
                \_ ->
                    intervalDays Box1
                        |> Expect.equal 1
            , Test.test "Box2 has interval of 3 days" <|
                \_ ->
                    intervalDays Box2
                        |> Expect.equal 3
            , Test.test "Box3 has interval of 7 days" <|
                \_ ->
                    intervalDays Box3
                        |> Expect.equal 7
            , Test.test "Box4 has interval of 14 days" <|
                \_ ->
                    intervalDays Box4
                        |> Expect.equal 14
            , Test.test "Box5 has interval of 30 days" <|
                \_ ->
                    intervalDays Box5
                        |> Expect.equal 30
            ]
        ]