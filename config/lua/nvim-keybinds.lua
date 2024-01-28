local opt = { noremap = true }

-- paste improvements
vim.api.nvim_set_keymap('x', '<leader>yy', '"+y', opt)
vim.api.nvim_set_keymap('v', '<leader>yy', '"+y', opt)

vim.api.nvim_set_keymap('x', '<leader>pp', '"+p', opt)
vim.api.nvim_set_keymap('v', '<leader>pp', '"+p', opt)
vim.api.nvim_set_keymap('n', '<leader>pp', '"+p', opt)

-- Open terminal, run nix run, and switch back to the original window
vim.api.nvim_set_keymap('n', '<Leader>ww', ':w <CR> :belowright 15sp <CR> :terminal nix build <CR> :wincmd k <CR>', opt)
vim.api.nvim_set_keymap('n', '<Leader>wd', ':w <CR> :belowright 15sp <CR> :terminal nix develop <CR> :wincmd k <CR>', opt)

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h <CR>', opt)
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j <CR>', opt)
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k <CR>', opt)
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l <CR>', opt)
