---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
        "bash",
        "c",
        "cmake",
        "css",
        "dockerfile",
        "gitignore",
        "html",
        "javascript",
        "json",
        "regex",
        "rust",
        "scss",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
    })
  end,
}
