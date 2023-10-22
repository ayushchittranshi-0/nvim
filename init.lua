vim.opt.mouse = ""
vim.wo.number = true
vim.wo.relativenumber = true
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
vim.g.mapleader = " "
local cwd = vim.fn.getcwd(-1, -1)
if cwd == '/home/maugham/writer' then
    require("writer")
else 
    require("worker")
end

--Common Keybindings
--use Ctrl - [ to escape from insert mode
vim.keymap.set("i","[[", "<Esc>:w<CR>l")
vim.keymap.set("n","<Leader>[", "<Esc>:w<CR>")
--Insert blank Line and space before cursor
vim.keymap.set("n","<Leader>o","a<CR><Esc>$")
vim.keymap.set("n","<Leader>nn","o<Esc>")
vim.keymap.set("n","<Leader>b","i<Space><Esc>l" )
--Insert new not full line text below/above from within line in a new line
vim.keymap.set("n","<Leader>p",[[ o<Esc>p==]])
vim.keymap.set("n","<Leader>P",[[ O<Esc>p==]])
--Insert Comment
vim.api.nvim_set_keymap("n" ,"<leader><space>" ,"gcc",{ noremap = false, silent = true })
vim.api.nvim_set_keymap("v" ,"<leader><space>" ,"gc",{ noremap = false, silent = true })
-- vim.keymap.set("n","<Leader><Space>", "<cmd>call smoothie#do("\<C-D>") <CR>")

--move line above and below
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--paste without putting ingto buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.g.user_emmet_leader_key = ','

--Common set
vim.keymap.set("n","<leader>fe",vim.cmd.Ex)
vim.opt.guicursor = ""
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd('set nowrap!')
