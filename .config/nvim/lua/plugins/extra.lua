return {
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false,
    version = "1.*",
    opts = {},
  },
  {
    "voldikss/vim-floaterm",
    keys = {
      { "<leader>cg", "<cmd>FloatermNew --autoclose=0 go run ./%<cr>", desc = "Run go file" },
    },
  },
  {
    "github/copilot.vim",
  },
}
