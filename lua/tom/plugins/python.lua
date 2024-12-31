return {
	{
		"vsedov/py.nvim",
		enabled=false,
		 ft = {"python"},
		 config = function()
			require("py").setup()
		end,
		keys = {
			{
				"<leader>rr",
				"<cmd>PyRun<cr>",
				desc = "Run Python code",
			},
			{
				"<leader>rp",
				"<cmd>PyRunFile<cr>",
				desc = "Run Python file",
			},
			{
				"<leader>rl",
				"<cmd>PyRunLast<cr>",
				desc = "Run last Python code",
			},
			{
				"<leader>rt",
				"<cmd>PyTest<cr>",
				desc = "Run Python tests",
			},
		},
	},

	{
		'rafi/neoconf-venom.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', 'folke/neoconf.nvim' },
	},
}
