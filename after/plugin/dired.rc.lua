local status, dired = pcall(require, 'dired')
if (not status) then return end

dired.setup {
    path_separator = "/",
    show_banner = true,
    show_hidden = true
}
