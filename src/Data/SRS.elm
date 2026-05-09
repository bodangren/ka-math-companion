module Data.SRS exposing
    ( Box(..)
    , Card(..)
    , CardFields
    , LeitnerBox
    , NewCard
    , ReviewStats
    , accuracy
    , boxNumber
    , cardToReview
    , decodeCards
    , decodeSRSData
    , defaultReviewStats
    , encodeCard
    , encodeSRSData
    , encodeSRSDataVal
    , intToBox
    , newCard
    , nextReviewDate
    , recordAnswer
    , version
    )

import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)


type Box
    = Box1
    | Box2
    | Box3
    | Box4
    | Box5


boxNumber : Box -> Int
boxNumber box =
    case box of
        Box1 ->
            1

        Box2 ->
            2

        Box3 ->
            3

        Box4 ->
            4

        Box5 ->
            5


type Card
    = Card CardFields


type alias CardFields =
    { question : String
    , answer : String
    , objectiveId : String
    , box : Box
    , intervalDays : Int
    , nextReviewDate : String
    , reviewCount : Int
    , correctCount : Int
    }


type NewCard
    = NewCard NewCardFields


type alias NewCardFields =
    { question : String
    , answer : String
    , objectiveId : String
    }


newCard : String -> String -> String -> Card
newCard question answer objectiveId =
    Card
        { question = question
        , answer = answer
        , objectiveId = objectiveId
        , box = Box1
        , intervalDays = 1
        , nextReviewDate = ""
        , reviewCount = 0
        , correctCount = 0
        }


cardToReview : Card -> CardFields
cardToReview (Card fields) =
    fields


nextReviewDate : Box -> String
nextReviewDate box =
    case box of
        Box1 ->
            "1 day"

        Box2 ->
            "3 days"

        Box3 ->
            "7 days"

        Box4 ->
            "14 days"

        Box5 ->
            "30 days"


type alias LeitnerBox =
    { box : Box
    , cards : List Card
    }


type alias ReviewStats =
    { totalReviewed : Int
    , correctCount : Int
    , incorrectCount : Int
    , averageConfidence : Float
    }


defaultReviewStats : ReviewStats
defaultReviewStats =
    { totalReviewed = 0
    , correctCount = 0
    , incorrectCount = 0
    , averageConfidence = 0.0
    }


accuracy : Card -> Float
accuracy (Card fields) =
    if fields.reviewCount == 0 then
        0.0
    else
        toFloat fields.correctCount / toFloat fields.reviewCount


recordAnswer : Bool -> Card -> Card
recordAnswer isCorrect (Card fields) =
    Card
        { fields
            | reviewCount = fields.reviewCount + 1
            , correctCount = fields.correctCount + (if isCorrect then 1 else 0)
        }


version : Int
version =
    1


type alias SRSData =
    { version : Int
    , cards : List Card
    }


encodeSRSData : SRSData -> String
encodeSRSData data =
    Encode.encode 0 (encodeSRSDataVal data)


encodeSRSDataVal : SRSData -> Encode.Value
encodeSRSDataVal data =
    Encode.object
        [ ( "version", Encode.int data.version )
        , ( "cards", Encode.list encodeCard data.cards )
        ]


encodeCard : Card -> Encode.Value
encodeCard (Card fields) =
    Encode.object
        [ ( "question", Encode.string fields.question )
        , ( "answer", Encode.string fields.answer )
        , ( "objectiveId", Encode.string fields.objectiveId )
        , ( "box", Encode.int (boxNumber fields.box) )
        , ( "intervalDays", Encode.int fields.intervalDays )
        , ( "nextReviewDate", Encode.string fields.nextReviewDate )
        , ( "reviewCount", Encode.int fields.reviewCount )
        , ( "correctCount", Encode.int fields.correctCount )
        ]


decodeCards : String -> Result Decode.Error (List Card)
decodeCards jsonString =
    Decode.decodeString (Decode.list cardDecoder) jsonString


decodeSRSData : String -> Result Decode.Error SRSData
decodeSRSData jsonString =
    Decode.decodeString srsDataDecoder jsonString


srsDataDecoder : Decoder SRSData
srsDataDecoder =
    Decode.map2 SRSData
        (Decode.field "version" Decode.int)
        (Decode.field "cards" (Decode.list cardDecoder))


cardDecoder : Decoder Card
cardDecoder =
    Decode.map8
        (\question answer objectiveId boxInterval intervalDays nextReviewDateStr reviewCount correctCount ->
            Card
                { question = question
                , answer = answer
                , objectiveId = objectiveId
                , box = intToBox boxInterval
                , intervalDays = intervalDays
                , nextReviewDate = nextReviewDateStr
                , reviewCount = reviewCount
                , correctCount = correctCount
                }
        )
        (Decode.field "question" Decode.string)
        (Decode.field "answer" Decode.string)
        (Decode.field "objectiveId" Decode.string)
        (Decode.field "box" Decode.int)
        (Decode.field "intervalDays" Decode.int)
        (Decode.field "nextReviewDate" Decode.string)
        (Decode.field "reviewCount" Decode.int)
        (Decode.field "correctCount" Decode.int)


intToBox : Int -> Box
intToBox n =
    case n of
        1 ->
            Box1

        2 ->
            Box2

        3 ->
            Box3

        4 ->
            Box4

        _ ->
            Box5
