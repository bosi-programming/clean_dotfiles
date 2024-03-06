" H K L J move cursor
nnoremap J <c-d>
nnoremap K <c-u>
nnoremap H ^
nnoremap L $

" Add smooth scrolling
noremap <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
noremap <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" Make Y behave as normal Vim
nnoremap Y yg_

" Keep it centered on search
nnoremap n nzzzv
nnoremap N Nzzzv

" Adds breakpoints for insert mode
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ] ]<c-g>u
inoremap } }<c-g>u
inoremap ) )<c-g>u
nnoremap <F2> :%s/<C-r><C-w>//gc<left><left><left>

" Fast split navigation with <Ctrl> + hjkl.
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-p> <c-w>p

" Remaps for copy and paste on other apps
vnoremap <leader>c "+y<CR>
nnoremap <leader>cc "+yy<CR>
vnoremap <leader>d "+d<CR>
nnoremap <leader>dd "+dd<CR>

" Remap to vertical split and horizontal split
nnoremap <leader>v :vsplit<CR>

" Add shortcut to save and close all
nnoremap ZZ :wqall<CR>
