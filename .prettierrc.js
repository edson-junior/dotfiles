module.exports = {
  printWidth: 120,
  tabWidth: 2,
  useTabs: false,
  // semi: false,
  singleQuote: true,
  overrides: [
    {
      "files": "**/*.scss",
      "options": {
        singleQuote: false
      }
    }
  ],
  // trailingComma: "all",
  bracketSpacing: true,
  jsxBracketSameLine: false
};
