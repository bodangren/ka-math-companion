module Data.LessonContent exposing (CheckQuestion, ContentBlock(..), LessonContent, Step, WorkedExample, checkQuestion, definition, example, explanation, getContent)


type alias Step =
    { description : String
    , mathContent : String
    }


type alias LessonContent =
    { unitSlug : String
    , lessonSlug : String
    , introduction : List ContentBlock
    , workedExamples : List WorkedExample
    , commonMistakes : List String
    , checks : List CheckQuestion
    }


type ContentBlock
    = Explanation String
    | Definition String String


type alias WorkedExample =
    { problem : String
    , steps : List Step
    , result : String
    }


type alias CheckQuestion =
    { question : String
    , answer : String
    , hint : Maybe String
    }


explanation : String -> ContentBlock
explanation text =
    Explanation text


definition : String -> String -> ContentBlock
definition term definitionText =
    Definition term definitionText


example : String -> List Step -> String -> WorkedExample
example problem steps result =
    WorkedExample problem steps result


checkQuestion : String -> String -> Maybe String -> CheckQuestion
checkQuestion question answer hint =
    CheckQuestion question answer hint


getContent : String -> String -> Maybe LessonContent
getContent unitSlug lessonSlug =
    case ( unitSlug, lessonSlug ) of
        ( "polynomial-arithmetic", "intro-to-polynomials" ) ->
            Just
                { unitSlug = unitSlug
                , lessonSlug = lessonSlug
                , introduction =
                    [ explanation "A polynomial is an expression consisting of variables and coefficients, combined using addition, subtraction, and multiplication. Polynomials are fundamental building blocks in algebra and appear throughout mathematics."
                    , definition "Polynomial"
                        "An algebraic expression of the form a_n x^n + a_{n-1} x^{n-1} + ... + a_1 x + a_0 where n is a non-negative integer and a_n ≠ 0."
                    , definition "Degree"
                        "The highest power of the variable in a polynomial. For example, 3x^4 + 2x^2 - 5 has degree 4."
                    ]
                , workedExamples =
                    [ example "Identify the degree and coefficients of 4x^3 + 2x - 1"
                        [ Step "Identify the highest power of x" "The term with the highest power is 4x^3"
                        , Step "The degree is the exponent of the highest power term" "degree = 3"
                        , Step "List each coefficient starting from highest power" "coefficients: [4, 0, 2, -1]"
                        ]
                        "Degree: 3, Coefficients: [4, 0, 2, -1]"
                    , example "Write 2x^2 + 5x + 3 in standard form"
                        [ Step "Standard form arranges terms from highest to lowest degree" "2x^2 + 5x + 3 is already in standard form"
                        ]
                        "2x^2 + 5x + 3"
                    ]
                , commonMistakes =
                    [ "Confusing the degree with the leading coefficient"
                    , "Forgetting that 0 is a valid coefficient (e.g., missing x terms)"
                    , "Not combining like terms before determining degree"
                    ]
                , checks =
                    [ checkQuestion "What is the degree of 5x^4 + 3x^2 + 1?" "4" Nothing
                    , checkQuestion "Is 7x^(-2) + 3 a polynomial? Why or why not?" "No, because polynomials cannot have negative exponents" (Just "Think about what makes an expression a polynomial")
                    ]
                }

        _ ->
            Nothing
