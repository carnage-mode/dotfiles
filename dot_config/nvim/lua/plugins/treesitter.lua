return { -- Treesitter config
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  init = function()
    vim.filetype.add {
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    }
  end,

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

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },

      filetype = "blade",
    }
  end,
}
