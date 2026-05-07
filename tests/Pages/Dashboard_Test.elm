module Pages.Dashboard_Test exposing (suite)

import Expect
import Pages.Dashboard as Dashboard
import Test


suite : Test.Test
suite =
    Test.describe "Pages.Dashboard"
        [ Test.test "page function exists and returns View" <|
            \_ ->
                let
                    _ =
                        Dashboard.page
                in
                Expect.pass
        ]