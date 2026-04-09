module Data.IntegratedMath3 exposing (course)

import Data.Curriculum exposing (Course, Unit)


course : Course
course =
    { title = "Integrated Math 3"
    , slug = "integrated-math-3"
    , units =
        [ unit1
        , unit2
        , unit3
        , unit4
        , unit5
        , unit6
        , unit7
        , unit8
        , unit9
        , unit10
        , unit11
        , unit12
        , unit13
        ]
    }


unit1 : Unit
unit1 =
    { title = "Polynomial Arithmetic"
    , slug = "polynomial-arithmetic"
    , lessons =
        [ { title = "Intro to polynomials"
          , slug = "intro-to-polynomials"
          , objectives =
                [ "Define polynomial, degree, leading coefficient, and standard form"
                , "Identify parts of a polynomial expression"
                , "Classify polynomials by degree and number of terms"
                ]
          }
        , { title = "Average rate of change of polynomials"
          , slug = "average-rate-of-change-of-polynomials"
          , objectives =
                [ "Calculate average rate of change from a table of values"
                , "Interpret average rate of change in context"
                , "Compare rates of change across intervals"
                ]
          }
        , { title = "Adding and subtracting polynomials"
          , slug = "adding-and-subtracting-polynomials"
          , objectives =
                [ "Combine like terms to add polynomials"
                , "Distribute negative signs to subtract polynomials"
                , "Write results in standard form"
                ]
          }
        , { title = "Multiplying monomials by polynomials"
          , slug = "multiplying-monomials-by-polynomials"
          , objectives =
                [ "Apply distributive property to multiply monomials by polynomials"
                , "Use exponent rules when multiplying powers"
                , "Simplify products to standard form"
                ]
          }
        , { title = "Multiplying binomials by polynomials"
          , slug = "multiplying-binomials-by-polynomials"
          , objectives =
                [ "Apply FOIL method to multiply binomials"
                , "Use area models to visualize polynomial multiplication"
                , "Multiply binomials by trinomials using distribution"
                ]
          }
        , { title = "Special products"
          , slug = "special-products"
          , objectives =
                [ "Recognize and apply perfect square patterns (a+b)² and (a-b)²"
                , "Apply difference of squares pattern (a+b)(a-b)"
                , "Use special products to multiply efficiently"
                ]
          }
        ]
    }


unit2 : Unit
unit2 =
    { title = "Polynomial Factorization"
    , slug = "polynomial-factorization"
    , lessons =
        [ { title = "Factoring monomials and greatest common factor"
          , slug = "factoring-monomials-and-gcf"
          , objectives = []
          }
        , { title = "Factoring polynomials with common factors"
          , slug = "factoring-polynomials-with-common-factors"
          , objectives = []
          }
        , { title = "Factorization using substitution"
          , slug = "factorization-using-substitution"
          , objectives = []
          }
        , { title = "Polynomial identities"
          , slug = "polynomial-identities"
          , objectives = []
          }
        , { title = "Geometric series applications"
          , slug = "geometric-series-applications"
          , objectives = []
          }
        ]
    }


unit3 : Unit
unit3 =
    { title = "Polynomial Division"
    , slug = "polynomial-division"
    , lessons =
        [ { title = "Dividing polynomials by x"
          , slug = "dividing-polynomials-by-x"
          , objectives = []
          }
        , { title = "Dividing quadratics by linear expressions"
          , slug = "dividing-quadratics-by-linear-expressions"
          , objectives = []
          }
        , { title = "General division by linear expressions"
          , slug = "general-division-by-linear-expressions"
          , objectives = []
          }
        , { title = "Using division for factoring"
          , slug = "using-division-for-factoring"
          , objectives = []
          }
        , { title = "Remainder theorem"
          , slug = "remainder-theorem"
          , objectives = []
          }
        ]
    }


unit4 : Unit
unit4 =
    { title = "Polynomial Graphs"
    , slug = "polynomial-graphs"
    , lessons =
        [ { title = "Zeros of polynomials"
          , slug = "zeros-of-polynomials"
          , objectives = []
          }
        , { title = "Positive and negative intervals"
          , slug = "positive-and-negative-intervals"
          , objectives = []
          }
        , { title = "End behavior of polynomials"
          , slug = "end-behavior-of-polynomials"
          , objectives = []
          }
        , { title = "Comprehensive graph analysis"
          , slug = "comprehensive-graph-analysis"
          , objectives = []
          }
        ]
    }


unit5 : Unit
unit5 =
    { title = "Logarithms"
    , slug = "logarithms"
    , lessons =
        [ { title = "Evaluating logarithms"
          , slug = "evaluating-logarithms"
          , objectives =
                [ "Define logarithms as inverses of exponential functions"
                , "Evaluate logarithms with base 10 and base e"
                , "Convert between exponential and logarithmic form"
                ]
          }
        , { title = "Relationships between exponentials and logarithms"
          , slug = "exponentials-and-logarithms"
          , objectives =
                [ "Explain the inverse relationship between exponential and logarithmic functions"
                , "Use the property that log_b(b^x) = x and b^(log_b(x)) = x"
                , "Graph exponential and logarithmic functions as reflections"
                ]
          }
        , { title = "Properties of logarithms"
          , slug = "properties-of-logarithms"
          , objectives =
                [ "Apply the product rule: log_b(MN) = log_b(M) + log_b(N)"
                , "Apply the quotient rule: log_b(M/N) = log_b(M) - log_b(N)"
                , "Apply the power rule: log_b(M^n) = n·log_b(M)"
                ]
          }
        , { title = "Solving exponential equations"
          , slug = "solving-exponential-equations"
          , objectives =
                [ "Use logarithms to solve exponential equations"
                , "Apply the change of base formula"
                , "Solve real-world problems involving exponential growth/decay"
                ]
          }
        , { title = "Exponential modeling word problems"
          , slug = "exponential-modeling-word-problems"
          , objectives =
                [ "Identify exponential growth and decay in context"
                , "Write exponential models from given information"
                , "Use models to make predictions and answer questions"
                ]
          }
        ]
    }


unit6 : Unit
unit6 =
    { title = "Transformations of Functions"
    , slug = "transformations-of-functions"
    , lessons =
        [ { title = "Shifts and reflections"
          , slug = "shifts-and-reflections"
          , objectives =
                [ "Identify horizontal and vertical shifts from function equations"
                , "Identify reflections over x-axis and y-axis"
                , "Graph transformed functions using shift rules"
                ]
          }
        , { title = "Vertical and horizontal scaling"
          , slug = "vertical-and-horizontal-scaling"
          , objectives =
                [ "Identify vertical stretches and compressions"
                , "Identify horizontal stretches and compressions"
                , "Graph functions with combined transformations"
                ]
          }
        , { title = "Identifying composite transformations"
          , slug = "identifying-composite-transformations"
          , objectives =
                [ "Identify multiple transformations from a single equation"
                , "Apply transformations in the correct order"
                , "Write equations from transformed graphs"
                ]
          }
        , { title = "Graphs of square and cube root functions"
          , slug = "graphs-of-square-and-cube-root-functions"
          , objectives =
                [ "Graph parent square root and cube root functions"
                , "Apply transformations to root functions"
                , "Identify domain and range of transformed root functions"
                ]
          }
        ]
    }


unit7 : Unit
unit7 =
    { title = "Equations"
    , slug = "equations"
    , lessons =
        [ { title = "Rational and square-root equations"
          , slug = "rational-and-square-root-equations"
          , objectives = []
          }
        , { title = "Cube-root equations"
          , slug = "cube-root-equations"
          , objectives = []
          }
        , { title = "Quadratic systems"
          , slug = "quadratic-systems"
          , objectives = []
          }
        , { title = "Solving equations graphically"
          , slug = "solving-equations-graphically"
          , objectives = []
          }
        ]
    }


unit8 : Unit
unit8 =
    { title = "Trigonometry"
    , slug = "trigonometry"
    , lessons =
        [ { title = "Laws of sines and cosines"
          , slug = "laws-of-sines-and-cosines"
          , objectives =
                [ "Apply the Law of Sines to find missing sides and angles"
                , "Apply the Law of Cosines to find missing sides and angles"
                , "Determine when each law is appropriate to use"
                ]
          }
        , { title = "Unit circle"
          , slug = "unit-circle"
          , objectives =
                [ "Define sine and cosine using the unit circle"
                , "Evaluate trigonometric functions at standard angles"
                , "Identify reference angles and use symmetry"
                ]
          }
        , { title = "Pythagorean identity"
          , slug = "pythagorean-identity"
          , objectives =
                [ "Derive the Pythagorean identity sin²(θ) + cos²(θ) = 1"
                , "Use the identity to find missing trigonometric values"
                , "Verify trigonometric equations using the identity"
                ]
          }
        , { title = "Graphs of sinusoidal functions"
          , slug = "graphs-of-sinusoidal-functions"
          , objectives =
                [ "Identify amplitude, period, and midline from equations"
                , "Graph sine and cosine functions with transformations"
                , "Write equations from graphs of sinusoidal functions"
                ]
          }
        , { title = "Modeling with sinusoidal functions"
          , slug = "modeling-with-sinusoidal-functions"
          , objectives =
                [ "Fit sinusoidal models to periodic data"
                , "Interpret amplitude, period, and phase shift in context"
                , "Make predictions using sinusoidal models"
                ]
          }
        ]
    }


unit9 : Unit
unit9 =
    { title = "Modeling"
    , slug = "modeling"
    , lessons =
        [ { title = "Function combination and periodicity"
          , slug = "function-combination-and-periodicity"
          , objectives = []
          }
        , { title = "End behavior and algebraic model analysis"
          , slug = "end-behavior-and-algebraic-model-analysis"
          , objectives = []
          }
        , { title = "Formula manipulation"
          , slug = "formula-manipulation"
          , objectives = []
          }
        , { title = "Word problems with multiple variables"
          , slug = "word-problems-with-multiple-variables"
          , objectives = []
          }
        ]
    }


unit10 : Unit
unit10 =
    { title = "Study Design"
    , slug = "study-design"
    , lessons =
        [ { title = "Valid claims from statistical studies"
          , slug = "valid-claims-from-statistical-studies"
          , objectives = []
          }
        , { title = "Inferences from random samples"
          , slug = "inferences-from-random-samples"
          , objectives = []
          }
        , { title = "Study types: surveys, observational studies, experiments"
          , slug = "study-types"
          , objectives = []
          }
        ]
    }


unit11 : Unit
unit11 =
    { title = "Binomial Probability"
    , slug = "binomial-probability"
    , lessons =
        [ { title = "Binomial probability"
          , slug = "binomial-probability"
          , objectives = []
          }
        ]
    }


unit12 : Unit
unit12 =
    { title = "Normal Distributions"
    , slug = "normal-distributions"
    , lessons =
        [ { title = "Normal distribution concepts"
          , slug = "normal-distribution-concepts"
          , objectives = []
          }
        ]
    }


unit13 : Unit
unit13 =
    { title = "Rational Functions"
    , slug = "rational-functions"
    , lessons =
        [ { title = "Reducing rational expressions"
          , slug = "reducing-rational-expressions"
          , objectives =
                [ "Factor numerators and denominators to find common factors"
                , "Simplify rational expressions by canceling common factors"
                , "Identify excluded values from the domain"
                ]
          }
        , { title = "Multiplying and dividing rational expressions"
          , slug = "multiplying-and-dividing-rational-expressions"
          , objectives =
                [ "Multiply rational expressions by multiplying numerators and denominators"
                , "Divide rational expressions by multiplying by the reciprocal"
                , "Simplify products and quotients of rational expressions"
                ]
          }
        , { title = "Adding and subtracting rational expressions"
          , slug = "adding-and-subtracting-rational-expressions"
          , objectives =
                [ "Find least common denominators for rational expressions"
                , "Add and subtract rational expressions with like denominators"
                , "Add and subtract rational expressions with unlike denominators"
                ]
          }
        , { title = "Rational function analysis"
          , slug = "rational-function-analysis"
          , objectives =
                [ "Identify vertical asymptotes from denominators"
                , "Identify horizontal and oblique asymptotes from degrees"
                , "Analyze end behavior of rational functions"
                ]
          }
        , { title = "Modeling with rational functions"
          , slug = "modeling-with-rational-functions"
          , objectives =
                [ "Write rational functions from word problems"
                , "Interpret asymptotes in context"
                , "Use rational models to make predictions"
                ]
          }
        ]
    }
