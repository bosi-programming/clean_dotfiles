" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

nmap =d <Plug>DittoNext " Jump to the next word
nmap -d <Plug>DittoPrev " Jump to the previous word
nmap +d <Plug>DittoGood " Ignore the word under the cursor
nmap _d <Plug>DittoBad " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore " Show the next matches
nmap [d <Plug>DittoLess " Show the previous matches"]"
