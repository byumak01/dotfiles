require 'nvim-treesitter.config'.setup {
    ensure_installed = { 'python', 'cpp', 'cmake', 'lua', 'yaml', 'json', 'html', 'css', 'javascript' },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}
