return {
  "saghen/blink.cmp",

  version = "1.*",

  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },

  opts = {
    keymap = { preset = "default" },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = { auto_show = true },
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
          treesitter = { "lsp" },
        },
      },
      -- list = { selection = { preselect = false } },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    snippets = { preset = "luasnip" },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = {
      enabled = true,
      window = {
        show_documentation = false,
      },
    },
  },

  opts_extend = { "sources.default" },
}
