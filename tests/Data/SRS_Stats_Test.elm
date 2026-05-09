module Data.SRS_Stats_Test exposing (suite)

import Data.SRS exposing (Card(..), accuracy, newCard, recordAnswer)
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Data.SRS - Card Statistics"
        [ Test.describe "accuracy"
            [ Test.test "returns 0 for card with no reviews" <|
                \_ ->
                    let
                        card =
                            newCard "Q" "A" "obj-1"
                    in
                    accuracy card
                        |> Expect.equal 0.0
            , Test.test "returns 1.0 for card with all correct" <|
                \_ ->
                    let
                        card =
                            newCard "Q" "A" "obj-1"
                                |> recordAnswer True
                                |> recordAnswer True
                    in
                    accuracy card
                        |> Expect.equal 1.0
            , Test.test "returns 0.5 for card with half correct" <|
                \_ ->
                    let
                        card =
                            newCard "Q" "A" "obj-1"
                                |> recordAnswer True
                                |> recordAnswer False
                    in
                    accuracy card
                        |> Expect.within (Expect.Absolute 0.001) 0.5
            ]
        , Test.describe "recordAnswer"
            [ Test.test "increments reviewCount on correct answer" <|
                \_ ->
                    let
                        card =
                            newCard "Q" "A" "obj-1"
                                |> recordAnswer True
                    in
                    case card of
                        Card fields ->
                            fields.reviewCount
                                |> Expect.equal 1
            , Test.test "increments correctCount on correct answer" <|
                \_ ->
                    let
                        card =
                            newCard "Q" "A" "obj-1"
                                |> recordAnswer True
                    in
                    case card of
                        Card fields ->
                            fields.correctCount
                                |> Expect.equal 1
            , Test.test "does not increment correctCount on incorrect answer" <|
                \_ ->
                    let
                        card =
                            newCard "Q" "A" "obj-1"
                                |> recordAnswer False
                    in
                    case card of
                        Card fields ->
                            fields.correctCount
                                |> Expect.equal 0
            , Test.test "increments reviewCount on incorrect answer" <|
                \_ ->
                    let
                        card =
                            newCard "Q" "A" "obj-1"
                                |> recordAnswer False
                    in
                    case card of
                        Card fields ->
                            fields.reviewCount
                                |> Expect.equal 1
            ]
        ]
