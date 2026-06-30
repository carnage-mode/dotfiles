local telescope = require "telescope"

telescope.setup {
  defaults = {
    initial_mode = "insert",
    vimgrep_arguments = vimgrep_arguments,
  },
  -- pickers = {}
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown() },

    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")

local builtin = require "telescope.builtin"

vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "keymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "files" })
vim.keymap.set("n", "<leader>fb", builtin.builtin, { desc = "builtin telescope commands" })
vim.keymap.set({ "n", "v" }, "<leader>fw", builtin.grep_string, { desc = "word (current)" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "grep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "resume" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = 'recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "commands" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "find existing buffers" })

require("oil").setup {
  default_file_explorer = true,
  watch_for_changes = true,
  keymaps = {
    [".."] = "actions.parent",
    ["."] = "actions.cd",
    ["<C-t>"] = false,
    ["<C-s>"] = false,
    ["<C-h>"] = false,
    ["<Esc>"] = "actions.close",
  },

  float = {
    padding = 5,
  },

  view_options = {
    is_hidden_file = function(name, bufnr)
      local dir = require("oil").get_current_dir(bufnr)
      local home = vim.fn.expand "$HOME" .. "/"
      local m = nil
      if dir == home then
        m = name:match "^%."
      else
        m = nil
      end
      return m ~= nil
    end,
    is_always_hidden = function(name, bufnr)
      local m = name:match "^%.git$"
      return m ~= nil
    end,
  },
}

vim.keymap.set("n", "<leader>bf", "<CMD>Oil<CR>", { desc = "files" })
