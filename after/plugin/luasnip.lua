local ls = require("luasnip")
require("luasnip.loaders.from_vscode").load()
require("luasnip.loaders.from_vscode").load({ paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" } })
local s = ls.snippet   -- Функция создания сниппета
local i = ls.insert_node
local t = ls.text_node -- Текстовые узлы
local f = ls.function_node


local snippets = {
 s("rc", {
    t({ "const " }),
    f(function() return vim.fn.expand("%:t:r") end), -- Имя файла как имя компонента
    t({ " = () => {", "  return (", "    <div>", "      " }),
    i(1, "Hello, React!"), -- Курсор появится здесь!
    t({ "", "    </div>", "  );", "};", "", "export default " }),
    f(function() return vim.fn.expand("%:t:r") end),
    t({ ";" }),
    i(0)
  }),}
ls.add_snippets("javascript", snippets)
ls.add_snippets("javascriptreact", snippets)
ls.add_snippets("typescript", snippets)
ls.add_snippets("typescriptreact", snippets)

ls.add_snippets("lua", {
    s("fn", {
        t("function "), i(1, "name"), t("()"),
        t({ "", "    " }), i(2, "body"),
        t({ "", "end" })
    }),
})


vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
