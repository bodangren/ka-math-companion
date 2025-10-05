/** @type {import('eslint').Linter.Config} */
module.exports = {
  root: true,
  extends: [
    "next/core-web-vitals",
    "next/typescript",
    "plugin:@typescript-eslint/recommended"
  ],
  parser: "@typescript-eslint/parser",
  plugins: ["@typescript-eslint"],
  ignorePatterns: ["out/**"],
  overrides: [
    {
      files: ["**/*.ts", "**/*.tsx"],
      parserOptions: {
        project: ["./tsconfig.json"],
        tsconfigRootDir: __dirname
      }
    },
    {
      files: ["**/*.d.ts"],
      rules: {
        "@typescript-eslint/triple-slash-reference": "off",
      },
    },
    {
      files: ["curriculum/**/*.mdx", "docs/**/*.mdx"],
      extends: ["plugin:mdx/recommended"],
      rules: {
        // Placeholder for KA content linting rules to be added in Sprint S2
        "mdx/no-unused-expressions": "off"
      }
    }
  ]
};
