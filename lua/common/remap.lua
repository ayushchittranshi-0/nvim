--WE HAVE DISABLED FORMAT CURRENT LINE FOR NOW. I WILL LOOK INTO IT LATER.
-- Change color scheme to gruvbox
vim.cmd[[autocmd VimEnter * colorscheme gruvbox]]


-- FOR WRITER
function formatCurrentLine()
    -- Get the current line number
    local current_line = vim.fn.line('.')
    
    -- Get the content of the current line
    local line_content = vim.fn.getline(current_line)

    
    -- Replace each space with two spaces
    local formatted_line = line_content:gsub(' ', '  ')


    -- Remove trailing spaces
    formatted_line = formatted_line:gsub('%s+$', '')

    -- Update the current line in the buffer
    vim.fn.setline(current_line, formatted_line)
end


function splitLongLines()
    local current_line = vim.fn.line('.')
    local abs_file_path = vim.fn.expand('%:p') -- Get absolute file path
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    if string.find(abs_file_path, 'maugham') then -- Changed the condition to check if 'maugham' is not found
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
    else
        local line = lines[current_line]

        local line_length = string.len(line)
        if line_length > 165 then
            local last_space = 165
            while last_space > 0 and string.sub(line, last_space, last_space) ~= ' ' do
                last_space = last_space - 1
            end

            if last_space > 0 then
                local first_part = string.sub(line, 1, last_space)
                local second_part = string.sub(line, last_space + 1)

                lines[current_line] = first_part
                table.insert(lines, current_line + 1, second_part)
            end
        end
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.fn.cursor(current_line, 0)
end

function splitLongLinesWriter()
    local current_line = vim.fn.line('.')
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    local line = lines[current_line]
    local line_length = string.len(line:gsub('%s','')) -- Calculate character count excluding spaces

    if line_length > 70 then
        local last_space = 70
        while last_space > 0 and string.sub(line, last_space, last_space) ~= ' ' do
            last_space = last_space - 1
        end

        if last_space > 0 then
            local first_part = string.sub(line, 1, last_space)
            local second_part = string.sub(line, last_space + 1)

            -- Remove spaces at the end of the line
            -- first_part = first_part:gsub('%s+$', '')

            -- Replace each space with two spaces
            first_part = first_part:gsub(' ', '  ')
            lines[current_line] = first_part
            table.insert(lines, current_line + 1, second_part)
        end
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.fn.cursor(current_line, 0)
end

-- ... (the rest of your code)

local cwd = vim.fn.getcwd(-1, -1)
-- Function to run splitLongLines on save
function splitLongLinesOnSave()
    if cwd == '/home/maugham/writer' then
        splitLongLinesWriter()
        formatCurrentLine()
    else 
        -- splitLongLines()
end
end



--Common set keybinding
vim.keymap.set("n","<leader>fe",vim.cmd.Ex)
vim.keymap.set("i","<C-l>","<Right>")
vim.opt.guicursor = ""
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.cmd('set nowrap!')

-- Set autocommand to execute splitLongLinesOnSave on BufWritePost
vim.api.nvim_set_keymap('n', '<Leader>k', ':w<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kk', '<Esc>:w<Esc>', { noremap = true, silent = true })
-- vim.keymap.set("i","kk", "<Esc>:w<CR>l")
-- vim.keymap.set("n","<Leader>k", "<Esc>:w<CR>")
vim.keymap.set("i","jj", "<Esc><Right>")


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


local variableValue = os.getenv("SYSTEM_NAME")

-- Check if the environment variable is set
if variableValue then
    -- Set the keymap to <leader>qq to open the Lua file in a new tab
    vim.api.nvim_set_keymap('n', '<leader>qq', string.format(':lua openFileInNewTab("~/vimwiki/%s/index.md")<CR>', variableValue), { noremap = true, silent = true })
else
    -- print("SYSTEM_NAME is not set. Keymap not configured.")
end

vim.api.nvim_set_keymap('n', '<leader>ee', ':lua openFileInNewTab("~/personalwiki/index.md")<CR>', { noremap = true, silent = true })

-- //vimwiki md format
vim.g.vimwiki_list = {{
    path = '~/vimwiki/',
    syntax = 'markdown',
    ext = '.md'
},{
    path = '~/personalwiki/',
    syntax = 'markdown',
    ext = '.md'
}}


vim.cmd('set nohlsearch')
