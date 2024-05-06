-- Ensure that the 'vim-airline' plugin is loaded before setting the theme
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        -- Command to set the Airline theme to Gruvbox
        vim.cmd("AirlineTheme minimalist")
    end,
})

