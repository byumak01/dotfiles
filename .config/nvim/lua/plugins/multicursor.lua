return {
    {
        'jake-stewart/multicursor.nvim',
        config = function()
            local mc = require('multicursor-nvim')
            mc.setup()

            local map = vim.keymap.set

            -- Add cursors above/below (like Helix C-up/C-down via Alt-up/down)
            map({ 'n', 'v' }, '<M-Up>', function() mc.lineAddCursor(-1) end, { desc = 'Add cursor above' })
            map({ 'n', 'v' }, '<M-Down>', function() mc.lineAddCursor(1) end, { desc = 'Add cursor below' })

            -- Add cursor at next/prev match of word or selection (Helix-like * then n/N)
            map({ 'n', 'v' }, '<C-d>', function() mc.matchAddCursor(1) end, { desc = 'Add cursor at next match' })
            map({ 'n', 'v' }, '<C-S-d>', function() mc.matchAddCursor(-1) end, { desc = 'Add cursor at prev match' })

            -- Skip current match and jump to next
            map({ 'n', 'v' }, '<C-s>', function() mc.matchSkipCursor(1) end, { desc = 'Skip match, jump next' })
            map({ 'n', 'v' }, '<C-S-s>', function() mc.matchSkipCursor(-1) end, { desc = 'Skip match, jump prev' })

            -- Select all matches in file (like Helix Alt-s)
            map({ 'n', 'v' }, '<M-s>', mc.matchAllAddCursors, { desc = 'Add cursors at all matches' })

            -- Rotate cursors (cycle through cursor positions)
            map({ 'n', 'v' }, '<M-n>', function() mc.nextCursor() end, { desc = 'Next cursor' })
            map({ 'n', 'v' }, '<M-p>', function() mc.prevCursor() end, { desc = 'Previous cursor' })

            -- Delete current cursor
            map({ 'n', 'v' }, '<M-x>', function() mc.deleteCursor() end, { desc = 'Delete cursor' })

            -- Split selections by regex (like Helix S)
            map('v', 'S', mc.splitCursors, { desc = 'Split selections by regex' })

            -- Align cursor columns
            map('n', '<leader>ma', mc.alignCursors, { desc = 'Align cursors' })

            -- Transpose selections (swap contents between cursors)
            map('v', '<leader>mt', function() mc.transposeCursors(1) end, { desc = 'Transpose selections' })

            -- Append/insert on every line of selection (like Helix)
            map('v', 'I', mc.insertVisual, { desc = 'Insert at start of selections' })
            map('v', 'A', mc.appendVisual, { desc = 'Append at end of selections' })

            -- Customise cursor hl
            local hl = vim.api.nvim_set_hl
            hl(0, "MultiCursorCursor", { link = "Cursor" })
            hl(0, "MultiCursorVisual", { link = "Visual" })
            hl(0, "MultiCursorSign", { link = "SignColumn" })
            hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
            hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
            hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
        end,
    },
}
