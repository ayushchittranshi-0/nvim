-- Harpoon
require('harpoon').setup({
    global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        -- Each branch will have it's own set of marked files
        mark_branch = false,

        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
    }
})

-- Harpoon telescope extension
require('telescope').load_extension('harpoon')



vim.keymap.set('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hh', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })

-- vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

