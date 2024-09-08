-- Status line
return {
  "nvim-lualine/lualine.nvim",

  config = function()
    require("lualine").setup {
      options = {
        theme = "adwaita",
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
      },
    }
  end,
}
