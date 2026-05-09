module Logic.SRS_Creation_Test exposing (suite)

import Data.Progress exposing (MasteryLevel(..), isMastered, createEntry)
import Data.SRS exposing (Card(..), newCard)
import Expect
import Logic.SRS_Creation as SRS_Creation
import Test


suite : Test.Test
suite =
    Test.describe "Logic.SRS_Creation"
        [ Test.describe "generateCardsFromMasteredObjectives"
            [ Test.test "returns empty list when no mastered objectives" <|
                \_ ->
                    let
                        progressEntries =
                            [ createEntry "unit1" "lesson1" "obj-1"
                            , createEntry "unit1" "lesson1" "obj-2"
                            ]
                    in
                    SRS_Creation.generateCardsFromMasteredObjectives progressEntries []
                        |> Expect.equal []
            , Test.test "generates card for mastered objective" <|
                \_ ->
                    let
                        entry =
                            createEntry "unit1" "lesson1" "obj-1"
                        progressEntries =
                            [ { entry | mastery = Mastered }
                            ]
                    in
                    SRS_Creation.generateCardsFromMasteredObjectives progressEntries []
                        |> List.length
                        |> Expect.equal 1
            , Test.test "generated card has correct objectiveId" <|
                \_ ->
                    let
                        entry =
                            createEntry "unit1" "lesson1" "obj-srs-1"
                        progressEntries =
                            [ { entry | mastery = Mastered }
                            ]
                    in
                    case SRS_Creation.generateCardsFromMasteredObjectives progressEntries [] of
                        [ card ] ->
                            case card of
                                Card fields ->
                                    fields.objectiveId
                                        |> Expect.equal "obj-srs-1"

                        _ ->
                            Expect.fail "Expected exactly one card"
            , Test.test "does not generate card for in-progress objective" <|
                \_ ->
                    let
                        entry =
                            createEntry "unit1" "lesson1" "obj-1"
                        progressEntries =
                            [ { entry | mastery = InProgress }
                            ]
                    in
                    SRS_Creation.generateCardsFromMasteredObjectives progressEntries []
                        |> List.length
                        |> Expect.equal 0
            , Test.test "filters out existing cards for same objective" <|
                \_ ->
                    let
                        entry =
                            createEntry "unit1" "lesson1" "obj-duplicate"
                        progressEntries =
                            [ { entry | mastery = Mastered }
                            ]
                        existingCards =
                            [ newCard "Q" "A" "obj-duplicate" ]
                    in
                    SRS_Creation.generateCardsFromMasteredObjectives progressEntries existingCards
                        |> List.length
                        |> Expect.equal 0
            ]
        ]