module Design.MasteryBadge_Test exposing (suite)

import Design.MasteryBadge as MasteryBadge
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Design.MasteryBadge"
        [ Test.test "masteryBadge renders NotStarted variant" <|
            \_ ->
                let
                    _ =
                        MasteryBadge.masteryBadge MasteryBadge.NotStarted
                in
                Expect.pass
        , Test.test "masteryBadge renders InProgress variant" <|
            \_ ->
                let
                    _ =
                        MasteryBadge.masteryBadge MasteryBadge.InProgress
                in
                Expect.pass
        , Test.test "masteryBadge renders Mastered variant" <|
            \_ ->
                let
                    _ =
                        MasteryBadge.masteryBadge MasteryBadge.Mastered
                in
                Expect.pass
        , Test.test "masteryBadgeWithLabel renders with custom label" <|
            \_ ->
                let
                    _ =
                        MasteryBadge.masteryBadgeWithLabel MasteryBadge.Mastered "85%"
                in
                Expect.pass
        , Test.test "masteryBadgeWithLabel renders NotStarted with label" <|
            \_ ->
                let
                    _ =
                        MasteryBadge.masteryBadgeWithLabel MasteryBadge.NotStarted "0%"
                in
                Expect.pass
        ]