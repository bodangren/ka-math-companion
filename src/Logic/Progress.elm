module Logic.Progress exposing
    ( State
    , init
    , isEmpty
    , entryCount
    , addEntry
    , getEntry
    , updateEntry
    , recordAttempt
    , getUnitProgress
    , masteredCount
    , totalCount
    )

import Data.Progress exposing (ProgressEntry, updateMasteryOnAttempt)


type alias State =
    { entries : List ProgressEntry }


init : State
init =
    { entries = [] }


isEmpty : State -> Bool
isEmpty state =
    List.isEmpty state.entries


entryCount : State -> Int
entryCount state =
    List.length state.entries


addEntry : String -> String -> String -> State -> State
addEntry unitSlug lessonSlug objectiveId state =
    let
        newEntry =
            { unitSlug = unitSlug
            , lessonSlug = lessonSlug
            , objectiveId = objectiveId
            , mastery = Data.Progress.NotStarted
            , attemptCount = 0
            , correctCount = 0
            , incorrectCount = 0
            , consecutiveCorrect = 0
            , lastAttemptTimestamp = Nothing
            }
    in
    { state | entries = newEntry :: state.entries }


getEntry : String -> String -> String -> State -> Maybe ProgressEntry
getEntry unitSlug lessonSlug objectiveId state =
    state.entries
        |> List.filter
            (\e ->
                e.unitSlug == unitSlug
                    && e.lessonSlug == lessonSlug
                    && e.objectiveId == objectiveId
            )
        |> List.head


updateEntry : String -> String -> String -> (ProgressEntry -> ProgressEntry) -> State -> State
updateEntry unitSlug lessonSlug objectiveId updateFn state =
    { state
        | entries =
            List.map
                (\entry ->
                    if entry.unitSlug == unitSlug
                       && entry.lessonSlug == lessonSlug
                       && entry.objectiveId == objectiveId
                    then
                        updateFn entry
                    else
                        entry
                )
                state.entries
    }


recordAttempt : String -> String -> String -> Bool -> State -> State
recordAttempt unitSlug lessonSlug objectiveId isCorrect state =
    case getEntry unitSlug lessonSlug objectiveId state of
        Just entry ->
            let
                timestamp =
                    Just 0

                updatedEntry =
                    { entry
                        | lastAttemptTimestamp = timestamp
                    }
                    |> updateMasteryOnAttempt isCorrect
            in
            updateEntry unitSlug lessonSlug objectiveId (\_ -> updatedEntry) state

        Nothing ->
            state


getUnitProgress : String -> State -> List ProgressEntry
getUnitProgress unitSlug state =
    List.filter (\e -> e.unitSlug == unitSlug) state.entries


masteredCount : State -> Int
masteredCount state =
    List.filter (\e -> e.mastery == Data.Progress.Mastered) state.entries
        |> List.length


totalCount : State -> Int
totalCount state =
    List.length state.entries