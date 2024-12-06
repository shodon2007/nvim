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

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("x", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("x", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>A", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.api.nvim_set_keymap('n', 'g]', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g[', ':tabprevious<CR>', { noremap = true, silent = true })

-- Функция для проверки, является ли окно справа терминалом
local function is_terminal_on_right()
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd l")
    local right_win = vim.api.nvim_get_current_win()

    -- Если справа другое окно, вернем фокус обратно и выйдем
    if current_win == right_win then
        return false
    end

    -- Проверяем, является ли буфер справа терминалом
    local buftype = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(right_win), "buftype")
    if buftype == "terminal" then
        return true
    else
        vim.cmd("wincmd h") -- Возвращаем фокус обратно
        return false
    end
end

-- Функция для запуска Node.js скрипта и открытия консоли справа
local function run_node_and_open_terminal()
    -- Получаем имя текущего файла
    vim.cmd('write')
    local filename = vim.fn.expand("%:p")
    local relative_path = vim.fn.fnamemodify(filename, ":~:.") -- Используем относительный путь от текущей директории


    -- Проверяем, есть ли терминал справа
    if is_terminal_on_right() then
        -- Если есть, отправляем команду в этот терминал
        vim.fn.chansend(vim.b.terminal_job_id, "node " .. relative_path .. "\n")
    else
        -- Если нет, открываем новый терминал справа
        vim.cmd("vsplit | wincmd l | terminal")
        vim.fn.chansend(vim.b.terminal_job_id, "node " .. relative_path .. "\n")
    end
    vim.cmd("wincmd h") -- Возвращаем фокус в левое окно
end

vim.keymap.set("n", "<leader>N", run_node_and_open_terminal, { noremap = true, silent = true })
