-- Leader key (must be set before plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers
vim.o.number = true

-- Mouse
vim.o.mouse = 'a'

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.hlsearch = true

-- Colors
vim.o.termguicolors = true

-- Tabs
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- UI
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.scrolloff = 8

-- Window splits
vim.opt.equalalways = true
vim.opt.eadirection = 'both'

-- Performance
vim.o.updatetime = 50
vim.o.timeoutlen = 300

-- Status line
vim.opt.laststatus = 2

-- Colorscheme
vim.cmd([[colorscheme minimal]])

-- Clipboard
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
