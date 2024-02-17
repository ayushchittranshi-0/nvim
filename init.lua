--for wsl clipboard
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

--Leader should be set before using it
vim.g.mapleader = ","
local cwd = vim.fn.getcwd(-1, -1)
require("common")

if cwd == '/home/maugham/writer' then
    require("writer")
else 
    require("worker")
end

