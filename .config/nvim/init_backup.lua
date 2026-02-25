-- Ensure lazy.nvim (plugin manager) is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'nyoom-engineering/oxocarbon.nvim'},
  { 'neovim/nvim-lspconfig' },  -- LSP configurations
  { 'morhetz/gruvbox'},         -- Gruvbox theme
  { 'hrsh7th/nvim-cmp' },       -- Autocompletion
  { 'hrsh7th/cmp-nvim-lsp' },   -- LSP completion source
  { 'L3MON4D3/LuaSnip' },       -- Snippet support
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }, -- Syntax highlighting
  { 'nvim-tree/nvim-tree.lua', dependencies = 'nvim-tree/nvim-web-devicons' }, -- File explorer
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }, -- Fuzzy search
  { 'nvim-telescope/telescope-ui-select.nvim' }, -- Better UI for Telescope LSP
  { 'nvim-lualine/lualine.nvim' }, -- Status line
  { 'EdenEast/nightfox.nvim' } -- Theme
})

-- Basic Settings
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbers
vim.o.mouse = 'a' -- Enable mouse support
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true -- Case-sensitive if uppercase present
vim.o.termguicolors = true -- Better color support
vim.cmd([[colorscheme gruvbox]]) -- Set nightfox theme

-- Tab settings
vim.o.expandtab = true    -- Convert tabs to spaces
vim.o.shiftwidth = 4      -- Number of spaces for each indent level
vim.o.tabstop = 4         -- Number of spaces a tab counts for
vim.o.softtabstop = 4     -- Number of spaces for <Tab> in insert mode

-- 🟢 Telescope Configuration (Bigger Window & LSP Preview)
require('telescope').setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.9,  -- 90% of the editor width
      height = 0.8, -- 80% of the editor height
      preview_cutoff = 120,
    },
    sorting_strategy = "ascending",
    prompt_prefix = "🔍 ",
    selection_caret = "➜ ",
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    preview = {
      hide_on_startup = false, -- Ensure preview is shown
    },
  },
  pickers = {
    lsp_definitions = { theme = "ivy", previewer = true },
    lsp_references = { theme = "ivy", previewer = true },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}
require('telescope').load_extension('ui-select')

local function telescope_lsp_picker(picker)
  return function()
    require('telescope.builtin')[picker]({
      jump_type = "never", -- Prevents jumping to the first result
      fname_width = 50,    -- Adjusts file name width
    })
  end
end

-- 🟢 Keybindings (LSP Preview Instead of Jump)
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Toggle file explorer
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true }) -- Find files
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true }) -- Search project
vim.api.nvim_set_keymap('n', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true }) -- Rename symbol
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true }) -- Show type info
vim.keymap.set("n", "gd", telescope_lsp_picker("lsp_definitions"), { noremap = true, silent = true })
vim.keymap.set("n", "fr", telescope_lsp_picker("lsp_references"), { noremap = true, silent = true })


-- 🟢 LSP Setup
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{} -- Python LSP
lspconfig.clangd.setup{ -- C/C++ LSP
}

-- Treesitter (Better Syntax Highlighting)
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'python', 'cpp', 'cmake', 'lua', 'yaml', 'json' },
  highlight = { enable = true },
}

-- Explorer Setup
require'nvim-tree'.setup {
  filters = { custom = { '.git', 'node_modules', '.cache', '.code', '.idea' } },
}

-- 🟢 Autocomplete Setup
local cmp = require'cmp'
cmp.setup {
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
  }
}

