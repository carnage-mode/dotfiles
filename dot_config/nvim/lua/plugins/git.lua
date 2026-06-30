require("gitsigns").setup {}

vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "preview hunk" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", { desc = "previous hunk" })
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "next hunk" })
vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>", { desc = "line blame" })
