return {
	{
		"mfussenegger/nvim-dap-python",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("dap-python").setup("python")
		end,
		keys = {
			{ "<leader>dpt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
			{ "<leader>dpc", function() require('dap-python').test_class() end,  desc = "Debug Class",  ft = "python" },
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		keys = {
			{ "<leader>du", function() require("dapui").toggle() end, desc = "Toggle Debug UI" },
		},
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		requires = { "mfussenegger/nvim-dap" },
	}
}
