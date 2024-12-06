-- local luasnip = require("luasnip")

local ls = require("luasnip") -- Импортируем LuaSnip
local s = ls.snippet          -- Для создания сниппетов
local t = ls.text_node        -- Для создания текстовых узлов
local i = ls.insert_node      -- Для создания вставляемых узлов
local f = ls.function_node    -- Для создания динамических узлов, которые могут зависеть от других значений


require("luasnip.loaders.from_vscode").lazy_load()
-- Пример создания собственного сниппета
ls.add_snippets("lua", {
    s("fnName", {
     t("function "), i(1, "Name"), t("() {"),
        t({ "", "\t" }), i(2, "// TODO: implement"),
        t({ "", "\tconst " }), f(function(_, snip) print(snip.env) return snip.env.TM_FILENAME or "defaultVar" end, {1}), t(" = "), i(2, "value"), t({ "", "}" }),
        t({ "", "}" }),
    });
})
