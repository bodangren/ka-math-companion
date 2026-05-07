module Logic.Progress_Test exposing (suite)

import Expect
import Logic.Progress as Progress
import Test


suite : Test.Test
suite =
    Test.describe "Logic.Progress"
        [ Test.test "init creates empty progress state" <|
            \_ ->
                let
                    state =
                        Progress.init
                in
                Expect.equal (Progress.isEmpty state) True
        , Test.test "addEntry adds new entry to state" <|
            \_ ->
                let
                    state =
                        Progress.init
                        |> Progress.addEntry "unit1" "lesson1" "obj1"
                in
                Expect.equal (Progress.entryCount state) 1
        , Test.test "getEntry returns entry if exists" <|
            \_ ->
                let
                    state =
                        Progress.init
                            |> Progress.addEntry "unit1" "lesson1" "obj1"
                    maybeEntry =
                        Progress.getEntry "unit1" "lesson1" "obj1" state
                in
                case maybeEntry of
                    Just entry ->
                        Expect.equal entry.objectiveId "obj1"

                    Nothing ->
                        Expect.fail "Expected entry"
        , Test.test "getEntry returns Nothing for non-existent entry" <|
            \_ ->
                let
                    state =
                        Progress.init
                    maybeEntry =
                        Progress.getEntry "unit1" "lesson1" "obj1" state
                in
                Expect.equal maybeEntry Nothing
        , Test.test "updateEntry updates existing entry" <|
            \_ ->
                let
                    state =
                        Progress.init
                            |> Progress.addEntry "unit1" "lesson1" "obj1"
                    updatedState =
                        state
                            |> Progress.updateEntry "unit1" "lesson1" "obj1"
                                (\entry -> { entry | attemptCount = 5 })
                    maybeEntry =
                        Progress.getEntry "unit1" "lesson1" "obj1" updatedState
                in
                case maybeEntry of
                    Just entry ->
                        Expect.equal entry.attemptCount 5

                    Nothing ->
                        Expect.fail "Expected entry"
        , Test.test "recordAttempt updates mastery on correct answer" <|
            \_ ->
                let
                    state =
                        Progress.init
                            |> Progress.addEntry "unit1" "lesson1" "obj1"
                            |> Progress.recordAttempt "unit1" "lesson1" "obj1" True
                    maybeEntry =
                        Progress.getEntry "unit1" "lesson1" "obj1" state
                in
                case maybeEntry of
                    Just entry ->
                        Expect.equal entry.correctCount 1

                    Nothing ->
                        Expect.fail "Expected entry"
        , Test.test "recordAttempt increments consecutiveCorrect on correct" <|
            \_ ->
                let
                    state =
                        Progress.init
                            |> Progress.addEntry "unit1" "lesson1" "obj1"
                            |> Progress.recordAttempt "unit1" "lesson1" "obj1" True
                            |> Progress.recordAttempt "unit1" "lesson1" "obj1" True
                    maybeEntry =
                        Progress.getEntry "unit1" "lesson1" "obj1" state
                in
                case maybeEntry of
                    Just entry ->
                        Expect.equal entry.consecutiveCorrect 2

                    Nothing ->
                        Expect.fail "Expected entry"
        , Test.test "recordAttempt resets consecutiveCorrect on incorrect" <|
            \_ ->
                let
                    state =
                        Progress.init
                            |> Progress.addEntry "unit1" "lesson1" "obj1"
                            |> Progress.recordAttempt "unit1" "lesson1" "obj1" True
                            |> Progress.recordAttempt "unit1" "lesson1" "obj1" True
                            |> Progress.recordAttempt "unit1" "lesson1" "obj1" False
                    maybeEntry =
                        Progress.getEntry "unit1" "lesson1" "obj1" state
                in
                case maybeEntry of
                    Just entry ->
                        Expect.equal entry.consecutiveCorrect 0

                    Nothing ->
                        Expect.fail "Expected entry"
        , Test.test "getUnitProgress returns entries for a unit" <|
            \_ ->
                let
                    state =
                        Progress.init
                            |> Progress.addEntry "unit1" "lesson1" "obj1"
                            |> Progress.addEntry "unit1" "lesson2" "obj2"
                            |> Progress.addEntry "unit2" "lesson1" "obj3"
                    unit1Entries =
                        Progress.getUnitProgress "unit1" state
                in
                Expect.equal (List.length unit1Entries) 2
        , Test.test "masteredCount returns count of mastered entries" <|
            \_ ->
                let
                    state =
                        Progress.init
                            |> Progress.addEntry "unit1" "lesson1" "obj1"
                            |> Progress.addEntry "unit1" "lesson2" "obj2"
                            |> Progress.addEntry "unit1" "lesson3" "obj3"
                            |> Progress.recordAttempt "unit1" "lesson1" "obj1" True
                            |> Progress.recordAttempt "unit1" "lesson1" "obj1" True
                            |> Progress.recordAttempt "unit1" "lesson1" "obj1" True
                            |> Progress.recordAttempt "unit1" "lesson2" "obj2" True
                            |> Progress.recordAttempt "unit1" "lesson2" "obj2" True
                            |> Progress.recordAttempt "unit1" "lesson2" "obj2" True
                    count =
                        Progress.masteredCount state
                in
                Expect.equal count 2
        ]