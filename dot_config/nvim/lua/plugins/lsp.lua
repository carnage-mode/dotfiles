return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",

  dependencies = {
    { "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {}, event = "LspAttach" },
  },

  config = function()
    local lsp_zero = require "lsp-zero"

    lsp_zero.on_attach(function(client, bufnr)
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      end

      -- Jump to the definition of the word under your cursor.
      map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

      -- WARN: This is not Goto Definition, this is Goto Declaration.
      --  For example, in C this would take you to the header.
      map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

      -- Find references for the word under your cursor.
      map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

      -- Jump to the implementation of the word under your cursor.
      map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

      -- Jump to the type of the word under your cursor.
      map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

      -- Fuzzy find all the symbols in your current document.
      map("<leader>fs", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

      -- Fuzzy find all the symbols in your current workspace.
      --  Similar to document symbols, except searches over your entire project.
      map("<leader>fw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

      -- Rename the variable under your cursor.
      --  Most Language Servers support renaming across files, etc.
      map("<leader>r", vim.lsp.buf.rename, "[R]e[n]ame")

      -- Execute a code action, usually your cursor needs to be on top of an error
      map("<leader>c", vim.lsp.buf.code_action, "[C]ode [A]ction")

      -- Opens a popup that displays documentation about the word under your cursor
      map("K", vim.lsp.buf.hover, "Hover Documentation")
    end)

    require("mason").setup {}

    require("mason-lspconfig").setup {
      ensure_installed = {
        "clangd",
        "cssls",
        "emmet_language_server",
        "html",
        "lua_ls",
        "phpactor",
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
