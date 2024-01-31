local opt = { noremap = true }

-- paste improvements
vim.api.nvim_set_keymap('x', '<leader>yy', '"+y', opt)
vim.api.nvim_set_keymap('v', '<leader>yy', '"+y', opt)

vim.api.nvim_set_keymap('x', '<leader>pp', '"+p', opt)
vim.api.nvim_set_keymap('v', '<leader>pp', '"+p', opt)
vim.api.nvim_set_keymap('n', '<leader>pp', '"+p', opt)

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h <CR>', opt)
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j <CR>', opt)
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k <CR>', opt)
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l <CR>', opt)

vim.api.nvim_set_keymap('n', '<Leader>ww', ":w <CR> :belowright 15sp <CR> :terminal echo hello <CR> :wincmd k <CR>", opt)
