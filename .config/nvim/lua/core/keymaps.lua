local map = vim.keymap.set

-- Escape: clear multicursors if active, otherwise clear search highlight
map('n', '<Esc>', function()
    local ok, mc = pcall(require, 'multicursor-nvim')
    if ok then
        if not mc.cursorsEnabled() then
            mc.enableCursors()
            return
        elseif mc.hasCursors() then
            mc.clearCursors()
            return
        end
    end
    vim.cmd('nohlsearch')
end)

----------------------------------------------------------------------
-- Helix-style <Space> menu
----------------------------------------------------------------------

-- File/buffer pickers
map('n', '<C-p>', '<cmd>Telescope find_files<CR>', { desc = 'Open file picker' })
map('n', '<C-b>', '<cmd>Telescope buffers<CR>', { desc = 'Open buffer picker' })
map('n', '<C-f>', '<cmd>Telescope live_grep<CR>', { desc = 'Global search' })
map('n', '<C-\'>', '<cmd>Telescope resume<CR>', { desc = 'Resume last picker' })

-- LSP 
map('n', '<leader>s', '<cmd>Telescope lsp_document_symbols<CR>', { desc = 'Document symbols' })
map('n', '<leader>S', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', { desc = 'Workspace symbols' })
map('n', '<leader>r', function() vim.lsp.buf.rename() end, { desc = 'Rename symbol' })
map('n', '<leader>a', function() vim.lsp.buf.code_action() end, { desc = 'Code action' })
map('n', '<leader>k', function() vim.lsp.buf.hover() end, { desc = 'Show docs' })
map('n', 'K', function() vim.lsp.buf.hover() end, { silent = true })

-- Goto 
map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', { desc = 'Goto definition' })
map('n', 'gr', '<cmd>Telescope lsp_references<CR>', { desc = 'Goto references' })
map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', { desc = 'Goto implementation' })
map('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', { desc = 'Goto type definition' })

-- Diagnostics 
map('n', '<leader>d', '<cmd>Telescope diagnostics<CR>', { desc = 'Diagnostics picker' })
map('n', '<leader>D', vim.diagnostic.open_float, { desc = 'Diagnostic float' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Quickfix list' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Clipboard 
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
map('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
map('n', '<leader>P', '"+P', { desc = 'Paste before' })
map('v', '<leader>p', '"+p', { desc = 'Replace with clipboard' })

-- File explorer 
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'File tree (sidebar)'})
map('n', '<C-e>', function() require('oil').open() end, { desc = 'File explorer (dired)' })

-- Aerial (code outline)
map('n', '<leader>o', '<cmd>AerialToggle<CR>', { desc = 'Code outline' })

-- Keybinding help 
map('n', '<leader>?', '<cmd>Telescope keymaps<CR>', { desc = 'Search all keybindings' })

-- Line navigation
map({ 'n', 'v' }, 'gh', '^', { desc = 'Goto beginning of line' })
map({ 'n', 'v' }, 'gl', '$', { desc = 'Goto end of line' })

-- Insert mode navigation
map('i', '<C-a>', '<Home>', { desc = 'Goto beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'Goto end of line' })
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- Tmux navigator
map('n', '<M-h>', '<cmd>TmuxNavigateLeft<CR>', { silent = true })
map('n', '<M-j>', '<cmd>TmuxNavigateDown<CR>', { silent = true })
map('n', '<M-k>', '<cmd>TmuxNavigateUp<CR>', { silent = true })
map('n', '<M-l>', '<cmd>TmuxNavigateRight<CR>', { silent = true })
