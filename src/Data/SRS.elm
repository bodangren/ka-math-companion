module Data.SRS exposing
    ( Box(..)
    , Card(..)
    , LeitnerBox
    , NewCard
    , ReviewStats
    , boxNumber
    , cardToReview
    , defaultReviewStats
    , newCard
    , nextReviewDate
    )


type Box
    = Box1
    | Box2
    | Box3
    | Box4
    | Box5


boxNumber : Box -> Int
boxNumber box =
    case box of
        Box1 -> 1
        Box2 -> 2
        Box3 -> 3
        Box4 -> 4
        Box5 -> 5


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
        Box1 -> "1 day"
        Box2 -> "3 days"
        Box3 -> "7 days"
        Box4 -> "14 days"
        Box5 -> "30 days"


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