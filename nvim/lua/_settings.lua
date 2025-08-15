-- General Settings
vim.o.number = true -- Show line numbers
vim.o.mouse = 'a' -- Enable mouse support
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true -- Case-sensitive if uppercase present
vim.o.termguicolors = true -- Enable true colors
vim.cmd([[colorscheme oxocarbon]])

-- Tab Settings
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.shiftwidth = 4 -- Number of spaces per indent level
vim.o.tabstop = 4 -- Number of spaces a tab counts for
vim.o.softtabstop = 4 -- Number of spaces for <Tab> in insert mode

-- UI Settings
vim.o.cursorline = true -- Highlight the current line
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.scrolloff = 8 -- Keep 8 lines visible when scrolling
vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- Window split
-- In init.lua
vim.opt.equalalways = true    -- Always keep windows equal size
vim.opt.eadirection = 'both'  -- Equalize in both directions

-- Performance
vim.o.updatetime = 250 -- Faster updates (affects CursorHold events)
vim.o.timeoutlen = 300 -- Faster key sequences

-- Status line configuration
vim.opt.laststatus = 2

require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      'filename',
      -- Use aerial's built-in lualine component
      {
        'aerial',
        sep = ' > ',  -- Separator between nested symbols
        depth = 1,    -- Only show current function (not nested)
        dense = false, -- Show icon for each symbol
        colored = true, -- Color the icons
      }
    },
    lualine_x = {
      -- LSP clients
      {
        function()
          local clients = vim.lsp.get_active_clients({ bufnr = 0 })
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
      -- Show current working directory
      {
        function()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
        end,
        icon = '📁'
      },
      -- Show word count (useful for writing)
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
      -- Show current time
      {
        function()
          return os.date('%H:%M')
        end
      }
    },
    lualine_z = {'location'}
  },
}

require('aerial').setup({
  backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
  
  -- Enable for more file types
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
  
  -- Better treesitter support
  treesitter = {
    update_delay = 300,
  },
  
  -- Ensure it attaches to buffers
  attach_mode = "window",
  
  -- Better layout
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

