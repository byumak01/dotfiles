return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup({
                ensure_installed = {
                    'python', 'cpp', 'cmake', 'lua', 'yaml',
                    'json', 'html', 'css', 'javascript', 'typescript',
                },
            })
        end,
    },
}
