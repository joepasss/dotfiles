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
          typescript = {
            require("formatter.filetypes.typescript").prettierd,

            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettierd,
          },
          css = {
            require("formatter.filetypes.css").stylelint,
          },
          scss = {
            function()
              return {
                exe = "stylelint",
                args = { "--fix", "--stdin-filename", vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
          sass = {
            function()
              return {
                exe = "stylelint",
                args = { "--fix", "--stdin-filename", vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end,
          },
        },
      })
    end,
  },
  {
    "gpanders/editorconfig.nvim",
  },
}
