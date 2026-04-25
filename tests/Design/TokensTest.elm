module Design.TokensTest exposing (suite)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Design.Tokens"
        [ Test.describe "colorPalette"
            [ Test.test "primary red is defined" <|
                \_ ->
                    Expect.equal colorPalette.primary "EB001B"
            , Test.test "secondary orange is defined" <|
                \_ ->
                    Expect.equal colorPalette.secondary "FF5F00"
            , Test.test "accent yellow is defined" <|
                \_ ->
                    Expect.equal colorPalette.accent "F79E1B"
            , Test.test "neutral gray is defined" <|
                \_ ->
                    Expect.equal colorPalette.neutral "6E6E6E"
            , Test.test "success green is defined" <|
                \_ ->
                    Expect.equal colorPalette.success "15803D"
            , Test.test "warning amber is defined" <|
                \_ ->
                    Expect.equal colorPalette.warning "CA8A04"
            , Test.test "error red is defined" <|
                \_ ->
                    Expect.equal colorPalette.error "DC2626"
            , Test.test "info red is defined" <|
                \_ ->
                    Expect.equal colorPalette.info "EB001B"
            ]
        , Test.describe "spacing"
            [ Test.test "xs is 8px" <|
                \_ ->
                    Expect.equal spacing.xs "8px"
            , Test.test "sm is 12px" <|
                \_ ->
                    Expect.equal spacing.sm "12px"
            , Test.test "md is 24px" <|
                \_ ->
                    Expect.equal spacing.md "24px"
            , Test.test "lg is 36px" <|
                \_ ->
                    Expect.equal spacing.lg "36px"
            , Test.test "xl is 48px" <|
                \_ ->
                    Expect.equal spacing.xl "48px"
            , Test.test "2xl is 96px" <|
                \_ ->
                    Expect.equal spacing.xxl "96px"
            ]
        , Test.describe "typographyScale"
            [ Test.test "headingFont is Newsreader serif" <|
                \_ ->
                    Expect.equal typographyScale.headingFont "'Newsreader', serif"
            , Test.test "bodyFont is Inter sans-serif" <|
                \_ ->
                    Expect.equal typographyScale.bodyFont "'Inter', sans-serif"
            , Test.test "smallFontSize is defined" <|
                \_ ->
                    Expect.equal typographyScale.smallFontSize "0.875rem"
            , Test.test "bodyFontSize is 1.125rem" <|
                \_ ->
                    Expect.equal typographyScale.bodyFontSize "1.125rem"
            , Test.test "largeFontSize is 1.25rem" <|
                \_ ->
                    Expect.equal typographyScale.largeFontSize "1.25rem"
            , Test.test "h3FontSize is 1.75rem" <|
                \_ ->
                    Expect.equal typographyScale.h3FontSize "1.75rem"
            , Test.test "h2FontSize is 2.5rem" <|
                \_ ->
                    Expect.equal typographyScale.h2FontSize "2.5rem"
            , Test.test "h1FontSize is 3.5rem" <|
                \_ ->
                    Expect.equal typographyScale.h1FontSize "3.5rem"
            ]
        ]
