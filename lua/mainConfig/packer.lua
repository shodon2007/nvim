-- Загружаем packer.nvim, если он установлен
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer может управлять сам собой
    use 'wbthomason/packer.nvim'
    use 'zaldih/themery.nvim'
use { "ellisonleao/gruvbox.nvim" }

    use 'brenoprata10/nvim-highlight-colors'

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
    use 'jayp0521/mason-null-ls.nvim'     -- Интеграция Mason с null-ls
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
                -- your config goes here
                -- or just leave it empty :)
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

                -- Methods of detecting the root directory. **"lsp"** uses the native neovim
                -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
                -- order matters: if one is not detected, the other is used as fallback. You
                -- can also delete or rearangne the detection methods.
                detection_methods = { "lsp", "pattern" },

                -- All the patterns used to detect root dir, when **"pattern"** is in
                -- detection_methods
                patterns = { "package.json" },

                -- Table of lsp clients to ignore by name
                -- eg: { "efm", ... }
                ignore_lsp = {},

                -- Don't calculate root dir on specific directories
                -- Ex: { "~/.cargo/*", ... }
                exclude_dirs = {},

                -- Show hidden files in telescope
                show_hidden = false,

                -- When set to false, you will get a message when project.nvim changes your
                -- directory.
                silent_chdir = true,

                -- What scope to change the directory, valid options are
                -- * global (default)
                -- * tab
                -- * win
                scope_chdir = 'global',

                -- Path where project.nvim will store the project history for use in
                -- telescope
                datapath = vim.fn.stdpath("data"),
            }
        end
    }
end)
