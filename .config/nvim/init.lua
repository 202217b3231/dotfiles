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

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>o', ':update<cr> :source<cr>')
map('n', '<leader>w', ':write<cr>')
map('n', '<leader>q', ':quit<cr>')

-- move lines up or down
map('n', '<A-j>', ":m .+1<CR>==")
map('i', '<A-j>', "<esc>:m .+1<CR>==gi")
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('n', '<A-k>', ":m .-2<CR>==")
map('i', '<A-k>', "<esc>:m .-2<CR>==gi")
map('v', '<A-k>', ":m '>-2<CR>gv=gv")

-- press jk fast to exit insert mode
map("i", "jk", "<esc>", opts)
map("i", "kj", "<esc>", opts)
map("n", "x", '"_x', opts)

-- select all, copy, save & format
map("n", "<c-a>", "gg<s-v>g")
map("n", "<c-c>", ":%y+<cr>", opts)
map({ "i", "n" }, "<C-s>", "<Esc><cmd>w<CR><cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

-- buffers
map("n", "<tab>", ":bnext<cr>", opts)
map("n", "<s-tab>", ":bprevious<cr>", opts)
map("n", "<leader>x", ":bdelete!<cr>", opts)

map({ 'n', 'v', 'x' }, '<leader>y', 'yyp<cr>')

map("n", "<c-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- keymap for find and replace
map("n", "<c-h>", function()                                        -- prompt for the word to find
	local find_word = vim.fn.input("find: ")                    -- prompt for the word to replace
	local replace_word = vim.fn.input("replace with: ")         -- create the substitute command
	local cmd = string.format("%%s/%s/%s/gc", find_word, replace_word) -- execute the command
	vim.cmd(cmd)
end, { desc = "find and replace a word" })

vim.api.nvim_create_autocmd('lspattach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textdocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

require "mini.pick".setup()
require "nvim-treesitter.configs".setup({ ensure_installed = { "svelte", "typescript", "javascript" }, highlight = { enable = true } })
require("oil").setup()
require("bufferline").setup()
require("lualine").setup()
require("mason").setup()

map('n', '<leader>f', ":Pick files<cr>")
map('n', '<leader>h', ":Pick help<cr>")
map('n', '<leader>e', ":Oil<cr>")

map('n', '<leader>lf', vim.lsp.buf.format)
vim.lsp.enable({ "lua_ls", "biome", "tinymist", "emmetls" })

require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=none")

