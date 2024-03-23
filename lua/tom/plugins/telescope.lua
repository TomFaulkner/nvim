return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "tsakirist/telescope-lazy.nvim",
    tag='0.1.6',
    keys={
      {'<leader>ff', function() require 'telescope.builtin'.find_files() end},
      -- {'<leader>ff', ":Telescope find_files<cr>" },
    },
  }
}

