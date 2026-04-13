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
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Average rate of change of polynomials"
          , slug = "average-rate-of-change-of-polynomials"
          , objectives =
                [ "Calculate average rate of change from a table of values"
                , "Interpret average rate of change in context"
                , "Compare rates of change across intervals"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Adding and subtracting polynomials"
          , slug = "adding-and-subtracting-polynomials"
          , objectives =
                [ "Combine like terms to add polynomials"
                , "Distribute negative signs to subtract polynomials"
                , "Write results in standard form"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Multiplying monomials by polynomials"
          , slug = "multiplying-monomials-by-polynomials"
          , objectives =
                [ "Apply distributive property to multiply monomials by polynomials"
                , "Use exponent rules when multiplying powers"
                , "Simplify products to standard form"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Multiplying binomials by polynomials"
          , slug = "multiplying-binomials-by-polynomials"
          , objectives =
                [ "Apply FOIL method to multiply binomials"
                , "Use area models to visualize polynomial multiplication"
                , "Multiply binomials by trinomials using distribution"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Special products"
          , slug = "special-products"
          , objectives =
                [ "Recognize and apply perfect square patterns (a+b)² and (a-b)²"
                , "Apply difference of squares pattern (a+b)(a-b)"
                , "Use special products to multiply efficiently"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , objectives =
                [ "Find the greatest common factor (GCF) of two or more monomials"
                , "Factor polynomial expressions by identifying the GCF"
                , "Factor expressions with negative coefficients"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Factoring polynomials with common factors"
          , slug = "factoring-polynomials-with-common-factors"
          , objectives =
                [ "Factor out common binomial factors"
                , "Factor by grouping with two distinct pairs"
                , "Identify when factoring by grouping is appropriate"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Factorization using substitution"
          , slug = "factorization-using-substitution"
          , objectives =
                [ "Recognize patterns that suggest substitution"
                , "Apply substitution to factor complex polynomials"
                , "Reverse substitution to restore original variables"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Polynomial identities"
          , slug = "polynomial-identities"
          , objectives =
                [ "Verify polynomial identities using algebraic manipulation"
                , "Use difference of cubes and sum of cubes identities"
                , "Apply identities to factor expressions with three terms"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Geometric series applications"
          , slug = "geometric-series-applications"
          , objectives =
                [ "Apply formulas for sums of geometric sequences"
                , "Solve problems involving geometric series in context"
                , "Connect geometric series to polynomial factorization"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , objectives =
                [ "Divide polynomials by monomials using the quotient rule"
                , "Express division of polynomials as a simplified fraction"
                , "Identify quotients and remainders in polynomial division"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Dividing quadratics by linear expressions"
          , slug = "dividing-quadratics-by-linear-expressions"
          , objectives =
                [ "Divide quadratic polynomials by linear expressions"
                , "Use long division to find quotients and remainders"
                , "Verify division results by multiplying back"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "General division by linear expressions"
          , slug = "general-division-by-linear-expressions"
          , objectives =
                [ "Apply polynomial long division to polynomials of any degree"
                , "Divide by linear expressions in the form (x - c)"
                , "Interpret remainders in context of polynomial division"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Using division for factoring"
          , slug = "using-division-for-factoring"
          , objectives =
                [ "Use polynomial division to factor polynomials"
                , "Find roots of polynomials using the factor theorem"
                , "Determine whether a binomial is a factor of a polynomial"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Remainder theorem"
          , slug = "remainder-theorem"
          , objectives =
                [ "State and apply the remainder theorem"
                , "Evaluate polynomials using the remainder theorem"
                , "Use the remainder theorem to check for factors"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , objectives =
                [ "Find zeros of polynomial functions from equations"
                , "Connect zeros to x-intercepts on a graph"
                , "Determine multiplicity of zeros from factored forms"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Positive and negative intervals"
          , slug = "positive-and-negative-intervals"
          , objectives =
                [ "Identify intervals where polynomial functions are positive or negative"
                , "Use sign charts to analyze polynomial function behavior"
                , "Connect sign intervals to the graph of the function"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "End behavior of polynomials"
          , slug = "end-behavior-of-polynomials"
          , objectives =
                [ "Describe the end behavior of polynomial functions"
                , "Use degree and leading coefficient to predict end behavior"
                , "Match polynomial graphs to their equations based on end behavior"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Comprehensive graph analysis"
          , slug = "comprehensive-graph-analysis"
          , objectives =
                [ "Analyze polynomial functions using all learned concepts"
                , "Sketch polynomial graphs from given characteristics"
                , "Write polynomial equations from given graphs"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Relationships between exponentials and logarithms"
          , slug = "exponentials-and-logarithms"
          , objectives =
                [ "Explain the inverse relationship between exponential and logarithmic functions"
                , "Use the property that log_b(b^x) = x and b^(log_b(x)) = x"
                , "Graph exponential and logarithmic functions as reflections"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Properties of logarithms"
          , slug = "properties-of-logarithms"
          , objectives =
                [ "Apply the product rule: log_b(MN) = log_b(M) + log_b(N)"
                , "Apply the quotient rule: log_b(M/N) = log_b(M) - log_b(N)"
                , "Apply the power rule: log_b(M^n) = n·log_b(M)"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Solving exponential equations"
          , slug = "solving-exponential-equations"
          , objectives =
                [ "Use logarithms to solve exponential equations"
                , "Apply the change of base formula"
                , "Solve real-world problems involving exponential growth/decay"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Exponential modeling word problems"
          , slug = "exponential-modeling-word-problems"
          , objectives =
                [ "Identify exponential growth and decay in context"
                , "Write exponential models from given information"
                , "Use models to make predictions and answer questions"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Vertical and horizontal scaling"
          , slug = "vertical-and-horizontal-scaling"
          , objectives =
                [ "Identify vertical stretches and compressions"
                , "Identify horizontal stretches and compressions"
                , "Graph functions with combined transformations"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Identifying composite transformations"
          , slug = "identifying-composite-transformations"
          , objectives =
                [ "Identify multiple transformations from a single equation"
                , "Apply transformations in the correct order"
                , "Write equations from transformed graphs"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Graphs of square and cube root functions"
          , slug = "graphs-of-square-and-cube-root-functions"
          , objectives =
                [ "Graph parent square root and cube root functions"
                , "Apply transformations to root functions"
                , "Identify domain and range of transformed root functions"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , objectives =
                [ "Solve rational equations by finding common denominators"
                , "Identify extraneous solutions in rational equations"
                , "Solve square-root equations by squaring both sides"
                , "Check solutions to square-root equations for extraneous roots"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Cube-root equations"
          , slug = "cube-root-equations"
          , objectives =
                [ "Solve equations involving cube roots"
                , "Use the property that cube root preserves sign"
                , "Cube both sides to eliminate radicals"
                , "Verify solutions in original equations"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Quadratic systems"
          , slug = "quadratic-systems"
          , objectives =
                [ "Solve systems containing one linear and one quadratic equation"
                , "Use substitution to solve quadratic systems"
                , "Find intersection points of parabolas and lines"
                , "Interpret solutions graphically as intersection points"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Solving equations graphically"
          , slug = "solving-equations-graphically"
          , objectives =
                [ "Use graphs to find approximate solutions to equations"
                , "Identify x-intercepts as solutions to f(x) = 0"
                , "Use graphing calculators to solve complex equations"
                , "Compare graphical and algebraic solution methods"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Unit circle"
          , slug = "unit-circle"
          , objectives =
                [ "Define sine and cosine using the unit circle"
                , "Evaluate trigonometric functions at standard angles"
                , "Identify reference angles and use symmetry"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Pythagorean identity"
          , slug = "pythagorean-identity"
          , objectives =
                [ "Derive the Pythagorean identity sin²(θ) + cos²(θ) = 1"
                , "Use the identity to find missing trigonometric values"
                , "Verify trigonometric equations using the identity"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Graphs of sinusoidal functions"
          , slug = "graphs-of-sinusoidal-functions"
          , objectives =
                [ "Identify amplitude, period, and midline from equations"
                , "Graph sine and cosine functions with transformations"
                , "Write equations from graphs of sinusoidal functions"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Modeling with sinusoidal functions"
          , slug = "modeling-with-sinusoidal-functions"
          , objectives =
                [ "Fit sinusoidal models to periodic data"
                , "Interpret amplitude, period, and phase shift in context"
                , "Make predictions using sinusoidal models"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , objectives =
                [ "Combine functions using addition, subtraction, multiplication, and division"
                , "Identify the domain and range of combined functions"
                , "Recognize periodic functions and their applications"
                , "Analyze how operations affect the periodicity of functions"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "End behavior and algebraic model analysis"
          , slug = "end-behavior-and-algebraic-model-analysis"
          , objectives =
                [ "Describe the end behavior of polynomial and rational functions"
                , "Use algebraic methods to analyze model behavior"
                , "Interpret end behavior in real-world contexts"
                , "Compare graphical and algebraic approaches to model analysis"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Formula manipulation"
          , slug = "formula-manipulation"
          , objectives =
                [ "Rearrange formulas to solve for specified variables"
                , "Apply formula manipulation to real-world formulas"
                , "Verify algebraic manipulations using dimensional analysis"
                , "Translate between verbal and algebraic representations"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Word problems with multiple variables"
          , slug = "word-problems-with-multiple-variables"
          , objectives =
                [ "Create equations from real-world scenarios involving multiple variables"
                , "Solve multi-variable equations for specified variables"
                , "Interpret solutions in the context of the original problem"
                , "Check the reasonableness of solutions in context"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , objectives =
                [ "Distinguish between valid and invalid statistical claims"
                , "Identify the population and sample in a statistical study"
                , "Recognize common sources of bias in sampling methods"
                , "Differentiate between correlation and causation"
                , "Evaluate whether conclusions are supported by the data"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Inferences from random samples"
          , slug = "inferences-from-random-samples"
          , objectives =
                [ "Explain how random sampling allows for inference about a population"
                , "Interpret margin of error and confidence intervals"
                , "Understand the relationship between sample size and precision"
                , "Conduct hypothesis testing to evaluate claims"
                , "Distinguish between statistical significance and practical significance"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Study types: surveys, observational studies, experiments"
          , slug = "study-types"
          , objectives =
                [ "Compare and contrast surveys, observational studies, and experiments"
                , "Identify the role of control groups in experiments"
                , "Explain random assignment and why it matters"
                , "Understand placebo and blinding in experimental design"
                , "Determine appropriate study type to answer specific research questions"
                ]
          , description = ""
          , estimatedMinutes = 30
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
          , description = ""
          , estimatedMinutes = 30
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
          , description = ""
          , estimatedMinutes = 30
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
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Multiplying and dividing rational expressions"
          , slug = "multiplying-and-dividing-rational-expressions"
          , objectives =
                [ "Multiply rational expressions by multiplying numerators and denominators"
                , "Divide rational expressions by multiplying by the reciprocal"
                , "Simplify products and quotients of rational expressions"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Adding and subtracting rational expressions"
          , slug = "adding-and-subtracting-rational-expressions"
          , objectives =
                [ "Find least common denominators for rational expressions"
                , "Add and subtract rational expressions with like denominators"
                , "Add and subtract rational expressions with unlike denominators"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Rational function analysis"
          , slug = "rational-function-analysis"
          , objectives =
                [ "Identify vertical asymptotes from denominators"
                , "Identify horizontal and oblique asymptotes from degrees"
                , "Analyze end behavior of rational functions"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        , { title = "Modeling with rational functions"
          , slug = "modeling-with-rational-functions"
          , objectives =
                [ "Write rational functions from word problems"
                , "Interpret asymptotes in context"
                , "Use rational models to make predictions"
                ]
          , description = ""
          , estimatedMinutes = 30
          }
        ]
    }
