vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'j-hui/fidget.nvim'
    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp"
    })
    use 'rafamadriz/friendly-snippets'
    use 'saadparwaiz1/cmp_luasnip'
    use 'wbthomason/packer.nvim'
    use 'zaldih/themery.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    use 'brenoprata10/nvim-highlight-colors'
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
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jayp0521/mason-null-ls.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })
    use({
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup {
            }
        end,
    })
    use({
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    }
    )
    use "terrortylor/nvim-comment"
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                manual_mode = false,
                detection_methods = { "lsp", "pattern" },
                patterns = { "package.json" },
                ignore_lsp = {},
                exclude_dirs = {},
                show_hidden = false,
                silent_chdir = true,
                scope_chdir = 'global',
                datapath = vim.fn.stdpath("data"),
            }
        end
    }
end)
