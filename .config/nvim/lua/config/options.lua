vim.g.mapleader = " "

local o = vim.opt
o.number = true
o.relativenumber = true
o.mouse = "a"
o.wrap = false
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.termguicolors = true
o.cursorline = true
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.scrolloff = 8
o.updatetime = 250
o.timeoutlen = 300
o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"

-- vim.notify = require("notify")

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	float = {
		border = "rounded",
		focusable = true,
		-- source = "always",
		header = "",
		prefix = "",
	},
})
