return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",

  opts = {
    user_default_options = {
      css = true,
      css_fn = true,
      mode = "virtualtext",
    },
  },
}
