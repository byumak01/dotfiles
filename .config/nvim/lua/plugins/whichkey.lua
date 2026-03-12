return {
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        config = function()
            local wk = require('which-key')
            wk.setup({
                delay = 200,
                icons = {
                    mappings = false,
                    separator = "->",
                },
            })

            wk.add({
                { "<leader>w", group = "window" },
                { "<leader>m", group = "multicursor" },

                { "g", group = "goto" },
                { "[", group = "prev" },
                { "]", group = "next" },
            })

        end,
    },
}
