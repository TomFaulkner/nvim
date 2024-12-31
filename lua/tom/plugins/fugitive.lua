return {
  'tpope/vim-fugitive',
  cmd = 'G',
  setup = function()
    vim.g.fugitive_no_maps = 1
  end,
}
