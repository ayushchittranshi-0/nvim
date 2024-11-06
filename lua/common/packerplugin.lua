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
    use {"williamboman/mason.nvim"}

    -- for smooth scrolling
    use 'psliwka/vim-smoothie'

    -- for lorem epsum
    use "derektata/lorem.nvim"

    -- for pairing
    use 'cohama/lexima.vim'

    -- tree sitter for linting highlights
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,} 
    -- use("nvim-treesitter/nvim-treesitter-context")

    --Others useful plugins not explored
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("tpope/vim-vinegar")
    use 'junegunn/vim-peekaboo'
    -- use "theprimeagen/harpoon"

    -- themes
    use 'navarasu/onedark.nvim'
    use 'morhetz/gruvbox'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- for prettier setup
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })

    -- for surround syntax 
    use 'tpope/vim-surround'

    -- for commenting/uncommenting
    use 'tpope/vim-commentary'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- for notes
    use 'vimwiki/vimwiki'

    --WRITING plugins
    use("folke/zen-mode.nvim")
    use {'reedes/vim-pencil'} -- Super-powered writing things
    use {'tpope/vim-abolish'} -- Fancy abbreviation replacements
    use {'junegunn/limelight.vim'} -- Highlights only active paragraph
    use {'junegunn/goyo.vim'} -- Full screen writing mode
    use {'reedes/vim-lexical'} -- Better spellcheck mappings
    use {'reedes/vim-litecorrect'} -- Better autocorrections
    use {'reedes/vim-textobj-sentence'} -- Treat sentences as text objects
    use {'reedes/vim-wordy'} -- Weasel words and passive voice

end)

