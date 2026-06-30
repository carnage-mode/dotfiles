require("which-key").setup {
  delay = 0,
  preset = "helix",
  icons = {
    mappings = false,
    keys = {
      S = "s-",
      C = "c-",
      M = "a-",
      BS = "bs",
      Esc = "esc",
    },
  },
  -- Document existing key chains
  spec = {
    { "<leader>b", group = "browse" },
    { "<leader>f", group = "find", mode = { "n", "v" } },
    { "<leader>g", group = "git" },
    { "<leader>s", group = "split" },
    { "<leader>t", group = "tabs" },
    { "<leader>l", group = "language" },
    { "gr", group = "language" },
  },
}
