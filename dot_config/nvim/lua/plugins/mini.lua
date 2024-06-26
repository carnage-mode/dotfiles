return {
  "echasnovski/mini.nvim",
  version = "*",

  config = function()
    local minipairs = require "mini.pairs"
    minipairs.setup()

    require("mini.move").setup {
      mappings = {
        left = "<C-A-h>",
        right = "<C-A-l>",
        down = "<C-A-j>",
        up = "<C-A-k>",

        -- Move current line in Normal mode
        line_left = "<C-A-h>",
        line_right = "<C-A-l>",
        line_down = "<C-A-j>",
        line_up = "<C-A-k>",
      },
    }
  end,
}
