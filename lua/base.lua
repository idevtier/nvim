vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.autoindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 7
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false -- No wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
-- vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
vim.opt.winbar = '%=%m %f'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

vim.g.mapleader = " "

function JsSettings()
  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
end

function LuaSettings()
  vim.opt.shiftwidth = 2
  vim.opt.tabstop = 2
end

vim.api.nvim_command [[augroup JsSettings]]
vim.api.nvim_command [[autocmd FileType javascript lua JsSettings()]]
vim.api.nvim_command [[autocmd FileType typescript lua JsSettings()]]
vim.api.nvim_command [[autocmd FileType typescriptreact lua JsSettings()]]
vim.api.nvim_command [[augroup END]]

vim.api.nvim_command [[augroup LuaSettings]]
vim.api.nvim_command [[autocmd FileType lua lua LuaSettings()]]
vim.api.nvim_command [[autocmd FileType lua lua LuaSettings()]]
vim.api.nvim_command [[augroup END]]
