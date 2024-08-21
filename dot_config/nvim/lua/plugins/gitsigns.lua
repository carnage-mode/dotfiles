return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",

  config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
    vim.keymap.set("n", "<leader>tg", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Current Git Line Blame" })
  end,
}
