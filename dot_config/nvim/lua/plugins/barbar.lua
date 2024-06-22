return {
  "romgrk/barbar.nvim",
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  config = function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map("n", "<LocalLeader>h", "<Cmd>BufferPrevious<CR>", { desc = "Previous Buffer", table.unpack(opts) })
    map("n", "<LocalLeader>l", "<Cmd>BufferNext<CR>", { desc = "Next Buffer", table.unpack(opts) })
    -- Re-order to previous/next
    map("n", "<LocalLeader>H", "<Cmd>BufferMovePrevious<CR>", { desc = "Move Buffer Right", table.unpack(opts) })
    map("n", "<LocalLeader>L", "<Cmd>BufferMoveNext<CR>", { desc = "Move Buffer Left", table.unpack(opts) })
    -- Pin/unpin buffer
    map("n", "<LocalLeader>p", "<Cmd>BufferPin<CR>", { desc = "Pin Buffer", table.unpack(opts) })
    -- Close buffer
    map("n", "<LocalLeader>c", "<Cmd>BufferClose<CR>", { desc = "Close Buffer", table.unpack(opts) })
    -- Restore buffer
    map("n", "<LocalLeader>r", "<Cmd>BufferRestore<CR>", { desc = "Restore Buffer", table.unpack(opts) })
    -- Magic buffer-picking mode
    map("n", "<LocalLeader>m", "<Cmd>BufferPick<CR>", { desc = "Magic Buffer Select Mode", table.unpack(opts) })

    require("barbar").setup()
  end,
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
