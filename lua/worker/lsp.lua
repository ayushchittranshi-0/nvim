local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)
require'lspconfig'.eslint.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.cssmodules_ls.setup{}

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
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
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
        -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
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

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'buffer'}
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }),
  --- (Optional) Show source name in completion menu
  formatting = cmp_format,
})

--format lsp
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


