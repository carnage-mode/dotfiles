return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup {
      keymaps = {
        [".."] = "actions.parent",
      },
    }
    vim.keymap.set("n", "<leader>bf", "<CMD>Oil<CR>", { desc = "Browse Files" })
  end,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
