local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = cmp_nvim_lsp.default_capabilities()

local default_servers = { 'pyright', 'ts_ls', 'html', 'cssls', 'lua_ls' }

for _, lsp in ipairs(default_servers) do
    vim.lsp.config(lsp, {
        capabilities = capabilities,
    })
end

vim.lsp.config('clangd', {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
    },
    settings = {
        clangd = {
            Style = "Google",
            UseTabs = "Never",
            IndentWidth = 4,
            BreakBeforeBraces = "Allman",

            AllowShortFunctionsOnASingleLine = "None",
            ColumnLimit = 80,
        },
    },
})

-- Enable LSP servers
vim.lsp.enable(default_servers)
vim.lsp.enable('clangd')


vim.api.nvim_create_user_command('Format', function(opts)
    -- Uses the default behavior, usually sets async = true
    vim.lsp.buf.format()
end, { desc = 'Format code using LSP' })

vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    signs = true,
    update_in_insert = false,
})
