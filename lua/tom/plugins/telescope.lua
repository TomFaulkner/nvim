return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "tsakirist/telescope-lazy.nvim",
		tag = '0.1.6',
		keys = {
			{ '<leader>ff', function() require 'telescope.builtin'.find_files() end,                desc = "Find files" },
			{ '<leader>fg', function() require 'telescope.builtin'.live_grep() end,                 desc = "Grep files" },
			{ '<leader>fb', function() require 'telescope.builtin'.buffers() end,                   desc = "List buffers" },
			{ '<leader>fh', function() require 'telescope.builtin'.help_tags() end,                 desc = "Help tags" },
			{ '<leader>fc', function() require 'telescope.builtin'.commands() end,                  desc = "Commands" },
			{ '<leader>fr', function() require 'telescope.builtin'.registers() end,                 desc = "Registers" },
			{ '<leader>fm', function() require 'telescope.builtin'.marks() end,                     desc = "Marks" },
			{ '<leader>fs', function() require 'telescope.builtin'.spell_suggest() end,             desc = "Spell suggest" },
			{ '<leader>fl', function() require 'telescope.builtin'.current_buffer_fuzzy_find() end, desc = "Current buffer fuzzy find" },
			{ '<leader>fo', function() require 'telescope.builtin'.oldfiles() end,                  desc = "Old files" },
			{ '<leader>fw', function() require 'telescope.builtin'.grep_string() end,               desc = "Grep string" },
			{ '<leader>ft', function() require 'telescope.builtin'.tags() end,                      desc = "Tags" },
			{ '<leader>fq', function() require 'telescope.builtin'.quickfix() end,                  desc = "Quickfix" },
			{ '<leader>fl', function() require 'telescope.builtin'.loclist() end,                   desc = "Loclist" },
			{ '<leader>fd', function() require 'telescope.builtin'.lsp_document_diagnostics() end,  desc = "LSP document diagnostics" },
			{ '<leader>fd', function() require 'telescope.builtin'.lsp_workspace_diagnostics() end, desc = "LSP workspace diagnostics" },
			{ '<leader>fi', function() require 'telescope.builtin'.lsp_implementations() end,       desc = "LSP implementations" },
			{ '<leader>fr', function() require 'telescope.builtin'.lsp_references() end,            desc = "LSP references" },
			{ '<leader>fs', function() require 'telescope.builtin'.lsp_document_symbols() end,      desc = "LSP document symbols" },
		},
	}
}
