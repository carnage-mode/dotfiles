return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  config = function()
    require("which-key").setup {}

    local wk = require "which-key"

    wk.register {
      ["<leader>f"] = { name = "+file" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>d"] = { name = "+debugger" },
      ["<leader>t"] = { name = "+toggle" },
      ["<leader>s"] = { name = "+split" },
    }
  end,
}
