require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"emmet_ls", "ts_ls"},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({
                on_attach = function(client, bufnr)
                    if server_name == "ts_ls" then
                        client.resolved_capabilities.document_formatting = false
                    end
                end,
            })
        end,
        ["ts_ls"] = function()
            require("lspconfig").ts_ls.setup({
                root_dir = require 'lspconfig'.util.root_pattern('tsconfig.json', '.git'),
                on_init = function(client)
                    client.config.settings = vim.tbl_deep_extend(
                        "force",
                        client.config.settings,
                        { typescript = { preferences = { importModuleSpecifier = "relative" } } }
                    )
                end,
                settings = {
                    completions = {
                        completeFunctionCalls = true,
                    },
                },
            })
        end,
        ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Указываем, что vim является глобальной переменной
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    },
                },
            })
        end,
        ["emmet_ls"] = function()
            require("lspconfig").emmet_ls.setup({
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "svelte", "pug", "less", "sass" },
                init_options = {
                    html = {
                        options = {
                            ["bem.enabled"] = true,
                        },
                    },
                },
            })
        end,
    },
})

require("mason-null-ls").setup({
    ensure_installed = { "prettier" }, -- Установка Prettier через mason
    automatic_installation = true,
})

-- Настройка null-ls для форматирования с использованием Prettier
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            extra_filetypes = { "json", "html" },
            extra_args = { "--tab-width", "4", "--use-tabs" },
        }),
    },
})

-- Автоформатирование при сохранении файла
vim.cmd [[autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx, lua vim.lsp.buf.format()]]
