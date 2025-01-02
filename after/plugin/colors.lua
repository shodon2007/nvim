local curTheme = 1;

local function setTheme(theme, normalBg, normalNcBg)
    vim.cmd.colorscheme(theme)
    vim.api.nvim_set_hl(normalBg, 'Normal', {})
    vim.api.nvim_set_hl(normalNcBg, 'NormalNC', {})
    vim.api.nvim_set_hl(normalBg, 'InclineNormal', {})
    vim.api.nvim_set_hl(normalNcBg, 'InclineNormalNC', {})
    vim.api.nvim_set_hl(normalBg, 'StatusLine', { bg = 'NONE' })
    vim.api.nvim_set_hl(normalNcBg, 'StatusLineNC', { bg = 'NONE' })
end
Keymap.changeTheme(function()
    if curTheme == 1 then
require("cyberdream").setup({transparent= true})
        setTheme("cyberdream", 0, 0);
        curTheme = 2;
    else

        require("cyberdream").setup({transparent= false})
        setTheme("cyberdream", 1, 1);
        curTheme = 1;
    end
end);
setTheme("cyberdream", 1, 1);
