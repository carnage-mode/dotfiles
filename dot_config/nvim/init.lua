vim.loader.enable()

-- options

vim.opt.compatible = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true
vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.synmaxcol = 300
vim.opt.fillchars = { eob = " " }

local undodir = vim.fs.joinpath(vim.fn.stdpath "state", "undodir")
if
  vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.updatetime = 100
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50
vim.opt.autoread = true
vim.opt.autowrite = false

vim.opt.autochdir = false
vim.opt.iskeyword:append "-" -- include-d in words
vim.opt.path:append "**"
vim.opt.mouse = "a"
vim.opt.clipboard:append "unnamedplus" -- use system clipboard

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wildmode = "full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append "linematch:60"
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.o.shell = os.getenv "SHELL"

vim.opt.list = true
vim.opt.listchars = { space = ".", tab = "> " }

-- colors
vim.g.termguicolors = true
vim.g.terminal_color_0 = "#07080d"
vim.g.terminal_color_1 = "#ffc0b9"
vim.g.terminal_color_2 = "#b3f6c0"
vim.g.terminal_color_3 = "#fce094"
vim.g.terminal_color_4 = "#a6dbff"
vim.g.terminal_color_5 = "#ffcaff"
vim.g.terminal_color_6 = "#8cf8f7"
vim.g.terminal_color_7 = "#eef1f8"
vim.g.terminal_color_8 = "#4f5258"
vim.g.terminal_color_9 = "#ffc0b9"
vim.g.terminal_color_10 = "#b3f6c0"
vim.g.terminal_color_11 = "#fce094"
vim.g.terminal_color_12 = "#a6dbff"
vim.g.terminal_color_13 = "#ffcaff"
vim.g.terminal_color_14 = "#8cf8f7"
vim.g.terminal_color_15 = "#eef1f8"
vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = "#8cf8f7" })
vim.api.nvim_set_hl(0, "MiniNotifyNormal", { bg = "#14161B" })

-- autocmds

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "disable spell checking for terminals",
  group = augroup,
  pattern = "*",
  command = "setlocal nospell",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight when yanking text",
  group = augroup,
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "restore last cursor position",
  group = augroup,
  callback = function()
    if vim.o.diff then -- except in diff mode
      return
    end

    local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
    local last_line = vim.api.nvim_buf_line_count(0)

    local row = last_pos[1]
    if row < 1 or row > last_line then
      return
    end

    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "disable auto comments",
  group = augroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "handle git commits",
  group = augroup,
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.textwidth = 72
    vim.opt_local.colorcolumn = "72"

    local ns = vim.api.nvim_create_namespace "gitcommit_highlight"
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePre", "TextChanged", "TextChangedI" }, {
      buffer = 0,
      callback = function()
        vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
        local line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
        if #line > 50 then
          vim.hl.range(0, ns, "ErrorMsg", { 0, 50 }, { 0, -1 })
        end
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "line numbers in terminal",
  group = augroup,
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "rename terminal buffer",
  group = augroup,
  callback = function()
    local shell = vim.fn.fnamemodify(vim.o.shell, ":t")
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_name(buf, shell .. " " .. buf)
  end,
})

vim.api.nvim_create_autocmd("TermClose", {
  desc = "auto close terminal on process exit",
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  desc = "auto-resize splits when window is resized",
  group = augroup,
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "create directories when saving files",
  group = augroup,
  callback = function()
    local dir = vim.fn.expand "<afile>:p:h"
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "no extra files for oil buffers",
  group = augroup,
  pattern = "oil",
  callback = function()
    vim.opt_local.swapfile = false
    vim.opt_local.undofile = false
    vim.opt_local.backup = false
  end,
})

-- keybinds

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<LocalLeader>l", "20zl", { desc = "scroll right" })
vim.keymap.set("n", "<LocalLeader>h", "20zh", { desc = "scroll left" })

vim.keymap.set("n", "<left>", '<cmd>echo "use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "use j to move!!"<CR>')

vim.keymap.set("n", "<Leader>sh", "<CMD>split<CR>", { desc = "horizontally" })
vim.keymap.set("n", "<Leader>sv", "<CMD>vsplit<CR>", { desc = "vertically" })
vim.keymap.set("n", "<Leader>sc", "<C-w><C-c>", { desc = "close" })
vim.keymap.set("n", "<Leader>ss", "<C-w><C-x>", { desc = "swap" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "focus on left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "focus on right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "focus on lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "focus on upper window" })

vim.keymap.set("n", "<Leader>tn", "<CMD>tabnew<CR>", { desc = "new" })
vim.keymap.set("n", "<Leader>tt", "<CMD>tabnew | terminal<CR>", { desc = "terminal" })
vim.keymap.set("n", "<Leader>tc", "<CMD>close<CR>", { desc = "close" })
vim.keymap.set("n", "<A-h>", "<CMD>tabNext<CR>", { desc = "left" })
vim.keymap.set("n", "<A-l>", "<CMD>tabprevious<CR>", { desc = "right" })

vim.keymap.set("n", "<Leader>mu", vim.pack.update, { desc = "update packages" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "show diagnostic" })

-- plugins

local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ""
    local stdout = result.stdout or ""
    local output = stderr ~= "" and stderr or stdout
    if output == "" then
      output = "No output from build command."
    end
    vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "telescope-fzf-native.nvim" and vim.fn.executable "make" == 1 then
      run_build(name, { "make" }, ev.data.path)
      return
    end

    if name == "LuaSnip" then
      if vim.fn.has "win32" ~= 1 and vim.fn.executable "make" == 1 then
        run_build(name, { "make", "install_jsregexp" }, ev.data.path)
      end
      return
    end

    if name == "nvim-treesitter" then
      if not ev.data.active then
        vim.cmd.packadd "nvim-treesitter"
      end
      vim.cmd "TSUpdate"
      return
    end
  end,
})

local plugins = {
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/echasnovski/mini.nvim",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/saghen/blink.lib",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/NMAC427/guess-indent.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  "https://github.com/stevearc/conform.nvim",
}

if vim.fn.executable "make" == 1 then
  table.insert(plugins, "https://github.com/nvim-telescope/telescope-fzf-native.nvim")
end

vim.pack.add(plugins)

require "plugins.files"
require "plugins.help"
require "plugins.line"
require "plugins.mini"
require "plugins.git"
require "plugins.language"
require "plugins.completion"
require "plugins.workflow"
