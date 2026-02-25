require('telescope').load_extension('fzf')
require('telescope').setup {
    defaults = {
        layout_strategy = "vertical",
        layout_config = {
            width = 0.99,
            height = 0.99,
            preview_cutoff = 0,
        },
        sorting_strategy = "ascending",
        prompt_prefix = "🔍 ",
        selection_caret = "➜ ",
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        preview = {
            hide_on_startup = false,
        },
        file_ignore_patterns = {
            "^.git/",  -- Ignore .git directory
            --      "^.vscode/", -- Ignore .vscode directory
            "^.idea/", -- Ignore .idea directory
        },
    },
    pickers = {
        find_files = {
            hidden = true,    -- Show hidden files
            follow = true,    -- Follow symbolic links
            previewer = true, -- Enable file preview
        },
        live_grep = {
            hidden = true, -- Show hidden files
        },
        lsp_definitions = { theme = "ivy", previewer = true },
        lsp_references = { theme = "ivy", previewer = true,
            layout_strategy = 'vertical',
            layout_config = {
                vertical = {
                    width = 0.99,
                    height = 0.99,
                    preview_height = 0.5,
                },
            },
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    }
}

require('telescope').load_extension('ui-select')
