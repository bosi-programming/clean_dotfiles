local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'wbthomason/packer.nvim',
  'stevearc/oil.nvim',
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "rose-pine/neovim",               name = "rose-pine" },
  'ThePrimeagen/harpoon',
  "lukas-reineke/indent-blankline.nvim",

  -- LSP
  'neovim/nvim-lspconfig',             -- Required
  'williamboman/mason.nvim',           -- Optional
  'williamboman/mason-lspconfig.nvim', -- Optional
  -- Autocompletion
  'hrsh7th/nvim-cmp',                  -- Required
  'hrsh7th/cmp-nvim-lsp',              -- Required
  'hrsh7th/cmp-buffer',                -- Optional
  'hrsh7th/cmp-path',                  -- Optional
  'saadparwaiz1/cmp_luasnip',          -- Optional
  'hrsh7th/cmp-nvim-lua',              -- Optional

  -- Snippets
  'L3MON4D3/LuaSnip', -- Required

  'jose-elias-alvarez/null-ls.nvim',

  -- From old vimrc
  'itchyny/lightline.vim',
  'frazrepo/vim-rainbow',
  'unblevable/quick-scope',
  'j5shi/CommandlineComplete.vim',
  'aklt/plantuml-syntax',
  'weirongxu/plantuml-previewer.vim',
  'tyru/open-browser.vim',

  -- Presentations
  'sotte/presenting.vim',

  -- FE frameworks
  'wuelnerdotexe/vim-astro',
  'posva/vim-vue',
  { 'evanleck/vim-svelte', branch = 'main' },

  -- tpope collection
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-commentary',

  {
    'smoka7/hop.nvim',
    tag = 'v2.4.2',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  'github/copilot.vim',
  'vim-test/vim-test',
  {
    "akinsho/toggleterm.nvim",
    tag = 'v2.9.0',
    config = true
  },
  'kosayoda/nvim-lightbulb',
  'gpanders/editorconfig.nvim',
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
})
