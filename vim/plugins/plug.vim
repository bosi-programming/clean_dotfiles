let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Vim Plug config
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/j5shi/CommandlineComplete.vim.git'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/frazrepo/vim-rainbow.git'
Plug 'https://github.com/tyru/open-browser.vim.git'
Plug 'https://github.com/weirongxu/plantuml-previewer.vim.git'
Plug 'aklt/plantuml-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'fladson/vim-kitty'
Plug 'https://github.com/previm/previm.git'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'unblevable/quick-scope' " Highlights unique characters on a line
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'github/copilot.vim'
Plug 'vim-test/vim-test'

" FE frameworks
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'posva/vim-vue'
Plug 'wuelnerdotexe/vim-astro'

" Tpope ones
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'

" Themes
Plug 'arcticicestudio/nord-vim' " Nord theme
Plug 'catppuccin/vim', {'as': 'catppuccin'} "Catppucin theme - Has various modes
Plug 'rose-pine/vim'

" For docs
Plug 'https://github.com/tyru/open-browser.vim.git' " Important for plantuml
Plug 'junegunn/goyo.vim' " Distraction free writing
Plug 'junegunn/limelight.vim' " Distraction free writing
Plug 'dbmrq/vim-ditto' " Highlights repeated words
call plug#end()
