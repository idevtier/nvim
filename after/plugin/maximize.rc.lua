local status, maximize = pcall(require, 'maximize')
if (not status) then return end

maximize.setup()

vim.keymap.set('n', '<C-w>m', "<Cmd>lua require('maximize').toggle()<CR>")
