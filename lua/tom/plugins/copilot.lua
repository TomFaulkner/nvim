return {
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true
      },
      panel = { enabled = false },
      filetypes = {
	["*"] = true,
      },
    },
  },


  { 'AndreM222/copilot-lualine' },
}

