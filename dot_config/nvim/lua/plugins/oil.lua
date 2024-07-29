return {
  "stevearc/oil.nvim",

  config = function()
    require("oil").setup {
      keymaps = {
        [".."] = "actions.parent",
        ["."] = "actions.cd",
        ["<Esc>"] = "actions.close",
      },

      float = {
        padding = 5,
      },
    }
    vim.keymap.set("n", "<leader>bf", "<CMD>Oil --float<CR>", { desc = "[B]rowse [F]iles" })

    vim.api.nvim_create_autocmd("User", {
      pattern = "OilEnter",
      callback = vim.schedule_wrap(function(args)
        local oil = require "oil"
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.open_preview()
        end
      end),
    })
  end,

  dependencies = { "nvim-tree/nvim-web-devicons" },
}
