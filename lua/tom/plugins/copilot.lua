return {

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
	python = true,
	lua = true,
        help = true,
      },
    },
  },


  -- copilot cmp source
  {
    "nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp").setup()
          copilot_cmp.setup(opts)
        end,
      },
    },
  },

  {
  "zbirenbaum/copilot-cmp",
  dependencies = "copilot.lua",
  opts = {},
  config = function()
    require("copilot_cmp").setup()
  end
},
}
