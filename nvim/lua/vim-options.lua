vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu")
vim.g.mapleader = " "

vim.api.nvim_set_keymap("t", "<leader><ESC>", "<C-\\><C-n>", { noremap = true })

vim.api.nvim_set_keymap("v", "<C-S-c>", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<C-S-v>", '"+p', { noremap = true })
vim.opt.clipboard = "unnamedplus"
