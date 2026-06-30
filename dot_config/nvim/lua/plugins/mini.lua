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

require("mini.jump").setup {}

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

require("mini.notify").setup {
  window = {
    config = {
      anchor = "SE",
      row = vim.o.lines - 2,
      col = vim.o.columns,
      title = "",
      border = "none",
    },
    max_width_share = 0.3,
    winblend = 10,
  },
}

require("mini.pairs").setup {}
