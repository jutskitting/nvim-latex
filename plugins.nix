# plugins.nix
{ pkgs }:
with pkgs.vimPlugins; [
  telescope-nvim
  toggleterm-nvim
  awesome-vim-colorschemes
  comment-nvim
  nvim-tree-lua
  nvim-lspconfig
  luasnip
  nvim-cmp
  vimtex
]
