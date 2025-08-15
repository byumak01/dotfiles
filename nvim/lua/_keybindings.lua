vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<C-x>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- System clipboard yank 
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })

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

vim.keymap.set("n", "gd", telescope_lsp_picker("lsp_definitions"), { noremap = true, silent = true })
vim.keymap.set("n", "fr", telescope_lsp_picker("lsp_references"), { noremap = true, silent = true })

