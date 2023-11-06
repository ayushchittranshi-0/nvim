-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself

  use 'wbthomason/packer.nvim'
  
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

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
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
          --this is not menmtioned in documentation
		  { 'saadparwaiz1/cmp_luasnip' } 
      }
  }
  use 'psliwka/vim-smoothie'
  use 'itchyny/lightline.vim'
  -- for pairing
  use 'cohama/lexima.vim'
  -- for indentation jsx and tsx
  use 'maxmellon/vim-jsx-pretty'
  use 'junegunn/vim-peekaboo'
  use 'morhetz/gruvbox'
  use 'Mattn/emmet-vim'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use "rafamadriz/friendly-snippets"
  use "theprimeagen/harpoon"
  use 'vimwiki/vimwiki'
  -- use 'preservim/nerdtree'
  -- use 'Xuyuanp/nerdtree-git-plugin'
  end)
