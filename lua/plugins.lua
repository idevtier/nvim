local status, packer = pcall(require, 'packer')
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Themes
    use 'navarasu/onedark.nvim'
    use { 'shaunsingh/oxocarbon.nvim', run = './install.sh' }
    -- end themes

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'neovim/nvim-lspconfig' -- LSP
    use 'glepnir/lspsaga.nvim' -- LSP UIs
    use 'onsails/lspkind-nvim' -- vscode-like pictograms in completion
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'L3MON4D3/LuaSnip' -- Snippets
    use 'windwp/nvim-autopairs'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'norcalli/nvim-colorizer.lua'
    use 'tpope/vim-commentary' -- Faster comments with gc & gcc
end)
