local M = {}

local default_opts = { noremap = true, silent = true }

function M.apply_keymaps(maps)
  for mode, mappings in pairs(maps) do
    for lhs, rhs in pairs(mappings) do
      if type(rhs) == "table" then
        vim.keymap.set(mode, lhs, rhs[1], vim.tbl_extend("force", default_opts, rhs[2] or {}))
      else
        vim.keymap.set(mode, lhs, rhs, default_opts)
      end
    end
  end
end

vim.cmd("set completeopt+=noselect")
vim.cmd(":hi statusline guibg=none")

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
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

highlight("Normal", { fg = "#c0caf5", bg = "#1a1b26" })

highlight("YankHighlight", { bg = "#2d3149" })

--╭──────────────────────────────────────────────╮
--│               Wrap words                     │
--╰──────────────────────────────────────────────╯

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "typst" },
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    -- Normal mode: wrap word under cursor and stay in normal mode
    vim.keymap.set("n", "<C-b>", 'viwdi*<C-r>"*<Esc>', opts)
    vim.keymap.set("n", "<C-i>", 'viwdi_<C-r>"_<Esc>', opts)

    -- Visual mode: wrap selection and stay in normal mode
    vim.keymap.set("v", "<C-b>", 'c*<C-r>"*<Esc>', opts)
    vim.keymap.set("v", "<C-i>", 'c_<C-r>"_<Esc>', opts)
  end,
})

return M
