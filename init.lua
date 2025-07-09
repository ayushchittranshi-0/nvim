--for wsl clipboard
-- Check if the MY_VARIABLE environment variable is set to a specific value
if vim.fn.getenv("pc_type") == "personal-ubuntu" then
    -- Apply specific configurations
    vim.o.clipboard = "unnamed"

    vim.g.clipboard = {
        copy = {
            -- ['+'] = { 'wl-copy', '--trim-newline' },
            ['+'] = { 'wl-copy', },
            ['*'] = { 'wl-copy', },
            -- ['*'] = { 'wl-copy', '--trim-newline' },
        },
        paste = {
            ['+'] = { 'wl-paste', '--no-newline' },
            ['*'] = { 'wl-paste', '--no-newline' },
        },
    }

else
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end

--Leader should be set before using it
vim.g.mapleader = ","
local cwd = vim.fn.getcwd(-1, -1)
require("common")

if cwd == '/home/maugham/writer' then
    require("writer")
else 
    require("worker")
end

require("relativePathsCopyPaste")
