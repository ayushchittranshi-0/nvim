-- Custom tabline. Neovim's built-in one runs shorten_dir() on the buffer name,
-- which turns "backend/scripts/embed.go" into "b/s/embed.go". This shows the
-- plain filename instead, adding the parent directory only when two tabs would
-- otherwise look identical.
--
-- Rendered shape:    embed.go 1   terminal 2
--
-- The active tab is a filled accent pill; its number sits on the right.

----------------------------------------------------------------------
-- Colours
----------------------------------------------------------------------

-- onedark "darker" palette, matching ~/.config/nvim/lua/worker/plugins/onedark.lua
local c = {
    bar       = "#1f2329", -- the bar behind everything; re-derived from Normal below
    accent    = "#2b3f55", -- the active tab's fill: a muted blue, not the full accent
    on_accent = "#9fcbf0", -- text on that fill
    accent_no = "#5e8199", -- the active tab's number, dimmed against the fill
    dim       = "#767e8b", -- inactive text
    dimmer    = "#4a505a", -- inactive tab numbers
    mod       = "#e2b86b", -- unsaved marker
    close     = "#e55561",
    crumb_root = "#9fcbf0", -- winbar: the project-root chip
    crumb_dir  = "#79818f", -- winbar: intermediate folders
    crumb_file = "#c9d1e0", -- winbar: the filename itself
    crumb_sep  = "#7d879a", -- winbar: the separators
    crumb_nc   = "#5a616d", -- winbar: everything, unfocused
}

local function set_highlights()
    -- Match the editor background rather than sitting on a darker band, so the
    -- header reads as part of the buffer. Falls back to the literal above if
    -- the colourscheme leaves Normal's background unset (transparent).
    local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
    if normal.bg then
        c.bar = string.format("#%06x", normal.bg)
    end

    local hl = {
        TabLineFill   = { bg = c.bar },
        TabLine       = { fg = c.dim, bg = c.bar },
        TabLineNum    = { fg = c.dimmer, bg = c.bar },
        TabLineMod    = { fg = c.mod, bg = c.bar },
        TabLineSel    = { fg = c.on_accent, bg = c.accent, bold = true },
        TabLineSelNum = { fg = c.accent_no, bg = c.accent, bold = true },
        TabLineSelMod = { fg = c.on_accent, bg = c.accent, bold = true },
        TabLineClose  = { fg = c.close, bg = c.bar },
        -- Rounded chip edges: the chip colour drawn *as text* on the bar.
        TabLineSelEdge = { fg = c.accent, bg = c.bar },
        TabLineDiv     = { fg = "#2f353f", bg = c.bar },
        WinBar        = { fg = c.crumb_dir, bg = c.bar },
        WinBarNC      = { fg = c.crumb_nc, bg = c.bar },
        WinBarRoot    = { fg = c.crumb_root, bg = c.accent, bold = true },
        WinBarDir     = { fg = c.crumb_dir, bg = c.bar },
        WinBarFile    = { fg = c.crumb_file, bg = c.bar, bold = true },
        WinBarSep     = { fg = c.crumb_sep, bg = c.bar },
        WinBarRootEdge = { fg = c.accent, bg = c.bar },
    }
    for group, opts in pairs(hl) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

set_highlights()

-- A :colorscheme runs "hi clear", wiping these groups, so re-assert them after.
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = set_highlights })

-- ...but the startup colorscheme is applied from a non-nested VimEnter autocmd
-- (~/.config/nvim/lua/common/remap.lua:3), and a non-nested autocmd suppresses
-- the ColorScheme event it would otherwise fire. So hook VimEnter too, deferred
-- so it lands after every other VimEnter handler has had its turn.
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function() vim.schedule(set_highlights) end,
})

----------------------------------------------------------------------
-- Labels
----------------------------------------------------------------------

local function tab_buf(tabnr)
    local winnr = vim.fn.tabpagewinnr(tabnr)
    return vim.fn.tabpagebuflist(tabnr)[winnr]
end

-- The name we'd like to show, ignoring collisions with other tabs.
local function base_label(bufnr)
    local name = vim.api.nvim_buf_get_name(bufnr)
    local buftype = vim.bo[bufnr].buftype

    if buftype == "terminal" then
        return "terminal"
    end

    if name == "" then
        if buftype == "quickfix" then return "[Quickfix]" end
        if buftype == "help" then return "[Help]" end
        return "[No Name]"
    end

    if buftype == "help" then
        return "? " .. vim.fn.fnamemodify(name, ":t")
    end

    return vim.fn.fnamemodify(name, ":t")
end

-- Same name, but qualified with its parent directory: "scripts/embed.go".
local function qualified_label(bufnr)
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name == "" or vim.bo[bufnr].buftype ~= "" then
        return base_label(bufnr)
    end
    local parent = vim.fn.fnamemodify(name, ":h:t")
    if parent == "" or parent == "." then
        return base_label(bufnr)
    end
    return parent .. "/" .. vim.fn.fnamemodify(name, ":t")
end

----------------------------------------------------------------------
-- Render
----------------------------------------------------------------------

function _G.MyTabline()
    local total = vim.fn.tabpagenr("$")
    local current = vim.fn.tabpagenr()

    -- First pass: work out which labels collide.
    local labels, seen = {}, {}
    for i = 1, total do
        local label = base_label(tab_buf(i))
        labels[i] = label
        seen[label] = (seen[label] or 0) + 1
    end
    for i = 1, total do
        if seen[labels[i]] > 1 then
            labels[i] = qualified_label(tab_buf(i))
        end
    end

    local out = {}
    local function add(s) table.insert(out, s) end

    -- A leading and a trailing %= split the leftover space evenly, which
    -- centres the tabs; the close button sits after the second one, hard right.
    add("%#TabLineFill#%=")

    -- Powerline half-circles, drawn as text in the chip's own colour so the
    -- active tab reads as a rounded pill sitting on the bar.
    local LEFT_EDGE, RIGHT_EDGE = "\u{E0B6}", "\u{E0B4}"

    for i = 1, total do
        local bufnr = tab_buf(i)
        local active = i == current
        local wins = #vim.fn.tabpagebuflist(i)
        local body = active and "%#TabLineSel#" or "%#TabLine#"

        add("%" .. i .. "T") -- clickable

        if active then
            add("%#TabLineSelEdge#" .. LEFT_EDGE)
            add(body .. labels[i])
        else
            add(body .. " " .. labels[i])
        end

        if wins > 1 then
            add(" (" .. wins .. ")")
        end
        if vim.bo[bufnr].modified then
            add((active and "%#TabLineSelMod#" or "%#TabLineMod#") .. " \u{25CF}")
        end
        add((active and "%#TabLineSelNum#" or "%#TabLineNum#") .. " " .. i .. " ")

        if active then
            add("%#TabLineSelEdge#" .. RIGHT_EDGE)
            add("%#TabLineFill# ")
        elseif i < total then
            add("%#TabLineDiv#\u{2502}") -- a hairline between inactive tabs
        else
            add("%#TabLineFill# ")
        end
    end

    add("%#TabLineFill#%T%=")
    if total > 1 then
        add("%#TabLineClose#%999X ✕ ")
    end

    return table.concat(out)
end

vim.o.tabline = "%!v:lua.MyTabline()"
vim.o.showtabline = 1

----------------------------------------------------------------------
-- Winbar: the path crumb under the tabline
----------------------------------------------------------------------
--
-- 'tabline' is a single row and cannot be made taller, so the second line
-- lives in 'winbar' -- the per-window bar Neovim draws directly beneath it:
--
--     main.go 1
--   ./backend/…/middleware
--
-- Shown only for real files; terminals, help and scratch buffers keep the
-- extra line for their own content.

-- Split a buffer's path into { root, {components...} }, where root is the
-- :pwd basename when the file lives under it ("Asgard"), and nil otherwise.
local function crumb_parts(bufnr)
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name == "" then return nil, {} end

    local rel = vim.fn.fnamemodify(name, ":.")
    if rel ~= name then
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t"), vim.split(rel, "/", { trimempty = true })
    end
    -- Outside :pwd -- show it ~- or /-relative, with no root chip.
    rel = vim.fn.fnamemodify(name, ":~")
    local parts = vim.split(rel, "/", { trimempty = true })
    if rel:sub(1, 1) == "/" and parts[1] then
        parts[1] = "/" .. parts[1] -- keep absolute paths unambiguous
    end
    return nil, parts
end

local SEP = " \u{E0B1} " -- powerline thin chevron: 

-- Drop components from the middle until the crumb fits, leaving one ellipsis
-- behind. The filename and its own parent are always kept.
local function fit(parts, budget)
    local function width()
        local n = 0
        for _, p in ipairs(parts) do n = n + vim.fn.strwidth(p) + 3 end
        return n
    end
    local elided = false
    while width() > budget and #parts > 2 do
        table.remove(parts, elided and 2 or 1)
        if not elided then
            table.insert(parts, 1, "\u{2026}")
            elided = true
        end
    end
    return parts
end

function _G.MyWinbar()
    local winid = vim.g.statusline_winid
    if not winid or not vim.api.nvim_win_is_valid(winid) then
        winid = vim.api.nvim_get_current_win()
    end
    local bufnr = vim.api.nvim_win_get_buf(winid)
    local root, parts = crumb_parts(bufnr)
    if #parts == 0 then return "" end

    -- An unfocused split gets the same crumb, flat and dim.
    if winid ~= vim.api.nvim_get_current_win() then
        return "%=" .. (root and (root .. SEP) or "") .. table.concat(parts, SEP) .. "%="
    end

    local budget = vim.api.nvim_win_get_width(winid) - (root and #root + 6 or 4)
    parts = fit(parts, budget)

    local out = { "%#WinBar#%=" }
    if root then
        table.insert(out, "%#WinBarRootEdge#\u{E0B6}%#WinBarRoot#" .. root .. "%#WinBarRootEdge#\u{E0B4}")
    end
    table.insert(out, "%#WinBarSep#" .. (root and SEP or "  "))
    for i, part in ipairs(parts) do
        local last = i == #parts
        table.insert(out, (last and "%#WinBarFile#" or "%#WinBarDir#") .. part)
        if not last then
            table.insert(out, "%#WinBarSep#" .. SEP)
        end
    end
    table.insert(out, "%#WinBar#%=")
    return table.concat(out)
end

local function apply_winbar()
    local ok = vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) ~= ""
    -- An empty 'winbar' hides the row entirely; a non-empty one always claims
    -- a line, even when the expression evaluates to "".
    vim.wo.winbar = ok and "%!v:lua.MyWinbar()" or ""
end

vim.api.nvim_create_autocmd(
    { "BufWinEnter", "WinEnter", "BufEnter", "TermOpen", "WinNew" },
    { pattern = "*", callback = apply_winbar }
)
