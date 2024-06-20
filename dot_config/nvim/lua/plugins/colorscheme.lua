-- Color scheme

return {
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    event = "VimEnter",
    init = function()
      vim.cmd "colorscheme adwaita"
    end,
  },
  "rebelot/kanagawa.nvim",
  "marko-cerovac/material.nvim",
}
