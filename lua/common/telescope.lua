local cwd = vim.fn.getcwd(-1, -1)

local builtin = require('telescope.builtin')
local tactions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<Tab>"] = require("telescope.actions").move_selection_previous,
                ["<S-Tab>"] = require("telescope.actions").move_selection_next,
                -- ["<C-p>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_next,
                -- ["<C-n>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_previous,
            },
            -- n = {
            --     ["<c-s>"] = open_in_nvim_tree,
            -- },
        },
    },
}    

vim.keymap.set('n',  '<C-p>', builtin.find_files, {})
vim.keymap.set('n','<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)


