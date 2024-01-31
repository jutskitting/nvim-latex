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

-- Get the buffer number of the current buffer
local bufnr = vim.api.nvim_get_current_buf()

-- Get the name (full path) of the file in the current buffer
local filename = vim.api.nvim_buf_get_name(bufnr)


local function compile_latex()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    vim.cmd('w')
    vim.cmd('belowright 15sp | terminal luatex ' .. filename)
    vim.cmd('wincmd k')
end

vim.api.nvim_set_keymap('n', '<Leader>ww', ':lua compile_latex()<CR>', opt)
