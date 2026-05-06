module Components.VizContainer_Test exposing (suite)

import Components.VizContainer as VizContainer
import Data.VizLessonContent exposing (VizBlock(..))
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Components.VizContainer"
        [ Test.describe "viewVizBlock"
            [ Test.test "renders FunctionGrapher block without error"
                (\_ ->
                    let
                        result =
                            VizContainer.viewVizBlock (FunctionGrapher "y = x^2" (\x -> x ^ 2) "#3B82F6")
                    in
                    case result of
                        _ ->
                            Expect.pass
                )
            , Test.test "renders UnitCircle block without error"
                (\_ ->
                    let
                        result =
                            VizContainer.viewVizBlock (UnitCircle (pi / 4))
                    in
                    case result of
                        _ ->
                            Expect.pass
                )
            ]
        ]
