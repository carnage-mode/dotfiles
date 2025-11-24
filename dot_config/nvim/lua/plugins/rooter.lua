return {
  "airblade/vim-rooter",
  lazy = false,
  event = "VimEnter",

  init = function()
    vim.g.rooter_patterns = {
      ".git",
      "_darcs",
      ".hg",
      ".bzr",
      ".svn",
      "Makefile",
      "package.json",
      "index.html",
      "go.mod",
    }
    vim.g.rooter_change_directory_for_non_project_files = "current"
  end,
}
