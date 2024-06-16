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
          c = {
            require("formatter.filetypes.c").clangformat,
          },
          rust = {
            require("formatter.filetypes.rust").rustfmt,
          },
          cmake = {
            require("formatter.filetypes.cmake").cmakeformat,
          },
        },
      })
    end,
  },
  {
    "gpanders/editorconfig.nvim",
  },
}
