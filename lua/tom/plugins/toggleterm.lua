-- File: /home/tom/.config/nvim/lua/tom/plugins/toggleterm.lua
return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<C-\>]],
                direction = "float",
                float_opts = {
                  border = "curved",
                  width = function()
                    return math.floor(vim.o.columns * 0.8)
                  end,
                  height = function()
                    return math.floor(vim.o.lines * 0.7)
                  end,
                },
                shade_terminals = true,
                start_in_insert = true,
                persist_size = true,
            })

            -- Define terminal instances
            local Terminal = require("toggleterm.terminal").Terminal
            local terminals = {
                shell = Terminal:new({ id = 1, display_name = "Shell" }),
                python = Terminal:new({ id = 2, display_name = "Python", cmd = "python3" }),
                build = Terminal:new({ id = 3, display_name = "Build", cmd = "make" }),
            }

            _G.toggle_shell = function() terminals.shell:toggle() end
            _G.toggle_python = function() terminals.python:toggle() end
            _G.toggle_build = function() terminals.build:toggle() end

            -- Load the extension after toggleterm is set up
            require("telescope").load_extension("toggleterm")
        end,
        keys = {
            { "<leader>t1", "<cmd>lua toggle_shell()<CR>", desc = "Shell Terminal" },
            { "<leader>t2", "<cmd>lua toggle_python()<CR>", desc = "Python Terminal" },
            { "<leader>t3", "<cmd>lua toggle_build()<CR>", desc = "Build Terminal" },
            { "<leader>ft", "<cmd>Telescope toggleterm<CR>", desc = "Find Terminals" },
        },
    }
}
