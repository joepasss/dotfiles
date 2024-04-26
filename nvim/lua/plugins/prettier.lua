return {
  "MunifTanjim/prettier.nvim",
  config = function()
    local prettier = require("prettier")

    require("prettier").setup({
      ["null-ls"] = {
        condition = function()
          return prettier.config_exists({
            check_package_json = true,
          })
        end,
        runtime_condition = function(params)
          return true
        end,
        timeout = 5000,
      },
      cli_options = {
        arrowParens = "always",
        bracketSpacing = true,
        endOfLine = "lf",
        htmlWhitespaceSensitivity = "css",
        printWidth = 80,
        proseWrap = "preserve",
        quoteProps = "as-needed",
        jsxBracketSameLine = true,
        embeddedLanguageFormatting = "auto",
        jsxSingleQuote = false,
        semi = true,
        singleQuote = false,
        tabWidth = 2,
        trailingComma = "es5",
        useTabs = false,
        requirePragma = false,
        insertPragma = false
      }
    })
  end
}
