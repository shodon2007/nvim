
vim.g.startify_lists = {
  { type = 'sessions', header = { '   Список сессий' } },
}
vim.g.startify_session_dir = vim.fn.stdpath('data') .. '/sessions'

vim.g.startify_custom_header = {
  '      _   _   _   _   _   _   _',
  '     / \\ / \\ / \\ / \\ / \\ / \\ / \\ ',
  '    ( W | e | l | c | o | m | e )',
  '     \\_/ \\_/ \\_/ \\_/ \\_/ \\_/ \\_/ ',
  '',
  '   Добро пожаловать в Neovim!'
}

vim.g.startify_enable_special = 0
