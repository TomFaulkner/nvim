return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup (
				{
					highlight = {
						enable = true,
					},
					indent = {
						enable = true,
					},
					incremental_selection = {
						enable = true,
						keymaps = {
							init_selection = "gnn",
							node_incremental = "grn",
							scope_incremental = "grc",
							node_decremental = "grm",
						},
					},
					textobjects = {
						select = {
							enable = true,
							look = true,
							keymaps = {
								["af"] = "@function.outer",
								["if"] = "@function.inner",
								["ac"] = "@class.outer",
								["ic"] = "@class.inner",
							},
						},
						swap = {
							enable = true,
							swap_next = {
								["<leader>a"] = "@parameter.inner",
							},
							swap_previous = {
								["<leader>A"] = "@parameter.inner",
							},
						},
						move = {
							enable = true,
							set_jumps = true,
							goto_next_start = {
								["]m"] = "@function.outer",
								["]]"] = "@class.outer",
							},
							goto_next_end = {
								["]M"] = "@function.outer",
								["]["] = "@class.outer",
							},
							goto_previous_start = {
								["[m"] = "@function.outer",
								["[["] = "@class.outer",
							},
							goto_previous_end = {
								["[M"] = "@function.outer",
								["[]"] = "@class.outer",
							},
						},
					},
				}
			)

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.org = {
          install_info = {
            url = "https://github.com/milisims/tree-sitter-org",
            revision = "main",
            files = { "src/parser.c" },
          },
          -- filetype = "org",
        }

		end,
	},
	{
		  {
			"HiPhish/rainbow-delimiters.nvim",
			dependencies = "nvim-treesitter/nvim-treesitter",
			event = "VeryLazy",
			config = function(_, opts) require "rainbow-delimiters.setup"(opts) end,
		  },
	},
	{
		"nvim-treesitter/nvim-treesitter-refactor",
		config = function()
			require("nvim-treesitter.configs").setup {
				refactor = {
					highlight_definitions = { enable = true },
					smart_rename = {
						enable = true,
						keymaps = {
							-- smart_rename = "grr",
						},
					},
					navigation = {
						enable = true,
						keymaps = {
							-- goto_definition = "grd",
							-- list_definitions = "grD",
							-- list_definitions_toc = "gO",
							-- goto_next_usage = "<a-*>",
							-- goto_previous_usage = "<a-#>",
						},
					},
				},
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
