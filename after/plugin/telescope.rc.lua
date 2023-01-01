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
  pickers = {
    find_files = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy"
    },
  },
}

local harpoon_status, harpoon = pcall(require, 'harpoon')
if (harpoon_status) then
  local opts = { noremap = true }
  vim.keymap.set('n', '<leader>am', require('harpoon.mark').add_file, opts)
  vim.keymap.set('n', '<leader>om', require('harpoon.ui').toggle_quick_menu, opts)
  vim.keymap.set('n', '<leader>h', require('harpoon.ui').nav_prev, opts)
  vim.keymap.set('n', '<leader>l', require('harpoon.ui').nav_next, opts)
  telescope.load_extension('harpoon')
end


local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, opts)
