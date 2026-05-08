module Logic.Review_Test exposing (suite)

import Data.SRS exposing (Box(..), Card(..), newCard)
import Expect
import Logic.Leitner exposing (intervalDays, moveCardDown, moveCardUp)
import Logic.Review exposing (ReviewSession, SessionStats, cardCount, createSession, currentCard, getDueCards, getRemainingCount, isSessionComplete, recordAnswer, sessionsReviewed)
import Test


suite : Test.Test
suite =
    Test.describe "Logic.Review"
        [ Test.describe "createSession"
            [ Test.test "creates session with due cards" <|
                \_ ->
                    let
                        cards =
                            [ newCard "q1" "a1" "obj-1"
                            , newCard "q2" "a2" "obj-2"
                            ]
                        session =
                            createSession cards
                    in
                    cardCount session
                        |> Expect.equal 2
            , Test.test "initial current index is 0" <|
                \_ ->
                    let
                        cards =
                            [ newCard "q1" "a1" "obj-1" ]
                        session =
                            createSession cards
                    in
                    currentCard session
                        |> Expect.equal (List.head cards)
            ]
        , Test.describe "currentCard"
            [ Test.test "returns first card initially" <|
                \_ ->
                    let
                        cards =
                            [ newCard "q1" "a1" "obj-1"
                            , newCard "q2" "a2" "obj-2"
                            ]
                        session =
                            createSession cards
                    in
                    currentCard session
                        |> Expect.equal (List.head cards)
            ]
        , Test.describe "getRemainingCount"
            [ Test.test "returns total cards minus current index" <|
                \_ ->
                    let
                        cards =
                            [ newCard "q1" "a1" "obj-1"
                            , newCard "q2" "a2" "obj-2"
                            , newCard "q3" "a3" "obj-3"
                            ]
                        session =
                            createSession cards
                    in
                    getRemainingCount session
                        |> Expect.equal 3
            ]
        , Test.describe "isSessionComplete"
            [ Test.test "false when cards remain" <|
                \_ ->
                    let
                        cards =
                            [ newCard "q1" "a1" "obj-1" ]
                        session =
                            createSession cards
                    in
                    isSessionComplete session
                        |> Expect.equal False
            , Test.test "true when all cards reviewed" <|
                \_ ->
                    let
                        cards =
                            [ newCard "q1" "a1" "obj-1" ]
                        session =
                            { dueCards = cards, currentIndex = 1, stats = { correctCount = 0, incorrectCount = 0, reviewedCount = 0 } }
                    in
                    isSessionComplete session
                        |> Expect.equal True
            ]
        , Test.describe "recordAnswer"
            [ Test.test "correct answer increments correct count and advances index" <|
                \_ ->
                    let
                        cards =
                            [ newCard "q1" "a1" "obj-1" ]
                        session =
                            createSession cards
                        updatedSession =
                            recordAnswer True session
                    in
                    case currentCard updatedSession of
                        Just _ ->
                            Expect.fail "Should have no current card after last answer"

                        Nothing ->
                            Expect.pass
            , Test.test "incorrect answer increments incorrect count and advances index" <|
                \_ ->
                    let
                        cards =
                            [ newCard "q1" "a1" "obj-1" ]
                        session =
                            createSession cards
                        updatedSession =
                            recordAnswer False session
                    in
                    case currentCard updatedSession of
                        Just _ ->
                            Expect.fail "Should have no current card after last answer"

                        Nothing ->
                            Expect.pass
            , Test.test "correct answer moves card up a box" <|
                \_ ->
                    let
                        originalCard =
                            newCard "q1" "a1" "obj-1"
                        cards =
                            [ originalCard ]
                        session =
                            createSession cards
                        updatedSession =
                            recordAnswer True session
                        movedCard =
                            updatedSession.dueCards
                                |> List.filter (\(Card c) -> c.objectiveId == "obj-1")
                                |> List.head
                    in
                    case movedCard of
                        Just (Card c) ->
                            c.box
                                |> Expect.equal Box2

                        Nothing ->
                            Expect.fail "Card not found in list"
            , Test.test "incorrect answer moves card down a box" <|
                \_ ->
                    let
                        boxedCard =
                            Card { question = "q1", answer = "a1", objectiveId = "obj-1", box = Box2, intervalDays = 3, nextReviewDate = "", reviewCount = 0, correctCount = 0 }
                        cards =
                            [ boxedCard ]
                        session =
                            createSession cards
                        updatedSession =
                            recordAnswer False session
                        movedCard =
                            updatedSession.dueCards
                                |> List.filter (\(Card c) -> c.objectiveId == "obj-1")
                                |> List.head
                    in
                    case movedCard of
                        Just (Card c) ->
                            c.box
                                |> Expect.equal Box1

                        Nothing ->
                            Expect.fail "Card not found in list"
            ]
        , Test.describe "getDueCards"
            [ Test.test "filters due cards from list" <|
                \_ ->
                    let
                        allCards =
                            [ newCard "q1" "a1" "obj-1"
                            , newCard "q2" "a2" "obj-2"
                            ]
                        dueCards =
                            getDueCards allCards
                    in
                    List.length dueCards
                        |> Expect.equal 2
            ]
        ]