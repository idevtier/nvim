-- Abvailable themes: onedark, oxocarbon

local status, n = pcall(require, 'onedark')
if (not status) then return end
n.load()

-- vim.cmd('colorscheme oxocarbon')
