-- Status line
return {
  "nvim-lualine/lualine.nvim",

  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = false,
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 3,
            newfile_status = true,
            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            color = { fg = "light", bg = "dark", gui = "italic" },
            padding = 2,
            symbols = {
              modified = "[+]",
              readonly = "[-]",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
