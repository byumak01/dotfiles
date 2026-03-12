-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        'git', 'clone', '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Core settings (load before plugins)
require('core.options')

-- Plugins (each file in lua/plugins/ returns a lazy.nvim spec)
require('lazy').setup({ import = 'plugins' }, {
    git = { url_format = "git@github.com:%s.git" },
})

-- Keymaps (load after plugins)
require('core.keymaps')
