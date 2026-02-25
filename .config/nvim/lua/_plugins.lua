local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
        -- Core Features
        {
            'stevearc/aerial.nvim',
            dependencies = {
                'nvim-treesitter/nvim-treesitter',
                'nvim-tree/nvim-web-devicons'
            }
        },
        { 'nyoom-engineering/oxocarbon.nvim' },
        {
            'ya2s/nvim-cursorline',
            opts = {
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                },
            },
        },
        { 'Mofiqul/vscode.nvim' },
        { 'lewis6991/gitsigns.nvim' },                                                          -- Git signs
        { 'hrsh7th/nvim-cmp' },                                                                 -- Autocompletion
        { 'hrsh7th/cmp-nvim-lsp' },                                                             -- LSP completion source
        { 'L3MON4D3/LuaSnip' },                                                                 -- Snippet support
        { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },                    -- Syntax highlighting
        { 'nvim-tree/nvim-tree.lua',                  dependencies = 'nvim-tree/nvim-web-devicons' }, -- File explorer
        { 'nvim-telescope/telescope.nvim',            dependencies = { 'nvim-lua/plenary.nvim' } }, -- Fuzzy search
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-ui-select.nvim' },                                          -- Better UI for Telescope LSP
        { 'nvim-lualine/lualine.nvim' },                                                        -- Status line
        { "Mofiqul/dracula.nvim" },
        {
            'christoomey/vim-tmux-navigator',
            lazy = false,
        },

    },
    {
        git = {
            url_format = "git@github.com:%s.git"
        }
    }
)
