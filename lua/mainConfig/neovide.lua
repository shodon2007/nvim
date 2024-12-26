if vim.g.neovide then
    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
