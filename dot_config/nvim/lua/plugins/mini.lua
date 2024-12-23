return {
  "echasnovski/mini.nvim",
  version = "*",

  config = function()
    require("mini.pairs").setup()

    local animate = require "mini.animate"

    require("mini.animate").setup {
      scroll = {
        timing = animate.gen_timing.cubic {
          easing = "in-out",
          duration = 100,
          unit = "total",
        },
      },

      cursor = {
        enable = true,
        path = animate.gen_path.spiral(),
        timing = animate.gen_timing.cubic {
          duration = 250,
          unit = "total",
        },
      },
    }

    require("mini.surround").setup {
      mappings = {
        add = "ma", -- Add surrounding in Normal and Visual modes
        delete = "md", -- Delete surrounding
        find = "mf", -- Find surrounding (to the right)
        find_left = "mF", -- Find surrounding (to the left)
        highlight = "mh", -- Highlight surrounding
        replace = "mr", -- Replace surrounding
        update_n_lines = "mn", -- Update `n_lines`

        suffix_last = "", -- Suffix to search with "prev" method
        suffix_next = "", -- Suffix to search with "next" method
      },
    }

    require("mini.jump").setup()

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
