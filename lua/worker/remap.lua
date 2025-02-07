-- Making powerline fonts work in vim.
vim.g.airline_powerline_fonts = 1

-- Disabling mouse in vim.
vim.opt.mouse = ""

-- Google coding guide recommends length of a line to be a maximum of 80 
-- characters hence this line below to give the user a visual indicator of when
-- to break lines. Follow this unless syntax does not allow it. For markdown 
-- the recommended line length is the same and for prose in my cursory research,
-- the recommended line length seems to be 45 to 75 characters. For now, I will
-- let this config slide.
vim.opt.colorcolumn = "81"

vim.wo.number = true
vim.wo.relativenumber = true

--Insert blank Line and space before cursor
vim.keymap.set("n","<Leader>0","a<CR><Esc>$")
vim.keymap.set("n","<Leader>9","o<Esc>k$")
vim.keymap.set("n","<Leader>8","i<Space><Esc>l" )

--Insert new not full line text below/above from within line in a new line
vim.keymap.set("n","<Leader>pa",[[ o<Esc>p==]])
vim.keymap.set("n","<Leader>pb",[[ O<Esc>p==]])

--Insert Comment
vim.api.nvim_set_keymap("n" ,"<C-_>" ,"gcc",{ noremap = false, silent = true })
vim.api.nvim_set_keymap("v" ,"<C-_>","gc",{ noremap = false, silent = true })

-- Go to last file with backspace
-- vim.api.nvim_set_keymap('n', '<BS>', ':b#<CR>', { noremap = true, silent = true })
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

vim.keymap.set({"n", "v"}, "<leader>v", [["+p]])
vim.keymap.set("n", "<leader>V", [["+P]])
-- moving tabs left and right
vim.keymap.set("n","<C-k>","gT")
vim.keymap.set("n","<C-j>","gt")
vim.api.nvim_set_keymap('n', '<C-S>', ':update<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<C-S>', '<C-C>:update<CR>', { silent = true })
vim.api.nvim_set_keymap('i', '<C-S>', '<C-O>:update<CR>', { silent = true })

--move line above and below
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--paste without putting into buffer
vim.keymap.set("x", "<leader>r", [["_dP]])

-- Create a key mapping for entering command mode and inserting current file path and then creating file/directory
vim.api.nvim_set_keymap('n', '<Leader>cf', ':e %:h/', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cd', ':!mkdir %:h/', { noremap = true })

