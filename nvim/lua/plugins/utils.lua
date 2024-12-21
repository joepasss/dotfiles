return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      ---@diagnostic disable-next-line: missing-parameter
      require("colorizer").setup()
    end,
  },
}
