-- Ensure that the 'vim-airline' plugin is loaded before setting the theme
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        -- Command to set the Airline theme to Gruvbox
        vim.cmd("AirlineTheme minimalist")

        -- Section C is airline's file path. The winbar
        -- (~/.config/nvim/lua/worker/plugins/tabline.lua) already shows the full
        -- path as a breadcrumb, so drop it here and leave the branch on its own.
        vim.g.airline_section_c = ""
        vim.cmd("AirlineRefresh")
    end,
})

