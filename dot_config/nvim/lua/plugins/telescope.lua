return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",

  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-project.nvim",
  },

  config = function()
    local telescope = require "telescope"
    local telescopeConfig = require "telescope.config"

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.setup {
      defaults = {
        initial_mode = "insert",
        vimgrep_arguments = vimgrep_arguments,
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },

      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*" },
        },
      },
    }

    telescope.load_extension "fzf"
    telescope.load_extension "project"

    local builtin = require "telescope.builtin"

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [f]iles in current working dir" })
    vim.keymap.set(
      "n",
      "<leader>fp",
      ":lua require'telescope'.extensions.project.project{}<CR>",
      { desc = "[F]ind [p]rojects" }
    )
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[G]rep strings in current working dir" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [buffers]" })
    vim.keymap.set("n", "<leader>q", builtin.diagnostics, { desc = "Open diagnostic [Q]uickfix list" })
  end,
}
