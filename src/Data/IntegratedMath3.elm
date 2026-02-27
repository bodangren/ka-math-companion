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
          , objectives = []
          }
        , { title = "Average rate of change of polynomials"
          , slug = "average-rate-of-change-of-polynomials"
          , objectives = []
          }
        , { title = "Adding and subtracting polynomials"
          , slug = "adding-and-subtracting-polynomials"
          , objectives = []
          }
        , { title = "Multiplying monomials by polynomials"
          , slug = "multiplying-monomials-by-polynomials"
          , objectives = []
          }
        , { title = "Multiplying binomials by polynomials"
          , slug = "multiplying-binomials-by-polynomials"
          , objectives = []
          }
        , { title = "Special products"
          , slug = "special-products"
          , objectives = []
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
          , objectives = []
          }
        , { title = "Relationships between exponentials and logarithms"
          , slug = "exponentials-and-logarithms"
          , objectives = []
          }
        , { title = "Properties of logarithms"
          , slug = "properties-of-logarithms"
          , objectives = []
          }
        , { title = "Solving exponential equations"
          , slug = "solving-exponential-equations"
          , objectives = []
          }
        , { title = "Exponential modeling word problems"
          , slug = "exponential-modeling-word-problems"
          , objectives = []
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
          , objectives = []
          }
        , { title = "Vertical and horizontal scaling"
          , slug = "vertical-and-horizontal-scaling"
          , objectives = []
          }
        , { title = "Identifying composite transformations"
          , slug = "identifying-composite-transformations"
          , objectives = []
          }
        , { title = "Graphs of square and cube root functions"
          , slug = "graphs-of-square-and-cube-root-functions"
          , objectives = []
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
          , objectives = []
          }
        , { title = "Unit circle"
          , slug = "unit-circle"
          , objectives = []
          }
        , { title = "Pythagorean identity"
          , slug = "pythagorean-identity"
          , objectives = []
          }
        , { title = "Graphs of sinusoidal functions"
          , slug = "graphs-of-sinusoidal-functions"
          , objectives = []
          }
        , { title = "Modeling with sinusoidal functions"
          , slug = "modeling-with-sinusoidal-functions"
          , objectives = []
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
          , objectives = []
          }
        , { title = "Multiplying and dividing rational expressions"
          , slug = "multiplying-and-dividing-rational-expressions"
          , objectives = []
          }
        , { title = "Adding and subtracting rational expressions"
          , slug = "adding-and-subtracting-rational-expressions"
          , objectives = []
          }
        , { title = "Rational function analysis"
          , slug = "rational-function-analysis"
          , objectives = []
          }
        , { title = "Modeling with rational functions"
          , slug = "modeling-with-rational-functions"
          , objectives = []
          }
        ]
    }
