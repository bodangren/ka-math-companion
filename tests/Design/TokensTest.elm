module Design.TokensTest exposing (suite)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Expect
import Test


suite : Test.Test
suite =
    Test.describe "Design.Tokens"
        [ Test.describe "colorPalette"
            [ Test.test "primary blue is defined" <|
                \_ ->
                    Expect.equal colorPalette.primary "2563EB"
            , Test.test "secondary purple is defined" <|
                \_ ->
                    Expect.equal colorPalette.secondary "7C3AED"
            , Test.test "accent teal is defined" <|
                \_ ->
                    Expect.equal colorPalette.accent "0D9488"
            , Test.test "neutral gray is defined" <|
                \_ ->
                    Expect.equal colorPalette.neutral "6B7280"
            , Test.test "success green is defined" <|
                \_ ->
                    Expect.equal colorPalette.success "10B981"
            , Test.test "warning amber is defined" <|
                \_ ->
                    Expect.equal colorPalette.warning "F59E0B"
            , Test.test "error red is defined" <|
                \_ ->
                    Expect.equal colorPalette.error "EF4444"
            , Test.test "info blue is defined" <|
                \_ ->
                    Expect.equal colorPalette.info "3B82F6"
            ]
        , Test.describe "spacing"
            [ Test.test "xs is 4px" <|
                \_ ->
                    Expect.equal spacing.xs "4px"
            , Test.test "sm is 8px" <|
                \_ ->
                    Expect.equal spacing.sm "8px"
            , Test.test "md is 16px" <|
                \_ ->
                    Expect.equal spacing.md "16px"
            , Test.test "lg is 24px" <|
                \_ ->
                    Expect.equal spacing.lg "24px"
            , Test.test "xl is 32px" <|
                \_ ->
                    Expect.equal spacing.xl "32px"
            , Test.test "2xl is 48px" <|
                \_ ->
                    Expect.equal spacing.xxl "48px"
            ]
        , Test.describe "typographyScale"
            [ Test.test "headingFont is defined" <|
                \_ ->
                    Expect.equal typographyScale.headingFont "ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace"
            , Test.test "bodyFont is defined" <|
                \_ ->
                    Expect.equal typographyScale.bodyFont "ui-sans-serif, system-ui, -apple-system, sans-serif"
            , Test.test "smallFontSize is defined" <|
                \_ ->
                    Expect.equal typographyScale.smallFontSize "0.875rem"
            , Test.test "bodyFontSize is defined" <|
                \_ ->
                    Expect.equal typographyScale.bodyFontSize "1rem"
            , Test.test "largeFontSize is defined" <|
                \_ ->
                    Expect.equal typographyScale.largeFontSize "1.125rem"
            , Test.test "h3FontSize is defined" <|
                \_ ->
                    Expect.equal typographyScale.h3FontSize "1.25rem"
            , Test.test "h2FontSize is defined" <|
                \_ ->
                    Expect.equal typographyScale.h2FontSize "1.5rem"
            , Test.test "h1FontSize is defined" <|
                \_ ->
                    Expect.equal typographyScale.h1FontSize "1.875rem"
            ]
        ]
