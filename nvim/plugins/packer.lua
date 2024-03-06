-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'stevearc/oil.nvim'

  use 'nvim-tree/nvim-web-devicons'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { "catppuccin/vim", as = "catppuccin" }
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('ThePrimeagen/harpoon')
  use "lukas-reineke/indent-blankline.nvim"

  use {

    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },                  -- Required
    { 'hrsh7th/cmp-nvim-lsp' },              -- Required
    { 'hrsh7th/cmp-buffer' },                -- Optional
    { 'hrsh7th/cmp-path' },                  -- Optional
    { 'saadparwaiz1/cmp_luasnip' },          -- Optional
    { 'hrsh7th/cmp-nvim-lua' },              -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' }, -- Required
  }
  -- Prettier
  use('jose-elias-alvarez/null-ls.nvim')

  -- From old vimrc
  use 'itchyny/lightline.vim'
  use 'frazrepo/vim-rainbow'
  use 'unblevable/quick-scope'
  use 'j5shi/CommandlineComplete.vim'
  use 'aklt/plantuml-syntax'
  use 'weirongxu/plantuml-previewer.vim'
  use 'tyru/open-browser.vim'

  -- Presentations
  use 'sotte/presenting.vim'

  -- FE frameworks
  use 'wuelnerdotexe/vim-astro'
  use 'posva/vim-vue'
  use { 'evanleck/vim-svelte', branch = 'main' }

  -- tpope collection
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  -- New ones
  use {
    'smoka7/hop.nvim',
    tag = 'v2.4.2',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use 'github/copilot.vim'
  use 'vim-test/vim-test'
  use { "akinsho/toggleterm.nvim", tag = 'v2.9.0', config = function()
    require("toggleterm").setup()
  end }
  use { 'kosayoda/nvim-lightbulb' }
  use 'gpanders/editorconfig.nvim'

  use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 100
    end
  }
end)
