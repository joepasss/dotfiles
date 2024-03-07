return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup {
      window = {
        width = 30,
      },
      filtered_items = {
        visible = true,
        force_visible_in_empty_folder = false,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      }
    }

    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
  end,
}
