return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    require("telescope").setup {
      defaults = {
        initial_mode = "insert",
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }

    require("telescope").load_extension "fzf"

    local builtin = require "telescope.builtin"
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in current working dir" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search for string in current working dir" })
  end,
}
