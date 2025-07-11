-- local discipline = require("craftzdog.discipline")
--
-- discipline.cowboy()

local map = vim.keymap
local opts = { noremap = true, silent = true }

-- Keymap for find and replace
map.set("n", "<leader>h", function() -- Prompt for the word to find
	local find_word = vim.fn.input("Find: ") -- Prompt for the word to replace
	local replace_word = vim.fn.input("Replace with: ") -- Create the substitute command
	local cmd = string.format("%%s/%s/%s/gc", find_word, replace_word) -- Execute the command
	vim.cmd(cmd)
end, { desc = "Find and replace a word" })

-- Press jk fast to exit insert mode
map.set("i", "jk", "<ESC>", opts)
map.set("i", "kj", "<ESC>", opts)

-- quit file
map.set("n", "<C-w>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
map.set("n", "x", '"_x', opts)
-- Do things without affecting the registers
map.set("n", "x", '"_x')
map.set("n", "<Leader>p", '"0p')
map.set("n", "<Leader>P", '"0P')
map.set("v", "<Leader>p", '"0p')
map.set("n", "<Leader>c", '"_c')
map.set("n", "<Leader>C", '"_C')
map.set("v", "<Leader>c", '"_c')
map.set("v", "<Leader>C", '"_C')
map.set("n", "<Leader>d", '"_d')
map.set("n", "<Leader>D", '"_D')
map.set("v", "<Leader>d", '"_d')
map.set("v", "<Leader>D", '"_D')

-- Increment/decrement
map.set("n", "+", "<C-a>")
map.set("n", "-", "<C-x>")

-- Select all
map.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
map.set("n", "<Leader>o", "o<Esc>^Da", opts)
map.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
map.set("n", "<C-m>", "<C-i>", opts)

-- Buffers
map.set("n", "<Tab>", ":bnext<CR>", opts)
map.set("n", "<S-Tab>", ":bprevious<CR>", opts)
map.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
-- map.set("n", "ss", ":split<Return>", opts)
-- map.set("n", "sv", ":vsplit<Return>", opts)

-- Ctrl+c to copy all content
map.set("n", "<C-c>", ":%y+<CR>", opts)

map.set("n", "<C-w>", ":bdelete<CR>", opts)

-- Resize window
map.set("n", "<S-Up>", "<C-w>+")
map.set("n", "<S-Down>", "<C-w>-")
map.set("n", "<S-Left>", "<C-w><")
map.set("n", "<S-Right>", "<C-w>>")

-- Resize with arrows
map.set("n", "<Up>", ":resize -2<CR>", opts)
map.set("n", "<Down>", ":resize +2<CR>", opts)
map.set("n", "<Left>", ":vertical resize -2<CR>", opts)
map.set("n", "<Right>", ":vertical resize +2<CR>", opts) -- Diagnostics

map.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

map.set("n", "<leader>r", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)

map.set("n", "<leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)

vim.api.nvim_create_user_command("ToggleAutoformat", function()
	require("craftzdog.lsp").toggleAutoformat()
end, {})
