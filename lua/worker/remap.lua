
vim.g.airline_powerline_fonts = 1

vim.opt.mouse = ""
vim.opt.colorcolumn = "81"
vim.wo.number = true
vim.wo.relativenumber = true
--Common Keybindings
--Insert blank Line and space before cursor
vim.keymap.set("n","<Leader>o","a<CR><Esc>$")
vim.keymap.set("n","<Leader>nn","o<Esc>")
vim.keymap.set("n","<Leader>b","i<Space><Esc>l" )
--Insert new not full line text below/above from within line in a new line
vim.keymap.set("n","<Leader>p",[[ o<Esc>p==]])
vim.keymap.set("n","<Leader>P",[[ O<Esc>p==]])
--Insert Comment
vim.api.nvim_set_keymap("n" ,"<C-_>" ,"gcc",{ noremap = false, silent = true })
vim.api.nvim_set_keymap("v" ,"<C-_>","gc",{ noremap = false, silent = true })
-- vim.keymap.set("n","<Leader><Space>", "<cmd>call smoothie#do("\<C-D>") <CR>")

-- To center cursor
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

--tmux
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--To copy to clipboard
-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])
-- moving tabs left and right
vim.keymap.set("n","<C-k>","gT")
vim.keymap.set("n","<C-j>","gt")

--move line above and below
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--paste without putting ingto buffer
vim.keymap.set("x", "<leader>p", [["_dP]])


-- Create a key mapping for entering command mode and inserting current file path and then creating file/directory
vim.api.nvim_set_keymap('n', '<Leader>cf', ':e %:h/', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cd', ':!mkdir %:h/', { noremap = true })

