-- File: /home/tom/.config/nvim/lua/telescope/_extensions/toggleterm.lua
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")

local function get_terminals()
    local terms = require("toggleterm.terminal").get_all()
    local term_list = {}
    for _, term in ipairs(terms) do
        table.insert(term_list, {
            id = term.id,
            name = term.display_name or ("Terminal " .. term.id),
            buf = term.bufnr,
        })
    end
    return term_list
end

local term_previewer = previewers.new_buffer_previewer({
    title = "Terminal Preview",
    define_preview = function(self, entry)
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, vim.api.nvim_buf_get_lines(entry.buf, 0, -1, false))
        vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", "terminal")
    end,
    get_buffer_by_name = function(_, entry)
        return tostring(entry.buf)
    end,
})

local function toggleterm_picker(opts)
    opts = opts or {}
    local terminals = get_terminals()
    if #terminals == 0 then
        vim.notify("No terminals open", vim.log.levels.INFO)
        return
    end

    pickers.new(opts, {
        prompt_title = "Select Terminal",
        finder = finders.new_table({
            results = terminals,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.name,
                    ordinal = entry.name,
                    buf = entry.buf,
                }
            end,
        }),
        sorter = conf.generic_sorter(opts),
        previewer = term_previewer,
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                require("toggleterm.terminal").get(selection.value.id):open()
            end)
            return true
        end,
    }):find()
end

-- Telescope expects the extension to return a table with the picker function
return require("telescope").register_extension({
    exports = {
        toggleterm = toggleterm_picker,
    },
})
