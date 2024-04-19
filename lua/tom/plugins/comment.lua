return {
  {
	  "numToStr/Comment.nvim",
	  event = { "BufReadPre", "BufNewFile" },
	  config = true -- runs require ('Comment').setup()
  },
  {
	  "folke/todo-comments.nvim",
	  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  },
	  keys = {
	    {"<leader>tc", "<cmd>TodoComments<cr>", desc = "List all todo comments"},
	    {"<leader>tt", "<cmd>TodoTelescope<cr>", desc = "List all todo comments w/ telescope"},
	    {"<leader>tg", "<cmd>TodoTrouble<cr>", desc = "List all todo comments w/ trouble"},
	    {"<leader>tq", "<cmd>TodoQuickFix<cr>", desc = "List all todo comments w/ quick fix"},
	  }
}}
