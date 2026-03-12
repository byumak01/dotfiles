return {
    {
        'hrsh7th/cmp-nvim-lsp',
        config = function()
            -- Apply capabilities to all LSP servers
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config('*', { capabilities = capabilities })

            -- Enable servers (configs come from lsp/ directory)
            vim.lsp.enable({
                'pyright', 'ts_ls', 'html', 'cssls', 'lua_ls', 'clangd',
            })

            -- Format command
            vim.api.nvim_create_user_command('Format', function()
                vim.lsp.buf.format()
            end, { desc = 'Format code using LSP' })

            -- Diagnostic display
            vim.diagnostic.config({
                virtual_text = false,
                underline = true,
                signs = true,
                update_in_insert = false,
            })
        end,
    },
}
