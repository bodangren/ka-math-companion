module Pages.Visualizations_Test exposing (suite)

import Expect
import Pages.Visualizations as Visualizations
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Pages.Visualizations"
        [ Test.test "page renders without error"
            (\_ ->
                let
                    page =
                        Visualizations.page
                in
                case page.body of
                    [] ->
                        Expect.fail "Page body should not be empty"

                    _ ->
                        Expect.pass
            )
        , Test.test "page title is set correctly"
            (\_ ->
                let
                    page =
                        Visualizations.page
                in
                Expect.equal page.title "Interactive Visualizations - KA Math Companion"
            )
        ]
