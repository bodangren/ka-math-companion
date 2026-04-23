module Design.Tokens exposing
    (ColorPalette
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
    }


colorPalette : ColorPalette
colorPalette =
    { primary = "2563EB"
    , secondary = "7C3AED"
    , accent = "0D9488"
    , neutral = "6B7280"
    , success = "10B981"
    , warning = "F59E0B"
    , error = "EF4444"
    , info = "3B82F6"
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
    { xs = "4px"
    , sm = "8px"
    , md = "16px"
    , lg = "24px"
    , xl = "32px"
    , xxl = "48px"
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
    { headingFont = "ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace"
    , bodyFont = "ui-sans-serif, system-ui, -apple-system, sans-serif"
    , smallFontSize = "0.875rem"
    , bodyFontSize = "1rem"
    , largeFontSize = "1.125rem"
    , h3FontSize = "1.25rem"
    , h2FontSize = "1.5rem"
    , h1FontSize = "1.875rem"
    }