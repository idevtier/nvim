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
vim.keymap.set('n', 'sh', ':split<CR><C-w>w', opts)
vim.keymap.set('n', 'sv', ':vsplit<CR><C-w>w', opts)

-- Buffer
vim.keymap.set('n', '<leader>bk', ':bd<CR>', opts)
vim.keymap.set('n', '<leader>bn', ':bn<CR>', opts)
vim.keymap.set('n', '<leader>bp', ':bp<CR>', opts)
vim.keymap.set('n', '<leader>bd', ':<C-U>bprevious <bar> bdelete #<CR>', opts)
vim.keymap.set('n', '<leader>bak', ':%bd<CR>', opts)

-- Paste without yank
vim.keymap.set('x', '<leader>p', '"_dP', opts)

-- Yank to system register
vim.keymap.set('n', '<leader>y', '"+y', opts)
vim.keymap.set('v', '<leader>y', '"+y', opts)
vim.keymap.set('n', '<leader>Y', '"+Y', opts)

-- Delete without yank
vim.keymap.set('n', '<leader>d', '"_d', opts)
vim.keymap.set('v', '<leader>d', '"_d', opts)

-- Files vew
vim.keymap.set('n', '<Space>od', ':Explore<CR>', opts)

-- Yank path to current Buffer
vim.keymap.set('n', '<leader>yf', "call setreg('@+', expand('%'))", opts)

-- Faster file opening with :e
local function expand_buffer_path()
  local path = vim.api.nvim_buf_get_name(0):match '.+/'
  if (not path) then
    return ':e '
  end
  return ':e ' .. path
end

vim.keymap.set('n', '<Space>.', expand_buffer_path())

-- Windows moving
vim.keymap.set('n', '<leader>wc', ':wincmd q<CR>', opts)

-- Move selectd lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

vim.keymap.set('n', 'J', "mzJ`z", opts)

-- Keep cursor in a middle while scrolling
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)

-- Keep cursor in a middle while seaching
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Replace word under cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Chmod replace
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
