local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save and format
map("n", "<C-s>", function()
	vim.cmd("w")
	vim.lsp.buf.format({ async = true })
end, opts)
map({ "i", "n" }, "<C-s>", "<Esc><cmd>w<CR><cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

-- Select all
map("n", "<C-a>", "ggVG", opts)

-- Ctrl+c to copy all content
map("n", "<C-c>", ":%y+<CR>", opts)

-- Close current buffer
map("n", "<C-w>", "<cmd>bd<CR>", opts)

-- Close all other buffers
map("n", "<leader>wa", ":%bd|e#|bd#<CR>", opts)

-- Find and Replace (opens Telescope live grep if installed, or use command mode)
map("n", "<leader>h", ":%s//g<Left><Left>", opts)

-- Easy escape in insert mode
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

-- Telescope keymaps
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>gr", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", opts)

-- Neo-tree (file explorer)
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>lf", function()
	vim.lsp.buf.format({ async = true })
end, opts)

-- Select all
map("n", "<C-a>", "gg<S-v>G")
-- Buffers
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>x", ":bdelete!<CR>", opts)

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)

-- Terminal
map("n", "<leader>t", "<cmd>split | terminal<cr>", opts)

-- Write / Quit
map("n", "<leader>w", "<cmd>w<cr>", opts)
map("n", "<leader>q", "<cmd>q<cr>", opts)

map("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)

map("n", "<leader>de", function()
	vim.diagnostic.open_float(nil, { focusable = true })
end, { desc = "Show line diagnostic" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
