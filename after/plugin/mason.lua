require("mason").setup()
require("mason-lspconfig").setup({
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({
                on_attach = function(client, bufnr)
                    -- Отключаем встроенное форматирование LSP для ts_ls, если это tsserver
                    if server_name == "tsserver" then
                        client.resolved_capabilities.document_formatting = false
                    end
                end,
            })
        end,
        	["ts_ls"] = function()
			require("lspconfig").ts_ls.setup({
				settings = {
					completions = {
						completeFunctionCalls = true,
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

