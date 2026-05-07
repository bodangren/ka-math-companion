module Data.Progress exposing
    ( MasteryLevel(..)
    , ProgressData
    , ProgressEntry
    , createEntry
    , decodeMasteryLevel
    , decodeProgressData
    , decodeProgressEntry
    , encodeMasteryLevel
    , encodeProgressData
    , encodeProgressEntry
    , intToMastery
    , isMastered
    , masteryToInt
    , needsReview
    , updateMasteryOnAttempt
    , version
    )

import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)


version : Int
version =
    1


type MasteryLevel
    = NotStarted
    | InProgress
    | Mastered


masteryToInt : MasteryLevel -> Int
masteryToInt mastery =
    case mastery of
        NotStarted ->
            0

        InProgress ->
            1

        Mastered ->
            2


intToMastery : Int -> MasteryLevel
intToMastery n =
    case n of
        0 ->
            NotStarted

        1 ->
            InProgress

        _ ->
            Mastered


type alias ProgressEntry =
    { unitSlug : String
    , lessonSlug : String
    , objectiveId : String
    , mastery : MasteryLevel
    , attemptCount : Int
    , correctCount : Int
    , incorrectCount : Int
    , consecutiveCorrect : Int
    , lastAttemptTimestamp : Maybe Int
    }


type alias ProgressData =
    { version : Int
    , entries : List ProgressEntry
    }


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


updateMasteryOnAttempt : Bool -> ProgressEntry -> ProgressEntry
updateMasteryOnAttempt isCorrect entry =
    let
        newAttemptCount =
            entry.attemptCount + 1

        newConsecutiveCorrect =
            if isCorrect then
                entry.consecutiveCorrect + 1

            else
                0

        newCorrectCount =
            if isCorrect then
                entry.correctCount + 1

            else
                entry.correctCount

        newIncorrectCount =
            if isCorrect then
                entry.incorrectCount

            else
                entry.incorrectCount + 1

        newMastery =
            if newConsecutiveCorrect >= 3 then
                Mastered

            else if newAttemptCount > 0 then
                InProgress

            else
                NotStarted
    in
    { entry
        | attemptCount = newAttemptCount
        , correctCount = newCorrectCount
        , incorrectCount = newIncorrectCount
        , consecutiveCorrect = newConsecutiveCorrect
        , mastery = newMastery
    }


isMastered : ProgressEntry -> Bool
isMastered entry =
    entry.mastery == Mastered


needsReview : Int -> ProgressEntry -> Bool
needsReview currentTime entry =
    case entry.lastAttemptTimestamp of
        Just timestamp ->
            let
                sevenDaysInMs =
                    7 * 24 * 60 * 60 * 1000

                daysSinceAttempt =
                    (currentTime - timestamp) // 1000 // 60 // 60 // 24
            in
            entry.mastery == Mastered && daysSinceAttempt > 7

        Nothing ->
            False


encodeMasteryLevel : MasteryLevel -> Value
encodeMasteryLevel mastery =
    Encode.int (masteryToInt mastery)


decodeMasteryLevel : Decoder MasteryLevel
decodeMasteryLevel =
    Decode.map intToMastery Decode.int


encodeProgressEntry : ProgressEntry -> Value
encodeProgressEntry entry =
    Encode.object
        [ ( "unitSlug", Encode.string entry.unitSlug )
        , ( "lessonSlug", Encode.string entry.lessonSlug )
        , ( "objectiveId", Encode.string entry.objectiveId )
        , ( "mastery", encodeMasteryLevel entry.mastery )
        , ( "attemptCount", Encode.int entry.attemptCount )
        , ( "correctCount", Encode.int entry.correctCount )
        , ( "incorrectCount", Encode.int entry.incorrectCount )
        , ( "consecutiveCorrect", Encode.int entry.consecutiveCorrect )
        , ( "lastAttemptTimestamp"
          , case entry.lastAttemptTimestamp of
                Just ts ->
                    Encode.int ts

                Nothing ->
                    Encode.null
          )
        ]


decodeProgressEntry : String -> Result Decode.Error ProgressEntry
decodeProgressEntry jsonString =
    Decode.decodeString progressEntryDecoder jsonString


progressEntryDecoder : Decoder ProgressEntry
progressEntryDecoder =
    Decode.map8
        (\unitSlug lessonSlug objectiveId mastery attemptCount correctCount incorrectCount consecutiveCorrect ->
            { unitSlug = unitSlug
            , lessonSlug = lessonSlug
            , objectiveId = objectiveId
            , mastery = mastery
            , attemptCount = attemptCount
            , correctCount = correctCount
            , incorrectCount = incorrectCount
            , consecutiveCorrect = consecutiveCorrect
            , lastAttemptTimestamp = Nothing
            }
        )
        (Decode.field "unitSlug" Decode.string)
        (Decode.field "lessonSlug" Decode.string)
        (Decode.field "objectiveId" Decode.string)
        (Decode.field "mastery" decodeMasteryLevel)
        (Decode.field "attemptCount" Decode.int)
        (Decode.field "correctCount" Decode.int)
        (Decode.field "incorrectCount" Decode.int)
        (Decode.field "consecutiveCorrect" Decode.int)
        |> Decode.andThen
            (\entry ->
                let
                    handleTimestamp maybeTs =
                        case maybeTs of
                            Just ts ->
                                Decode.succeed { entry | lastAttemptTimestamp = Just ts }

                            Nothing ->
                                Decode.succeed entry
                in
                Decode.oneOf
                    [ Decode.field "lastAttemptTimestamp" (Decode.nullable Decode.int)
                        |> Decode.andThen handleTimestamp
                    , Decode.succeed entry
                    ]
            )


encodeProgressData : ProgressData -> Value
encodeProgressData data =
    Encode.object
        [ ( "version", Encode.int data.version )
        , ( "entries", Encode.list encodeProgressEntry data.entries )
        ]


decodeProgressData : String -> Result Decode.Error ProgressData
decodeProgressData jsonString =
    Decode.decodeString progressDataDecoder jsonString


progressDataDecoder : Decoder ProgressData
progressDataDecoder =
    Decode.map2 ProgressData
        (Decode.field "version" Decode.int)
        (Decode.field "entries" (Decode.list progressEntryDecoder))
