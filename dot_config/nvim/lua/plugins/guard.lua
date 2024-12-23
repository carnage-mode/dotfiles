return {
  "nvimdev/guard.nvim",
  event = "BufReadPre",

  dependencies = {
    "nvimdev/guard-collection",
  },

  config = function()
    local ft = require "guard.filetype"

    ft("html"):fmt "prettier"

    ft("css"):fmt "prettier"

    ft("markdown"):fmt "prettier"

    ft("typescript,javascript,typescriptreact"):fmt "prettier"

    ft("lua"):fmt {
      cmd = "stylua",
      args = { "-s", "-" },
      stdin = true,
    }

    ft("go"):fmt {
      cmd = "go",
      args = { "fmt", "./..." },
    }
  end,
}
