return {
  "kristijanhusak/vim-dadbod-ui",
  event = "VeryLazy",

  keys = {
    { "<leader>td", "<cmd>DBUIToggle<cr>", desc = "[T]oggle [D]atabase UI" },
  },

  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },

  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
}
