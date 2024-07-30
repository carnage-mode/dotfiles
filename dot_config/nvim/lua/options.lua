--[[

General Configs

--]]

-- disable compatability with old-time vi
vim.opt.compatible = false

-- dont unload buffers when they're abandoned
vim.opt.hidden = true

-- enable spell checker
vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.opt.swapfile = false -- disable swapfile
vim.opt.backup = false
vim.opt.writebackup = false

vim.o.shell = "/usr/bin/env fish"

-- searching behaviour
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Disable mouse click
vim.opt.mouse = ""

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- indentation behavior
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false -- disable line wrapping

-- disable auto comments
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
})

-- highlight whitespace
vim.opt.list = true
vim.opt.listchars = { space = ".", tab = "> " }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- add column on the right
vim.opt.colorcolumn = "80"

-- add column on the left edge to show signs
vim.opt.signcolumn = "yes"

-- time between changes and plugin trigger
vim.opt.updatetime = 100

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- number of lines above and below cursor (prime tip)
vim.opt.scrolloff = 8

vim.g.termguicolors = true

-- disable builtin file manager
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--[[

Key mappings

--]]

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<LocalLeader>l", "20zl", { desc = "Scroll Right" })
vim.keymap.set("n", "<LocalLeader>h", "20zh", { desc = "Scroll Left" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<leader>?", "<CMD>WhichKey<CR>", { desc = "Show keyboard shortcut hints" })

vim.keymap.set("n", "<Leader>sh", "<CMD>split<CR>", { desc = "[H]orizontally" })
vim.keymap.set("n", "<Leader>sv", "<CMD>vsplit<CR>", { desc = "[V]ertically" })
vim.keymap.set("n", "<Leader>sc", "<C-w><C-c>", { desc = "[C]lose" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move Focus To The Left Window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move Focus To The Right Window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move Focus To The Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move Focus To The Upper Window" })
