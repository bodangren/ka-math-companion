module Design.Tokens exposing
    ( ColorPalette
    , Spacing
    , TypographyScale
    , colorPalette
    , spacing
    , typographyScale
    )


type alias ColorPalette =
    { primary : String
    , secondary : String
    , accent : String
    , neutral : String
    , success : String
    , warning : String
    , error : String
    , info : String
    , surface : String
    , white : String
    , textPrimary : String
    , textSecondary : String
    }


colorPalette : ColorPalette
colorPalette =
    { primary = "EB001B"
    , secondary = "FF5F00"
    , accent = "F79E1B"
    , neutral = "6E6E6E"
    , success = "15803D"
    , warning = "CA8A04"
    , error = "DC2626"
    , info = "EB001B"
    , surface = "F9F7F2"
    , white = "FFFFFF"
    , textPrimary = "1A1A1A"
    , textSecondary = "555555"
    }


type alias Spacing =
    { xs : String
    , sm : String
    , md : String
    , lg : String
    , xl : String
    , xxl : String
    }


spacing : Spacing
spacing =
    { xs = "8px"
    , sm = "12px"
    , md = "24px"
    , lg = "36px"
    , xl = "48px"
    , xxl = "96px"
    }


type alias TypographyScale =
    { headingFont : String
    , bodyFont : String
    , smallFontSize : String
    , bodyFontSize : String
    , largeFontSize : String
    , h3FontSize : String
    , h2FontSize : String
    , h1FontSize : String
    }


typographyScale : TypographyScale
typographyScale =
    { headingFont = "'Newsreader', serif"
    , bodyFont = "'Inter', sans-serif"
    , smallFontSize = "0.875rem"
    , bodyFontSize = "1.125rem"
    , largeFontSize = "1.25rem"
    , h3FontSize = "1.75rem"
    , h2FontSize = "2.5rem"
    , h1FontSize = "3.5rem"
    }
