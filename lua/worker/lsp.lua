vim.opt.signcolumn = "yes"

---------------------------------------------------------------------------
-- GLOBAL DIAGNOSTIC MAPPINGS
---------------------------------------------------------------------------
vim.keymap.set('n', '<Leader>dd', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next)

---------------------------------------------------------------------------
-- LSP ATTACH (instead of on_attach)
-- This replaces all `on_attach` logic for 0.11+
---------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local bufnr = event.buf
    local opts = { buffer = bufnr, remap = false }

    -- Your keymaps moved here
    vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<space>td', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>ho', vim.lsp.buf.hover, opts)
    vim.keymap.set('i', '<C-b>', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
  end
})

---------------------------------------------------------------------------
-- NEW LSP API (Neovim 0.11+)
-- Replaces all lspconfig.*.setup({})
---------------------------------------------------------------------------

local servers = {
  "eslint",
  "pyright",
  "ts_ls",
  "html",
  "tailwindcss",
  "cssls",
  "cssmodules_ls",
  "somesass_ls",
  "jdtls",
  "docker_compose_language_service",
  "emmet_ls",
  "emmet_language_server",
}

-- Basic configs for all servers
for _, srv in ipairs(servers) do
  vim.lsp.config(srv, {})
end

---------------------------------------------------------------------------
-- SPECIAL CONFIGS (replacing setup({...}))
---------------------------------------------------------------------------

-- Emmet Language Server
vim.lsp.config("emmet_language_server", {
  filetypes = { "css", "ejs", "eruby", "html", "javascript", "javascriptreact",
    "less", "sass", "scss", "pug", "typescriptreact" },
  init_options = {
    includeLanguages = {},
    excludeLanguages = {},
    extensionsPath = {},
    preferences = {},
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = "always",
    showSuggestionsAsSnippets = false,
    syntaxProfiles = {},
    variables = {},
  },
})

-- Emmet LS (second config)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("emmet_ls", {
  capabilities = capabilities,
  filetypes = {
    "css","ejs","eruby","html","javascript","javascriptreact","less","sass","scss",
    "svelte","pug","typescriptreact","vue"
  },
  init_options = {
    html = { options = { ["bem.enabled"] = true } }
  },
})

---------------------------------------------------------------------------
-- Enable all servers
---------------------------------------------------------------------------
vim.lsp.enable(servers)
