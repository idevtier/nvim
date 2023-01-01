local status, printer = pcall(require, 'printer')
if (not status) then return end

printer.setup({
  keymap = 'gp',
})
