module Logic.Leitner exposing (intervalDays, moveCardDown, moveCardUp)

import Data.SRS exposing (Box(..), Card(..))


intervalDays : Box -> Int
intervalDays box =
    case box of
        Box1 ->
            1

        Box2 ->
            3

        Box3 ->
            7

        Box4 ->
            14

        Box5 ->
            30


moveCardUp : Card -> Card
moveCardUp (Card fields) =
    let
        newBox =
            case fields.box of
                Box1 ->
                    Box2

                Box2 ->
                    Box3

                Box3 ->
                    Box4

                Box4 ->
                    Box5

                Box5 ->
                    Box5
    in
    Card { fields | box = newBox }


moveCardDown : Card -> Card
moveCardDown (Card fields) =
    let
        newBox =
            case fields.box of
                Box1 ->
                    Box1

                Box2 ->
                    Box1

                Box3 ->
                    Box2

                Box4 ->
                    Box3

                Box5 ->
                    Box4
    in
    Card { fields | box = newBox }
