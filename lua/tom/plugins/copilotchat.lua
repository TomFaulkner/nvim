return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>Cp", ":CopilotChatPrompts<cr>", desc = "Prompts" },
      { "<leader>CC", ":CopilotChatToggle<cr>", desc = "Toggle Chat" },
      { "<leader>Ca", ":CopilotChatAgents<cr>", desc = "Agents" },
      { "<leader>Cm", ":CopilotChatModels<cr>", desc = "Models" },

      { "<leader>Ct", ":CopilotChatTests<cr>", desc = "Tests" },
      { "<leader>Cd", ":CopilotChatDocs<cr>", desc = "Docs" },
      { "<leader>Ce", ":CopilotChatExplain<cr>", desc = "Explain" },
      { "<leader>Cf", ":CopilotChatFix<cr>", desc = "Fix" },
      { "<leader>Co", ":CopilotChatOptimize<cr>", desc = "Optimize" },
      { "<leader>Cr", ":CopilotChatReview<cr>", desc = "Review" },
      { "<leader>Cc", ":CopilotChatCommit<cr>", desc = "Commit" },

      { "<leader>CS", ":CopilotChatStop<cr>", desc = "Stop!" },
      { "<leader>CR", ":CopilotChatReset<cr>", desc = "Reset" },

      { "<leader>Cs", ":CopilotChatSave <name>", desc = "Save Chat" },
      { "<leader>Cl", ":CopilotChatLoad <name>", desc = "Load Chat" },

    },
  }
}
