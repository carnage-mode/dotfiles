return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  config = function()
    require("which-key").setup {
      preset = "helix",
      icons = {
        mappings = false,
        keys = {
          S = "Shift ",
          C = "Ctrl ",
          M = "Alt ",
        },
      },
    }

    local wk = require "which-key"

    wk.add {
      { "<leader>f", group = "+file" },
      { "<leader>g", group = "+git" },
      { "<leader>t", group = "+toggle" },
      { "<leader>s", group = "+split" },
      { "<leader>b", group = "+browse" },
    }
  end,
}
