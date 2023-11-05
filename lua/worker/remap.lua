
--Common Keybindings
--use Ctrl - [ to escape from insert mode
vim.keymap.set("i","]]", "<Esc>:w<CR>l")
vim.keymap.set("n","]]", "<Esc>:w<CR>")
vim.keymap.set("i","jj", "<Esc><Right>")
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

-- moving tabs left and right
vim.keymap.set("n","<C-k>","gT")
vim.keymap.set("n","<C-j>","gt")

--move line above and below
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--paste without putting ingto buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.g.user_emmet_leader_key = '\\'

--Common set
vim.keymap.set("n","<leader>fe",vim.cmd.Ex)
vim.keymap.set("i","<C-l>","<Right>")
vim.opt.guicursor = ""
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd('set nowrap!')

-- Define the function to split long lines
function splitLongLines()
    local current_line = vim.fn.line('.')
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    for i, line in ipairs(lines) do
        local line_length = string.len(line)
        if line_length > 165 then
            local last_space = 165
            while last_space > 0 and string.sub(line, last_space, last_space) ~= ' ' do
                last_space = last_space - 1
            end

            if last_space > 0 then
                local first_part = string.sub(line, 1, last_space)
                local second_part = string.sub(line, last_space + 1)

                lines[i] = first_part
                table.insert(lines, i + 1, second_part)
                i = i + 1
            end
        end
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.fn.cursor(current_line, 0)
end
function saveFile()
    vim.cmd(':w')
end
-- Function to run splitLongLines on save
function splitLongLinesOnSave()
    splitLongLines()
end

-- Set autocommand to execute splitLongLinesOnSave on BufWritePost
vim.api.nvim_set_keymap('n', ']]', '<Esc>:lua splitLongLines()<CR>:w<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', ']]', '<Esc>:lua splitLongLines()<CR>:w<Esc>', { noremap = true, silent = true })


-- Create a key mapping for entering command mode and inserting current file path and then creating file/directory
vim.api.nvim_set_keymap('n', '<Leader>cf', ':e %:h/', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cd', ':!mkdir %:h/', { noremap = true })

-- Function to open personalVimWiki in a new tab if not already opened in a tab
function openFileInNewTab(filepath)
    local found_tab = false

    -- Check if the file is already open in a tab
    for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
        local windows = vim.api.nvim_tabpage_list_wins(tabpage)
        for _, win in ipairs(windows) do
            if vim.fn.expand('#'..vim.api.nvim_win_get_buf(win)) == filepath then
                vim.api.nvim_set_current_tabpage(tabpage)
                vim.cmd('buffer ' .. filepath)
                found_tab = true
                break
            end
        end
        if found_tab then
            break
        end
    end

    -- If file not found in any tab, open it in a new tab
    if not found_tab then
        vim.cmd('tabnew ' .. filepath)
    end
end

vim.api.nvim_set_keymap('n', '<leader>ee', ':lua openFileInNewTab("/home/maugham/personalwiki/index.wiki")<CR>', { noremap = true, silent = true })
