return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",

  dependencies = {
    "neovim/nvim-lspconfig",
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
  },

  config = function()
    local lsp_zero = require "lsp-zero"

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps { buffer = bufnr }
    end)

    require("mason").setup {}

    require("mason-lspconfig").setup {
      ensure_installed = {
        "clangd",
        "cssls",
        "emmet_language_server",
        "html",
        "lua_ls",
        -- "phpactor",
        "pyright",
        "tsserver",
        "vimls",
      },
      handlers = {
        lsp_zero.default_setup,

        lua_ls = function()
          require("lspconfig").lua_ls.setup {
            settings = {
              Lua = {
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          }
        end,
      },
    }

    require("mason-tool-installer").setup {
      ensure_installed = {
        "stylua",
      },
    }
  end,
}
