-- leader key
vim.g.mapleader = " "

-- copy to clipboard
vim.api.nvim_set_keymap("v", "<C-S-c>", '"+y', { noremap = true })

-- neo-tree toggle
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true })

-- mason open
vim.keymap.set("n", "<C-m>", ":Mason<CR>", { noremap = true })

-- format
vim.keymap.set("n", "<C-f>", ":Format<CR>", { noremap = true })
vim.keymap.set("n", "<C-S-f>", ":FormatWrite<CR>", { noremap = true })

-- lsp
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })

--lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true })
