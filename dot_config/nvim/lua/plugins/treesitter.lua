return { -- Treesitter config
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "meson",
        "php",
        "python",
        "racket",
        "regex",
        "rust",
        "scheme",
        "sql",
        "vim",
        "vimdoc",
      },

      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
