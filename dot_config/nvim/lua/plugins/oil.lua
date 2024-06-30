return {
  "stevearc/oil.nvim",

  config = function()
    require("oil").setup {
      keymaps = {
        [".."] = "actions.parent",
        ["."] = "actions.cd",
        ["<Esc>"] = "actions.close",
      },
    }
    vim.keymap.set("n", "<leader>bf", "<CMD>Oil --float<CR>", { desc = "[B]rowse [F]iles" })
  end,

  dependencies = { "nvim-tree/nvim-web-devicons" },
}
