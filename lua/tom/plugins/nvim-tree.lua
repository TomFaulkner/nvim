return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require("nvim-tree").setup(
			{
				filters = { custom = { "node_modules", ".git", ".venv" } },
				renderer = { highlight_opened_files = "name", highlight_git = "icon", highlight_modified = "icon" },
				actions = { open_file = { quit_on_open = true } },

			}
		)
	end,
	keys = {
		{ '<leader>nn', ':NvimTreeToggle<CR>',   desc = "Toggle NvimTree" },
		{ '<leader>nf', ':NvimTreeFindFile<CR>', desc = "Find file in NvimTree" },
		{ '<leader>nr', ':NvimTreeRefresh<CR>',  desc = "Refresh NvimTree" },
	},
}
