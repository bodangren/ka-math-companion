module Logic.SRS_Creation exposing (generateCardsFromMasteredObjectives)

import Data.Curriculum exposing (Course, Lesson, Unit)
import Data.Progress exposing (ProgressEntry, isMastered)
import Data.SRS exposing (Card(..), CardFields, newCard)


generateCardsFromMasteredObjectives : List ProgressEntry -> List Card -> List Card
generateCardsFromMasteredObjectives progressEntries existingCards =
    let
        existingObjectiveIds =
            List.map (\(Card fields) -> fields.objectiveId) existingCards

        masteredEntries =
            List.filter isMastered progressEntries

        newCards =
            List.filterMap
                (\entry ->
                    if List.member entry.objectiveId existingObjectiveIds then
                        Nothing
                    else
                        Just (newCard "" "" entry.objectiveId)
                )
                masteredEntries
    in
    newCards
