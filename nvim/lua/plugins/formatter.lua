return {
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          sh = {
            require("formatter.filetypes.sh").shfmt,
          },
        },
      })
    end,
  },
  {
    "gpanders/editorconfig.nvim",
  },
}
