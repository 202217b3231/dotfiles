return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
 █████   █████       █████
░░███   ░░███       ░░███ 
 ░███    ░███        ░███ 
 ░███████████        ░███ 
 ░███░░░░░███        ░███ 
 ░███    ░███  ███   ░███ 
 █████   █████░░████████  
░░░░░   ░░░░░  ░░░░░░░░   
                        ]],
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = {
          function()
            return vim.fn.mode():upper()
          end,
        },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = LazyVim.config.icons.diagnostics.Error,
              warn = LazyVim.config.icons.diagnostics.Warn,
              info = LazyVim.config.icons.diagnostics.Info,
              hint = LazyVim.config.icons.diagnostics.Hint,
            },
          },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_x = {
          function()
            return tostring(vim.fn.line("$")) .. " "
          end,
        },
        lualine_y = {
          { "location", padding = { left = 0, right = 1 } },
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    },
  },
}
