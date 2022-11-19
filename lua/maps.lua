local opts = { noremap = true, silent = true }

-- Do not yank with x
vim.keymap.set('n', 'x', '"_x', opts)

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>', opts)
vim.keymap.set('n', '-', '<C-x>', opts)

-- Delete a word backwards
vim.keymap.set('n', 'dw', 'vb"_d', opts)

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

-- New tab
vim.keymap.set('n', 'te', ':tabedit<CR>', opts)

-- Splits
vim.keymap.set('n', 'ss', ':split<CR><C-w>w', opts)
vim.keymap.set('n', 'sv', ':vsplit<CR><C-w>w', opts)

-- Buffer
vim.keymap.set('n', '<Space>bk', ':bd<CR>', opts)
vim.keymap.set('n', '<Space>bn', ':bn<CR>', opts)
vim.keymap.set('n', '<Space>bp', ':bp<CR>', opts)

-- Paste wihtout yank
vim.keymap.set('v', '<Space>p', '"0pdP', opts)

-- Faster file opening with :e
local function expand_buffer_path()
    local path = vim.api.nvim_buf_get_name(0):match '.+/'
    if (not path) then
        return ':e '
    end
    return ':e ' .. path
end

vim.keymap.set('n', '<Space>.', expand_buffer_path())
