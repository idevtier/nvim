function NetrwMappings()
  vim.cmd('nmap <buffer> l <CR>')
  vim.cmd('nmap <buffer> h -')
  vim.cmd('nmap <buffer> <silent> c %:w<CR>:bp<CR>')
  vim.cmd('nnoremap <buffer> <silent> Q :bd<CR>')
end

vim.g.netrw_banner = 0

vim.api.nvim_command [[augroup NetrwMappings]]
vim.api.nvim_command [[autocmd filetype netrw lua NetrwMappings()]]
vim.api.nvim_command [[augroup END]]
