local curTheme = 1;

local function setTheme(theme, normalBg, normalNcBg)
    vim.cmd.colorscheme(theme)
    vim.api.nvim_set_hl(normalBg, 'Normal', {})
    vim.api.nvim_set_hl(normalNcBg, 'NormalNC', {})
end

Keymap.changeTheme(function()
    if curTheme == 1 then
        setTheme("cyberdream", 0, 0);
        curTheme = 2;
    else
        setTheme("cyberdream", 1, 1);
        curTheme = 1;
    end
end);
