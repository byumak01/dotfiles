require 'nvim-tree'.setup {
    filters = {
        custom = { '.git', 'node_modules', '.cache', '.idea' }
    },
    view = {
        width = 30, -- Set tree width
        side = "left",
        number = false,
        relativenumber = false,
    },
    renderer = {
        indent_markers = {
            enable = true, -- Show indent markers
        },
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            }
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    }
}
