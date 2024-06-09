-- tab size
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- clipboard
vim.opt.clipboard = "unnamedplus"

local function copy(lines, _)
  require("osc52").copy(table.concat(lines, "\n"))
end

local function paste()
  return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

vim.g.clipboard = {
  name = "osc52",
  copy = { ["+"] = copy, ["*"] = copy },
  paste = { ["+"] = paste, ["*"] = paste },
}
