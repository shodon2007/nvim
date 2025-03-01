vim.g.mapleader = " "

vim.keymap.set("n", "<leader>c", ":term<CR>")
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("x", "<leader>Y", "\"+Y")
vim.keymap.set('n', '<leader>pc', '\"+p')
vim.keymap.set('x', '<leader>pc', '\"+p')

vim.keymap.set("n", "f/", ":split<Return>")
vim.keymap.set("n", "f;", ":vsplit<Return>")
vim.keymap.set("n", "fu", "<C-w><C-w>")
vim.keymap.set("n", "fh", "<C-w>h")
vim.keymap.set("n", "fj", "<C-w>j")
vim.keymap.set("n", "fk", "<C-w>k")
vim.keymap.set("n", "fl", "<C-w>l")
vim.keymap.set("n", "f.", "5<C-w>>")
vim.keymap.set("n", "f,", "5<C-w><")
vim.keymap.set("n", "f=", "5<C-w>")
vim.keymap.set("n", "f-", "5<C-w>-")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("n", "-", ":noh<CR>")
vim.keymap.set("n", "=", "gg<S-v>G")
vim.keymap.set("n", "fs", ":w<CR>")
vim.keymap.set("n", "ff", ":Ex<CR>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>A", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set('n', 'g]', ':tabnext<CR>')
vim.keymap.set('n', 'g[', ':tabprevious<CR>')
vim.api.nvim_set_keymap('n', '<leader>m', '`', { noremap = true, silent = true })
