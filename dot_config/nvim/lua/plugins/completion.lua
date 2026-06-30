require("luasnip").setup {}
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require "blink.cmp"
cmp.build():pwait()

cmp.setup {
  keymap = {
    preset = "default",
  },

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
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  snippets = { preset = "luasnip" },

  fuzzy = { implementation = "rust" },

  signature = {
    enabled = true,
    window = {
      show_documentation = false,
    },
  },
}
