return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    whitespace = {
      remove_blankline_trail = true,
    },

    scope = {
      enabled = true,
    },
  },
}
