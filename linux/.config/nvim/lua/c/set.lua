vim.o.backup = false
vim.o.writebackup = false
vim.o.signcolumn = "yes"
vim.o.updatetime = 30
vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 0
vim.o.cmdheight = 1
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.background = "dark"
vim.o.encoding = "utf-8"
vim.o.compatible = false
vim.o.cursorline = true
vim.o.showtabline = 0
vim.o.cursorlineopt = "number"
vim.o.guicursor = "i:block"
vim.cmd.syntax = "enable"
require('rose-pine').setup({
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,
})
vim.cmd.colorscheme("rose-pine")
vim.cmd[[filetype plugin indent on]]
