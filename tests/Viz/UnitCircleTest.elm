module Viz.UnitCircleTest exposing (all)

import Expect
import Test exposing (describe, test)
import Viz.UnitCircle as UnitCircle exposing (UnitCircle)


all : Test.Test
all =
    describe "Viz.UnitCircle"
        [ describe "empty"
            [ test "creates default unit circle" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty
                    in
                    Expect.equal uc.width 200
            , test "has height equal to width" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty
                    in
                    Expect.equal uc.width uc.height
            ]
        , describe "init"
            [ test "sets dimensions correctly" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.init 300
                    in
                    Expect.equal uc.width 300
            , test "sets radius based on width" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.init 200
                    in
                    Expect.equal uc.radius (200 // 2 - 10)
            ]
        , describe "withAngle"
            [ test "sets the angle" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty |> UnitCircle.withAngle (pi / 4)
                    in
                    Expect.within (Expect.Absolute 0.001) (pi / 4) uc.angle
            , test "angle defaults to 0" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty
                    in
                    Expect.within (Expect.Absolute 0.001) 0 uc.angle
            ]
        , describe "withLabel"
            [ test "sets the label" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty |> UnitCircle.withLabel "π/4"
                    in
                    Expect.equal (Just "π/4") uc.label
            , test "label defaults to Nothing" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty
                    in
                    Expect.equal Nothing uc.label
            ]
        , describe "withCoords"
            [ test "sets showCoords to True" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty |> UnitCircle.withCoords True
                    in
                    Expect.equal True uc.showCoords
            , test "showCoords defaults to False" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty
                    in
                    Expect.equal False uc.showCoords
            ]
        , describe "onClickSelect"
            [ test "sets onClickMsg" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty |> UnitCircle.onClickSelect Basics.identity
                    in
                    Expect.equal True (uc.onClickMsg /= Nothing)
            , test "onClickMsg defaults to Nothing" <|
                \_ ->
                    let
                        uc =
                            UnitCircle.empty
                    in
                    Expect.equal Nothing uc.onClickMsg
            ]
        , test "render produces HTML" <|
            \_ ->
                let
                    uc =
                        UnitCircle.empty
                    html =
                        UnitCircle.render uc
                in
                Expect.pass
        , test "render with angle produces HTML" <|
            \_ ->
                let
                    uc =
                        UnitCircle.empty |> UnitCircle.withAngle (pi / 3)
                    html =
                        UnitCircle.render uc
                in
                Expect.pass
        , test "render with coords produces HTML" <|
            \_ ->
                let
                    uc =
                        UnitCircle.empty |> UnitCircle.withCoords True
                    html =
                        UnitCircle.render uc
                in
                Expect.pass
        , test "render with label produces HTML" <|
            \_ ->
                let
                    uc =
                        UnitCircle.empty |> UnitCircle.withLabel "π/4"
                    html =
                        UnitCircle.render uc
                in
                Expect.pass
        , test "render with click handler produces HTML" <|
            \_ ->
                let
                    uc =
                        UnitCircle.empty |> UnitCircle.onClickSelect Basics.identity
                    html =
                        UnitCircle.render uc
                in
                Expect.pass
        , test "full configuration renders" <|
            \_ ->
                let
                    uc =
                        UnitCircle.init 300
                            |> UnitCircle.withAngle (pi / 6)
                            |> UnitCircle.withLabel "π/6"
                            |> UnitCircle.withCoords True
                            |> UnitCircle.onClickSelect Basics.identity
                    html =
                        UnitCircle.render uc
                in
                Expect.pass
        ]