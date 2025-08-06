vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'Mofiqul/dracula.nvim';
    use({
	    "L3MON4D3/LuaSnip",
	    tag = "v2.*",
	    run = "make install_jsregexp"
    });
    use "rafamadriz/friendly-snippets";
    use { 'dsznajder/vscode-es7-javascript-react-snippets',
        run = 'yarn install --frozen-lockfile && yarn compile'
    }
    use {
        'mhinz/vim-startify',
        config = function()
            vim.g.startify_session_dir = vim.fn.stdpath('data') .. '/sessions'
            vim.g.startify_session_autoload = 1
            vim.g.startify_session_persistence = 1
        end
    }
    use { "scottmckendry/cyberdream.nvim" }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    use "b0o/incline.nvim"
    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp"
    })
    use 'saadparwaiz1/cmp_luasnip'
    use 'wbthomason/packer.nvim'
    use 'zaldih/themery.nvim'
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
    use({ 'neovim/nvim-lspconfig' })
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp' })
    use "terrortylor/nvim-comment"
end)
