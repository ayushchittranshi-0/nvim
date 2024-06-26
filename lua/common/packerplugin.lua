-- Vim configuration settings
vim.cmd('set nocompatible')
vim.cmd('set ignorecase')
vim.cmd('set splitright')
vim.cmd('set splitbelow')
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.filetype.add({ extension = { ejs = "ejs" } })

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself

    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { 
            {'nvim-lua/plenary.nvim'} ,
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-cmdline'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},
            --this is not menmtioned in documentation
            { 'saadparwaiz1/cmp_luasnip' },
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    --  smooth scroll plugin
    use 'psliwka/vim-smoothie'

    use "derektata/lorem.nvim"

    -- for pairing
    use 'cohama/lexima.vim'
    -- for indentation jsx and tsx
    --   use 'maxmellon/vim-jsx-pretty'

    --highlinting and syntax color
    -- can use jsx pretty also
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,} 
    -- use("nvim-treesitter/nvim-treesitter-context")

    --Others
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("tpope/vim-vinegar")
    use 'junegunn/vim-peekaboo'

-- somewhere in your config:
    -- Using Packer
    use 'navarasu/onedark.nvim'
    use 'morhetz/gruvbox'
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    -- use "theprimeagen/harpoon"
    use 'vimwiki/vimwiki'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use("folke/zen-mode.nvim")
    -- use 'preservim/nerdtree'
    -- use 'Xuyuanp/nerdtree-git-plugin'




    --WRITING plugins
    use {'reedes/vim-pencil'} -- Super-powered writing things
    use {'tpope/vim-abolish'} -- Fancy abbreviation replacements
    use {'junegunn/limelight.vim'} -- Highlights only active paragraph
    use {'junegunn/goyo.vim'} -- Full screen writing mode
    use {'reedes/vim-lexical'} -- Better spellcheck mappings
    use {'reedes/vim-litecorrect'} -- Better autocorrections
    use {'reedes/vim-textobj-sentence'} -- Treat sentences as text objects
    use {'reedes/vim-wordy'} -- Weasel words and passive voice

end)



--   old configs
-- use {
-- 'VonHeikemen/lsp-zero.nvim',
-- branch = 'v3.x',
-- requires = {
-- --- Uncomment these if you want to manage LSP servers from neovim
-- -- {'williamboman/mason.nvim'},
-- -- {'williamboman/mason-lspconfig.nvim'},

-- -- LSP Support
-- {'neovim/nvim-lspconfig'},
-- -- Autocompletion
-- {'hrsh7th/nvim-cmp'},
-- {'hrsh7th/cmp-nvim-lsp'},
-- {'L3MON4D3/LuaSnip'},
-- {
-- 'hrsh7th/nvim-cmp',
-- config = function ()
-- require'cmp'.setup {
-- snippet = {
-- expand = function(args)
-- require'luasnip'.lsp_expand(args.body)
-- end
-- },

-- sources = {
-- { name = 'luasnip' },
-- -- more sources
-- },
-- }
-- end
-- },
-- { 'saadparwaiz1/cmp_luasnip' } 
-- }
-- }
