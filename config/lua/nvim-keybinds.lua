local opt = { noremap = false }

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

require("toggleterm").setup{}


vim.api.nvim_set_keymap(
    'n', 
    '<Leader>fo', 
    ":w<CR>:belowright 15sp<CR>:terminal zathura '%:t:r.pdf'<CR>:wincmd k<CR>", 
    { noremap = true, silent = true }
)

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",  -- Adjust the pattern to match LaTeX files
    callback = function()
        local filename = vim.fn.expand('%:t') -- Get the filename of the current buffer
        local command = string.format("!latexrun '%s' -O ./", filename)
        vim.cmd(command)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), 'm', true)
    end
})

function InsertByMap(key)
    local snippets = {
        latexMath = {'\\begin{math}', '\\end{math}'},
        latexEquation = {'\\begin{equation}','\\begin{aligned}','\\end{aligned}', '\\end{equation}'},
        latexConjecture = { '\\newtheorem{conj}{Conjecture}', '\\begin{conj}','\\end{conj}'}
        -- Add more snippets here as needed
    }

    if snippets[key] then
        vim.api.nvim_put(snippets[key], 'l', true, false)
    else
        print("No snippet found for key: " .. key)
    end
end

vim.api.nvim_set_keymap('n', '<leader>mm<leader>', ":lua InsertByMap('latexMath') <CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>me<leader>', ":lua InsertByMap('latexEquation') <CR>", opt)
vim.api.nvim_set_keymap('n', '<leader>mc<leader>', ":lua InsertByMap('latexConjecture') <CR>", opt)

