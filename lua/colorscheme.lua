local status, onedark = pcall(require, 'onedark')
if (not status) then return end
onedark.load()

-- vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

-- 100% transparent lualine
vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")
