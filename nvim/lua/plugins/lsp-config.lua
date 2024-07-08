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
      require("mason-lspconfig").setup({
        ensure_installed = {
          "snyk_ls",
          "typos_lsp",
          "bashls",
          "clangd",
          "cmake",
          "dockerls",
          "docker_compose_language_service",
          "emmet_ls",
          "html",
          "jsonls",
          "tsserver",
          "lua_ls",
          "somesass_ls",
          "stylelint_lsp",
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

      lspconfig.snyk_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.typos_lsp.setup({
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

      lspconfig.cmake.setup({
        capabilities = capabilities,
      })

      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })

      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities,
      })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.html.setup({
        capabilities = capabilities,
      })

      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.somesass_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.stylelint_lsp.setup({
        capabilities = capabilities,
        filetypes = { "css", "scss", "sass" },
      })

      lspconfig.emmet_ls.setup({
        filetypes = { "html", "css", "typescriptreact", "sass" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      })
    end,
  },
}
