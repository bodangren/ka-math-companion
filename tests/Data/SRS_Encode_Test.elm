module Data.SRS_Encode_Test exposing (suite)

import Data.SRS as SRS exposing (Card(..), decodeSRSData, encodeSRSData, newCard, version)
import Expect
import Json.Decode as Decode
import Test


suite : Test.Test
suite =
    Test.describe "Data.SRS - Encoding/Decoding"
        [ Test.test "encodeSRSData and decodeSRSData roundtrip" <|
            \_ ->
                let
                    cards =
                        [ newCard "Q1" "A1" "obj-1"
                        , newCard "Q2" "A2" "obj-2"
                        ]

                    data =
                        { version = version
                        , cards = cards
                        }

                    encoded =
                        encodeSRSData data
                in
                case decodeSRSData encoded of
                    Ok decoded ->
                        List.length decoded.cards
                            |> Expect.equal 2

                    Err err ->
                        Expect.fail ("Decode failed: " ++ Decode.errorToString err)
        ]