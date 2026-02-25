vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- System clipboard yank
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })

-- System clipboard paste
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard after cursor' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = 'Paste from system clipboard before cursor' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'Replace selection with system clipboard' })

-- AerialToggle
-- Toggle aerial window
vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>AerialToggle<CR>', { noremap = true, silent = true })

-- Navigate to next/previous symbol
vim.api.nvim_set_keymap('n', '<Leader>an', '<cmd>AerialNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ap', '<cmd>AerialPrev<CR>', { noremap = true, silent = true })

-- Open aerial in floating window
vim.api.nvim_set_keymap('n', '<Leader>af', '<cmd>AerialOpen float<CR>', { noremap = true, silent = true })

local function telescope_lsp_picker(picker)
    return function()
        require('telescope.builtin')[picker]({
            jump_type = "never",
            fname_width = 50,
        })
    end
end

-- LSP Keybindings
vim.api.nvim_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

-- Tmux Navigator (normal mode - navigate between nvim splits and tmux panes)
vim.keymap.set('n', '<M-h>', '<cmd>TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<M-j>', '<cmd>TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', '<cmd>TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('n', '<M-l>', '<cmd>TmuxNavigateRight<CR>', { silent = true })
