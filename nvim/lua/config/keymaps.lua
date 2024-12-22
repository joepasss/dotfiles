-- leader key
vim.g.mapleader = " "

-- lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })

-- neo-tree
vim.keymap.set("n", "<C-m>", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":Neotree<CR>", { noremap = true, silent = true })

-- lsp
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
