return {
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    event = "VimEnter",

    init = function()
      vim.g.adwaita_darker = true
      vim.cmd "colorscheme adwaita"
    end,
  },

  {
    "p00f/alabaster.nvim",
    event = "VeryLazy",
  },
}
