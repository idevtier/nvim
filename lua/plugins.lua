local status, packer = pcall(require, 'packer')
if not status then return end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- UI
  use 'navarasu/onedark.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
  } -- Status bar
  use 'norcalli/nvim-colorizer.lua' -- Adds colors to HEX
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- AST highlight

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'onsails/lspkind-nvim' -- vscode-like pictograms in completion

  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' } -- List errors, wornings etc.

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  -- Completion
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'L3MON4D3/LuaSnip' -- Snippets

  -- Search navigation
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = 'nvim-lua/plenary.nvim' } -- Fuzzy finder
  use { 'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' } -- Mark buffers and jumps between them
  use { 'idevtier/netrw_ext.vim', requires = 'ryanoasis/vim-devicons' } -- My own fork of netrw with icons

  -- Markdown setup
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })

  -- Wiki
  use { 'renerocksai/telekasten.nvim', requires = 'renerocksai/calendar-vim' } -- Note taking plugin

  -- Utils
  use 'rareitems/printer.nvim' -- Faster debug print statements
  use 'windwp/nvim-autopairs' -- Automatically closes brackets
  use 'tpope/vim-commentary' -- Faster comments with gc & gcc
  use 'junegunn/vim-easy-align' -- Align markdown tables and other things
  use 'mbbill/undotree' -- Use undo after reopening buffer and search with tree like structure
  use 'declancm/maximize.nvim' -- Maximaze pane like in tmux
  use 'christoomey/vim-tmux-navigator' -- Move between panes like in tmux
end)
