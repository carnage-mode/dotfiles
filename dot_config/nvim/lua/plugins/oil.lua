return {
  "stevearc/oil.nvim",
  event = "VeryLazy",

  config = function()
    require("oil").setup {
      keymaps = {
        [".."] = "actions.parent",
        ["."] = "actions.cd",
        ["<C-t>"] = false,
        ["<Esc>"] = "actions.close",
      },

      float = {
        padding = 5,
      },

      view_options = {
        show_hidden = true,
      },
    }
    vim.keymap.set("n", "<leader>bf", "<CMD>Oil<CR>", { desc = "[B]rowse [F]iles" })
  end,

  dependencies = { "nvim-tree/nvim-web-devicons" },
}
