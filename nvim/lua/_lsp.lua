local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Enable capabilities for autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Mason Setup
local mason_status, mason = pcall(require, "mason")
if mason_status then
  mason.setup()
end

local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if mason_lsp_status then
  mason_lspconfig.setup {
    ensure_installed = { "pyright", "clangd", "ts_ls", "html", "cssls", "lua_ls" }
  }
end

-- LSP Servers
local servers = { 'pyright', 'clangd', 'ts_ls', 'html', 'cssls', 'lua_ls' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

require('lspconfig').clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
  },
  -- no --std=c++23 here!
})

-- LSP Keybindings
vim.api.nvim_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

vim.diagnostic.config({
    virtual_text = false,  -- No inline error messages
    underline = true,     -- No underlines for errors
    signs = true,          -- Keep signs in the sign column (optional)
    update_in_insert = false,
})

-- Auto-formatting on Save
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
