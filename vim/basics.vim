let mapleader = " "

set encoding=utf-8

set nu " Set current line number on the line you are
set relativenumber

set tabstop=2
set softtabstop=2
set shiftwidth=2 " Tab size = 2
set expandtab
set smarttab
set smartindent

set nobackup "Stoping vim from creating swp files
set nowritebackup "Stoping vim from creating swp files
set noswapfile "Stoping vim from creating swp files

set hlsearch!
set incsearch " Enable incremental searching
set smartcase " Override ignorecase option for search pattern contains upper case.

set termguicolors

set scrolloff=4 " Make vim scroll 4 lines before the end
set signcolumn=yes

set re=0
set updatetime=50

set wildmenu " Display completion matches on your status line
set wildoptions=pum
set splitright " Setting vplit to right

set noerrorbells " Remove error sound
set history=100 " Save 100 items in history
set showcmd " Display the incomplete commands in the bottom right-hand side of your screen.  
set lbr " Don't line wrap mid-word.
set laststatus=2 "Configuration to make the lightline plugin work
set noshowmode "Removing the show note bellow since I'm using lightline
set mouse= " Turn off mouse on nvim

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'typescript']
