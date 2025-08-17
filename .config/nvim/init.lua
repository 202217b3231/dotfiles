vim.g.mapleader = " "

require("config.plugins")
require("config.keymaps")
require("config.lsp")
require("config.autocmd")

--╭──────────────────────────────────────────────╮
--│                 Options                      │
--╰──────────────────────────────────────────────╯
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.clipboard = "unnamedplus"
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.winborder = "rounded"
vim.o.cmdheight = 0
