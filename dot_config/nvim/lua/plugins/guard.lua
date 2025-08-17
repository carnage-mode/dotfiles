return {
  "nvimdev/guard.nvim",

  dependencies = {
    "nvimdev/guard-collection",
    { "williamboman/mason.nvim", config = true },
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

    ft("python"):fmt("ruff"):lint "ruff"
    ft("go"):fmt "gofmt"
    ft("tex"):fmt "latexindent"
  end,
}
