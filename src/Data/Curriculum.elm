module Data.Curriculum exposing
    ( Course
    , Lesson
    , Unit
    )


type alias Course =
    { title : String
    , slug : String
    , units : List Unit
    }


type alias Unit =
    { title : String
    , slug : String
    , lessons : List Lesson
    }


type alias Lesson =
    { title : String
    , slug : String
    , objectives : List String
    , description : String
    , estimatedMinutes : Int
    }
