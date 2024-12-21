-- leader key
vim.g.mapleader = " "

-- lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })

-- neo-tree toggle
vim.keymap.set("n", "<C-m>", ":Neotree toggle<CR>", { noremap = true, silent = true })
