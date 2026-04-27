return {
    -- Colorschemes
    { 'nyoom-engineering/oxocarbon.nvim' },
    { 'Mofiqul/vscode.nvim' },
    { 'Mofiqul/dracula.nvim' },

    -- Cursorline
    {
        'ya2s/nvim-cursorline',
        opts = {
            cursorline = { enable = true, timeout = 1000, number = false },
            cursorword = { enable = true, min_length = 3, hl = { underline = true } },
        },
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local colors = {
                bg = '#282c34',
                bg_alt = '#23272f',
                bg_active = '#384150',
                fg = '#e5e9f0',
                fg_dim = '#c0c8d4',
                fg_muted = '#9aa6b8',
            }
            local minimal_theme = {
                normal = {
                    a = { fg = colors.fg, bg = colors.bg_active, gui = 'bold' },
                    b = { fg = colors.fg_dim, bg = colors.bg_alt },
                    c = { fg = colors.fg, bg = colors.bg },
                },
                insert = {
                    a = { fg = colors.fg, bg = colors.bg_active, gui = 'bold' },
                    b = { fg = colors.fg_dim, bg = colors.bg_alt },
                    c = { fg = colors.fg, bg = colors.bg },
                },
                visual = {
                    a = { fg = colors.fg, bg = colors.bg_active, gui = 'bold' },
                    b = { fg = colors.fg_dim, bg = colors.bg_alt },
                    c = { fg = colors.fg, bg = colors.bg },
                },
                replace = {
                    a = { fg = colors.fg, bg = colors.bg_active, gui = 'bold' },
                    b = { fg = colors.fg_dim, bg = colors.bg_alt },
                    c = { fg = colors.fg, bg = colors.bg },
                },
                command = {
                    a = { fg = colors.fg, bg = colors.bg_active, gui = 'bold' },
                    b = { fg = colors.fg_dim, bg = colors.bg_alt },
                    c = { fg = colors.fg, bg = colors.bg },
                },
                inactive = {
                    a = { fg = colors.fg_muted, bg = colors.bg_alt },
                    b = { fg = colors.fg_muted, bg = colors.bg_alt },
                    c = { fg = colors.fg_muted, bg = colors.bg },
                },
            }

            require('lualine').setup {
                options = {
                    theme = minimal_theme,
                    component_separators = '',
                    section_separators = '',
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        'filename',
                        { 'aerial', sep = ' > ', depth = 1, dense = false, colored = true },
                    },
                    lualine_x = {
                        {
                            function()
                                local clients = vim.lsp.get_clients({ bufnr = 0 })
                                if #clients == 0 then return '' end
                                local names = {}
                                for _, c in pairs(clients) do table.insert(names, c.name) end
                                return table.concat(names, ',')
                            end,
                            icon = '',
                            color = { fg = colors.fg_dim },
                        },
                        {
                            function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':t') end,
                            icon = '',
                        },
                        {
                            function() return tostring(vim.fn.wordcount().words) .. ' words' end,
                            cond = function()
                                return vim.bo.filetype == 'markdown' or vim.bo.filetype == 'text'
                            end,
                        },
                        'encoding', 'fileformat', 'filetype',
                    },
                    lualine_y = {
                        'progress',
                        { function() return os.date('%H:%M') end },
                    },
                    lualine_z = { 'location' },
                },
            }
        end,
    },

    -- Code outline
    {
        'stevearc/aerial.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('aerial').setup({
                backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
                filter_kind = {
                    "Class", "Constructor", "Enum", "Function",
                    "Interface", "Module", "Method", "Struct",
                },
                treesitter = { update_delay = 300 },
                attach_mode = "window",
                layout = { min_width = 20, default_direction = "prefer_right" },
                show_guides = true,
                guides = {
                    mid_item = "├─", last_item = "└─",
                    nested_top = "│ ", whitespace = "  ",
                },
            })
        end,
    },
}
