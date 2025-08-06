-- =====================
-- Mason + LSP Setup
-- =====================
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "emmet_ls" }, -- добавь сюда свои LSP
    automatic_installation = true,
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    local map = vim.keymap.set
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'ge', vim.diagnostic.open_float, opts)
    map('n', 'gq', vim.diagnostic.setloclist, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', 'go', vim.lsp.buf.type_definition, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', 'gs', vim.lsp.buf.signature_help, opts)
    map('n', '<F2>', vim.lsp.buf.rename, opts)
    map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format { async = true } end, opts)
    map('n', '<F4>', vim.lsp.buf.code_action, opts)
end

lspconfig.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 
        "css", 
        "eruby", 
        "html", 
        "javascript", 
        "javascriptreact", 
        "less", 
        "sass", 
        "scss", 
        "svelte", 
        "pug", 
        "typescriptreact", 
        "vue" 
    },
    init_options = {
        html = { options = { ["bem.enabled"] = true } }
    }
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- =====================
-- nvim-cmp + snippets
-- =====================
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-l>'] = cmp.mapping.select_next_item(),
        ['<C-h>'] = cmp.mapping.select_prev_item(),
        ['<C-k>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    formatting = {
        format = require("nvim-highlight-colors").format
    }
})
