vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use {
        "oysandvik94/curl.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        cmd = { "CurlOpen" },
        config = function()
            require("curl").setup()
        end
    }
    use "rafamadriz/friendly-snippets";
    use { 'dsznajder/vscode-es7-javascript-react-snippets',
        run = 'yarn install --frozen-lockfile && yarn compile'
    }
    use({
        "epwalsh/pomo.nvim",
        tag = "*",
        requires = {
            "rcarriga/nvim-notify",
        },
    })
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    use "b0o/incline.nvim"
    use {
        'mhinz/vim-startify',
        config = function()
            vim.g.startify_session_dir = vim.fn.stdpath('data') .. '/sessions'
            vim.g.startify_session_autoload = 1
            vim.g.startify_session_persistence = 1
        end
    }
    use { "scottmckendry/cyberdream.nvim" }
    use 'j-hui/fidget.nvim'
    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp"
    })
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
    })
    use({
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    }
    )
    use "terrortylor/nvim-comment"
end)
