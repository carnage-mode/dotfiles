-- Status line
return {
  "nvim-lualine/lualine.nvim",

  config = function()
    local my_theme = require "lualine.themes.auto"

    my_theme.normal.c = { fg = "#C4C6CD", bg = "#2C2E33" }
    my_theme.insert.c = { fg = "#C4C6CD", bg = "#2C2E33" }
    my_theme.command.c = { fg = "#C4C6CD", bg = "#2C2E33" }
    my_theme.visual.c = { fg = "#C4C6CD", bg = "#2C2E33" }
    my_theme.replace.c = { fg = "#C4C6CD", bg = "#2C2E33" }

    require("lualine").setup {
      options = {
        icons_enabled = false,
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
        theme = my_theme,
      },
      winbar = {
        lualine_a = {},
        lualine_b = {
          {
            "filename",
            path = 3,
            newfile_status = true,
            shorting_target = 40,
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {
          {
            "filename",
            newfile_status = true,
            shorting_target = 40,
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
