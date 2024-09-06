-- Загружаем packer.nvim, если он установлен
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer может управлять сам собой
    use 'wbthomason/packer.nvim'

    -- Пример установки плагина
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "rose-pine/neovim", as = "rose-pine" }

    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }

    use 'ThePrimeagen/harpoon'

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'

    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })
    use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' })
    use({ 'neovim/nvim-lspconfig' })
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp' })

    use 'jose-elias-alvarez/null-ls.nvim' -- Null-ls для интеграции форматтеров и линтеров
    use 'jayp0521/mason-null-ls.nvim'    -- Интеграция Mason с null-ls
end)
