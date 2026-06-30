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
