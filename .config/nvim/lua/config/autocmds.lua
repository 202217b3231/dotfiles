
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.vue" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
