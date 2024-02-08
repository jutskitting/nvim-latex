vim.g.mapleader = " "
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=2
vim.opt.ignorecase = true
vim.o.expandtab = true
vim.o.smartindent=true
vim.o.wrap=true
vim.o.swapfile=false
vim.o.history=500
vim.o.cursorline=true
vim.o.scrolloff=20
vim.o.filetype = "on"
vim.opt.termguicolors = true
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.fdc = "1"
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.updatetime = 2000                        -- faster completion (4000ms default)
vim.opt.foldclose = "all"
vim.opt.foldopen = "all"
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.ruler = true
vim.opt.numberwidth = 1                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "auto"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff =  22                          -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars.eob=""
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,]")
vim.opt.iskeyword:append("-")
vim.wo.number = true
vim.wo.relativenumber = true


-- Ensure 'nvim-lspconfig' is installed
require'lspconfig'.texlab.setup{}
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})
