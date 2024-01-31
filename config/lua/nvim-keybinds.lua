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

require("toggleterm").setup{}

function zath_toggle()
  local file_name = vim.fn.expand('%:t') -- Gets the name of the current file
  file_name = file_name:sub(1, -3)
  local full_command = "zathura " .. file_name .. "pdf"
  zath.cmd = full_command
  zath:toggle()
end

vim.api.nvim_set_keymap('n', '<Leader>ww', ":w <CR> :belowright 15sp <CR> :terminal latexrun '%:t' -O ./ <CR> :wincmd k <CR>", opt)

vim.api.nvim_set_keymap('n', '<Leader>fo', ":w <CR> zath_toggle() <CR>", opt)
