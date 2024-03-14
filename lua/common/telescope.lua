local cwd = vim.fn.getcwd(-1, -1)

local builtin = require('telescope.builtin')
local tactions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                -- ["<Tab>"] = require("telescope.actions").move_selection_previous,
                -- ["<S-Tab>"] = require("telescope.actions").move_selection_next,
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

local pc_type = os.getenv("pc_type")
-- Lua function to search in the parent directory of the current file using Telescope
function TelescopeSearchParent()
    if pc_type == 'personal' then
        require('telescope.builtin').find_files({ cwd = "/mnt/c/Users/Ayush/Notes Personal"})
    else 
        require('telescope.builtin').find_files({ cwd = "/mnt/c/Users/Ayush/Notes Personal"})
    end
end

-- Lua function to search for a string in the parent directory of the current file using Telescope
function TelescopeGrepParent()
    if pc_type == 'personal' then
        require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > "), cwd =  "/mnt/c/Users/Ayush/Notes Personal" })
    else
        require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > "), cwd =  "/mnt/c/Users/Ayush/Notes Personal" })
    end
end

-- sp search file
vim.api.nvim_set_keymap('n', '<Leader>sf', '<cmd>lua TelescopeSearchParent()<CR>', { noremap = true, silent = true })
-- sg search grep
vim.api.nvim_set_keymap('n', '<Leader>sg', '<cmd>lua TelescopeGrepParent()<CR>', { noremap = true, silent = true })
