module Design.Card exposing (card, withFooter, withHeader)

import Design.Tokens exposing (colorPalette, spacing, typographyScale)
import Html exposing (Html, div)
import Html.Attributes exposing (attribute)


card : List (Html msg) -> Html msg
card children =
    div
        [ attribute "style"
            ("background-color:#" ++ colorPalette.white ++ ";box-shadow:0 10px 15px -3px rgba(0,0,0,0.05), 0 4px 6px -2px rgba(0,0,0,0.02);padding:" ++ spacing.md ++ ";margin-bottom:" ++ spacing.md ++ ";border-radius:24px;")
        ]
        children


withHeader : List (Html msg) -> List (Html msg) -> Html msg
withHeader headerContent bodyContent =
    div
        [ attribute "style"
            ("background-color:#" ++ colorPalette.white ++ ";box-shadow:0 10px 15px -3px rgba(0,0,0,0.05), 0 4px 6px -2px rgba(0,0,0,0.02);margin-bottom:" ++ spacing.md ++ ";border-radius:24px;overflow:hidden;")
        ]
        [ div
            [ attribute "style"
                ("background-color:#" ++ colorPalette.surface ++ ";padding:" ++ spacing.md ++ " " ++ spacing.md ++ ";font-family:" ++ typographyScale.headingFont ++ ";font-weight:700;color:#" ++ colorPalette.primary ++ ";")
            ]
            headerContent
        , div
            [ attribute "style" ("padding:" ++ spacing.md) ]
            bodyContent
        ]


withFooter : List (Html msg) -> List (Html msg) -> List (Html msg) -> Html msg
withFooter headerContent bodyContent footerContent =
    div
        [ attribute "style"
            ("background-color:#" ++ colorPalette.white ++ ";box-shadow:0 10px 15px -3px rgba(0,0,0,0.05), 0 4px 6px -2px rgba(0,0,0,0.02);margin-bottom:" ++ spacing.md ++ ";border-radius:24px;overflow:hidden;")
        ]
        [ div
            [ attribute "style"
                ("background-color:#" ++ colorPalette.surface ++ ";padding:" ++ spacing.md ++ " " ++ spacing.md ++ ";font-family:" ++ typographyScale.headingFont ++ ";font-weight:700;color:#" ++ colorPalette.primary ++ ";")
            ]
            headerContent
        , div
            [ attribute "style" ("padding:" ++ spacing.md) ]
            bodyContent
        , div
            [ attribute "style"
                ("background-color:#" ++ colorPalette.surface ++ ";padding:" ++ spacing.md ++ " " ++ spacing.md ++ ";border-top:1px solid rgba(0,0,0,0.05);")
            ]
            footerContent
        ]

