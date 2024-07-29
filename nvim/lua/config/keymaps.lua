-- leader key
vim.g.mapleader = " "

-- copy to clipboard
vim.keymap.set("v", "<leader>c", '"+y')
vim.keymap.set("n", "<leader>cc", '"+yy')

-- neo-tree toggle
vim.keymap.set("n", "<C-m>", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":Neotree focus<CR>", { noremap = true, silent = true })

-- format
vim.keymap.set("n", "<C-f>", ":Format<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-f>", ":FormatWrite<CR>", { noremap = true, silent = true })

-- lsp
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })

--lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
