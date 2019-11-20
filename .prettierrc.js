module.exports = {
  printWidth: 80,
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
  bracketSpacing: false,
  jsxBracketSameLine: false
};
