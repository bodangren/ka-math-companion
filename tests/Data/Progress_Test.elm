module Data.Progress_Test exposing (suite)

import Data.Progress exposing (MasteryLevel(..), ProgressEntry, encodeProgressEntry, decodeProgressEntry, updateMasteryOnAttempt, needsReview, isMastered)
import Expect
import Json.Decode as Decode
import Json.Encode as Encode
import Test


suite : Test.Test
suite =
    Test.describe "Data.Progress"
        [ Test.describe "MasteryLevel"
            [ Test.test "NotStarted has correct discriminant" <|
                \_ ->
                    Expect.equal (masteryToInt NotStarted) 0
            , Test.test "InProgress has correct discriminant" <|
                \_ ->
                    Expect.equal (masteryToInt InProgress) 1
            , Test.test "Mastered has correct discriminant" <|
                \_ ->
                    Expect.equal (masteryToInt Mastered) 2
            ]
        , Test.describe "ProgressEntry"
            [ Test.test "createEntry makes entry with NotStarted mastery" <|
                \_ ->
                    let
                        entry =
                            createEntry "unit1" "lesson1" "obj1"
                    in
                    Expect.equal entry.mastery NotStarted
            , Test.test "createEntry initializes attemptCount to 0" <|
                \_ ->
                    let
                        entry =
                            createEntry "unit1" "lesson1" "obj1"
                    in
                    Expect.equal entry.attemptCount 0
            , Test.test "createEntry initializes correctCount to 0" <|
                \_ ->
                    let
                        entry =
                            createEntry "unit1" "lesson1" "obj1"
                    in
                    Expect.equal entry.correctCount 0
            , Test.test "createEntry initializes incorrectCount to 0" <|
                \_ ->
                    let
                        entry =
                            createEntry "unit1" "lesson1" "obj1"
                    in
                    Expect.equal entry.incorrectCount 0
            , Test.test "createEntry sets unitSlug, lessonSlug, objectiveId" <|
                \_ ->
                    let
                        entry =
                            createEntry "polynomials" "factoring" "FOIL method"
                    in
                    Expect.equal ( entry.unitSlug, entry.lessonSlug, entry.objectiveId ) ( "polynomials", "factoring", "FOIL method" )
            , Test.test "createEntry initializes consecutiveCorrect to 0" <|
                \_ ->
                    let
                        entry =
                            createEntry "unit1" "lesson1" "obj1"
                    in
                    Expect.equal entry.consecutiveCorrect 0
            ]
        , Test.describe "JSON encoding/decoding"
            [ Test.test "encodeProgressEntry encodes mastery as integer" <|
                \_ ->
                    let
                        entry =
                            { unitSlug = "u1"
                            , lessonSlug = "l1"
                            , objectiveId = "o1"
                            , mastery = Mastered
                            , attemptCount = 5
                            , correctCount = 4
                            , incorrectCount = 1
                            , consecutiveCorrect = 3
                            , lastAttemptTimestamp = Nothing
                            }
                    in
                    let
                        json =
                            encodeProgressEntry entry
                        masteryValue =
                            Decode.decodeValue (Decode.field "mastery" Decode.int) json
                    in
                    case masteryValue of
                        Ok val ->
                            Expect.equal val 2

                        Err _ ->
                            Expect.fail "Failed to decode mastery"
            , Test.test "decodeProgressEntry decodes mastery from integer" <|
                \_ ->
                    let
                        json =
                            Encode.encode 0
                                (Encode.object
                                    [ ( "unitSlug", Encode.string "u1" )
                                    , ( "lessonSlug", Encode.string "l1" )
                                    , ( "objectiveId", Encode.string "o1" )
                                    , ( "mastery", Encode.int 2 )
                                    , ( "attemptCount", Encode.int 5 )
                                    , ( "correctCount", Encode.int 4 )
                                    , ( "incorrectCount", Encode.int 1 )
                                    , ( "consecutiveCorrect", Encode.int 3 )
                                    , ( "lastAttemptTimestamp", Encode.null )
                                    ]
                                )
                    in
                    case decodeProgressEntry json of
                        Ok entry ->
                            Expect.equal entry.mastery Mastered

                        Err _ ->
                            Expect.fail "Failed to decode entry"
            ]
        , Test.describe "Mastery Calculation (Task 4)"
            [ Test.test "3 consecutive correct = Mastered" <|
                \_ ->
                    let
                        entry =
                            createEntry "u1" "l1" "o1"
                                |> updateMasteryOnAttempt True
                                |> updateMasteryOnAttempt True
                                |> updateMasteryOnAttempt True
                    in
                    Expect.equal entry.mastery Mastered
            , Test.test "2 correct then incorrect resets consecutive" <|
                \_ ->
                    let
                        entry =
                            createEntry "u1" "l1" "o1"
                                |> updateMasteryOnAttempt True
                                |> updateMasteryOnAttempt True
                                |> updateMasteryOnAttempt False
                    in
                    Expect.equal entry.consecutiveCorrect 0
            , Test.test "1 correct then incorrect = InProgress" <|
                \_ ->
                    let
                        entry =
                            createEntry "u1" "l1" "o1"
                                |> updateMasteryOnAttempt True
                                |> updateMasteryOnAttempt False
                    in
                    Expect.equal entry.mastery InProgress
            , Test.test "isMastered returns True for Mastered entries" <|
                \_ ->
                    let
                        entry =
                            createEntry "u1" "l1" "o1"
                                |> updateMasteryOnAttempt True
                                |> updateMasteryOnAttempt True
                                |> updateMasteryOnAttempt True
                    in
                    Expect.equal (isMastered entry) True
            ]
        , Test.describe "Decay System (Task 5)"
            [ Test.test "needsReview True after 7+ days for mastered entry" <|
                \_ ->
                    let
                        sevenDaysAgo =
                            7 * 24 * 60 * 60 * 1000

                        currentTime =
                            10 * sevenDaysAgo

                        entry =
                            { unitSlug = "u1"
                            , lessonSlug = "l1"
                            , objectiveId = "o1"
                            , mastery = Mastered
                            , attemptCount = 3
                            , correctCount = 3
                            , incorrectCount = 0
                            , consecutiveCorrect = 3
                            , lastAttemptTimestamp = Just sevenDaysAgo
                            }
                    in
                    Expect.equal (needsReview currentTime entry) True
            , Test.test "needsReview False within 7 days for mastered entry" <|
                \_ ->
                    let
                        threeDaysAgo =
                            3 * 24 * 60 * 60 * 1000

                        currentTime =
                            10 * 24 * 60 * 60 * 1000

                        entry =
                            { unitSlug = "u1"
                            , lessonSlug = "l1"
                            , objectiveId = "o1"
                            , mastery = Mastered
                            , attemptCount = 3
                            , correctCount = 3
                            , incorrectCount = 0
                            , consecutiveCorrect = 3
                            , lastAttemptTimestamp = Just threeDaysAgo
                            }
                    in
                    Expect.equal (needsReview currentTime entry) False
            , Test.test "needsReview False for non-mastered entry" <|
                \_ ->
                    let
                        tenDaysAgo =
                            10 * 24 * 60 * 60 * 1000

                        currentTime =
                            20 * 24 * 60 * 60 * 1000

                        entry =
                            { unitSlug = "u1"
                            , lessonSlug = "l1"
                            , objectiveId = "o1"
                            , mastery = InProgress
                            , attemptCount = 2
                            , correctCount = 1
                            , incorrectCount = 1
                            , consecutiveCorrect = 0
                            , lastAttemptTimestamp = Just tenDaysAgo
                            }
                    in
                    Expect.equal (needsReview currentTime entry) False
            ]
        ]


masteryToInt : MasteryLevel -> Int
masteryToInt mastery =
    case mastery of
        NotStarted ->
            0

        InProgress ->
            1

        Mastered ->
            2


createEntry : String -> String -> String -> ProgressEntry
createEntry unitSlug lessonSlug objectiveId =
    { unitSlug = unitSlug
    , lessonSlug = lessonSlug
    , objectiveId = objectiveId
    , mastery = NotStarted
    , attemptCount = 0
    , correctCount = 0
    , incorrectCount = 0
    , consecutiveCorrect = 0
    , lastAttemptTimestamp = Nothing
    }