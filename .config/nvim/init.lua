--╭──────────────────────────────────────────────╮
--│                 Plugins                      │
--╰──────────────────────────────────────────────╯
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/williamboman/mason.nvim" },
})

require("nvim-treesitter.configs").setup({ ensure_installed = { "svelte", "typescript", "javascript" }, highlight = { enable = true } })
require("vague").setup({ transparent = true })
require("mini.pick").setup()
require("oil").setup()
require("bufferline").setup()
require("lualine").setup()
require("mason").setup()

--╭──────────────────────────────────────────────╮
--│                 Options                      │
--╰──────────────────────────────────────────────╯
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
-- vim.o.cmdheight = 0

--╭──────────────────────────────────────────────╮
--│                 Keymaps                      │
--╰──────────────────────────────────────────────╯
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>o', '<cmd>update<cr> <cmd>source<cr>')
map('n', '<leader>w', '<cmd>write<cr>')
map('n', '<leader>q', '<cmd>quit<cr>')

-- Keep search results in center
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
-- move lines up or down
map('n', '<A-k>', "<cmd>m .-2<CR>==")
map('i', '<A-k>', "<esc><cmd>m .-2<CR>==gi")
map('v', '<A-k>', "<cmd>m '<-2<CR>gv=gv")
map('n', '<A-j>', "<cmd>m .+1<CR>==")
map('i', '<A-j>', "<esc><cmd>m .+1<CR>==gi")
map('v', '<A-j>', "<cmd>m '>+1<CR>gv=gv")

-- press jk fast to exit insert mode
map("i", "jk", "<esc>", opts)
map("i", "kj", "<esc>", opts)
map("n", "x", '"_x', opts)

-- Esc to remove highlight
map("n", "<esc>", '<cmd>noh<cr>', opts)

-- select all, copy, save & format
map("n", "<c-a>", "gov<s-g>$")
map("n", "<c-c>", "<cmd>%y+<cr>", opts)
map({ "i", "n" }, "<C-s>", "<Esc><cmd>w<CR><cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

-- buffers
map("n", "<tab>", "<cmd>bnext<cr>", opts)
map("n", "<s-tab>", "<cmd>bprevious<cr>", opts)
map("n", "<leader>x", "<cmd>bdelete!<cr>", opts)

map({ 'n', 'v', 'x' }, '<leader>y', '"1yy"1p<cr>')

map("n", "<c-j>", function() vim.diagnostic.goto_next() end, opts)

map('n', '<leader>f', "<cmd>Pick files<cr>")
map('n', '<leader>h', "<cmd>Pick help<cr>")
map('n', '<leader>e', "<cmd>Oil<cr>")
map('n', '<leader>lf', vim.lsp.buf.format)

-- keymap for find and replace
map("n", "<c-h>", function()
	local cmd = string.format("%%s/%s/%s/gc", vim.fn.input("find: "), vim.fn.input("replace with: "))
	vim.cmd(cmd)
end, { desc = "find and replace a word" })

--╭──────────────────────────────────────────────╮
--│                 Autocmds                     │
--╰──────────────────────────────────────────────╯
vim.api.nvim_create_autocmd('lspattach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textdocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=none")

vim.lsp.enable({ "lua_ls", "biome", "tinymist", "emmetls" })

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "YankHighlight",
			timeout = 200,
		})
	end,
})
--╭──────────────────────────────────────────────╮
--│         Helper: Highlight Function           │
--╰──────────────────────────────────────────────╯

local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Custom highlight for CursorLine
highlight("CursorLine", { bg = "#1f1f1f" })

-- Make comments italic
highlight("Comment", { fg = "#5c6370", italic = true })

-- Set normal text color
highlight("Normal", { fg = "#c0caf5", bg = "#1a1b26" })

highlight("YankHighlight", { bg = "#2d3149", })
vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })

--╭──────────────────────────────────────────────╮
--╰──────────────────────────────────────────────╯
