module Logic.Review exposing
    ( ReviewSession
    , SessionStats
    , cardCount
    , createSession
    , currentCard
    , getDueCards
    , getRemainingCount
    , isSessionComplete
    , recordAnswer
    , sessionsReviewed
    )

import Data.SRS exposing (Box(..), Card(..), CardFields)
import Logic.Leitner exposing (intervalDays, moveCardDown, moveCardUp)


type alias ReviewSession =
    { dueCards : List Card
    , currentIndex : Int
    , stats : SessionStats
    }


type alias SessionStats =
    { correctCount : Int
    , incorrectCount : Int
    , reviewedCount : Int
    }


type alias ReviewState =
    { session : ReviewSession
    , cards : List Card
    }


createSession : List Card -> ReviewSession
createSession dueCards =
    { dueCards = dueCards
    , currentIndex = 0
    , stats =
        { correctCount = 0
        , incorrectCount = 0
        , reviewedCount = 0
        }
    }


cardCount : ReviewSession -> Int
cardCount session =
    List.length session.dueCards


currentCard : ReviewSession -> Maybe Card
currentCard session =
    List.drop session.currentIndex session.dueCards
        |> List.head


getRemainingCount : ReviewSession -> Int
getRemainingCount session =
    List.length session.dueCards - session.currentIndex


isSessionComplete : ReviewSession -> Bool
isSessionComplete session =
    session.currentIndex >= List.length session.dueCards


recordAnswer : Bool -> ReviewSession -> ReviewSession
recordAnswer isCorrect session =
    case currentCard session of
        Just card ->
            let
                updatedCard =
                    if isCorrect then
                        moveCardUp card
                    else
                        moveCardDown card

                updatedStats =
                    if isCorrect then
                        { correctCount = session.stats.correctCount + 1, incorrectCount = session.stats.incorrectCount, reviewedCount = session.stats.reviewedCount + 1 }
                    else
                        { correctCount = session.stats.correctCount, incorrectCount = session.stats.incorrectCount + 1, reviewedCount = session.stats.reviewedCount + 1 }
            in
            { session
                | currentIndex = session.currentIndex + 1
                , dueCards = updateCardInList card updatedCard session.dueCards
                , stats = updatedStats
            }

        Nothing ->
            session


updateCardInList : Card -> Card -> List Card -> List Card
updateCardInList oldCard newCard cards =
    List.map
        (\c ->
            if cardFieldsEqual (extractFields c) (extractFields oldCard) then
                newCard
            else
                c
        )
        cards


extractFields : Card -> CardFields
extractFields (Card fields) =
    fields


cardFieldsEqual : CardFields -> CardFields -> Bool
cardFieldsEqual a b =
    a.objectiveId == b.objectiveId


sessionsReviewed : ReviewSession -> Int
sessionsReviewed session =
    session.stats.reviewedCount


getDueCards : List Card -> List Card
getDueCards cards =
    cards
        |> List.filter isDueToday


isDueToday : Card -> Bool
isDueToday (Card fields) =
    True