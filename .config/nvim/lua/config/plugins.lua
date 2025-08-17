vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim.git" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
})

require("nvim-treesitter.configs").setup({ ensure_installed = { "svelte", "typescript", "javascript" }, highlight = { enable = true } })
require("vague").setup({ transparent = true })
require("render-markdown").setup()
require("lualine").setup()
require("mason").setup()
require("flash").setup()
require("which-key").setup()

require("mini.pick").setup()
require("mini.surround").setup()
require("mini.files").setup()
require("mini.tabline").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.hipatterns").setup()
require("mini.trailspace").setup()

require("snacks").setup(
	{
		-- dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	}
)

require('nvim-ts-autotag').setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false
	},
	per_filetype = {
		["html"] = { enable_close = false }
	}
})

local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-k>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set("n", "<cr>", function() require("flash").jump() end, { desc = "Flash" })
