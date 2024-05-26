---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua" },
      auto_install = true,
      highlight = {
        enable = true,
      },
    })
  end,
}
