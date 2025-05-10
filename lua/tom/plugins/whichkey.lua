return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			defaults = {
			},
		},
		keys = {
			{ "<leader>?", ":WhichKey<CR>", desc = "Open WhichKey" },
		},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local wk = require("which-key")
			wk.add({
				{ "<leader>x", group = "Trouble" },
				{ "<leader>n", group = "NvimTree" },
				{ "<leader>h", group = "Harpoon" },
				{ "<leader>o", group = "Orgmode" },
				{ "<leader>c", group = "Neoconf" },
				{ "<leader>C", group = "Copilot Chat" },
				{ "<leader>d", group = "Neodev" },
				{ "<leader>f", group = "file" },
				{ "<leader>t", group = "todo/terminal" },
				{ "<leader>ft", "<cmd>Telescope toggleterm<CR>", desc = "Find Terminals" },
			})
		end,
	},

	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
	},
	{
		"folke/lazydev.nvim",
	},
}
