-- Copy current file path
-- Function to copy relative file path with a leading slash to clipboard
local function copy_relative_file_path_with_slash()
  local relative_path = '/' .. vim.fn.expand('%')
  vim.fn.setreg('+', relative_path)
  print("Copied: " .. relative_path)
end

-- Create a user command that calls the function
vim.api.nvim_create_user_command("CopyRelPath", function()
  copy_relative_file_path_with_slash()
end, {})
vim.api.nvim_set_keymap('n', '<leader>yf', ':CopyRelPath<CR>', { noremap = true, silent = true })

function getRelativePath(fromPath, toPath)
    -- Split paths into components
    local function splitPath(path)
        local parts = {}
        for part in path:gmatch("[^/]+") do
            table.insert(parts, part)
        end
        return parts
    end

    -- Find common prefix length
    local function getCommonPrefixLength(path1Parts, path2Parts)
        local i = 1
        while i <= #path1Parts and i <= #path2Parts and path1Parts[i] == path2Parts[i] do
            i = i + 1
        end
        return i - 1
    end

    -- Convert absolute paths to tables of components
    local fromParts = splitPath(fromPath)
    local toParts = splitPath(toPath)

    -- Get the common prefix length
    local commonLength = getCommonPrefixLength(fromParts, toParts)

    -- Build the relative path
    local relativePath = {}
    
    -- Add "../" for each level we need to go up
    for i = commonLength + 1, #fromParts - 1 do
        table.insert(relativePath, "..")
    end

    -- Add the remaining path components
    for i = commonLength + 1, #toParts do
        table.insert(relativePath, toParts[i])
    end

    -- If the paths are identical, return "."
    if #relativePath == 0 then
        return "."
    end

    -- Join the components with "/"
    return table.concat(relativePath, "/")
end

local function get_buffer_filepaths_and_copy_to_register()
  -- Get the current buffer file path
  local current_filepath = vim.fn.expand('%:p')
  if current_filepath == "" then
    vim.notify("Current buffer has no valid file path", vim.log.levels.WARN)
    return nil, nil
  end

  -- Get the previous buffer number
  local prev_buf = vim.fn.bufnr('#')
  if prev_buf <= 0 then
    vim.notify("No previous buffer found", vim.log.levels.WARN)
    return current_filepath, nil
  end

  -- Get the previous buffer file path
  local prev_filepath = vim.fn.fnamemodify(vim.fn.bufname(prev_buf), ':p')
  if prev_filepath == "" then
    vim.notify("Previous buffer has no valid file path", vim.log.levels.WARN)
    return current_filepath, nil
  end

  -- Get the relative path from the current file to the previous file
  local relative_path = getRelativePath(current_filepath, prev_filepath)

  -- Copy the relative path to the default register (unnamed register)
  vim.fn.setreg('"', relative_path)

  -- Return both file paths
  return current_filepath, prev_filepath
end

-- Example usage
local function executeCopyRelativePath()
  local current, previous = get_buffer_filepaths_and_copy_to_register()
  if current then
    print("Current file: " .. current)
  end
  if previous then
    print("Previous file: " .. previous)
  end
  print("Relative path copied to register: " .. vim.fn.getreg('"'))
end

-- You can add this as a command to test
vim.api.nvim_create_user_command("ShowBuffersAndCopyRelativePath", function()
  executeCopyRelativePath()
end, {})

vim.api.nvim_set_keymap('n', '<leader>yf', ':ShowBuffersAndCopyRelativePath<CR>', { noremap = true, silent = true })
