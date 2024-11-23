require("themery").setup({
    themes = {
        {
            name = "rose-pine-moon",
            colorscheme = "rose-pine-moon",
        },
        {
            name = "gruvbox",
            colorscheme = "gruvbox",
        },

    },
})
vim.keymap.set("n", "<leader>m", function()
    local themery = require("themery")
    local currentTheme = themery.getCurrentTheme()
    print(currentTheme);
    print(themery.getAvailableThemes());
    if currentTheme and currentTheme.name == "rose-pine-moon" then
        themery.setThemeByName("gruvbox", true)

    vim.api.nvim_set_hl(1, "Normal", {})
	vim.api.nvim_set_hl(1, "NormalFloat", {})
    else
        themery.setThemeByName("rose-pine-moon", true)

 vim.api.nvim_set_hl(0, "Normal", {})
	vim.api.nvim_set_hl(0, "NormalFloat", {})
    end
end, { noremap = true })
