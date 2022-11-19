local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ['q'] = actions.close,
            }
        }
    },
}

local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Space>ff', builtin.find_files, opts)
vim.keymap.set('n', '<Space>fd', builtin.diagnostics, opts)
vim.keymap.set('n', '<Space>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<Space>fb', builtin.buffers, opts)
vim.keymap.set('n', '<Space>fh', builtin.help_tags, opts)
