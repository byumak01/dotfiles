-- General Settings
vim.o.number = true        -- Show line numbers
vim.o.mouse = 'a'          -- Enable mouse support
vim.o.ignorecase = true    -- Case-insensitive search
vim.o.smartcase = true     -- Case-sensitive if uppercase present
vim.o.termguicolors = true -- Enable true colors
vim.cmd([[colorscheme minimal]])

-- Tab Settings
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.shiftwidth = 4   -- Number of spaces per indent level
vim.o.tabstop = 4      -- Number of spaces a tab counts for
vim.o.softtabstop = 4  -- Number of spaces for <Tab> in insert mode
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- UI Settings
vim.o.cursorline = true  -- Highlight the current line
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.scrolloff = 8      -- Keep 8 lines visible when scrolling
vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Window split
-- In init.lua
vim.opt.equalalways = true   -- Always keep windows equal size
vim.opt.eadirection = 'both' -- Equalize in both directions

-- Performance
vim.o.updatetime = 50 -- Faster updates (affects CursorHold events)
vim.o.timeoutlen = 300 -- Faster key sequences

-- Status line configuration
vim.opt.laststatus = 2

require('lualine').setup {
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            'filename',
            {
                'aerial',
                sep = ' > ',
                depth = 1,
                dense = false,
                colored = true,
            }
        },
        lualine_x = {
            -- LSP clients
            {
                function()
                    local clients = vim.lsp.get_clients({ bufnr = 0 })
                    if #clients == 0 then return '' end

                    local names = {}
                    for _, client in pairs(clients) do
                        table.insert(names, client.name)
                    end
                    return table.concat(names, ',')
                end,
                icon = '',
                color = { fg = '#98be65' }
            },
            {
                function()
                    return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                end,
                icon = '📁'
            },
            {
                function()
                    return tostring(vim.fn.wordcount().words) .. ' words'
                end,
                cond = function()
                    return vim.bo.filetype == 'markdown' or vim.bo.filetype == 'text'
                end
            },
            'encoding', 'fileformat', 'filetype'
        },
        lualine_y = {
            'progress',
            {
                function()
                    return os.date('%H:%M')
                end
            }
        },
        lualine_z = { 'location' }
    },
}

require('aerial').setup({
    backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },

    filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
    },

    treesitter = {
        update_delay = 300,
    },

    attach_mode = "window",

    layout = {
        min_width = 20,
        default_direction = "prefer_right",
    },

    show_guides = true,
    guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
    },
})
