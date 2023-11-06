-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself

  use 'wbthomason/packer.nvim'
  use {'reedes/vim-pencil'} -- Super-powered writing things
  use {'tpope/vim-abolish'} -- Fancy abbreviation replacements
  use {'junegunn/limelight.vim'} -- Highlights only active paragraph
  use {'junegunn/goyo.vim'} -- Full screen writing mode
  use {'reedes/vim-lexical'} -- Better spellcheck mappings
  use {'reedes/vim-litecorrect'} -- Better autocorrections
  use {'reedes/vim-textobj-sentence'} -- Treat sentences as text objects
  use {'reedes/vim-wordy'} -- Weasel words and passive voice
  end)
