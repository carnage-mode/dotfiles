return { -- Treesitter config
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

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

      textobjects = {
        select = {
          enable = true,
          lookahead = true,

          keymaps = {
            ["aa"] = { query = "@attribute.outer", desc = "Around attribute" },
            ["ia"] = { query = "@attribute.inner", desc = "Inside attribute" },
            ["ac"] = { query = "@comment.outer", desc = "Around comment" },
            ["ic"] = { query = "@comment.inner", desc = "Inside comment" },
            ["af"] = { query = "@function.outer", desc = "Around function" },
            ["if"] = { query = "@function.inner", desc = "Inside function" },
            ["ap"] = { query = "@parameter.outer", desc = "Around parameter" },
            ["ip"] = { query = "@parameter.inner", desc = "Inside parameter" },
            ["as"] = { query = "@class.outer", desc = "Around struct/class" },
            ["is"] = { query = "@class.inner", desc = "Inside struct/class" },
          },

          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },

          include_surrounding_whitespace = true,
        },
      },
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
