function SearchAndReplaceMultipleRanges()
    -- Prompt for search text
    vim.ui.input({ prompt = 'Enter text to search: ' }, function(search_text)
        if search_text == nil or search_text == '' then
            print('Search cancelled.')
            return
        end

        -- Prompt for replace text
        vim.ui.input({ prompt = 'Enter replacement text: ' }, function(replace_text)
            if replace_text == nil then
                print('Replacement cancelled.')
                return
            end

            -- Prompt for multiple ranges, default to whole file
            vim.ui.input({ prompt = "Enter line ranges (e.g., 10,20 30,40) or leave empty for whole file: " },
                function(range_input)
                    if range_input == nil then
                        print('Operation cancelled.')
                        return
                    end

                    -- Prompt for replace mode: confirm each or replace all
                    vim.ui.select({ 'Confirm each', 'Replace all' }, { prompt = 'Choose replace mode:' },
                        function(choice)
                            if choice == nil then
                                print('Operation cancelled.')
                                return
                            end

                            local flag = ''
                            if choice == 'Confirm each' then
                                flag = 'c'
                            elseif choice == 'Replace all' then
                                flag = 'g'
                            end

                            -- If range input is empty, default to whole file
                            if range_input == '' then
                                range_input = '%'
                            end

                            -- Function to escape search/replace text
                            local function esc(text)
                                return vim.fn.escape(text, '/\\')
                            end

                            -- Split ranges by space
                            local ranges = {}
                            if range_input == '%' then
                                table.insert(ranges, '%')
                            else
                                for range in string.gmatch(range_input, '([^%s]+)') do
                                    table.insert(ranges, range)
                                end
                            end

                            -- Execute substitute command for each range
                            for _, range in ipairs(ranges) do
                                local cmd = string.format("%ss/%s/%s/%s", range, esc(search_text), esc(replace_text),
                                    flag)
                                vim.cmd(cmd)
                            end
                        end)
                end)
        end)
    end)
end

-- Keymap to call the function
vim.api.nvim_set_keymap('n', '<leader>sr', ':lua SearchAndReplaceMultipleRanges()<CR>', { noremap = true, silent = true })
