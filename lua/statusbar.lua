local status, lualine = pcall(require, 'lualine')
if (not status) then return end

local function maximize_status()
  return vim.t.maximized and ' ' or ''
end

local function is_harpooned()
  return require('harpoon.mark').status()
end

local layout = {
  lualine_a = {
    {
      "mode",
      separator = { left = "", right = "" },
    },
  },
  lualine_b = {
    {
      "filetype",
      icon_only = true,
      colored = true,
      color = { bg = "", fg = "" },
    },
    {
      "filename",
      color = { bg = "", fg = "#DDE8F3" },
      separator = { left = "", right = "" },
    },
    {
      "branch",
      icon = "",
      color = { fg = "#c296eb" },
      separator = { left = "", right = "" },
    },
    {
      "diff",
      colored = true,
      symbols = {
        added = " ",
        modified = "柳",
        removed = " ",
      },
      separator = { left = "", right = "" },
    },
  },
  lualine_c = {
    {
      "diagnostics",
      sources = { "nvim_lsp" },
      sections = {
        "info",
        "error",
        "warn",
        "hint",
      },
      diagnostic_color = {
        error = { fg = "#e06c75", bg = "#282c34" },
        warn = { fg = "DiagnosticWarn", bg = "#282c34" },
        info = { fg = "DiaganosticInfo", bg = "#282c34" },
        hint = { fg = "#56b6c2", bg = "#282c34" },
      },
      colored = true,
      update_in_insert = true,
      always_visible = false,
      symbols = {
        error = " ",
        warn = " ",
        hint = " ",
        info = " ",
      },
      separator = { left = "", right = "" },
    },
  },
  lualine_x = { maximize_status },
  lualine_y = {
    is_harpooned,
  },
  lualine_z = {
    {
      "encoding",
      color = "StatusLine",
      separator = { left = "", right = "" },
    },
    {
      "filesize",
      color = "StatusLine",
      separator = { left = "", right = "" },
    },
    {
      function()
        return " "
      end,
      separator = { left = "", right = "" },
      color = { bg = "#C296EB" },
    },
    {
      "progress",
      color = "StatusLine",
    },
    {
      function()
        return " "
      end,
      separator = { left = "", right = "" },
      color = { bg = "#e5c07b" },
    },
    {
      "location",
      color = "StatusLine",
    },
    {
      function()
        return " "
      end,
      separator = { left = "", right = "" },
      color = { bg = "#61afef" },
    },
  },
}


local colors = {
  darkgray = "#282c34",
  gray = "#393e48",
  innerbg = nil,
  outerbg = "#282c34",
  normal = "#61afef",
  insert = "#98c379",
  visual = "#d19a66",
  replace = "#e06c75",
  command = "#e6c384",
}

local theme =  {
  inactive = {
    a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
  },
  visual = {
    a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
  },
  replace = {
    a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
  },
  normal = {
    a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
  },
  insert = {
    a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
  },
  command = {
    a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
  },
}

lualine.setup({
  sections = layout,
  options = {
    icons_enabled = true,
    globalstatus = true,
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
    theme = theme,
  },
})
