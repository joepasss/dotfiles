return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "lua-ls",
          "bash-language-server",
          "clangd",
          "rust-analyzer",
          "dockerfile-language-server",
          "cmake-language-server",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    settings = {
      CMake = {
        filetypes = { "cmake", "CMakeLists.txt" },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--compile-commands-dir=./build" },
        init_options = {
          compilationDatabaseDirectory = "build",
        },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })

      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })

      lspconfig.cmake.setup({
        capabilities = capabilities,
      })
    end,
  },
}
