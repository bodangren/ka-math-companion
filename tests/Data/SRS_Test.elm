module Data.SRS_Test exposing (suite)

import Data.SRS exposing (Box(..), Card(..), LeitnerBox, ReviewStats, boxNumber, newCard)
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Data.SRS"
        [ Test.describe "Box"
            [ Test.test "boxNumber returns 1 for Box1" <|
                \_ ->
                    boxNumber Box1
                        |> Expect.equal 1
            , Test.test "boxNumber returns 5 for Box5" <|
                \_ ->
                    boxNumber Box5
                        |> Expect.equal 5
            ]
        , Test.describe "Card"
            [ Test.test "newCard creates Card in Box1" <|
                \_ ->
                    let
                        card =
                            newCard "question" "answer" "obj-1"
                    in
                    case card of
                        Card c ->
                            c.box
                                |> boxNumber
                                |> Expect.equal 1
            , Test.test "newCard sets correct objectiveId" <|
                \_ ->
                    let
                        card =
                            newCard "q" "a" "obj-42"
                    in
                    case card of
                        Card c ->
                            c.objectiveId
                                |> Expect.equal "obj-42"
            ]
        ]