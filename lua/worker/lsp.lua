local lsp_zero = require('lsp-zero')

vim.keymap.set('n', '<Leader>dd', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next)

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "<leader>n", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>p", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<space>td', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>ho', vim.lsp.buf.hover, opts)
    vim.keymap.set('i', '<C-b>', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
end)
require'lspconfig'.eslint.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.cssmodules_ls.setup{}
require'lspconfig'.emmet_language_server.setup({
  filetypes = { "css","ejs", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css","ejs", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    preselect = 'none',
    completion = {
        autocomplete = false, -- Disable automatic completion
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    },
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    completion = {
        autocomplete = false, -- Disable automatic completion
    },
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            {
                name = 'cmdline',
                option = {
                    ignore_cmds = { 'Man', '!' }
                }
            }
        })
})
--eslint basic formatting works with this
-- lsp_zero.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ['tsserver'] = {'javascript', 'typescript'},
--   }
-- })

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format()

--for snippets
require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip").filetype_extend("javascript", { "typescriptreact" })

local types = require("cmp.types")

local function deprioritize_snippet(entry1, entry2)
  if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
  if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
end
cmp.setup({
    sources = {
        {name = 'buffer',
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        },
        {name = 'nvim_lsp'},
        {name = 'luasnip'}
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }),
    --- (Optional) Show source name in completion menu
      sorting = {
    priority_weight = 2,
    comparators = {
      deprioritize_snippet,
      -- the rest of the comparators are pretty much the defaults
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.scopes,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
    },
})



--format lsp
require("conform").setup({
    formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettier" } },
        typescript = { { "prettier" } },
        typescriptreact = { { "prettier" } },
        html = { { "prettier" } },
        ejs  = { { "prettier" } },
        javascriptreact  = { { "prettier" } },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
})

vim.api.nvim_create_user_command("Wf", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

vim.api.nvim_set_keymap('n', '<leader>pr', ':Wf<CR>', { noremap = true, silent = true })
--maybe formatting working due to eslint config check later
-- local lsp_zero = require('lsp-zero')

-- lsp_zero.on_attach(function(client, bufnr)
--   lsp_zero.default_keymaps({buffer = bufnr})
--   local opts = {buffer = bufnr}

--   vim.keymap.set({'n', 'x'}, 'gq', function()
--     vim.lsp.buf.format({async = false, timeout_ms = 10000})
--   end, opts)
-- end)













 --OLD MAPPING (NOT NEEDED JUST IN CASE)

 -- local lsp = require("lsp-zero")

 -- lsp.preset("recommended")

 -- lsp.ensure_installed({
 --   'tsserver',
 --   'rust_analyzer',
 -- })

 -- -- Fix Undefined global 'vim'
 -- lsp.nvim_workspace()


 -- local cmp = require('cmp')
 -- local cmp_select = {behavior = cmp.SelectBehavior.Select}
 -- local cmp_mappings = lsp.defaults.cmp_mappings({
 --   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
 --   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
 --   ['<CR>'] = cmp.mapping.confirm({ select = true }),
 --   ["<C-Space>"] = cmp.mapping.complete(),
 -- })

 -- cmp_mappings['<Tab>'] = nil
 -- cmp_mappings['<S-Tab>'] = nil

 -- lsp.setup_nvim_cmp({
 --   mapping = cmp_mappings
 -- })

 -- lsp.set_preferences({
 --     suggest_lsp_servers = false,
 --     sign_icons = {
 --         error = 'E',
 --         warn = 'W',
 --         hint = 'H',
 --         info = 'I'
 --     }
 -- })

 -- lsp.on_attach(function(client, bufnr)
 --   local opts = {buffer = bufnr, remap = false}

 --   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
 --   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
 --   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
 --   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
 --   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
 --   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
 --   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
 --   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
 --   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
 --   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
 -- end)

 -- lsp.setup()

 -- vim.diagnostic.config({
 --     virtual_text = true
 -- })
 -- require('luasnip.loaders.from_vscode').lazy_load()


