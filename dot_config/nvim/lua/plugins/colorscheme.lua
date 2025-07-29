return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    event = "VimEnter",

    init = function()
      vim.cmd "colorscheme kanagawa"
    end,
  },

  {
    "Mofiqul/adwaita.nvim",
    event = "VeryLazy",
  },
}
