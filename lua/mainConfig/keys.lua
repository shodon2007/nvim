Keymap = {
	changeTheme = "n,<leader>m",
}

for name, config in pairs(Keymap) do
    local mode, key = config:match("([^,]+),([^,]+)")  -- Извлекаем режим и клавишу из строки
    Keymap[name] = function(action)
        vim.keymap.set(mode, key, action)
    end
end
