local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', opts)

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
