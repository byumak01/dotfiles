return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            local telescope = require('telescope')
            telescope.setup({
                defaults = {
                    layout_strategy = "vertical",
                    layout_config = { width = 0.99, height = 0.99, preview_cutoff = 0 },
                    sorting_strategy = "ascending",
                    prompt_prefix = "> ",
                    selection_caret = "  ",
                    borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
                    preview = { hide_on_startup = false },
                    file_ignore_patterns = { "^.git/", "^.idea/" },
                },
                pickers = {
                    find_files = { hidden = true, follow = true, previewer = true },
                    live_grep = { hidden = true },
                    lsp_definitions = { theme = "ivy", previewer = true },
                    lsp_references = {
                        theme = "ivy",
                        previewer = true,
                        layout_strategy = 'vertical',
                        layout_config = {
                            vertical = { width = 0.99, height = 0.99, preview_height = 0.5 },
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
                },
            })
            telescope.load_extension('fzf')
            telescope.load_extension('ui-select')
        end,
    },
}
