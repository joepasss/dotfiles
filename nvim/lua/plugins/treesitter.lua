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
        "make",
        "cmake",
        "gitignore",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
    })
  end,
}
