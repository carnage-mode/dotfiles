return {
  "echasnovski/mini.nvim",
  version = "*",

  config = function()
    require("mini.pairs").setup()

    require("mini.jump2d").setup()

    local gen_ai_spec = require("mini.extra").gen_ai_spec

    require("mini.ai").setup {
      custom_textobjects = {
        B = gen_ai_spec.buffer(),
        D = gen_ai_spec.diagnostic(),
        I = gen_ai_spec.indent(),
        L = gen_ai_spec.line(),
        N = gen_ai_spec.number(),
      },
    }

    require("mini.surround").setup()

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
