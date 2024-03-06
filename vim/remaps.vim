nnoremap <leader>e :Explore<CR>

" Replace word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" cd vim into the directory of the current buffer.
nnoremap <leader>cd :cd %:p:h<CR>

" Remap to create new tab
nnoremap <leader>t :tabnew<CR>

" Remap to open quickfix window
nnoremap <leader>q :copen<CR>

" Remap to show marks
nnoremap <leader>m :marks<CR>

" Remap to show registers
nnoremap <leader>p :registers<CR>

" Easy compile java in vim with <leader>m
" autocmd FileType java set makeprg=javac\ %
" set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C.%#
" nnoremap <leader>m :make<CR>
" nnoremap <leader>n :!mvn package<CR>
